/*
	LibTorrent media parse
*/	

//	string GetTitle() 									-> get title for UI
//	string GetVersion									-> get version for manage
//	string GetDesc()									-> get detail information
//	string GetLoginTitle()								-> get title for login dialog
//	string GetLoginDesc()								-> get desc for login dialog
//	string ServerCheck(string User, string Pass) 		-> server check
//	string ServerLogin(string User, string Pass) 		-> login
//	void ServerLogout() 								-> logout
// 	bool PlayitemCheck(const string &in)				-> check playitem
//	array<dictionary> PlayitemParse(const string &in)	-> parse playitem
// 	bool PlaylistCheck(const string &in)				-> check playlist
//	array<dictionary> PlaylistParse(const string &in)	-> parse playlist

/*
	__declspec(dllexport) DownloadSession *TorrentCreate(LPCSTR file, int len, LPCSTR save_path);
	__declspec(dllexport) int TorrentWaitReady(DownloadSession *pSession, int TimeOut);
	__declspec(dllexport) void TorrentDestroy(DownloadSession *pSession);
	__declspec(dllexport) LPCSTR TorrentName(DownloadSession *pSession);
	__declspec(dllexport) int TorrentCount(DownloadSession *pSession);
	__declspec(dllexport) LPCSTR TorrentFileName(DownloadSession *pSession, int idx);
	__declspec(dllexport) __int64 TorrentLength(DownloadSession *pSession, int idx);
	__declspec(dllexport) int TorrentRead(DownloadSession *pSession, int idx, __int64 pos, void *pBuffer, int len);
	__declspec(dllexport) __int64 TorrentDownloadLength(DownloadSession *pSession, int idx);
	__declspec(dllexport) int TorrentState(DownloadSession *pSession);
	__declspec(dllexport) int TorrentPeer(DownloadSession *pSession);
	__declspec(dllexport) int TorrentSeed(DownloadSession *pSession);
	__declspec(dllexport) int TorrentMetaGetDataSize(DownloadSession *pSession, void *pPtr);
	__declspec(dllexport) IStream *TorrentCreateStream(DownloadSession *pSession, int idx);
*/
uintptr dll = 0;
uintptr TorrentCreate = 0;
uintptr TorrentWaitReady = 0;
uintptr TorrentDestroy = 0;
uintptr TorrentCount = 0;
uintptr TorrentFileName = 0;
uintptr TorrentLength = 0;
uintptr TorrentState = 0;
uintptr TorrentMetaGetDataSize = 0;

uintptr g_temphan = 0;
bool g_PlayitemCancel = false;

bool InitTorrent()
{
	if (dll == 0)
	{
		if (HostIsWin64()) dll = HostLoadLibrary("TorrentReader64.dll");
		else dll = HostLoadLibrary("TorrentReader.dll");
		if (dll != 0)
		{		
			TorrentCreate = HostGetProcAddress(dll, "TorrentCreate");
			TorrentWaitReady = HostGetProcAddress(dll, "TorrentWaitReady");
			TorrentDestroy = HostGetProcAddress(dll, "TorrentDestroy");
			TorrentCount = HostGetProcAddress(dll, "TorrentCount");
			TorrentFileName = HostGetProcAddress(dll, "TorrentFileName");
			TorrentLength = HostGetProcAddress(dll, "TorrentLength");
			TorrentState = HostGetProcAddress(dll, "TorrentState");
			TorrentMetaGetDataSize = HostGetProcAddress(dll, "TorrentMetaGetDataSize");
		}
	}
	return dll != 0 && TorrentCreate != 0 && TorrentWaitReady != 0 && TorrentDestroy != 0 && TorrentCount != 0 && TorrentFileName != 0 && TorrentLength != 0;
}

bool isMagnet(string url)
{
	url.MakeLower();
	if (url.find("magnet:") == 0) return true;
	return false;
}

bool isHttp(string url)
{
	url.MakeLower();
	if (url.find("http://") == 0 || url.find("https://") == 0) return true;
	return false;
}

array<dictionary> TorrentParse(const string &in path)
{
	array<dictionary> ret;
	
	if (InitTorrent() && TorrentCreate != 0)
	{
		string fn = path;
		if (fn.find(PrefixList) == 0) fn.erase(0, PrefixList.size());
		
		string mem;
		if (isMagnet(fn)) mem = HostLoadString(fn);
		else if (isHttp(fn)) mem = HostUrlGetString(fn);

		string temp = HostGetTempFolder();
		uintptr temp_ptr = HostString2UIntPtr(temp);
		
		uintptr han = 0;
		if (mem.empty())
		{
			uintptr fn_ptr = HostString2UIntPtr(fn);
			
			han = HostCallProcUIntPtr(TorrentCreate, "pip", fn_ptr, 0, temp_ptr);
		}
		else
		{
			uintptr mem_ptr = HostString2UIntPtr(mem);

			han = HostCallProcUIntPtr(TorrentCreate, "pip", mem_ptr, mem.size(), temp_ptr);
		}
		
		if (han != 0)
		{
			int ready = 0;
			
			g_temphan = han;
			while (ready == 0 && g_temphan != 0)
			{
				ready = HostCallProcInt(TorrentWaitReady, "p", han);
				HostSleep(10);
				HostIncTimeOut(5000);
			}
			if (g_temphan != 0)
			{
				g_temphan = 0;
				HostSleep(10);
				if (ready >= 1)
				{
					int count = HostCallProcInt(TorrentCount, "p", han);

					for(int i = 0; i < count; i++)
					{
						uintptr name_ptr = HostCallProcUIntPtr(TorrentFileName, "pi", han, i);
						string name = HostUIntPtr2String(name_ptr);

						if (HostCheckMediaFile(name, true, true, false))
						{
							dictionary item;
							int64 size = HostCallProcUInt64(TorrentLength, "pi", han, i);

							item["url"] =  "libtorrent://" + formatInt(i) + "," + fn;
							item["title"] = name;
							item["size"] = size;
							ret.insertLast(item);
						}
					}
					
					if (mem.empty() && isMagnet(fn) && TorrentMetaGetDataSize != 0)
					{
						int len = HostCallProcInt(TorrentMetaGetDataSize, "pp", han, 0);
						
						if (len > 0)
						{
							mem.set_length(len);
							HostCallProcInt(TorrentMetaGetDataSize, "pp", han, HostString2UIntPtr(mem));
							HostSaveString(fn, mem);
						}
					}
				}
			}
			HostSleep(10);
			HostCallProcAsync(TorrentDestroy, "p", han);
		}
	}
	
	return ret;
}

string GetTitle()
{
	return "LibTorrent";
}

string GetVersion()
{
	return "1";
}

string GetDesc()
{
	return "https://www.libtorrent.org/";
}

string PrefixItem = "torrent_item://";
string PrefixList = "torrent://";

bool PlayitemCheck(const string &in path)
{
	if (path.find(PrefixItem) == 0) return true;
	return false;
}

string PlayitemParse(const string &in path, dictionary &MetaData, array<dictionary> &QualityList)
{
	string ret = "";
	
	g_PlayitemCancel = false;
	if (PlayitemCheck(path))
	{
		string url = path;	
		url.erase(0, PrefixItem.size());
		
		array<string> lines = url.split("\t");		
		for (int i = 0, len = lines.size(); i < len; i++)
		{
			string line = lines[i];
			int p = line.find("=");
			
			if (p > 0)
			{
				string addr = line.substr(p + 1);

				if (@QualityList !is null)
				{
					dictionary item;
					string quality = line.substr(0, p);					

					item["quality"] = quality;
					item["url"] = "libtorrent://" + addr;
					item["itag"] = i * 5 + 10;
					QualityList.insertLast(item);
				}
				if (ret.empty())
				{
					array<dictionary> dic = TorrentParse(addr);
					
					if (!dic.empty()) dic[0].get("url", ret);
				}
			}
			if (g_PlayitemCancel) break;
		}
	}
	return ret;
}

void PlayitemCancel()
{
	g_temphan = 0;
	g_PlayitemCancel = true;
}

bool PlaylistCheck(const string &in path)
{	
	if (path.find(PrefixList) == 0) return true;
	if (isMagnet(path)) return true;
	
	string ext = HostGetExtention(path);
	ext.MakeLower();
	if (ext == ".torrent") return true;
	return false;
}

array<dictionary> PlaylistParse(const string &in path)
{
	array<dictionary> ret;

	if (PlaylistCheck(path)) ret = TorrentParse(path);	
	return ret;
}

void PlaylistCancel()
{
	g_temphan = 0;	
}

string GetStatus()
{
	uintptr han = g_temphan;
	
	if (TorrentState != 0 && han != 0 && g_temphan == han)
	{
		int ret = HostCallProcInt(TorrentState, "p", han);
		
		if (ret == 1) return "magnet link";
	}
	return "";
}

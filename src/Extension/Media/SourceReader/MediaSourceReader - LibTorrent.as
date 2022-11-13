/*
	LibTorrent source reader
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
	__declspec(dllexport) bool TorrentDownloadComplete(DownloadSession *pSession, int idx);
	__declspec(dllexport) int TorrentState(DownloadSession *pSession);
	__declspec(dllexport) int TorrentPeer(DownloadSession *pSession);
	__declspec(dllexport) int TorrentSeed(DownloadSession *pSession);
	__declspec(dllexport) int TorrentDownloadRate(DownloadSession *pSession);
	__declspec(dllexport) int TorrentMetaData(DownloadSession *pSession, void *pPtr);
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
uintptr TorrentDownloadRate = 0;
uintptr TorrentMetaData = 0;
uintptr TorrentDownloadLength = 0;
uintptr TorrentDownloadComplete = 0;
uintptr TorrentRead = 0;

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
			TorrentDownloadRate = HostGetProcAddress(dll, "TorrentDownloadRate");
			TorrentMetaData = HostGetProcAddress(dll, "TorrentMetaData");
			TorrentDownloadLength = HostGetProcAddress(dll, "TorrentDownloadLength");
			TorrentDownloadComplete = HostGetProcAddress(dll, "TorrentDownloadComplete");
			TorrentRead = HostGetProcAddress(dll, "TorrentRead");
		}
	}
	return dll != 0 && TorrentCreate != 0 && TorrentWaitReady != 0 && TorrentDestroy != 0 && TorrentCount != 0 && TorrentFileName != 0 && TorrentLength != 0 && TorrentRead != 0;
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

int GetType() // 0: Normal, 1: Normal cache, 2: Progressive download, 3: Progressive download cache, 4: Live Streamming
{
	return 0;
}

string prefix = "libtorrent://";

bool CheckOpen(const string &in path)
{	
	if (path.find(prefix) == 0) return true;
	return false;
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

uintptr g_temphan = 0;

uintptr OpenFile(const string &in path)
{
	if (!CheckOpen(path)) return 0;
	
	string fn = path;
	fn.erase(0, prefix.size());
	
	int idx = -1;	
	int p = fn.find(",");
	if (p >= 1)
	{
		idx = parseInt(fn.substr(0, p));
		if (idx < 0) return 0;
	}

	fn = fn.substr(p + 1);	
	
	if (InitTorrent() && TorrentCreate != 0)
	{
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

					if (idx < count)
					{
						if (mem.empty() && isMagnet(fn) && TorrentMetaData != 0)
						{
							int len = HostCallProcInt(TorrentMetaData, "pp", han, 0);
							
							if (len > 0)
							{
								mem.set_length(len);
								HostCallProcInt(TorrentMetaData, "pp", han, HostString2UIntPtr(mem));
								HostSaveString(fn, mem);
							}
						}
						return han;
					}
				}
			}
			HostSleep(10);
			HostCallProcAsync(TorrentDestroy, "p", han);
		}
	}
	
	return 0;
}

int GetFileIndex(uintptr han, const string &in path)
{
	if (!CheckOpen(path)) return -1;
	
	string fn = path;
	fn.erase(0, prefix.size());
	
	int p = fn.find(",");
	if (p < 1)
	{
		if (han != 0 && TorrentCount != 0 && TorrentFileName != 0)
		{
			int count = HostCallProcInt(TorrentCount, "p", han);

			for(int i = 0; i < count; i++)
			{
				uintptr name_ptr = HostCallProcUIntPtr(TorrentFileName, "pi", han, i);
				string name = HostUIntPtr2String(name_ptr);

				if (HostCheckMediaFile(name, true, true, false)) return i;
			}
		}	
		return -1;
	}
	
	return parseInt(fn.substr(0, p));
}

void CloseFile(uintptr han)
{
	if (han != 0 && TorrentDestroy != 0) HostCallProcAsync(TorrentDestroy, "p", han);
}

int GetFileCount(uintptr han)
{
	if (han != 0 && TorrentCount != 0) return HostCallProcInt(TorrentCount, "p", han);
	return -1;
}

int64 GetFileLength(uintptr han, int idx)
{
	if (han != 0 && TorrentLength != 0 && idx >= 0)
	{
		int cnt = GetFileCount(han);
		
		if (cnt > idx) return HostCallProcUInt64(TorrentLength, "pi", han, idx);
	}
	return -1;
}

int64 GetFileAvailable(uintptr han, int idx)
{
	if (han != 0 && TorrentDownloadLength != 0 && idx >= 0)
	{
		int cnt = GetFileCount(han);
		
		if (cnt > idx) return HostCallProcUInt64(TorrentDownloadLength, "pi", han, idx);
	}
	return -1;
}

string GetFileName(uintptr han, int idx)
{
	if (han != 0 && TorrentFileName != 0 && idx >= 0)
	{
		int cnt = GetFileCount(han);
		
		if (cnt > idx)
		{
			uintptr name_ptr = HostCallProcUIntPtr(TorrentFileName, "pi", han, idx);
			string name = HostUIntPtr2String(name_ptr);
		
			return name;
		}
	}
	return "";
}

int ReadFileBuffer(uintptr han, int idx, int64 pos, string &buf, int size)
{
	if (han != 0 && TorrentFileName != 0 && idx >= 0)
	{
		int cnt = GetFileCount(han);
		
		if (cnt > idx)
		{
			uintptr buf_ptr = HostString2UIntPtr(buf);
			int ret = HostCallProcInt(TorrentRead, "piqpi", han, idx, pos, buf_ptr, size);
		
			return ret;
		}
	}
	return -1;
}

bool GetFileComplete(uintptr han, int idx)
{
	if (han != 0 && TorrentDownloadComplete != 0 && idx >= 0)
	{
		int cnt = GetFileCount(han);
		
		if (cnt > idx)
		{
			int ret = HostCallProcInt(TorrentDownloadComplete, "pi", han, idx);
		
			return ret != 0;
		}
	}
	return false;
}

void OpenCancel()
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

int64 GetDownloadRate()
{
	uintptr han = g_temphan;
	
	if (TorrentDownloadRate != 0 && han != 0 && g_temphan == han)
	{
		int ret = HostCallProcInt(TorrentDownloadRate, "p", han);
		
		return ret;
	}
	return 0;
}

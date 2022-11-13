/*
	TorrServer media parse (get m3u, magnet only)
*/

// --- TorrServer MatriX
string first = "http://127.0.0.1:8090/stream/fname?link=";
string second = "&index=1&m3u";

// --- TorrServer Оld
//string first = "http://127.0.0.1:8090/torrent/play?link=";
//string second = "&m3u=true";

string GetTitle()
{
	return "TorrServer";
}

string GetVersion()
{
	return "1";
}

string GetDesc()
{
	return "https://github.com/YouROK/TorrServer/releases/";
}

bool PlayitemCheck(const string &in path)
{
	path.MakeLower();
	if (path.find("magnet:") == 0) return true;
	return false;
}

string PlayitemParse(const string &in path, dictionary &MetaData, array<dictionary> &QualityList)
{
	string url = first + path + second;
	return url;
}
/*
	yt-dlp media parse (x86)
*/	

// void OnInitialize()
// void OnFinalize()
// string GetTitle() 						-> get title for UI
// string GetVersion						-> get version for manage
// string GetDesc()						-> get detail information
// string GetLoginTitle()					-> get title for login dialog
// string GetLoginDesc()					-> get desc for login dialog
// string GetUserText()						-> get user text for login dialog
// string GetPasswordText()					-> get password text for login dialog
// string ServerCheck(string User, string Pass) 		-> server check
// string ServerLogin(string User, string Pass) 		-> login
// void ServerLogout() 						-> logout
// --------------------------------------------------------------------------------------------------
// bool PlayitemCheck(const string &in)				-> check playitem
// array<dictionary> PlayitemParse(const string &in)		-> parse playitem
// bool PlaylistCheck(const string &in)				-> check playlist
// array<dictionary> PlaylistParse(const string &in)		-> parse playlist

string GetTitle()
{
	return "yt-dlp";
}

string GetVersion()
{
	return "1";
}

string GetDesc()
{
	return "https://github.com/yt-dlp/yt-dlp/releases/";
}

bool PlayitemCheck(const string &in path)
{
	if (path.size() < 100 && path.find("://www.youtube.com/") >= 0) return true;
	else if (path.find("://youtu.be/") >= 0) return true;
	else if (path.find("://yewtu.be/") >= 0) return true;
	else if (path.find("://www.twitch.tv/") >= 0) return true;
	else if (path.find("://rumble.com/") >= 0) return true;
	else if (path.find("://vimeo.com/") >= 0) return true;
	else if (path.find("://www.imdb.com/") >= 0) return true;
	else if (path.find("://www.filmweb.pl/") >= 0) return true;
	else if (path.find("://www.dailymotion.com/") >= 0) return true;
	else if (path.find("://www.tiktok.com/") >= 0) return true;
	else if (path.find("://twitter.com/") >= 0) return true;
	else if (path.find("://www.facebook.com/") >= 0) return true;
	else if (path.find("://drive.google.com/") >= 0) return true;
	else if (path.find("://www.xnxx.com/") >= 0) return true;
	else if (path.find("://www.xvideos.com/") >= 0) return true;
	else if (path.find("://www.pornhub.com/") >= 0) return true;
	return false;
}

class QualityListItem
{
	string url;
	string quality;
	string qualityDetail;
	int itag = 0;
	dictionary toDictionary()
	{
		dictionary ret;

		ret["url"] = url;
		ret["quality"] = quality;
		ret["qualityDetail"] = qualityDetail;
		ret["itag"] = itag;
		return ret;
	}	
};

string PlayitemParse(const string &in path, dictionary &MetaData, array<dictionary> &QualityList)
{
	if (@QualityList is null) return "";

	string filename = "Extention\\Media\\PlayParse\\yt-dlp_x86-parser.exe";

	uintptr pFile = HostFileOpen(filename);

	if (pFile == 0)
	{
		filename = "Extension\\Media\\PlayParse\\yt-dlp_x86-parser.exe";
	}
	else
	{
		HostFileClose(pFile);
	}

	string url;
	string json = HostExecuteProgram(filename, path);

	JsonReader Reader;
	JsonValue Root;

	if (Reader.parse(json, Root) && Root.isObject())
	{
		JsonValue value;

		value = Root["vid"];

		if (value.isString()) {
			MetaData["vid"] = value.asString();
		}

		value = Root["webUrl"];

		if (value.isString()) {
			MetaData["webUrl"] = value.asString();
		}

		value = Root["title"];

		if (value.isString()) {
			MetaData["title"] = value.asString();
		}

		value = Root["author"];

		if (value.isString()) {
			MetaData["author"] = value.asString();
		}

		value = Root["date"];

		if (value.isString()) {
			MetaData["date"] = value.asString();
		}

		value = Root["content"];

		if (value.isString()) {
			MetaData["content"] = value.asString();
		}

		value = Root["thumbnail"];

		if (value.isString()) {
			MetaData["thumbnail"] = value.asString();
		}

		value = Root["duration"];

		if (value.isInt64()) {
			MetaData["duration"] = value.asInt64();
		}

		value = Root["viewCount"];

		if (value.isString()) {
			MetaData["viewCount"] = value.asString();
		}

		JsonValue items = Root["formats"];

		if (items.isArray())
		{
			for (int i = 0, len = items.size(); i < len; i++)
			{
				JsonValue item = items[i];

				if (item.isObject())
				{
					if (@QualityList !is null)
					{
						QualityListItem qualityItem;

						JsonValue value;

						value = item["itag"];

						if (value.isInt()) {
							qualityItem.itag = value.asInt();
						}

						value = item["vid"];

						if (value.isInt()) {
							qualityItem.itag = value.asInt();
						}

						value = item["url"];

						if (value.isString()) {
							qualityItem.url = value.asString();
						}

						value = item["quality"];

						if (value.isString()) {
							qualityItem.quality = value.asString();
						}

						value = item["qualityDetail"];

						if (value.isString()) {
							qualityItem.qualityDetail = value.asString();
						}

						QualityList.insertLast(qualityItem.toDictionary());
					}

					JsonValue value;

					value = item["selected"];

					if (value.isBool() && value.asBool()) {

						JsonValue value;

						value = item["fileExt"];

						if (value.isString()) {
							MetaData["fileExt"] = value.asString();
						}

						value = item["url"];

						if (value.isString()) {
							url = value.asString();
						}

						if (@QualityList is null) break;
					}
				}
			}
		}
	}

	return url;
}
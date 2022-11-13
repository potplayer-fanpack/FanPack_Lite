; Ten skrypt pokazuje, jak funkcja obs³ugi CreateDownloadPage mo¿e byæ u¿ywana do pobierania plików tymczasowych, 
; jednoczeœnie pokazuj¹c u¿ytkownikowi postêp pobierania.

#define MyAppName "FanPack"
#define MyAppVersion "1.0.77"
#define MyAppPublisher "PotPlayer Club"
#define MyAppURL "http://www.potplayerclub.pl"

#define keyPM "Software\Daum\PotPlayerMini"
#define keyPMS "Software\Daum\PotPlayerMini\Settings"
#define keyPMOS "Software\Daum\PotPlayerMini\Override_Settings"
#define keyMVR "Software\MPC-BE Filters\MPC Video Renderer"

[Setup]
; UWAGA: Wartoœæ AppId jednoznacznie identyfikuje tê aplikacjê. Nie u¿ywaj tej samej wartoœci AppId w instalatorach dla innych aplikacji.
; (Aby wygenerowaæ nowy GUID, kliknij Narzêdzia | Generuj GUID wewn¹trz IDE.)
AppId                              = {{33706324-07D9-4A45-BD21-80DE3CE6A4D2}
AppName                            = {#MyAppName}
AppVersion                         = {#MyAppVersion}
AppPublisher                       = {#MyAppPublisher}
AppPublisherURL                    = {#MyAppURL}
AppSupportURL                      = {#MyAppURL}
AppUpdatesURL                      = {#MyAppURL}
DefaultDirName                     = {autopf}\{#MyAppName}
DefaultGroupName                   = {#MyAppName}
AppCopyright                       = Copyright © {#MyAppPublisher} 2014-2022
AllowNoIcons                       = yes
OutputDir                          = bin
SourceDir                          = .
SetupIconFile                      = embedded\PotPlayer.ico
Compression                        = lzma2/ultra
InternalCompressLevel              = ultra
SolidCompression                   = yes
WizardStyle                        = modern
WizardSmallImageFile               = embedded\WizardSmallImage.bmp
WizardImageFile                    = embedded\WizModernImage.bmp
Uninstallable                      = yes
OutputBaseFilename                 = {#MyAppName}_Lite
ShowTasksTreeLines                 = yes
VersionInfoVersion                 = {#MyAppVersion}
VersionInfoCompany                 = PotPlayer Club
VersionInfoTextVersion             = 1.0 build 77
VersionInfoCopyright               = PotPlayer Club
ArchitecturesAllowed               = x86 x64
PrivilegesRequiredOverridesAllowed = dialog
DisableDirPage                     = yes
DisableProgramGroupPage            = yes

[Languages]
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"

[Messages]
BeveledLabel= PotPlayer Club

[Files]
; Normalne pliki instalatora
Source: "InstallDir\Changelog.txt";                                                     DestDir: "{app}";                                     Components: program; Flags: ignoreversion
Source: "InstallDir\License.txt";                                                       DestDir: "{app}";                                     Components: program; Flags: ignoreversion
Source: "InstallDir\CzytajTo.txt";                                                      DestDir: "{app}";                                     Components: program; Flags: isreadme;
Source: "InstallDir\LGPL.TXT";                                                          DestDir: "{app}";                                     Components: program; Flags: ignoreversion
Source: "InstallDir\MyProg.exe";                                                        DestDir: "{app}";                                     Components: program; Flags: ignoreversion
;Source: "src\CmdLine.txt";                                                              DestDir: "{commonpf32}\DAUM\PotPlayer";               Components: program; Flags: uninsneveruninstall ignoreversion
;Source: "src\Language\Polish.ini";                                                      DestDir: "{commonpf32}\DAUM\PotPlayer\Language";      Components: program; Flags: uninsneveruninstall ignoreversion
;Source: "src\History\Polish.txt";                                                       DestDir: "{commonpf32}\DAUM\PotPlayer\History";       Components: program; Flags: uninsneveruninstall ignoreversion
Source: "src\UrlList\Radio.asx";                                                        DestDir: "{commonpf32}\DAUM\PotPlayer\UrlList";       Components: program; Flags: ignoreversion uninsneveruninstall
Source: "src\UrlList\TV.asx";                                                           DestDir: "{commonpf32}\DAUM\PotPlayer\UrlList";       Components: program; Flags: ignoreversion uninsneveruninstall
Source: "{tmp}\Module.7z";                                                              DestDir: "{tmp}";                                     Components: program; Flags: deleteafterinstall
Source: "{tmp}\PxShader.7z";                                                            DestDir: "{tmp}";                                     Components: program; Flags: deleteafterinstall
Source: "{commonpf32}\DAUM\PotPlayer\ffcodec.dll"; DestName: "FFmpeg.dll";              DestDir: "{commonpf32}\DAUM\PotPlayer\Module\FFmpeg4"; Flags: external;
Source: "src\Skins\FMOD.Gilly.dsf";                                                     DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\FMOD.Light.dsf";                                                     DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotMPC v1.0.dsf";                                                    DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotMPC v2.0.dsf";                                                    DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\Default.MOD.dsf";                                                    DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\Default.MOD.Optimized,1.dsf"; DestName: "Default.MOD.Optimized.DSF"; DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Tasks: skin1; Flags: uninsrestartdelete ignoreversion
Source: "src\x86\PotPlayerMini,1.exe";               DestName: "PotPlayerMini.exe";     DestDir: "{commonpf32}\DAUM\PotPlayer";               Tasks: skin1; Flags: ignoreversion uninsneveruninstall
Source: "src\Skins\Default.MOD.Optimized,2.dsf"; DestName: "Default.MOD.Optimized.DSF"; DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Tasks: fixpot; Flags: uninsrestartdelete ignoreversion
Source: "src\x86\PotPlayerMini,2.exe";               DestName: "PotPlayerMini.exe";     DestDir: "{commonpf32}\DAUM\PotPlayer";               Tasks: fixpot; Flags: ignoreversion uninsneveruninstall
Source: "src\Skins\FMOD.dsf";                                                           DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Tasks: skin2; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotMPC v3.0.dsf";                                                    DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Tasks: skin3; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotXMP.dsf";                                                         DestDir: "{commonpf32}\DAUM\PotPlayer\Skins";         Components: program; Tasks: skin4; Flags: uninsrestartdelete ignoreversion
;
Source: "{userappdata}\Playlist\IPTV.dpl";                                              DestDir: "{userappdata}\PotPlayerMini\Playlist";      Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion  
;Source: "{userappdata}\Playlist\IPTV2.dpl";                                              DestDir: "{userappdata}\PotPlayerMini\Playlist";      Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion 
Source: "{userappdata}\Playlist\Ten komputer.dpl";                                      DestDir: "{userappdata}\PotPlayerMini\Playlist";      Tasks: savedef; Flags: restartreplace uninsrestartdelete ignoreversion 
Source: "{userappdata}\Playlist\FilmPolski.dpl";                                        DestDir: "{userappdata}\PotPlayerMini\Playlist";      Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion
Source: "{userappdata}\Playlist\Torrent.dpl";                                           DestDir: "{userappdata}\PotPlayerMini\Playlist";      Components: ext/torrent; Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion 
Source: "{userappdata}\Playlist\YouTube.dpl";                                           DestDir: "{userappdata}\PotPlayerMini\Playlist";      Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion 
Source: "{userdocs}\Playlist\IPTV.dpl";                                                 DestDir: "{userdocs}\PotPlayerMini\Playlist";         Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion  
;Source: "{userdocs}\Playlist\IPTV2.dpl";                                                 DestDir: "{userdocs}\PotPlayerMini\Playlist";         Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion 
Source: "{userdocs}\Playlist\Ten komputer.dpl";                                         DestDir: "{userdocs}\PotPlayerMini\Playlist";         Tasks: savedocs; Flags: restartreplace uninsrestartdelete ignoreversion
Source: "{userdocs}\Playlist\FilmPolski.dpl";                                           DestDir: "{userdocs}\PotPlayerMini\Playlist";         Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion
Source: "{userdocs}\Playlist\Torrent.dpl";                                              DestDir: "{userdocs}\PotPlayerMini\Playlist";         Components: ext/torrent; Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion
Source: "{userdocs}\Playlist\YouTube.dpl";                                              DestDir: "{userdocs}\PotPlayerMini\Playlist";         Tasks: playlist; Flags: restartreplace uninsrestartdelete ignoreversion
;<-- // Rozszerzenia // -->
; Source: "src\Extension\Media\PlayParse\MediaPlayParse - YouTube.as";                    DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse";    Flags: uninsrestartdelete ignoreversion
Source: "src\x86\Extension\Lib\TorrentReader.dll";                                      DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Lib";                Components: ext/torrent; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - LibTorrent.as";                 DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: ext/torrent; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - LibTorrent.ico";                DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: ext/torrent; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\config.ini";                                     DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: ext/twich; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - Twitch.as";                     DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: ext/twich; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - Twitch.ico";                    DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: ext/twich; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\SourceReader\MediaSourceReader - LibTorrent.as";           DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\SourceReader"; Components: ext/torrent; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\SourceReader\MediaSourceReader - LibTorrent.ico";          DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\SourceReader"; Components: ext/torrent; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\UrlList\MediaUrlList - Twitch.as";                         DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\UrlList";      Components: ext/twich; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\UrlList\MediaUrlList - Twitch.ico";                        DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\UrlList";      Components: ext/twich; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\UrlList\config.ini";                                       DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\UrlList";      Components: ext/twich; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - yt-dlp.as";                     DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";      Components: ext/ytdlp; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - yt-dlp.ico";                    DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";      Components: ext/ytdlp; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\yt-dlp_x86.exe";                                 DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";      Components: ext/ytdlp; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\yt-dlp_x86-parser.exe";                          DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";      Components: ext/ytdlp; Flags: uninsrestartdelete ignoreversion
;<-- // AviSynth and SVPflow // -->
Source: "src\AviSynth\CPU-1-Low.avs";                                                   DestDir: "{commonpf32}\DAUM\PotPlayer\AviSynth";       Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\CPU-2-Medium.avs";                                                DestDir: "{commonpf32}\DAUM\PotPlayer\AviSynth";       Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\CPU-3-High.avs";                                                  DestDir: "{commonpf32}\DAUM\PotPlayer\AviSynth";       Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\GPU-1-Low.avs";                                                   DestDir: "{commonpf32}\DAUM\PotPlayer\AviSynth";       Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\GPU-2-Medium.avs";                                                DestDir: "{commonpf32}\DAUM\PotPlayer\AviSynth";       Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\GPU-3-High.avs";                                                  DestDir: "{commonpf32}\DAUM\PotPlayer\AviSynth";       Components: avs; Flags: uninsrestartdelete ignoreversion
Source: "src\x86\AviSynth.dll";                                                         DestDir: "{commonpf32}\DAUM\PotPlayer";                Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\x86\svp.avs";                                                              DestDir: "{commonpf32}\DAUM\PotPlayer";                Components: avs; Flags: uninsrestartdelete ignoreversion
Source: "src\x86\msvcp140.dll";                                                         DestDir: "{commonpf32}\DAUM\PotPlayer";                Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\x86\svpflow1.dll";                                                         DestDir: "{commonpf32}\DAUM\PotPlayer";                Components: avs; Flags: uninsrestartdelete ignoreversion 
Source: "src\x86\svpflow2.dll";                                                         DestDir: "{commonpf32}\DAUM\PotPlayer";                Components: avs; Flags: uninsrestartdelete ignoreversion
Source: "src\x86\vcruntime140.dll";                                                     DestDir: "{commonpf32}\DAUM\PotPlayer";                Components: avs; Flags: uninsrestartdelete ignoreversion
; Pliki pobierane w trakcie instalacji
; <-- // TorrServer // -->
Source: "{tmp}\TS.MatriX.Setup.exe";                                                    DestDir: "{tmp}";                                                 Components: tor; Flags: external deleteafterinstall;
Source: "src\Extension\Media\PlayParse\MediaPlayParse - TorrServer.as";                 DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse"; Components: tor; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - TorrServer.ico";                DestDir: "{commonpf32}\DAUM\PotPlayer\Extension\Media\PlayParse"; Components: tor; Flags: uninsrestartdelete ignoreversion
; <-- // Icaros // -->
Source: "{tmp}\Icaros.exe";                                                             DestDir: "{tmp}";                                      Components: icaros; Flags: external deleteafterinstall;
Source: "{tmp}\Icaros_HKCU.reg";                                                        DestDir: "{tmp}";                                      Components: icaros; Flags: deleteafterinstall
Source: "{tmp}\icaros_HKLM_64.reg";                                                     DestDir: "{tmp}";                                      Components: icaros; Flags: deleteafterinstall
Source: "{tmp}\icaros_HKLM_32.reg";                                                     DestDir: "{tmp}";                                      Components: icaros; Flags: deleteafterinstall
Source: "src\Icaros\Resources\Localize\Config.pl.po";                                                                                          Components: icaros; Flags: dontcopy
; <-- // Ace Stream Engine // -->
Source: "{tmp}\ace_engine_setup.exe";                                                   DestDir: "{tmp}";                                      Components: ace; Flags: external deleteafterinstall;
Source: "{userappdata}\Playlist\AceTV.dpl";                                             DestDir: "{userappdata}\PotPlayerMini\Playlist";       Components: ace; Tasks: savedef; Flags: ignoreversion 
Source: "{userdocs}\Playlist\AceTV.dpl";                                                DestDir: "{userdocs}\PotPlayerMini\Playlist";          Components: ace; Tasks: savedocs; Flags: ignoreversion
;<-- // madVR // -->
Source: "{tmp}\madVR_v0.9.17.exe";                                                      DestDir: "{tmp}";                                      Components: madvr; Flags: deleteafterinstall
Source: "InstallDir\delete madVR.bat";                                                  DestDir: "{app}";                                      Components: madvr; Flags: uninsrestartdelete ignoreversion
;<-- // MediaInfo // -->
Source: "src\x86\Module\MediaInfo.exe";                                                 DestDir: "{commonpf32}\DAUM\PotPlayer\Module\";        Components: minfo; Flags: restartreplace uninsrestartdelete ignoreversion
 ; MPC Video Renderer
Source: "src\x86\Module\MpcVideoRenderer.ax";                                           DestDir: "{commonpf32}\DAUM\PotPlayer\Module";         Tasks: mpcvr; Flags: regserver ignoreversion
; Sanear Audio Renderer
Source: "src\x86\Module\sanear.ax";                                                     DestDir: "{commonpf32}\DAUM\PotPlayer\Module";         Tasks: sanear; Flags: regserver ignoreversion
; ; Splittery MPC-BE
Source: "src\x86\Module\AviSplitter.ax";                                                DestDir: "{commonpf32}\DAUM\PotPlayer\Module";         Components: program; Flags: restartreplace uninsrestartdelete ignoreversion
Source: "src\x86\Module\MatroskaSplitter.ax";                                           DestDir: "{commonpf32}\DAUM\PotPlayer\Module";         Components: program; Flags: restartreplace uninsrestartdelete ignoreversion
Source: "src\x86\Module\MP4Splitter.ax";                                                DestDir: "{commonpf32}\DAUM\PotPlayer\Module";         Components: program; Flags: restartreplace uninsrestartdelete ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "7za.exe";                                                                      DestDir: "{tmp}";                                      Flags: deleteafterinstall;

[Dirs]
Name: {app};               Permissions: everyone-full; Flags: UninsAlwaysUninstall; Components: program;
Name: {userappdata}\madVR; Permissions: everyone-full; Flags: UninsAlwaysUninstall; Components: madvr;

[Registry]
Root: HKCU; Subkey: Software\madshi;                                                                              Components: "madvr"; Flags: uninsdeletekey dontcreatekey;
Root: HKCU; Subkey: Software\madshi\madHcCtrl; ValueType: dword; ValueName: "ShowTrayIcon"; ValueData: "$1";      Components: "madvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\madshi\madVR; ValueType: string; ValueName: "LastSettingsKey"; ValueData: "devices"; Components: "madvr"; Flags: uninsdeletekey;
;
Root: HKCU; Subkey: "Software\MediaInfo"; ValueName: "Path"; ValueType: String; ValueData: "{commonpf32}\DAUM\PotPlayer\Module\";                                  Tasks: minfo; Flags: uninsdeletevalue uninsdeletekeyifempty 
Root: HKCU; Subkey: "Software\Classes\*\shell\MediaInfo"; ValueName: "Icon"; ValueType: String; ValueData: """{commonpf32}\DAUM\PotPlayer\Module\mediainfo.exe"""; Tasks: minfo; Flags: uninsdeletevalue uninsdeletekeyifempty 
Root: HKCU; Subkey: "Software\Classes\*\shell\MediaInfo\Command"; ValueType: String; ValueData: """{commonpf32}\DAUM\PotPlayer\Module\mediainfo.exe"" ""%1""";     Tasks: minfo; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; Subkey: {#keyPM}; ValueType: dword; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}; ValueType: dword; ValueName: "AddMyComPL"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}; ValueType: dword; ValueName: "ServiceValue"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\AtscAntenaList; ValueType: string; ValueName: "0"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\AtscCableList; ValueType: string; ValueName: "0"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Dialog324; ValueType: string; ValueName: "WindowPosition"; ValueData: "585,238,1336,802"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Dialog324; ValueType: dword; ValueName: "TopMost"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\DvbcList; ValueType: string; ValueName: "0"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\DvbsList; ValueType: string; ValueName: "0"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\DvbtList; ValueType: string; ValueName: "0"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "0"; ValueData: "SubtitleSearch - Napisy24.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "0DN"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "0UP"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "0U"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "0P"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "0S"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "0D"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "1"; ValueData: "SubtitleSearch - OpenSubtitle.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "1DN"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "1UP"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "1U"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "1P"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "1S"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "1D"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "2"; ValueData: "SubtitleSearch - podnapisi.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "2DN"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "2UP"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "2U"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "2P"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "2S"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "2D"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "3"; ValueData: "SubtitleSearch - SubDB.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "3DN"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "3UP"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "3U"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "3P"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "3S"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "3D"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "4"; ValueData: "SubtitleSearch - titlovi.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "4DN"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "4UP"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "4U"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "4P"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "4S"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "4D"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "5"; ValueData: "SubtitleSearch - ysubs.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "5DN"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: dword; ValueName: "5UP"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "5U"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "5P"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "5S"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "5D"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionInfoList; ValueType: string; ValueName: "6"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionSection; ValueType: string; ValueName: "MediaUrlList"; ValueData: "MediaUrlList - YouTube.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionSection; ValueType: string; ValueName: "MediaPlayParse"; ValueData: "MediaPlayParse - YouTube.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionSection; ValueType: string; ValueName: "OnlineSubtitleSearch"; ValueData: "SubtitleSearch - Napisy24.as/SubtitleSearch - OpenSubtitle.as/SubtitleSearch - podnapisi.as/SubtitleSearch - SubDB.as/SubtitleSearch - titlovi.as/SubtitleSearch - ysubs.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\ExtentionSection; ValueType: string; ValueName: "OnlineSubtitleTrans"; ValueData: "SubtitleTranslate - bing.as/SubtitleTranslate - google.as/SubtitleTranslate - papago.as/SubtitleTranslate - papagoNMT.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "MainX"; ValueData: "$1db"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "MainY"; ValueData: "$c8"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "MainWidth2"; ValueData: "$1e6"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "MainHeight2"; ValueData: "$18a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowWidth"; ValueData: "$1e0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectL0"; ValueData: "$1db"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectT0"; ValueData: "$c8"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectR0"; ValueData: "$3c1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectB0"; ValueData: "$252"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowState1"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectL1"; ValueData: "$1b6"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectT1"; ValueData: "$64"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectR1"; ValueData: "$2f6"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectB1"; ValueData: "$1fc"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowState2"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectL2"; ValueData: "$365"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectT2"; ValueData: "$225"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectR2"; ValueData: "$49b"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "VideoWindowRectB2"; ValueData: "$2ee"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "PlayListWidth"; ValueData: "$140"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow0"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow1"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow2"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow3"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow4"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow5"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow6"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow7"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow8"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "TopMostWindow9"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\Positions; ValueType: dword; ValueName: "ControlBoxWidth"; ValueData: "$136"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MftDecoder"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DmoDecoder"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "Info1"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "Info6"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "Info7"; ValueData: ""; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "LastConfigPage"; ValueData: "$179"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AllowMultiple"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PlaybackMode"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AudioVolume"; ValueData: "$46"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastPlayListName"; ValueData: "PotPlayerMini.dpl"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'MoveTop''SetButtons''AddVis''AddTime''AddButtons'"; Tasks: fixpot; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinName"; ValueData: "Default.MOD.Optimized.dsf";                           Tasks: fixpot; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'MoveTop''SetButtons''AddVis''AddTime''AddButtons'"; Tasks: skin1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinName"; ValueData: "Default.MOD.Optimized.dsf";                           Tasks: skin1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinName"; ValueData: "Default.dsf";                                         Tasks: skin0; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "CaptionStyle"; ValueData: "5;5;5;5;2;0;2.000000;2.000000;3.000000;3.000000;0xffffff;0x000000;0x000000;0x000000;0x00;0x00;0x00;0x90;1;Segoe UI;17.000000;100.000000;100.000000;0.000000;700;0;0;0;0;0.000000;0.000000;0.000000;0.000000;2;0;1;50;95;0.000000;0;0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinXmlName"; ValueData: "VideoSkin.xml"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinXmlNameVideo"; ValueData: "VideoSkin.xml"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "EffectPage"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "EffectCastOnly"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SkipCastPreview"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "ChatAttachToMain2"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "UseSideWindow"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "BroadcastAttachToMain2"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PlaylistAttachSize2"; ValueData: "$13f"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "CaptionTranslateEngine2"; ValueData: "SubtitleTranslate - google.as"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AttachWindowIndex"; ValueData: "$2"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PageSelectedIndex1"; ValueData: "$4"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "ExtentionUpdate"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PlayScreenSize"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_FontSize"; ValueData: "$12"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_WindowSize"; ValueData: "$3"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_Cover"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_16_9"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_LargeFrame"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_LargeSelect"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_FastLink"; ValueData: "$2"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_RightList"; ValueData: "$2"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_FolderOpen"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_FolderOpenSub"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SortByFolderPL"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "NoSameFileAddPL"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AutoAddPL"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AutoDetectTimePL"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DropMousePos"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VMR9VSyncInternal"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "D3DFullScreenUi"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DisplayCdVolumeLabel"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "SkinPopupMenuStyle"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "MessageFontName"; ValueData: "Oswald"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageFontWeight"; ValueData: "$258"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageFontSize"; ValueData: "$1a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "ItuRecSpec"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SkinDarkMenu"; ValueData: "$1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageChapter"; ValueData: "$0"; Flags: uninsdeletekey;
; ; Ustawienia skórek, Sta³y rozmiar okna, menu, odtwarzanie
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSize"; ValueData: "$3";        Tasks: skinfix; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSizeUserW"; ValueData: "$2d0"; Tasks: skinfix\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSizeUserH"; ValueData: "$194"; Tasks: skinfix\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSizeUserW"; ValueData: "$320"; Tasks: skinfix\b; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSizeUserH"; ValueData: "$1c2"; Tasks: skinfix\b; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSizeUserW"; ValueData: "$500"; Tasks: skinfix\c; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartScreenSizeUserH"; ValueData: "$2d0"; Tasks: skinfix\c; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AutoResizeFullScreen"; ValueData: "$1";   Tasks: autoresfullscr; Flags: uninsdeletekey;
; ; Skin menu
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "SkinDarkMenu"; ValueData: "$1";         Tasks: skinmenu; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "SkinPopupMenuStyle"; ValueData: "$1";   Tasks: skinmenu; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SkinDefaultStart"; ValueData: "$2";     Tasks: skinstart; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SkinSizePersist"; ValueData: "$1";      Tasks: skinsize; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MoveSizeByCenter"; ValueData: "$1";     Tasks: sizebycenter; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "StartCenterPos"; ValueData: "$1";       Tasks: startcenter; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DefSizeOnClose"; ValueData: "$1";       Tasks: sizeonclose; Flags: uninsdeletekey;
; ;Ustawienia odtwarzania
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PauseOnMin"; ValueData: "$1";            Tasks: pauseonmin\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PauseOnMin"; ValueData: "$2";            Tasks: pauseonmin\b; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "ShowRememberList"; ValueData: "$1";      Tasks: rememberlist; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PlayScreenMoveCenter"; ValueData: "$1";  Tasks: movecenter; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "RememberPosition"; ValueData: "$1";      Tasks: remposvideo; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "RememberPositionAudio"; ValueData: "$1"; Tasks: remposaudio; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "CloseOnComplete"; ValueData: "$1";       Tasks: closecomplete; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PreviewThumbnail"; ValueData: "$1";      Tasks: prevthumb; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "DVDRestorePosition"; ValueData: "$2";    Tasks: remposdvd; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueName: "DisplayBookmark";                                          Tasks: dispbookmark; Flags: deletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PreviewSeekTime"; ValueData: "$1";       Tasks: seektime; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "DisplayAsThumbnail"; ValueData: "$1";    Tasks: dispasthumb; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "PlaybackFailSkip"; ValueData: "$1";      Tasks: failskip_a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "PlaybackFailSkip"; ValueData: "$2";      Tasks: failskip_b; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "OnTopMode"; ValueData: "$2";             Tasks: ontopmode; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "ScreenFitBySize"; ValueData: "$1";      Tasks: screenfitbysize\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "ScreenFitBySize"; ValueData: "$2";      Tasks: screenfitbysize\b; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessagePlayInfo"; ValueData: "$1";      Tasks: mesplayinfo; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessagePlayInfoFull"; ValueData: "$1";  Tasks: mesplayinfo; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessagePlayTime"; ValueData: "$7";      Tasks: mesplayinfo; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageFileName"; ValueData: "$0";      Tasks: mesplayinfo; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageChapter"; ValueData: "$0";       Tasks: mesplayinfo\a; Flags: deletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MousePanScanControl"; ValueData: "$1";  Tasks: mouse_ps; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageBetery"; ValueData: "$1";        Tasks: powerststus\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MessageBetery"; ValueData: "$2";        Tasks: powerststus\b; Flags: uninsdeletekey;
; ; Eksternal audio, gain
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AutoLoadExtAudio"; ValueData: "$1";     Tasks: extaudio; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueName: "AudioNormalize"; Tasks: gain; Flags: deletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "Ac3DtsVolumeControl"; ValueData: "$1";  Tasks: gain2; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudioVolumeMaxVal"; ValueData: "$c8";   Tasks: gain3; Flags: uninsdeletekey;
; ;<-- // Dodajemy ustawienia g³oœników // -->
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudSpkIndex_new"; ValueData: "$1";      Tasks: stereo; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudExpandSurround"; ValueData: "$1";    Tasks: stereo; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudExpandCenter"; ValueData: "$1";      Tasks: stereo; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudExpandCenter"; ValueData: "$1";      Tasks: ch6; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudExpandSurround"; ValueData: "$1";    Tasks: ch6; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudSpkIndex_new"; ValueData: "$11";     Tasks: ch6; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudSpkIndex_new"; ValueData: "$16";     Tasks: asis; Flags: uninsdeletevalue;
; ;Virtual Dolby Decoder
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudSpkIndex_new"; ValueData: "$19";     Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "Ac3Drc_new"; ValueData: "$1";           Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "UseOnly48000"; ValueData: "$0";         Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudioResampleMode"; ValueData: "$2";    Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudioResampleQuality"; ValueData: "$0"; Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntMp1_0"; ValueData: "$4";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntMp2_0"; ValueData: "$4";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntMp3_0"; ValueData: "$5";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntAac_0"; ValueData: "$4";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntLatm"; ValueData: "$2";              Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntAc3_0"; ValueData: "$3";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntEac3_0"; ValueData: "$2";            Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntTrueHD_0"; ValueData: "$1";          Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntMlp_0"; ValueData: "$1";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IntDts_0"; ValueData: "$3";             Tasks: virtual_dolby; Flags: uninsdeletevalue;
; ;<-- // W³¹czenie Sanear // -->
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "AudioRen"; ValueData: "@device:sw:{{E0F158E1-CB04-11D0-BD4E-00A0C911CE86}\{{DF557071-C9FD-433A-9627-81E0D3640ED9}"; Tasks: sanear; Flags: uninsdeletevalue;
; ;<-- // W³¹czenie WASAPI // -->
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "AudioRen"; ValueData: "{{EE9109D9-1534-4B24-B86E-EAADE6850E59}"; Tasks: wasapi; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntAudioRenWSExclusive"; ValueData: "$1";                         Tasks: wasapi; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntAudioRenWSBitExact"; ValueData: "$1";                          Tasks: wasapi; Flags: uninsdeletevalue;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AudioCrossfeedUse"; ValueData: "$1";                       Tasks: Crossfeed; Flags: uninsdeletevalue;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AudioVolumeStart"; ValueData: "$1";                        Tasks: audio_start; Flags: uninsdeletevalue;
; ;< --// Próbkowanie audio // -->
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudOutBit_new"; ValueData: "$0";                           Tasks: bit_depth16; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudOutBit_new"; ValueData: "$1";                           Tasks: bit_depth24; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudOutBit_new"; ValueData: "$2";                           Tasks: bit_depth32; Flags: uninsdeletevalue;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AudOutBit_new"; ValueData: "$3";                           Tasks: bit_depth32f; Flags: uninsdeletevalue;
; ; Zak³adki do PBF
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "BookmarkSaveExternal"; ValueData: "$1";                    Tasks: bookmark; Flags: uninsdeletekey;
; ; Zapisz na Pulpit lub galeria
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "VideoCaptureFolder"; ValueData: "{userdesktop}";          Tasks: savedesktop; Flags: createvalueifdoesntexist;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "ThumbnailSameDir"; ValueData: "$1";                        Tasks: savegalery; Flags: uninsdeletekey;
; ; Format przechwytu obrazków
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "VideoCaptureFormat"; ValueData: "$0";                      Tasks: saveformat\bmp; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "VideoCaptureFormat"; ValueData: "$2";                      Tasks: saveformat\png; Flags: uninsdeletekey;
; ; Automatyczne wczytywanie URL ze schowka
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "UseClipboardUrl"; ValueData: "$1";                         Tasks: loadurl; Flags: uninsdeletekey;
; ;Domyœlne dzia³anie otwierania
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DefOpenMode"; ValueData: "$1";                             Tasks: opendef\url; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DefOpenMode"; ValueData: "$2";                             Tasks: opendef\folder; Flags: uninsdeletekey;
; ;Domyœlne dzia³anie otwierania - pliki
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "OpenWithSameName"; ValueData: "$2";     Tasks: openwithsamename_a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AppendFilePL"; ValueData: "$1";         Tasks: openwithsamename_a\1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "OpenWithSameName"; ValueData: "$0";     Tasks: openwithsamename_b; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "SavePlayList"; ValueData: "$0";         Tasks: openwithsamename_b\savepl; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "PlaybackSearchFile"; ValueData: "$1";   Tasks: openwithsamename_sf; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "AttachOpenFullScreen"; ValueData: "$0"; Tasks: playlistopenfullscreen; Flags: uninsdeletekey;
; ; Ustawienia Nawigatora po plikach
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_WindowSize"; ValueData: "$3";        Tasks: opendef\navig; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DefOpenMode"; ValueData: "$3";          Tasks: opendef\navig; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_FontSize"; ValueData: "$14";         Tasks: opendef\navig; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_RightList"; ValueData: "$1";         Tasks: opendef\navig\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_RightList"; ValueData: "$2";         Tasks: opendef\navig\b; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_LargeSelect"; ValueData: "$0";       Tasks: opendef\navig\disable_zoom; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_LargeFrame"; ValueData: "$1";        Tasks: opendef\navig\large_frame; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SO_NoClose"; ValueData: "$1";           Tasks: opendef\navig\no_close; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "Win7WorkTool"; ValueData: "$2";         Tasks: win7worktool; Flags: uninsdeletekey;
; ; Ustawienia napisów
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "CaptionVisible"; ValueData: "$0"; Flags: uninsdeletekey; 
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "DVDCaptionVisible"; ValueData: "$0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueName: "CaptionVisible";                                          Tasks: sub; Flags: deletevalue 
Root: HKCU; Subkey: {#keyPMS}; ValueName: "DVDCaptionVisible";                                       Tasks: sub; Flags: deletevalue 
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "UseCaptionBinFilter"; ValueData: "$1";  Tasks: subfilter; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "ForceCaptionLoad"; ValueData: "$1";     Tasks: force_sub\a; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "MouseCaptionMove"; ValueData: "$1";     Tasks: pos_sub; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "IdxSubOverridePos"; ValueData: "$1";    Tasks: pos_pgs; Flags: uninsdeletekey;
; ; Pobieranie napisów
; ; OSDB - u¿ywaj tylko wtedy gdy brak napisów, wczytaj pierwsze dostêpne
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "CaptionDownloadBefore"; ValueData: "$1"; Tasks: downsub_first; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "CaptionDownloadAfter"; ValueData: "$1";  Tasks: downsub_first; Flags: uninsdeletekey;
; ; W³¹czenie LEKTORA
Root: HKCU; SubKey: {#keyPMS}; ValueType: string; ValueName: "CaptionStyle"; ValueData: "5;5;5;5;2;0;2.000000;2.000000;3.000000;3.000000;0xffffff;0x000000;0x000000;0x000000;0x00;0x00;0x00;0x90;1;Segoe UI;0.000000;100.000000;100.000000;0.000000;700;0;0;0;0;0.000000;0.000000;0.000000;0.000000;2;0;1;50;95;0.000000;0;0"; Tasks: lektor; Flags: uninsdeletekey;
Root: HKCU; SubKey: {#keyPMS}; ValueType: dword; ValueName: "CaptionTTS"; ValueData: "$1";            Tasks: lektor; Flags: uninsdeletekey;
Root: HKCU; SubKey: {#keyPMS}; ValueType: dword; ValueName: "EngineTTS"; ValueData: "$0";             Tasks: lektor; Flags: uninsdeletekey;
Root: HKCU; SubKey: {#keyPMS}; ValueType: dword; ValueName: "SpeedTTS"; ValueData: "$0";              Tasks: lektor; Flags: uninsdeletekey;
Root: HKCU; SubKey: {#keyPMS}; ValueType: dword; ValueName: "AudioVolume"; ValueData: "$2d";          Tasks: lektor; Flags: uninsdeletekey;
; ; Zmniejszenie Interlinii
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "CaptionLineSpace"; ValueData: "$ffffffec";      Tasks: interlinia; Flags: uninsdeletekey;
; ; Maksymalny czas ukazywania napisów
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "CaptionMaxVisUse"; ValueData: "$1";             Tasks: maxtime; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: binary; ValueName: "CaptionMaxVisTime"; ValueData: "00 00 e0 40";  Tasks: maxtime; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "CaptionForceSecond"; ValueData: "$1";    Tasks: subsecond; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PrefCapLangHide"; ValueData: "$1";       Tasks: hidesub; Flags: uninsdeletekey;
; ; Renderer madVR
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VideoRen2"; ValueData: "$a";             Tasks: renderer\madvr; Flags: uninsdeletekey;
; ; Renderer Open GL
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VideoRen2"; ValueData: "$c";             Tasks: renderer\opengl; Flags: uninsdeletekey;
; ; Renderer D3D11
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VideoRen2"; ValueData: "$f";             Tasks: renderer\d3d11; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VMR9VSyncInternal"; ValueData: "$0";     Tasks: renderer\d3d11; Flags: uninsdeletekey;
; W³¹czenie AviSynth i SVP
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'MoveTop''SetSub''AddVis''AddTime''AddButtons'";                         Tasks: hw\avs and skin3; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'MoveTop''SetButtons''AddVis''AddTime''AddButtons'";                     Tasks: hw\avs and skin2; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "''TopButtons''StreamButton''PlayPauseButton''TimeLabel''OpenurlButton'"; Tasks: hw\avs and skin1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AvisynthUse"; ValueData: "$1";                                                                        Tasks: hw\avs; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: string; ValueName: "AvisynthScript"; ValueData: "svp=3 alg=3 fim=3 bf=0 sh=0 uhd=0 gpu=0 fps=60 import(""svp.avs"")";    Tasks: hw\avs; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AvisynthBufferAhead"; ValueData: "$b";                                                                Tasks: hw\avs; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "AvisynthBufferBack"; ValueData: "$0";                                                                 Tasks: hw\avs; Flags: uninsdeletekey;
; Koniec w³¹czenia AviSynth i SVP
; W³¹czenie FFmpeg64 dla H265
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntH265_0"; ValueData: "$2";           Tasks: ffmpeg; Flags: uninsdeletekey;
;
; ; DXVA
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUseMode"; ValueData: "$1";      Tasks: hw\dxva; Flags: uninsdeletekey;
; ; DXVA FullHD
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUseMode"; ValueData: "$1";         Tasks: hw\dxva1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUpperHoriVal"; ValueData: "$1000"; Tasks: hw\dxva1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUpperVertVal"; ValueData: "$6b8";  Tasks: hw\dxva1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVALowerHoriVal"; ValueData: "$780";  Tasks: hw\dxva1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVALowerVertVal"; ValueData: "$3d4";  Tasks: hw\dxva1; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAResLimit"; ValueData: "$3";        Tasks: hw\dxva1; Flags: uninsdeletekey;
; ; DXVA Copy-back
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUseMode"; ValueData: "$1";      Tasks: hw\dxva2; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "UseSelfDxva"; ValueData: "$1";         Tasks: hw\dxva2; Flags: uninsdeletekey;
; ; CUDA
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUseMode"; ValueData: "$1";      Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntH264_0"; ValueData: "$2";           Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntMPEG1_0"; ValueData: "$1";          Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntMPEG2_0"; ValueData: "$2";          Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntMPEG4_0"; ValueData: "$1";          Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntVc1"; ValueData: "$2";              Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntMjpeg"; ValueData: "$1";            Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntVp8_0"; ValueData: "$2";            Tasks: hw\cuda; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntVp9_0"; ValueData: "$2";            Tasks: hw\cuda; Flags: uninsdeletekey;
; ;QSYNC
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntDXVAUseMode"; ValueData: "$1";      Tasks: hw\qsyn; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntH264_0"; ValueData: "$1";           Tasks: hw\qsyn; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntMPEG2_0"; ValueData: "$1";          Tasks: hw\qsyn; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "IntVc1"; ValueData: "$1";              Tasks: hw\qsyn; Flags: uninsdeletekey;
; ; Filtry
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VideoPropertyHwFirst"; ValueData: "$1"; Tasks: hwfirst; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "DX9ResizeMode_0"; ValueData: "$13";     Tasks: resizer; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "Sharpen"; ValueData: "$1";              Tasks: sharpen; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "VideoDeband"; ValueData: "$1";          Tasks: deband; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPMS}; ValueType: Dword; ValueName: "LevelFix"; ValueData: "$1";             Tasks: levelfix; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "HqRgbConv"; ValueData: "$1";            Tasks: HqRgbConv; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "ThreadConv"; ValueData: "$1";           Tasks: ThreadConv; Flags: uninsdeletekey;
; ; Priorytet odtwarzania
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "PlayPriority2"; ValueData: "$4";        Tasks: playpriority; Flags: uninsdeletekey;
; ; W³¹czenie MVC3D
Root: HKCU; Subkey: {#keyPMS}; ValueType: dword; ValueName: "SupportH264MVC"; ValueData: "$1";                               Tasks: mvc3d; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyPM}\OptionList_DXVA Native Decoder; ValueType: dword; ValueName: "SupportH264MVC"; ValueData: "$1"; Tasks: mvc3d; Flags: uninsdeletekey;
; ; Koniec w³¹czenia MVC3D
; ;< -- // Ustawiamy foldery zapisu -->
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "VideoCaptureFolder"; ValueData: "{userdocs}\PotPlayerMini\Capture";  Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "AudioCaptureFolder"; ValueData: "{userdocs}\PotPlayerMini\Capture";  Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "MovieCaptureFolder"; ValueData: "{userdocs}\PotPlayerMini\Capture";  Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "BroadcastSaveFolder"; ValueData: "{userdocs}\PotPlayerMini\Capture"; Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "BdaSaveFolder"; ValueData: "{userdocs}\PotPlayerMini\Capture";       Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "PlayListFolder"; ValueData: "{userdocs}\PotPlayerMini\Playlist";     Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "TempFolder"; ValueData: "{userdocs}\PotPlayerMini\Temp";             Tasks: savedocs; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: {#keyPMS}; ValueType: String; ValueName: "WinampDspPath"; ValueData: "{userdocs}\PotPlayerMini\Plugins";       Tasks: savedocs; Flags: createvalueifdoesntexist
; ; Imported Registry File: "MPC Video Renderer"
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "UseD3D11"; ValueData: "$1";                   Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "ShowStatistics"; ValueData: "$0";             Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "TextureFormat"; ValueData: "$0";              Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "VPEnableNV12"; ValueData: "$1";               Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "VPEnableP01x"; ValueData: "$1";               Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "VPEnableYUY2"; ValueData: "$1";               Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "VPEnableOther"; ValueData: "$1";              Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "DoubleFramerateDeinterlace"; ValueData: "$1"; Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "VPScaling"; ValueData: "$1";                  Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "ChromaScaling"; ValueData: "$0";              Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "Upscaling"; ValueData: "$2";                  Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "Downscaling"; ValueData: "$2";                Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "InterpolateAt50pct"; ValueData: "$1";         Tasks: mpcvr; Flags: uninsdeletekey;
Root: HKCU; Subkey: {#keyMVR}; ValueType: dword; ValueName: "SwapEffect"; ValueData: "$0";                 Tasks: mpcvr; Flags: uninsdeletekey;
; ; Imported Registry File: "Sanear Audio Renderer"
Root: HKCU; Subkey: Software\sanear; ValueType: string; ValueName: "DeviceId"; ValueData: "";                    Tasks: sanear; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\sanear; ValueType: dword; ValueName: "DeviceExclusive"; ValueData: "$0";            Tasks: sanear; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\sanear; ValueType: dword; ValueName: "DeviceBufferDuration"; ValueData: "$c8";      Tasks: sanear; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\sanear; ValueType: dword; ValueName: "AllowBitstreaming"; ValueData: "$1";          Tasks: sanear; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\sanear; ValueType: dword; ValueName: "CrossfeedEnabled"; ValueData: "$0";           Tasks: sanear; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\sanear; ValueType: dword; ValueName: "CrossfeedCutoffFrequency"; ValueData: "$2bc"; Tasks: sanear; Flags: uninsdeletekey;
Root: HKCU; Subkey: Software\sanear; ValueType: dword; ValueName: "CrossfeedLevel"; ValueData: "$3c";            Tasks: sanear; Flags: uninsdeletekey;
; ; Zewnêtrzne splittery MPC
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "Type"; ValueType: Dword; ValueData: "$1"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "Disabled"; ValueType: Dword; ValueData: "$1"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "Path"; ValueType: String; ValueData: "{app}\Module\AviSplitter64.ax"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "Name"; ValueType: String; ValueData: "MPC AVI Source"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "CLSID"; ValueType: String; ValueData: "{{CEA8DEFF-0AF7-4DB9-9A38-FB3C3AEFC0DE}"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "FilterType"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "Merit"; ValueType: Dword; ValueData: "$600001"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "MeritHi"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "Type"; ValueType: Dword; ValueData: "$1"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "Disabled"; ValueType: Dword; ValueData: "$1"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "Path"; ValueType: String; ValueData: "{app}\Module\MatroskaSplitter64.ax"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "Name"; ValueType: String; ValueData: "MPC Matroska Source"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "CLSID"; ValueType: String; ValueData: "{{0A68C3B5-9164-4A54-AFAF-995B2FF0E0D4}"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "FilterType"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "Merit"; ValueType: Dword; ValueData: "$600000"; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "MeritHi"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "Type"; ValueType: Dword; ValueData: "$1"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "Disabled"; ValueType: Dword; ValueData: "$1"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "Path"; ValueType: String; ValueData: "{app}\Module\MP4Splitter64.ax"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "Name"; ValueType: String; ValueData: "MPC MP4/MOV Source"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "CLSID"; ValueType: String; ValueData: "{{3CCC052E-BDEE-408A-BEA7-90914EF2964B}"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "FilterType"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "Merit"; ValueType: Dword; ValueData: "$600000"; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "MeritHi"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: {#keyPMOS}\0003; ValueName: "Type"; ValueType: Dword; ValueData: "$FFFFFFFE"; 
Root: HKCU; Subkey: {#keyPMOS}\0000; ValueName: "Disabled"; ValueType: Dword; ValueData: "$0"; Tasks: extsource; 
Root: HKCU; Subkey: {#keyPMOS}\0001; ValueName: "Disabled"; ValueType: Dword; ValueData: "$0"; Tasks: extsource; 
Root: HKCU; Subkey: {#keyPMOS}\0002; ValueName: "Disabled"; ValueType: Dword; ValueData: "$0"; Tasks: extsource;

[INI]
Filename: "{app}\Links\FanPack w sieci.url";                  Section: "InternetShortcut"; Key: "URL"; String: "http://www.potplayerclub.pl/"
Filename: "{app}\Links\Addons Mozilla PotPlayer YouTube.url"; Section: "InternetShortcut"; Key: "URL"; String: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/"
Filename: "{app}\Links\Addons Chrome PotPlayer YouTube.url";  Section: "InternetShortcut"; Key: "URL"; String: "https://chrome.google.com/webstore/search/potplayer"

[Icons]
Name: "{group}\Addons Mozilla PotPlayer YouTube.url"; Filename: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/"; Tasks: addon\1;
Name: "{group}\Addons Chrome PotPlayer YouTube.url";  Filename: "https://chrome.google.com/webstore/search/potplayer";                     Tasks: addon\2;
Name: "{group}\CzytajTo";                             Filename: "{app}\CzytajTo.txt"; 
Name: "{group}\Licencja";                             Filename: "{app}\License.txt";
Name: "{group}\Resetuj madVR";                        Filename: "{userappdata}\madVR\restore default settings.bat";                        Components: madvr;
Name: "{group}\Addons Mozilla PotPlayer YouTube";     Filename: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/";
Name: "{group}\Addons Chrome PotPlayer YouTube";      Filename: "https://chrome.google.com/webstore/search/potplayer";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}";   Filename: "{uninstallexe}";
Name: "{group}\FanPack w sieci";                      Filename: "{#MyAppURL}"

[Run]
Filename: "{tmp}\madVR_v0.9.17.exe";                                                      WorkingDir: {tmp}; Description: "Trwa instalacja madVR. Proszê czekaæ...";             StatusMsg: "Trwa instalacja madVR. Proszê czekaæ...";             Components: "madvr";  Check: IsmadVRInstalled;
Filename: "{tmp}\Icaros.exe";            Parameters: "/VERYSILENT";                       WorkingDir: {tmp}; Description: "Trwa instalacja Icaros. Proszê czekaæ...";            StatusMsg: "Trwa instalacja Icaros. Proszê czekaæ...";            Components: "icaros"; Check: IsIcarosInstalled; 
Filename: "{tmp}\TS.MatriX.Setup.exe";   Parameters: "/VERYSILENT";                       WorkingDir: {tmp}; Description: "Trwa instalacja TorrServer. Proszê czekaæ...";        StatusMsg: "Trwa instalacja TorrServer. Proszê czekaæ...";        Components: "tor";    Check: IsTORInstalled;
Filename: "{tmp}\\ace_engine_setup.exe"; Parameters: "/VERYSILENT";                       WorkingDir: {tmp}; Description: "Trwa instalacja Ace Sream Engine. Proszê czekaæ...";  StatusMsg: "Trwa instalacja Ace Sream Engine. Proszê czekaæ..."; Components: "ace";    Check: IsAceInstalled;
Filename: "reg";                         Parameters: "IMPORT Icaros_HKCU.reg /reg:64";    WorkingDir: {tmp}; Description: "Konfiguracja Icaros.";                                StatusMsg: "Konfiguracja Icaros.";                                Components: "icaros"; Check: IsIcarosInstalled; Flags: shellexec runhidden
Filename: "reg";                         Parameters: "IMPORT icaros_HKLM_64.reg /reg:64"; WorkingDir: {tmp}; Description: "Konfiguracja Icaros.";                                StatusMsg: "Konfiguracja Icaros.";                                Components: "icaros"; Check: IsIcarosInstalled; Flags: shellexec runhidden
Filename: "reg";                         Parameters: "IMPORT icaros_HKLM_32.reg /reg:32"; WorkingDir: {tmp}; Description: "Konfiguracja Icaros.";                                StatusMsg: "Konfiguracja Icaros.";                                Components: "icaros"; Check: IsIcarosInstalled; Flags: shellexec runhidden
Filename: "{tmp}\7za.exe";               Parameters: "x ""{tmp}\Module.7z"" -o""{commonpf32}\DAUM\PotPlayer\Module"" * -r -aoa";                                                                                                                   Components: "program"; Flags: runhidden runascurrentuser;
Filename: "{tmp}\7za.exe";               Parameters: "x ""{tmp}\PxShader.7z"" -o""{commonpf32}\DAUM\PotPlayer\PxShader"" * -r -aoa";                                                                                                               Components: "program"; Flags: runhidden runascurrentuser;
Filename: "{commonpf32}\DAUM\PotPlayer\PotPlayerMini.exe";                                                   Description: "{cm:LaunchProgram,PotPlayer}";                                      Flags: postinstall skipifsilent nowait 
Filename: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/";                         Description: "Przekieruj do Firefox Potplayer Youtube Shortcut";  Tasks: addon\1; Flags: postinstall ShellExec
Filename: "https://chrome.google.com/webstore/search/potplayer";                                             Description: "Przekieruj do Chrome Potplayer Youtube Shortcut";   Tasks: addon\2; Flags: postinstall ShellExec

[UninstallRun]
Filename: "{app}\delete madVR.bat";                                        WorkingDir: "{app}"; StatusMsg: "Deinstalacja madVR.";               Components: "madvr"; RunOnceId: "DelService"; Flags: shellexec runhidden
Filename: "{localappdata}\TorrServer\unins000.exe"; Parameters: "/SILENT"; WorkingDir: "{app}"; StatusMsg: "Deinstalacja TorrServer.";          Components: "tor";   RunOnceId: "DelService"; Flags: shellexec

[Tasks]      
Name: "minfo";                      Description: "Dodaj MediaInfo do menu kontekstowego plików";                           GroupDescription: "Integracja:";        Components: minfo
Name: "addon";                      Description: "Instalacja dodatków dla przegl¹darek";                                   GroupDescription: "Integracja:";        Flags: unchecked;
Name: "addon\1";                    Description: "Przekieruj do Firefox Potplayer Youtube Shortcut";                       GroupDescription: "Integracja:";        Flags: exclusive unchecked;
Name: "addon\2";                    Description: "Przekieruj do Chrome Potplayer Youtube Shortcut";                        GroupDescription: "Integracja:";        Flags: exclusive unchecked;
Name: "skin0";                      Description: """Default skin"" (instalacja domyœlna)";                                                GroupDescription: "Ustawienia skórek:"; Flags: exclusive;
Name: "skin1";                      Description: """Default MOD Optimized"" (¿ó³te elementy + okr¹g³a ¿ó³ta ikona odtwarzacza)";          GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked;
Name: "fixpot";                     Description: """Default MOD Optimized"" (niebieskie elementy + okr¹g³a niebieska ikona odtwarzacza)"; GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked; 
Name: "skin2";                      Description: """FMOD""";                                                               GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked;
Name: "skin3";                      Description: """PotMPC""";                                                             GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked;
Name: "skin4";                      Description: """PotXMP""";                                                             GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked; 
Name: "skinmenu";                   Description: "Systemowe ciemne menu kontekstowe odtwarzacza";                          GroupDescription: "Ustawienia skórek:";
Name: "skinfix";                    Description: "U¿yj sta³ego rozmiaru skórki";                                           GroupDescription: "Ustawienia skórek:"; 
Name: "skinfix\a";                  Description: "720x404";                                                                GroupDescription: "Ustawienia skórek:"; Flags: exclusive; 
Name: "skinfix\b";                  Description: "800x450";                                                                GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked; 
Name: "skinfix\c";                  Description: "1280x720";                                                               GroupDescription: "Ustawienia skórek:"; Flags: exclusive unchecked;
Name: "skinstart";                  Description: "Zawsze uruchamiaj ze skórk¹ w trybie ""Wideo""";                         GroupDescription: "Ustawienia skórek:";
Name: "skinsize";                   Description: "Zachowaj rozmiar okna podczas prze³¹czania trybów skórki wideo/audio";   GroupDescription: "Ustawienia skórek:";
Name: "autoresfullscr";             Description: "Automatycznie dostosuj rozmiar obszaru obrazu na pe³nym ekranie";        GroupDescription: "Ustawienia skórek:"; Flags: unchecked;
Name: "startcenter";                Description: "Okno na œrodku ekranu podczas uruchamiania odtwarzacza";                 GroupDescription: "Ustawienia skórek:";
Name: "savedocs";                   Description: "Zapisuj do folderu ""...\Dokumenty\PotPlayerMini64""";                   GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: exclusive unchecked;
Name: "savedef";                    Description: "Zapisuj w domyœlnych folderach";                                         GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: exclusive;
Name: "playlist";                   Description: "Dodaj samoaktualizuj¹ce siê listy odtwarzania (YT, Torrent IPTV)";       GroupDescription: "Listy, Audio, Wideo, Zak³adki...";
Name: "bookmark";                   Description: "Przechowuj zak³adki w pliku .PBF w folderze z filmem";                   GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: unchecked;
Name: "savedesktop";                Description: "Zrzuty ekranu zapisuj na Pulpit w formacie...";                          GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: unchecked;
Name: "saveformat\bmp";             Description: ".BMP";                                                                   GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: exclusive unchecked;
Name: "saveformat\jpg";             Description: ".JPG";                                                                   GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: exclusive unchecked;
Name: "saveformat\png";             Description: ".PNG";                                                                   GroupDescription: "Listy, Audio, Wideo, Zak³adki..."; Flags: exclusive;
Name: "savegalery";                 Description: "Zapisuj galeriê miniatur w folderze z odtwarzanym plikiem";              GroupDescription: "Listy, Audio, Wideo, Zak³adki...";
Name: "loadurl";                    Description: "Automatycznie wklejaj adresy URL ze schowka";                            GroupDescription: "Listy, Audio, Wideo, Zak³adki...";
Name: "dispasthumb";                Description: "Wyœwietlaj miniatury i szczegó³y w liœcie odtwarzania";                  GroupDescription: "Listy, Audio, Wideo, Zak³adki...";
Name: "opendef";                    Description: "Domyœlne dzia³anie otwierania";                                              GroupDescription: "Odtwarzacz:";
Name: "opendef\file";               Description: "Otwórz plik(i)";                                                             GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "opendef\url";                Description: "Otwórz adres URL";                                                           GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "opendef\folder";             Description: "Otwórz folder";                                                              GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "opendef\navig";              Description: "Otwórz ""Mened¿er plików"" - *zalecane do wyœwietlania na TV";               GroupDescription: "Odtwarzacz:"; Flags: exclusive;
Name: "opendef\navig\a";            Description: "Wyœwietlaj elementy po prawej w dwóch liniach";                              GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "opendef\navig\b";            Description: "Wyœwietlaj elementy po prawej jako kafelki";                                 GroupDescription: "Odtwarzacz:"; Flags: exclusive;
Name: "opendef\navig\disable_zoom"; Description: "Wy³¹cz powiêkszanie elementów po najechaniu myszk¹";                         GroupDescription: "Odtwarzacz:"; Flags: unchecked; 
Name: "opendef\navig\large_frame";  Description: "Zwiêksz nieznacznie tytu³ okna, obramowanie";                                GroupDescription: "Odtwarzacz:";
Name: "opendef\navig\no_close";     Description: "Nie zamykaj okna po wybraniu elementu";                                      GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "openwithsamename_a";         Description: "Dodawaj wszystkie pliki do g³ównej listy odtwarzania";                       GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "openwithsamename_a\1";       Description: "Nie czyœæ listy odtwarzania podczas dodawania nowych plików";                GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "openwithsamename";           Description: "Dodawaj do listy odtwarzania wszystkie podobne pliki";                       GroupDescription: "Odtwarzacz:"; Flags: exclusive;
Name: "openwithsamename_b";         Description: "Dodawaj tylko wybrane pliki do g³ównej listy odtwarzania";                   GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "openwithsamename_b\savepl";  Description: "Wyczyœæ listê odtwarzania przy zamykaniu odtwarzacza";                       GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "openwithsamename_sf";        Description: "Dodawaj poprzedni/nastêpny plik z folderu klawiszami ""Pg Up/Dn""";          GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "playlistopenfullscreen";     Description: "Nie wyœwietlaj listy na pe³nym ekranie po przesuniêciu myszki w prawo";      GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "rememberlist";               Description: "Przechowuj i poka¿ ostatnio odtwarzane elementy w menu ""Albumy/Ulubione"""; GroupDescription: "Odtwarzacz:";
Name: "remposvideo";                Description: "Wznawiaj odtwarzanie plików wideo od momentu zatrzymania";                   GroupDescription: "Odtwarzacz:";
Name: "remposaudio";                Description: "Wznawiaj odtwarzanie plików audio od momentu zatrzymania";                   GroupDescription: "Odtwarzacz:";
Name: "remposdvd";                  Description: "Wznawiaj odtwarzanie DVD od momentu zatrzymania";                            GroupDescription: "Odtwarzacz:";
Name: "pauseonmin";                 Description: "Wstrzymaj odtwarzanie po minimalizacji";                                     GroupDescription: "Odtwarzacz:";
Name: "pauseonmin\a";               Description: "Wstrzymaj odtwarzanie wideo/audio";                                          GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "pauseonmin\b";               Description: "Wstrzymaj odtwarzanie tylko wideo";                                          GroupDescription: "Odtwarzacz:"; Flags: exclusive; 
Name: "failskip_a";                 Description: "Automatyczne odtwarzaj nastêpny plik po b³êdzie odtwarzania";                GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "failskip_b";                 Description: "Wyœwietlaj komunikat o b³êdzie po wyst¹pieniu b³êdu odtwarzania";            GroupDescription: "Odtwarzacz:"; Flags: exclusive;
Name: "closecomplete";              Description: "Automatycznie zamknij ostatni plik po zakoñczeniu odtwarzania";              GroupDescription: "Odtwarzacz:";
Name: "movecenter";                 Description: "Okno odtwarzacza na œrodku ekranu podczas odtwarzania";                      GroupDescription: "Odtwarzacz:";
Name: "ontopmode";                  Description: "Okno odtwarzacza zawsze na wierzchu innych okien podczas odtwarzania";       GroupDescription: "Odtwarzacz:";
Name: "sizebycenter";               Description: "Zmieniaj rozmiar okna w oparciu o œrodek";                                   GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "sizeonclose";                Description: "Domyœlny rozmiar okna po zamkniêciu pliku";                                  GroupDescription: "Odtwarzacz:";
Name: "screenfitbysize";            Description: "Zachowaj wspó³czynnik proporcji obrazu przy zmianie rozmiaru okna";          GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "screenfitbysize\a";          Description: "Zachowaj wspó³czynnik proporcji w oparciu o rozmiar pionowy";                GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "screenfitbysize\b";          Description: "Zachowaj wspó³czynnik proporcji w oparciu o rozmiar poziomy";                GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "prevthumb";                  Description: "Wyœwietlaj miniatury po najechaniu myszk¹ na pasek nawigacyjny";             GroupDescription: "Odtwarzacz:";
Name: "dispbookmark";               Description: "Poka¿ znaczniki rozdzia³ów/zak³adek na pasku nawigacyjnym";                  GroupDescription: "Odtwarzacz:";
Name: "seektime";                   Description: "Poka¿ czas, gdy myszka znajdzie siê nad paskiem nawigacyjnym";               GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "mesplayinfo";                Description: "Wyœwietlaj informacje o czasie odtwarzania tylko na pe³nym ekranie";         GroupDescription: "Odtwarzacz:"; 
Name: "mesplayinfo\a";              Description: "Wyœwietlaj informacje o znacznikach rozdzia³ów";                             GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "win7worktool";               Description: "Przyciski steruj¹ce w ikonie odtwarzacza na Pasku zadañ";                    GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "mouse_ps";                   Description: "Aktywuj przeci¹ganie myszk¹ dla PanScan, Zoom i rozci¹gania obrazu";         GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "powerststus";                Description: "Stan zasilania";                                                             GroupDescription: "Odtwarzacz:"; Flags: unchecked;
Name: "powerststus\a";              Description: "Wyœwietlaj konfiguracjê zasilania i stan na³adowania baterii";               GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;
Name: "powerststus\b";              Description: "Wyœwietlaj tylko stan na³adowania baterii";                                  GroupDescription: "Odtwarzacz:"; Flags: exclusive unchecked;

Name: "sub";                        Description: "Poka¿ napisy";                                                               GroupDescription: "Ustawienia napisów:";
Name: "subfilter";                  Description: "W³¹cz wyg³adzanie napisów";                                                  GroupDescription: "Ustawienia napisów:"; Flags: unchecked;
Name: "force_sub";                  Description: "Wczytaj napisy z folderu";                                                   GroupDescription: "Ustawienia napisów:";
Name: "force_sub\a";                Description: "Wczytaj dowolne napisy, jeœli ¿adne nie pasuj¹ (z dowoln¹ nazw¹)";           GroupDescription: "Ustawienia napisów:"; Flags: exclusive unchecked;
Name: "force_sub\b";                Description: "Wczytaj napisy pasuj¹ce do tytu³u i sezonu/odcinka";                         GroupDescription: "Ustawienia napisów:"; Flags: exclusive;
Name: "pos_sub";                    Description: "Aktywuj przesuwanie myszk¹ pozycji H/V napisów na ekranie";                  GroupDescription: "Ustawienia napisów:"; Flags: unchecked;
Name: "pos_pgs";                    Description: "Zastosuj niestandardowe po³o¿enie napisów graficznych (PGS, VobSub)";        GroupDescription: "Ustawienia napisów:"; Flags: unchecked;
Name: "downsub_first";              Description: "Gdy brak napisów, znajdŸ i wczytaj z Napisy24";                              GroupDescription: "Ustawienia napisów:";
Name: "lektor";                     Description: "W³¹cz funkcjê Lektora (TTS)";                                                GroupDescription: "Ustawienia napisów:"; Flags: unchecked;
Name: "interlinia";                 Description: "Zmniejsz odstêp miêdzy liniami napisów";                                     GroupDescription: "Ustawienia napisów:";
Name: "maxtime";                    Description: "Maksymalny czas ukazywania siê napisów (7 sek.)";                            GroupDescription: "Ustawienia napisów:"; Flags: unchecked;
Name: "subsecond";                  Description: "W³¹cz 2-gie napisy na wyjœciu, gdy dostêpne s¹ ró¿ne napisy";                GroupDescription: "Ustawienia napisów:"; Flags: unchecked;
Name: "hidesub";                    Description: "Ukryj napisy, jeœli nie s¹ w preferowanym jêzyku";                           GroupDescription: "Ustawienia napisów:"; Flags: unchecked;

Name: "extaudio";                   Description: "Automatycznie wczytuj zewnêtrzne pliki audio";                               GroupDescription: "Ustawienia audio:"; Flags: unchecked;
Name: "gain";                       Description: "Aktywuj filtr normalizacji g³oœnoœci";                                       GroupDescription: "Ustawienia audio:";
Name: "gain2";                      Description: "Aktywuj wzmocnienie g³oœnoœci AC3/DTS do 10dB";                              GroupDescription: "Ustawienia audio:"; Flags: unchecked;
Name: "gain3";                      Description: "Ustaw poziom regulatora g³oœnoœci na 200%";                                  GroupDescription: "Ustawienia audio:"; Flags: unchecked;

Name: "stereo";                     Description: "Stereo (2.0) *zalecane";                                                     GroupDescription: "Ustawienia audio - wyjœcie audio:"; Flags: exclusive;
Name: "ch6";                        Description: "Wielokana³owe (5.1)";                                                        GroupDescription: "Ustawienia audio - wyjœcie audio:"; Flags: exclusive unchecked;
Name: "asis";                       Description: "Takie same jak wejœcie (mikser karty dŸwiêkowej)";                           GroupDescription: "Ustawienia audio - wyjœcie audio:"; Flags: exclusive unchecked;
Name: "virtual_dolby";              Description: "Wirtualny dekoder Dolby - *gdy u¿ywasz s³uchawek";                           GroupDescription: "Ustawienia audio - wyjœcie audio:"; Flags: exclusive unchecked;
Name: "audio_start";                Description: "Podczas uruchamiania odtwarzacza zawsze ustawiaj g³oœnoœæ na 100%";          GroupDescription: "Ustawienia audio - wyjœcie audio:"; Flags: unchecked;

Name: "rendef";                     Description: "Wybór automatyczny (zalecane)";                                              GroupDescription: "Ustawienia audio - renderer audio:"; Flags: exclusive;
Name: "wasapi";                     Description: "W³¹cz wbudowany WASAPI Audio Renderer";                                      GroupDescription: "Ustawienia audio - renderer audio:"; Flags: exclusive unchecked;
Name: "Crossfeed";                  Description: "W³¹cz Crossfeed - *gdy u¿ywasz s³uchawek";                                   GroupDescription: "Ustawienia audio - renderer audio:"; Flags: unchecked;
Name: "sanear";                     Description: "Dodaj zewnêtrzny Sanear Audio Renderer (mo¿na u¿yæ zamiast WASAPI)";         GroupDescription: "Ustawienia audio - renderer audio:";

Name: "bit_depth16";                Description: "16-bitów/próbkê *zalecane";                                                  GroupDescription: "Ustawienia audio - bit depth:"; Flags: exclusive unchecked;
Name: "bit_depth24";                Description: "24-bity/próbkê";                                                             GroupDescription: "Ustawienia audio - bit depth:"; Flags: exclusive;
Name: "bit_depth32";                Description: "32-bity/próbkê";                                                             GroupDescription: "Ustawienia audio - bit depth:"; Flags: exclusive unchecked;
Name: "bit_depth32f";               Description: "32-bity (floating point)/próbkê";                                            GroupDescription: "Ustawienia audio - bit depth:"; Flags: exclusive unchecked;

Name: "renderer";                   Description: "Renderer wideo";                                                             GroupDescription: "Ustawienia wideo:";
Name: "renderer\auto";              Description: "Automatyczny wybór odtwarzacza";                                             GroupDescription: "Ustawienia wideo:"; Flags: exclusive;
Name: "renderer\opengl";            Description: "W³¹cz wbudowany OpenGL Video Renderer";                                      GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "renderer\d3d11";             Description: "W³¹cz wbudowany Direct3D 11 Video Renderer";                                 GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "renderer\madvr";             Description: "W³¹cz zewnêtrzny madVR";                                                     GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked; Components: madvr
Name: "mpcvr";                      Description: "Dodaj zewnêtrzny MPC Video Renderer (D3D9/11)";                              GroupDescription: "Ustawienia wideo:";
Name: "hw";                         Description: "Opcje dekodowania wideo";                                                    GroupDescription: "Ustawienia wideo:";
Name: "hw\soft";                    Description: "SOFT *bez akceleracji (mo¿na u¿ywaæ madVR)";                                 GroupDescription: "Ustawienia wideo:"; Flags: exclusive;
Name: "hw\dxva";                    Description: "DXVA Native (nie nale¿y u¿ywaæ madVR)";                                      GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "hw\dxva1";                   Description: "DXVA Native FullHD *warunkowe w³¹czenie DXVA przy FullHD/4K (nie nale¿y u¿ywaæ madVR)";   GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "hw\dxva2";                   Description: "DXVA2 COPY-BACK (mo¿na u¿ywaæ madVR)";                                                    GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "hw\cuda";                    Description: "CUDA (OpenCodec) *dla GPU nVidia (mo¿na u¿ywaæ madVR)";                                   GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "hw\qsyn";                    Description: "Quick Sync (OpenCodec) *dla GPU Intel HD Sandy/Ivy/Haswell (mo¿na u¿ywaæ madVR)";         GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked;
Name: "hw\avs";                     Description: "AviSynth+ && SVPflow - zwiêkszenie p³ynnoœci i dynamiki ruchu (nie nale¿y u¿ywaæ madVR)"; GroupDescription: "Ustawienia wideo:"; Flags: exclusive unchecked; Components: avs
Name: "ffmpeg";                     Description: "W³¹cz FFmpeg.dll do odtwarzania H.265/HEVC";                                 GroupDescription: "Ustawienia wideo:";
Name: "extsource";                  Description: "U¿yj zewnêtrznych splitterów (AVI/MKV/MP4)";                                 GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "hwfirst";                    Description: "U¿yj sprzêtowego zarz¹dzania kolorami";                                      GroupDescription: "Ustawienia wideo:";
Name: "resizer";                    Description: "U¿yj resizera ""Shader (2PASS) Lanczos 3"" *zwiêkszenie ostroœci";           GroupDescription: "Ustawienia wideo:";
Name: "sharpen";                    Description: "W³¹cz filtr ""Sharpen""";                                                    GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "deband";                     Description: "W³¹cz filtr ""Deband""";                                                     GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "levelfix";                   Description: "W³¹cz filtr ""Automatyczna korekta poziomów""";                              GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "HqRgbConv";                  Description: "Konwersja High Quality YUY2/RGB24/32";                                       GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "ThreadConv";                 Description: "Konwersja Multi-Threaded Color Space";                                       GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "playpriority";               Description: "Wysoki priorytet procesu *niezalecane (zaznacz, jeœli wiesz co robisz)";     GroupDescription: "Ustawienia wideo:"; Flags: unchecked;
Name: "mvc3d";                      Description: "W³¹cz dekoder H.264 MVC (3D wideo)";                                         GroupDescription: "Ustawienia wideo:"; Flags: unchecked;

[Types]
Name: "tweak";        Description: "Instalacja optymalna"
Name: "full";         Description: "Instalacja pe³na"
Name: "compact";      Description: "Instalacja minimalna"
Name: "custom";       Description: "Instalacja u¿ytkownika"; Flags: iscustom

[Components]
Name: "program";      Description: "Pliki programowe";                                                                       Types: full compact tweak custom;                           Flags: fixed
Name: "avs";          Description: "AviSynth+ & SVPflow - ogl¹danie wideo z efektem p³ynnego ruchu";                         Types: tweak full custom;                                   Check: IsAVSInstalled;
Name: "madvr";        Description: "madVR - wysokiej jakoœci renderer wideo";                                                Types: full custom;                                         Check: IsmadVRInstalled;
Name: "icaros";       Description: "Icaros - wyœwietlanie miniatur plików multimedialnych w oknach Eksploratora Windows";    Types: tweak full custom; ExtraDiskSpaceRequired: 10428416; Check: IsIcarosInstalled;
Name: "tor";          Description: "TorrServer MatriX.118 - strumieniowe przesy³anie treœci cyfrowych przez HTTP";           Types: tweak full;        ExtraDiskSpaceRequired: 28735659; Check: IsTORInstalled;
Name: "ace";          Description: "Ace Stream Engine - ogl¹danie TV z trackerów sieci Torrent (acestream://)";              Types: full custom;       ExtraDiskSpaceRequired: 23356723; Check: IsAceInstalled;
Name: "ext";          Description: "Dodatkowe rozszerzenia";                                                                 Types: full custom;
Name: "ext/torrent";  Description: "Torrent - ogl¹danie wideo z trackerów sieci Torrent";                                    Types: tweak full custom;
Name: "ext/ytdlp";    Description: "YouTube-DLP - odtwarzanie wideo z popularnych witryn hostingowych";                      Types: tweak full custom;
Name: "ext/twich";    Description: "Twich - strumieniowanie gier komputerowych oraz rozgrywek sportu elektronicznego";       Types: full custom;
Name: "minfo";        Description: "Dodaj MediaInfo do menu kontekstowego plików";                                           Types: full custom;                                          Check: IsMInfoInstalled; 

[InstallDelete]
Type: filesandordirs; Name: "{commonpf32}\DAUM\PotPlayer\PxShader"; Components: program;
Type: filesandordirs; Name: "{commonpf32}\DAUM\PotPlayer\AviSynth"; Components: avs;

[UninstallDelete]
Type: files; Name: "{app}\FanPack.url"
Type: files; Name: "{app}\Addons Mozilla PotPlayer YouTube.url"
Type: files; Name: "{app}\Addons Chrome PotPlayer YouTube.url"
Type: filesandordirs; Name: "{app}";
Type: files; Name: "{localappdata}\madVR\settings.bin";                      Components: madvr; 
Type: files; Name: "{localappdata}\madVR\settings.bak";                      Components: madvr; 
Type: filesandordirs; Name: "{localappdata}\madVR";                          Components: madvr;
Type: filesandordirs; Name: "{userdocs}\PotPlayer";
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\IPTV.dpl";             Tasks: playlist and savedocs;
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\IPTV2.dpl";            Tasks: playlist and savedocs;
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\Ten komputer.dpl";     Tasks: playlist and savedocs;
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\FilmPolski.dpl";       Tasks: playlist and savedocs;
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\Torrent.dpl";          Tasks: playlist and savedocs; 
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\YouTube.dpl";          Tasks: playlist and savedocs;  
Type: files; Name: "{userdocs}\PotPlayerMini\Playlist\PotPlayerMini.dpl";    Tasks: savedocs; 
Type: files; Name: "{userappdata}\PotPlayerMini\Playlist\IPTV.dpl";          Tasks: playlist; 
Type: files; Name: "{userappdata}\PotPlayerMini\Playlist\IPTV2.dpl";         Tasks: playlist; 
Type: files; Name: "{userappdata}\PotPlayerMini\Playlist\Ten komputer.dpl";  Tasks: savedef; 
Type: files; Name: "{userappdata}\PotPlayerMini\Playlist\FilmPolski.dpl";    Tasks: playlist;
Type: files; Name: "{userappdata}\PotPlayerMini\Playlist\Torrent.dpl";       Components: ext/torrent; Tasks: playlist; 
Type: files; Name: "{userappdata}\PotPlayerMini\Playlist\YouTube.dpl";       Tasks: playlist; 
Type: files; Name: "{userdocs}\PotPlayerMini\Temp\*";                        Tasks: savedocs; 
Type: files; Name: "{commonpf32}\DAUM\PotPlayer\Module\MpcVideoRenderer.ax"; Tasks: mpcvr;
Type: files; Name: "{commonpf32}\DAUM\PotPlayer\Module\sanear.ax";           Tasks: sanear;
Type: files; Name: "{commonpf32}\DAUM\PotPlayer\Module\MediaInfo.exe";       Components: minfo;

[Code]
function IsX86: boolean;
begin
	Result := (ProcessorArchitecture = paX86) or (ProcessorArchitecture = paUnknown);
end;

function IsX64: boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function GetString(x86, x64, ia64: String): String;
begin
	if IsX64() and (x64 <> '') then begin
		Result := x64;
	end else if IsIA64() and (ia64 <> '') then begin
		Result := ia64;
	end else begin
		Result := x86;
	end;
end;

function GetArchitectureString(): String;
begin
	if IsX64() then begin
		Result := '_x64';
	end else if IsIA64() then begin
		Result := '_ia64';
	end else begin
		Result := '';
	end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
    if CurStep = ssPostInstall then begin
      //This will actually extract your file to setup's temporary directory. 
      //If you don't do this, the file is skipped
      //The temporary directory is deleted after setup ends.
      ExtractTemporaryFile('Config.pl.po');

      FileCopy(ExpandConstant('{tmp}\Config.pl.po'), 'C:\Program Files\Icaros\Resources\Localize\Config.pl.po', False);
    end;
        if (CurStep=ssDone) then
    begin
        
    end;
end;

function IsIcarosInstalled():Boolean;
begin
    Result := not RegKeyExists(HKEY_CURRENT_USER, 'SOFTWARE\Icaros');
end;

function IsTORInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{userappdata}\TorrServer\tsl.exe'));
end;

function IsmadVRInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{localappdata}\madVR\madVR.ax'));
end;

function IsAVSInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{commonpf32}\DAUM\PotPlayer\AviSynth.dll'));
end;

function IsMInfoInstalled():Boolean;
begin
    Result := not RegKeyExists(HKEY_CURRENT_USER, 'SOFTWARE\MediaInfo'); 
end;

function IsAceInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{userappdata}\ACEStream\engine\ace_engine.exe'));
end;

var
  DownloadPage: TDownloadWizardPage;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  if Progress = ProgressMax then
    Log(Format('Pomyœlnie pobrano plik do {tmp}: %s', [FileName]));
  Result := True;
end;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(SetupMessage(msgWizardPreparing), SetupMessage(msgPreparingDesc), @OnDownloadProgress);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    DownloadPage.Clear;
    DownloadPage.Add('http://www.potplayerclub.pl/ccount/click.php?id=27', 'Icaros.exe', '');
    DownloadPage.Add('http://www.potplayerclub.pl/ccount/click.php?id=33', 'TS.MatriX.Setup.exe', '');
    DownloadPage.Add('http://www.potplayerclub.pl/ccount/click.php?id=28', 'ace_engine_setup.exe', '');
    DownloadPage.Show;
    try
      try
        DownloadPage.Download; // Spowoduje to pobranie plikÃ³w do {tmp}
        Result := True;
      except
        if DownloadPage.AbortedByUser then
          Log('Przerwane przez u¿ytkownika.')
        else
          SuppressibleMsgBox(AddPeriod(GetExceptionMessage), mbCriticalError, MB_OK, IDOK);
        Result := False;
      end;
    finally
      DownloadPage.Hide;
    end;
  end else
    Result := True;
end;
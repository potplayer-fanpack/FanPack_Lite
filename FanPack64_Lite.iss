; Skrypt wygenerowany przez Inno Setup Script Wizard.
; ZOBACZ DOKUMENTACJÊ, ABY UZYSKAÆ SZCZEGÓ£OWE INFORMACJE NA TEMAT TWORZENIA PLIKÓW SKRYPTÓW INSTALACYJNYCH INNO!
#pragma include __INCLUDE__ + ";" + ReadReg(HKLM, "Software\Mitrich Software\Inno Download Plugin", "InstallDir")

#define localize = "true"

#define appname "FanPack64"
#define brandname "FanPack64"
#define vmajor 1
#define vminor 1
#define vbuild 80
#define publisher "PotPlayer Club"
#define URL "http://www.potplayerclub.pl"

#define keyPM "Software\Daum\PotPlayerMini64"
#define keyPMS "Software\Daum\PotPlayerMini64\Settings"
#define keyPMOS "Software\Daum\PotPlayerMini64\Override_Settings"
#define keyMVR "Software\MPC-BE Filters\MPC Video Renderer"
#define keyPCF "Software\DAUM\PotPlayerMini64\CaptionFolderList"
#define keyPAF "Software\DAUM\PotPlayerMini64\AudioFolderList"
#define keyPEI "Software\DAUM\PotPlayerMini64\ExtensionInfoList"

[Setup]
; UWAGA: Wartoœæ AppId jednoznacznie identyfikuje tê aplikacjê. Nie u¿ywaj tej samej wartoœci AppId w instalatorach dla innych aplikacji.
; (Aby wygenerowaæ nowy GUID, kliknij Narzêdzia | Generuj GUID wewn¹trz IDE.)
AppID                              = {code:GetAppID|''}
; AppId                              = {{300CE3EF-8514-4640-B06B-5003220E4FC7}
AppName                            = {#appname} v{#vmajor}.{#vminor}.{#vbuild}
AppVerName                         = {#appname} v{#vmajor}.{#vminor}.{#vbuild}
AppVersion                         = {#vmajor}.{#vminor}.{#vbuild}
AppPublisher                       = {#publisher}
AppPublisherURL                    = {#URL}
AppSupportURL                      = {#URL}
AppUpdatesURL                      = {#URL}
DefaultDirName                     = {autopf}\{#appname}
DefaultGroupName                   = {#appname}
AppCopyright                       = Copyright © {#publisher} 2014-2022
AllowNoIcons                       = yes
OutputDir                          = bin
SourceDir                          = .
SetupIconFile                      = embedded\PotPlayer.ico
UninstallDisplayIcon               = {app}\MyProg-x64.exe
Compression                        = lzma2/ultra
InternalCompressLevel              = ultra
SolidCompression                   = yes
WizardStyle                        = modern
WizardSmallImageFile               = embedded\WizardSmallImage.bmp
WizardImageFile                    = embedded\WizModernImage.bmp
Uninstallable                      = yes
OutputBaseFilename                 = {#appname}_Lite
ShowTasksTreeLines                 = yes
VersionInfoVersion                 = {#vmajor}.{#vminor}.{#vbuild}
VersionInfoCompany                 = PotPlayer Club
VersionInfoTextVersion             = {#vmajor}.{#vminor}.{#vbuild}
VersionInfoCopyright               = PotPlayer Club
ArchitecturesAllowed               = x64
ArchitecturesInstallIn64BitMode    = x64
PrivilegesRequiredOverridesAllowed = dialog
DisableDirPage                     = yes
DisableProgramGroupPage            = yes
UsePreviousLanguage                = no
UsePreviousPrivileges              = no

[Languages]
Name: "pl"; MessagesFile: "compiler:Languages\Polish.isl";
#if localize == "true"
Name: "en"; MessagesFile: "compiler:Default.isl";
#endif

; Include installer's custom messages
#include "custom_messages.iss"

[Messages]
BeveledLabel= 01.12.2022

#include <idp.iss>
#include <idplang\Polish.iss>

[Files]
; <-- // Normalne pliki instalatora // -->
Source: "InstallDir\Changelog.txt";                 DestName: "Lista zmian.txt";          DestDir: "{app}";                                                  Components: "program"; Languages: "pl"; Flags: ignoreversion
Source: "InstallDir\Changelog_Eng.txt";             DestName: "Changelog.txt";            DestDir: "{app}";                                                  Components: "program"; Languages: "en"; Flags: ignoreversion
Source: "InstallDir\License.txt";                   DestName: "Licencja.txt";             DestDir: "{app}";                                                  Components: "program"; Languages: "pl"; Flags: ignoreversion
Source: "InstallDir\License_Eng.txt";               DestName: "License.txt";              DestDir: "{app}";                                                  Components: "program"; Languages: "en"; Flags: ignoreversion
Source: "InstallDir\ReadMe.txt";                    DestName: "CzytajTo.txt";             DestDir: "{app}";                                                  Components: "program"; Languages: "pl"; Flags: isreadme;
Source: "InstallDir\ReadMe_Eng.txt";                DestName: "ReadMe.txt";               DestDir: "{app}";                                                  Components: "program"; Languages: "en"; Flags: isreadme;
Source: "InstallDir\LGPL.TXT";                                                            DestDir: "{app}";                                                  Components: "program"; Flags: ignoreversion
Source: "InstallDir\MyProg-x64.exe";                                                      DestDir: "{app}";                                                  Components: "program"; Flags: ignoreversion
; <-- // Listy // -->
Source: "src\UrlList\Radio.asx";                                                          DestDir: "{commonpf}\DAUM\PotPlayer\UrlList";                      Components: "program"; Flags: ignoreversion uninsneveruninstall
Source: "src\UrlList\TV.asx";                                                             DestDir: "{commonpf}\DAUM\PotPlayer\UrlList";                      Components: "program"; Flags: ignoreversion uninsneveruninstall
; <-- // Skins // -->
Source: "src\Skins\FMOD.Gilly.dsf";                                                       DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\FMOD.Light.dsf";                                                       DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotMPC v1.0.dsf";                                                      DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotMPC v2.0.dsf";                                                      DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\Default.MOD.dsf";                                                      DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Flags: uninsrestartdelete ignoreversion
; <-- // Skórki i ikony odtwarzacza // -->
Source: "src\Skins\Default.MOD.Optimized,1.dsf";   DestName: "Default.MOD.Optimized.DSF"; DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                                               Tasks: "skin1"; Flags: uninsrestartdelete ignoreversion
Source: "src\x64\PotPlayerMini64,1.exe";           DestName: "PotPlayerMini64.exe";       DestDir: "{commonpf}\DAUM\PotPlayer";                                                     Tasks: "skin1"; Flags: ignoreversion uninsneveruninstall
Source: "src\Skins\Default.MOD.Optimized,2.dsf";   DestName: "Default.MOD.Optimized.DSF"; DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                                               Tasks: "fixpot"; Flags: uninsrestartdelete ignoreversion
Source: "src\x64\PotPlayerMini64,2.exe";           DestName: "PotPlayerMini64.exe";       DestDir: "{commonpf}\DAUM\PotPlayer";                                                     Tasks: "fixpot"; Flags: ignoreversion uninsneveruninstall
Source: "src\Skins\FMOD.dsf";                                                             DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Tasks: "skin2"; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotMPC v3.0.dsf";                                                      DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Tasks: "skin3"; Flags: uninsrestartdelete ignoreversion
Source: "src\Skins\PotXMP.dsf";                                                           DestDir: "{commonpf}\DAUM\PotPlayer\Skins";                        Components: "program"; Tasks: "skin4"; Flags: uninsrestartdelete ignoreversion
; <-- // Splittery MPC-BE // -->
Source: "src\x64\Module\AviSplitter.ax";                                                  DestDir: "{commonpf}\DAUM\PotPlayer\Module";                       Components: "program"; Flags: uninsrestartdelete ignoreversion
Source: "src\x64\Module\MatroskaSplitter.ax";                                             DestDir: "{commonpf}\DAUM\PotPlayer\Module";                       Components: "program"; Flags: uninsrestartdelete ignoreversion
Source: "src\x64\Module\MP4Splitter.ax";                                                  DestDir: "{commonpf}\DAUM\PotPlayer\Module";                       Components: "program"; Flags: uninsrestartdelete ignoreversion
; <-- // Operacje na plikach odtwarzacza // -->
Source: "{commonpf}\DAUM\PotPlayer\ffcodec64.dll"; DestName: "FFmpeg64.dll";              DestDir: "{commonpf}\DAUM\PotPlayer\Module\FFmpeg4";                                      Flags: external;
Source: "{tmp}\Module64.7z";                                                              DestDir: "{tmp}";                                                  Components: "program"; Flags: deleteafterinstall
Source: "{tmp}\PxShader.7z";                                                              DestDir: "{tmp}";                                                  Components: "program"; Flags: deleteafterinstall
; <-- // Samoaktualizuj¹ce listy odtwarzania // -->
Source: "src\Playlist\IPTV.dpl";                                                          DestDir: "{userappdata}\PotPlayerMini64\Playlist";                 Tasks: "playlist"; Flags: uninsrestartdelete ignoreversion   
Source: "src\Playlist\Ten komputer.dpl";                                                  DestDir: "{userappdata}\PotPlayerMini64\Playlist";                 Tasks: "playlist"; Flags: uninsrestartdelete ignoreversion 
Source: "src\Playlist\FilmPolski.dpl";                                                    DestDir: "{userappdata}\PotPlayerMini64\Playlist";                 Tasks: "playlist"; Flags: uninsrestartdelete ignoreversion 
Source: "src\Playlist\YouTube.dpl";                                                       DestDir: "{userappdata}\PotPlayerMini64\Playlist";                 Tasks: "playlist"; Flags: uninsrestartdelete ignoreversion
; <-- // AviSynth and SVPflow // -->
Source: "src\AviSynth\CPU-1-Low.avs";                                                     DestDir: "{commonpf}\DAUM\PotPlayer\AviSynth";                     Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\CPU-2-Medium.avs";                                                  DestDir: "{commonpf}\DAUM\PotPlayer\AviSynth";                     Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\CPU-3-High.avs";                                                    DestDir: "{commonpf}\DAUM\PotPlayer\AviSynth";                     Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\GPU-1-Low.avs";                                                     DestDir: "{commonpf}\DAUM\PotPlayer\AviSynth";                     Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\GPU-2-Medium.avs";                                                  DestDir: "{commonpf}\DAUM\PotPlayer\AviSynth";                     Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\AviSynth\GPU-3-High.avs";                                                    DestDir: "{commonpf}\DAUM\PotPlayer\AviSynth";                     Components: "SVP"; Flags: uninsrestartdelete ignoreversion
Source: "src\x64\AviSynth.dll";                                                           DestDir: "{commonpf}\DAUM\PotPlayer";                              Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\x64\svp.avs";                                                                DestDir: "{commonpf}\DAUM\PotPlayer";                              Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\x64\msvcp140.dll";                                                           DestDir: "{commonpf}\DAUM\PotPlayer";                              Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\x64\svpflow1.dll";                                                           DestDir: "{commonpf}\DAUM\PotPlayer";                              Components: "SVP"; Flags: uninsrestartdelete ignoreversion 
Source: "src\x64\svpflow2.dll";                                                           DestDir: "{commonpf}\DAUM\PotPlayer";                              Components: "SVP"; Flags: uninsrestartdelete ignoreversion
Source: "src\x64\vcruntime140.dll";                                                       DestDir: "{commonpf}\DAUM\PotPlayer";                              Components: "SVP"; Flags: uninsrestartdelete ignoreversion
; ;<-- // madVR // -->
Source: "{tmp}\madVR_v0.9.17.exe";                                                        DestDir: "{tmp}";                                                  Components: "madVR"; Flags: deleteafterinstall
Source: "InstallDir\delete madVR.bat";                                                    DestDir: "{app}";                                                  Components: "madVR"; Flags: uninsrestartdelete ignoreversion
; ;<-- // Icaros // -->
Source: "{tmp}\Icaros.exe";                                                               DestDir: "{tmp}";                                                  Components: "icaros"; Flags: external deleteafterinstall;
Source: "{tmp}\Icaros_HKCU.reg";                                                          DestDir: "{tmp}";                                                  Components: "icaros"; Flags: deleteafterinstall
Source: "{tmp}\icaros_HKLM_64.reg";                                                       DestDir: "{tmp}";                                                  Components: "icaros"; Flags: deleteafterinstall
Source: "{tmp}\icaros_HKLM_32.reg";                                                       DestDir: "{tmp}";                                                  Components: "icaros"; Flags: deleteafterinstall
Source: "src\Icaros\Resources\Localize\Config.pl.po";                                                                                                        Components: "icaros"; Flags: dontcopy
; <-- // TorrServer // -->
Source: "{tmp}\TS.MatriX.Setup.exe";                                                      DestDir: "{tmp}";                                                  Components: "TOR"; Flags: external deleteafterinstall;
Source: "src\Extension\Media\PlayParse\MediaPlayParse - TorrServer.as";                   DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "TOR"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - TorrServer.ico";                  DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "TOR"; Flags: uninsrestartdelete ignoreversion
; <-- // Ace Stream Engine // -->
Source: "{tmp}\ace_engine_setup.exe";                                                     DestDir: "{tmp}";                                                  Components: "ACE"; Flags: external deleteafterinstall;
Source: "src\Playlist\AceTV.dpl";                                                         DestDir: "{userappdata}\PotPlayerMini64\Playlist";                 Components: "ACE"; Flags: uninsrestartdelete ignoreversion
; <-- // Rozszerzenia // -->
Source: "src\x64\Extension\Lib\TorrentReader64.dll";                                      DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Lib";                Components: "ext/torrent"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - LibTorrent.as";                   DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "ext/torrent"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - LibTorrent.ico";                  DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "ext/torrent"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\SourceReader\MediaSourceReader - LibTorrent.as";             DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\SourceReader"; Components: "ext/torrent"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\SourceReader\MediaSourceReader - LibTorrent.ico";            DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\SourceReader"; Components: "ext/torrent"; Flags: uninsrestartdelete ignoreversion
Source: "src\Playlist\Torrent.dpl";                                                       DestDir: "{userappdata}\PotPlayerMini64\Playlist";                 Components: "ext/torrent"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\config.ini";                                       DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "ext/twich"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - Twitch.as";                       DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "ext/twich"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\PlayParse\MediaPlayParse - Twitch.ico";                      DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse";    Components: "ext/twich"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\UrlList\MediaUrlList - Twitch.as";                           DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\UrlList";      Components: "ext/twich"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\UrlList\MediaUrlList - Twitch.ico";                          DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\UrlList";      Components: "ext/twich"; Flags: uninsrestartdelete ignoreversion
Source: "src\Extension\Media\UrlList\config.ini";                                         DestDir: "{commonpf}\DAUM\PotPlayer\Extension\Media\UrlList";      Components: "ext/twich"; Flags: uninsrestartdelete ignoreversion
Source: "{tmp}\yt-dlp-parser.7z";                                                         DestDir: "{tmp}";                                                  Components: "ext/ytdlp"; Flags: external deleteafterinstall;
; ;<-- // MediaInfo // --> 
Source: "src\x64\Module\MI\MediaInfo.exe";                                                DestDir: "{commonpf}\DAUM\PotPlayer\Module\MI";                    Components: "minfo"; Flags: uninsrestartdelete ignoreversion 
Source: "src\x64\Module\MI\MediaInfo.dll";                                                DestDir: "{commonpf}\DAUM\PotPlayer\Module\MI";                    Components: "minfo"; Flags: uninsrestartdelete ignoreversion 
; <-- // MPC Video Renderer // -->
Source: "src\x64\Module\MpcVideoRenderer64.ax";                                           DestDir: "{commonpf}\DAUM\PotPlayer\Module";                       Tasks: "extmpcvr"; Flags: regserver ignoreversion
; <-- // Sanear Audio Renderer // -->
Source: "src\x64\Module\sanear64.ax";                                                     DestDir: "{commonpf}\DAUM\PotPlayer\Module";                       Tasks: "extsanear"; Flags: regserver ignoreversion
; ; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "7za.exe";                                                                        DestDir: "{tmp}"; Flags: deleteafterinstall;

[Dirs]
Name: {app};               Permissions: everyone-full; Flags: UninsAlwaysUninstall; Components: "program";
Name: {userappdata}\madVR; Permissions: everyone-full; Flags: UninsAlwaysUninstall; Components: "madVR";

[Registry]
; ---start autoupdate code; see http://www.microchipc.com/innosetup/innosetup_auto_versioning_upgrade.php--
Root: HKLM; Subkey: "Software\{#appname}"; ValueType: string; ValueName: CurrentVersion; ValueData: {code:GetAppCurrentVersion|''}; Flags: uninsdeletekey
; ---end autoupdate code---
Root: HKCU; Subkey: "Software\madshi";                                                                                                                              Components: "madVR"; Flags: uninsdeletekey dontcreatekey;
Root: HKCU; Subkey: "Software\madshi\madHcCtrl"; ValueType: dword; ValueName: "ShowTrayIcon"; ValueData: "$1";                                                      Components: "madVR"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\madshi\madVR"; ValueType: string; ValueName: "LastSettingsKey"; ValueData: "devices";                                                 Components: "madVR"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "Software\MediaInfo"; ValueName: "Path"; ValueType: String; ValueData: "{commonpf}\DAUM\PotPlayer\Module\MI\";                                  Tasks: "minfo1"; Flags: uninsdeletevalue uninsdeletekeyifempty 
Root: HKCU; Subkey: "Software\Classes\*\shell\MediaInfo"; ValueName: "Icon"; ValueType: String; ValueData: """{commonpf}\DAUM\PotPlayer\Module\MI\mediainfo.exe"""; Tasks: "minfo1"; Flags: uninsdeletevalue uninsdeletekeyifempty 
Root: HKCU; Subkey: "Software\Classes\*\shell\MediaInfo\Command"; ValueType: String; ValueData: """{commonpf}\DAUM\PotPlayer\Module\MI\mediainfo.exe"" ""%1""";     Tasks: "minfo1"; Flags: uninsdeletevalue uninsdeletekeyifempty 
; ;
Root: HKCU; SubKey: "{#keyPM}"; ValueType: dword; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}"; ValueType: dword; ValueName: "AddMyComPL"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}"; ValueType: dword; ValueName: "ServiceValue"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}"; ValueType: dword; ValueName: "ExtensionDays"; ValueData: "$0000016b"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}"; ValueType: string; ValueName: "MInfo1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}"; ValueType: string; ValueName: "MInfo2"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\RememberFiles"; Flags: uninsdeletekey;
Root: HKCU; SubKey: "{#keyPM}\AtscAntenaList"; ValueType: string; ValueName: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\AtscCableList"; ValueType: string; ValueName: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "0"; ValueData: ".\Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "1"; ValueData: ".\Pol Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "2"; ValueData: ".\Eng Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "3"; ValueData: ".\Sound Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "4"; ValueData: ".\Sound Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "5"; ValueData: ".\Pol_Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "6"; ValueData: ".\Eng_Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "7"; ValueData: ".\Sound_Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "8"; ValueData: ".\Sound_Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "9"; ValueData: ".\Pol.Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "10"; ValueData: ".\Eng.Sound"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "11"; ValueData: ".\Sound.Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "12"; ValueData: ".\Sound.Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPAF}"; ValueType: string; ValueName: "13"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\BMItem_0"; Flags: uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "0"; ValueData: ".\Sub"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "1"; ValueData: ".\Sub Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "2"; ValueData: ".\Sub Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "3"; ValueData: ".\Pol Sub"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "4"; ValueData: ".\Eng Sub"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "5"; ValueData: ".\Sub_Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "6"; ValueData: ".\Sub_Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "7"; ValueData: ".\Pol_Sub"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "8"; ValueData: ".\Eng_Sub"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "9"; ValueData: ".\Subs"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "10"; ValueData: ".\Subs Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "11"; ValueData: ".\Subs Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "12"; ValueData: ".\Pol Subs"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "13"; ValueData: ".\Eng Subs"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "14"; ValueData: ".\Subs_Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "15"; ValueData: ".\Subs_Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "16"; ValueData: ".\Pol_Subs"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "17"; ValueData: ".\Eng_Subs"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "18"; ValueData: ".\Subtitles"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "19"; ValueData: ".\Subtitles Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "20"; ValueData: ".\Subtitles Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "21"; ValueData: ".\Pol Subtitles"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "22"; ValueData: ".\Eng Subtitles"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "23"; ValueData: ".\Subtitles_Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "24"; ValueData: ".\Subtitles_Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "25"; ValueData: ".\Pol_Subtitles"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "26"; ValueData: ".\Eng_Subtitles"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "27"; ValueData: ".\Napisy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "28"; ValueData: ".\Napisy Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "29"; ValueData: ".\Napisy Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "30"; ValueData: ".\Pol Napisy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "31"; ValueData: ".\Eng Napisy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "32"; ValueData: ".\Napisy_Pol"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "33"; ValueData: ".\Napisy_Eng"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "34"; ValueData: ".\Pol_Napisy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "35"; ValueData: ".\Eng_Napisy"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPCF}"; ValueType: string; ValueName: "36"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "0"; ValueData: "pl.bab.la=http://pl.bab.la/slownik/angielski-polski/%%SS"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "1"; ValueData: "Wikipedia=http://pl.wikipedia.org/w/index.php?search=%%SS"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "2"; ValueData: "Wiktionary=https://pl.wiktionary.org/wiki/%%SS"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "3"; ValueData: "OneLook=http://www.onelook.com/?w=%%SS"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "4"; ValueData: "Google=http://www.google.com/#newwindow=1&q=%%SS"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "5"; ValueData: "DuckDuckGo=https://duckduckgo.com/?q=%%SS"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "6"; ValueData: "Kopiuj do schowka="; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\CaptionWordSearchList"; ValueType: string; ValueName: "7"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Dialog324"; ValueType: string; ValueName: "WindowPosition"; ValueData: "585,234,1336,798"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Dialog324"; ValueType: dword; ValueName: "TopMost"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Dialog409"; ValueType: dword; ValueName: "TopMost"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\DvbcList"; ValueType: string; ValueName: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\DvbsList"; ValueType: string; ValueName: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\DvbtList"; ValueType: string; ValueName: "0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "0"; ValueData: "SubtitleSearch - Napisy24.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "0DN"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "0UP"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "0U"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "0P"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "0S"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "0D"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "1"; ValueData: "SubtitleSearch - OpenSubtitle.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "1DN"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "1UP"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "1U"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "1P"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "1S"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "1D"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "2"; ValueData: "SubtitleSearch - podnapisi.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "2DN"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "2UP"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "2U"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "2P"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "2S"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "2D"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "3"; ValueData: "SubtitleSearch - SubDB.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "3DN"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "3UP"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "3U"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "3P"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "3S"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "3D"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "4"; ValueData: "SubtitleSearch - titlovi.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "4DN"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "4UP"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "4U"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "4P"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "4S"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "4D"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "5"; ValueData: "SubtitleSearch - ysubs.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "5DN"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: dword; ValueName: "5UP"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "5U"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "5P"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "5S"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "5D"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPEI}"; ValueType: string; ValueName: "6"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\ExtensionSection"; ValueType: string; ValueName: "MediaUrlList"; ValueData: "MediaUrlList - Twitch.as/MediaUrlList - YouTube.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\ExtensionSection"; ValueType: string; ValueName: "MediaPlayParse"; ValueData: "MediaPlayParse - LibTorrent.as/MediaPlayParse - Twitch.as/MediaPlayParse - YouTube.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\ExtensionSection"; ValueType: string; ValueName: "MediaSourceReader"; ValueData: "MediaSourceReader - LibTorrent.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\ExtensionSection"; ValueType: string; ValueName: "OnlineSubtitleSearch"; ValueData: "SubtitleSearch - Napisy24.as/SubtitleSearch - OpenSubtitle.as/SubtitleSearch - podnapisi.as/SubtitleSearch - SubDB.as/SubtitleSearch - titlovi.as/SubtitleSearch - ysubs.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\ExtensionSection"; ValueType: string; ValueName: "OnlineSubtitleTrans"; ValueData: "SubtitleTranslate - google.as/SubtitleTranslate - bing.as/SubtitleTranslate - papago.as/SubtitleTranslate - papagoNMT.as/SubtitleTranslate - Yandex.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\MainShortCutList"; ValueType: string; ValueName: "0"; ValueData: "9,2,10863,0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\MainShortCutList"; ValueType: string; ValueName: "1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "MainX"; ValueData: "$000001b5"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "MainY"; ValueData: "$00000108"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "MainWidth2"; ValueData: "$00000416"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "MainHeight2"; ValueData: "$000001f7"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowWidth"; ValueData: "$000002d0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowHeight"; ValueData: "$00000194"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectL0"; ValueData: "$000001b5"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectT0"; ValueData: "$00000108"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectR0"; ValueData: "$000005cb"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectB0"; ValueData: "$000002ff"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowState1"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectL1"; ValueData: "$000001b6"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectT1"; ValueData: "$00000064"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectR1"; ValueData: "$000002f6"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectB1"; ValueData: "$000001fc"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowState2"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectL2"; ValueData: "$00000365"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectT2"; ValueData: "$00000225"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectR2"; ValueData: "$00000492"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "VideoWindowRectB2"; ValueData: "$00000308"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "ChatWindowVisible"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "PlayListWidth"; ValueData: "$00000140"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "BroadcastListWindowVisible"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow0"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow1"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow2"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow3"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow4"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow5"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow6"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow7"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow8"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "TopMostWindow9"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "ControlBoxWidth"; ValueData: "$0000012d"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\Positions"; ValueType: dword; ValueName: "ControlBoxHeight"; ValueData: "$000000e3"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: dword; ValueName: "DefType"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath2"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath3"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath4"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath5"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath6"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath7"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath8"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "DefPath9"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "PathToken"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "FindText"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "Sort"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPM}\SimpleOpen"; ValueType: string; ValueName: "Genre"; ValueData: "Genre"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "MftDecoder"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "DmoDecoder"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "Info1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "Info6"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "Info7"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "LastConfigPage"; ValueData: "$00000179"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "PlaybackMode"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "LastPlayListName"; ValueData: "PotPlayerMini64.dpl"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinXmlName"; ValueData: "VideoSkin.xml"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinXmlNameVideo"; ValueData: "VideoSkin.xml"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinXmlNameAudio"; ValueData: "AudioSkin.xml"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "LastUrlList"; ValueData: "Radio.asx"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "DisplayCdVolumeLabel"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioVolume"; ValueData: "$0000003c"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "CaptionStyle"; ValueData: "5;5;5;5;2;0;2.000000;2.000000;3.000000;3.000000;0xffffff;0x000000;0x000000;0x000000;0x00;0x00;0x00;0x90;1;Segoe UI;17.000000;100.000000;100.000000;0.000000;700;0;0;0;0;0.000000;0.000000;0.000000;0.000000;2;0;1;50;95;0.000000;0;0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "PlayScreenSize"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionRemoveEmpty"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionAutoLoad"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AllowMultiple"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "EffectPage"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "EffectCastOnly"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "SkipCastPreview"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "BroadcastAttachToMain2"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "ChatAttachSize2"; ValueData: "$0000013d"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "PlaylistAttachSize2"; ValueData: "$0000013d"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "VideoCaptureFrame"; ValueData: "$3"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "Thumbnail16_9PL"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "NoSameFileAddPL"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AutoAddPL"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AutoDetectTimePL"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "WinampDspIndex"; ValueData: "$ffffffff"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionPreferFirst"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionSupportAutoGen"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionDownloadAlert"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "CaptionTranslateEngine2"; ValueData: "SubtitleTranslate - google.as"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "WdmCountryCode"; ValueData: "$00000030"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "BookmarkPromptAdd"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "D3DFullScreenUi"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "MessageFontName"; ValueData: "Oswald"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "MessageFontWeight"; ValueData: "$00000258"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "MessageFontSize"; ValueData: "$0000001a"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_Cover"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_16_9"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_FolderOpen"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_FolderOpenSub"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AttachWindowIndex"; ValueData: "$2"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioPreferFirst"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "BaseOpenFolder"; ValueData: "{%USERPROFILE}\Videos"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CheckAutoUpdate"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AutoDownloadFile"; ValueData: "$0"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "ExtensionUpdate"; ValueData: "$1"; Flags: uninsdeletevalue uninsdeletekeyifempty
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinName"; ValueData: "Default.dsf";                                                          Tasks: "skin0"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'SetButtons''AddTime''AddButtons'";                                   Tasks: "skin1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinName"; ValueData: "Default.MOD.Optimized.dsf";                                            Tasks: "skin1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'SetButtons''AddTime''AddButtons'";                                   Tasks: "skin1"; Components: "SVP"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'SetButtons''AddTime''AddButtons'";                                   Tasks: "skin2"; Components: "SVP"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'SetSub''AddTime''AddButtons'";                                       Tasks: "skin3"; Components: "SVP"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinStyle"; ValueData: "'SetButtons''AddTime''AddButtons'";                                   Tasks: "fixpot"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "LastSkinName"; ValueData: "Default.MOD.Optimized.dsf";                                            Tasks: "fixpot"; Flags: uninsdeletekey;
; ; Skin menu
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "SkinDarkMenu"; ValueData: "$1";                                                                    Tasks: "skinmenu"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "SkinPopupMenuStyle"; ValueData: "$1";                                                              Tasks: "skinmenu"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "AudExpandCenter"; ValueType: Dword; ValueData: "$0"; 
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "AudExpandSurround"; ValueType: Dword; ValueData: "$0";
;
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: IntDXVAUseMode; ValueData: $1;                                                                      Tasks: "dxva"; Flags: uninsdeletevalue uninsdeletekeyifempty
; ; 
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "AvisynthBufferBack"; ValueType: Dword; ValueData: "$0";                                                              Components: "SVP"; Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "AvisynthScript"; ValueType: String; ValueData: "svp=1 alg=1 fim=1 bf=0 sh=0 uhd=0 gpu=0 fps=60 import(""svp.avs"")"; Components: "SVP"; Flags: uninsdeletekey;
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: UseSelfDxva; ValueData: $1;                                                                         Components: "SVP"; Flags: uninsdeletevalue uninsdeletekeyifempty
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: IntDXVAUseMode; ValueData: $1;                                                                      Components: "SVP"; Flags: uninsdeletevalue uninsdeletekeyifempty
; Filtry
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "VideoPropertyHwFirst"; ValueData: "$1";                                                            Tasks: "hwcc"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DX9ResizeMode_0"; ValueData: "$13";                                                                Tasks: "resizer"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "Sharpen"; ValueData: "$1";                                                                         Tasks: "sharpen"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "VideoDeband"; ValueData: "$1";                                                                     Tasks: "deband"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "LevelFix"; ValueData: "$1";                                                                        Tasks: "levelfix"; Flags: uninsdeletekey;
;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "HqRgbConv"; ValueData: "$1";                                                                       Tasks: "HqRgbConv"; Flags: uninsdeletekey;
;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "ThreadConv"; ValueData: "$1";                                                                      Tasks: "ThreadConv"; Flags: uninsdeletekey;
; ; Priorytet odtwarzania
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PlayPriority2"; ValueData: "$4";                                                                   Tasks: "playpriority"; Flags: uninsdeletekey;
; ; W³¹czenie MVC3D
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SupportH264MVC"; ValueData: "$1";                                                                  Tasks: "mvc3d"; Flags: uninsdeletekey;
; ; Koniec w³¹czenia MVC3D
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "UseStreamTimeShift";                                                                                                 Tasks: "tsh"; Flags: deletevalue
;
; W³¹czenie FFmpeg64 dla H265
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntH265_0"; ValueData: "$2";                                                                       Tasks: "ffmpeg"; Flags: uninsdeletekey;
; ; Renderer madVR
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "VideoRen2"; ValueData: "$a";                                                                       Tasks: "renderer\madVR"; Flags: uninsdeletekey;
; ; Renderer Open GL
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "VideoRen2"; ValueData: "$c";                                                                       Tasks: "renderer\opengl"; Flags: uninsdeletekey;
; ; Renderer D3D11
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "VideoRen2"; ValueData: "$f";                                                                       Tasks: "renderer\d3d11"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "VMR9VSyncInternal"; ValueData: "$0";                                                               Tasks: "renderer\d3d11"; Flags: uninsdeletekey;
; ; Ustawienia skórek, Sta³y rozmiar okna, menu, odtwarzanie
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSize"; ValueData: "$3";                                                                 Tasks: "skinfix"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSizeUserW"; ValueData: "$2d0";                                                          Tasks: "skinfix\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSizeUserH"; ValueData: "$194";                                                          Tasks: "skinfix\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSizeUserW"; ValueData: "$320";                                                          Tasks: "skinfix\b"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSizeUserH"; ValueData: "$1c2";                                                          Tasks: "skinfix\b"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSizeUserW"; ValueData: "$500";                                                          Tasks: "skinfix\c"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartScreenSizeUserH"; ValueData: "$2d0";                                                          Tasks: "skinfix\c"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AutoResizeFullScreen"; ValueData: "$1";                                                            Tasks: "autoresfullscr"; Flags: uninsdeletekey;
; ;< -- // Ustawiamy foldery zapisu -->
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "VideoCaptureFolder"; ValueData: "{userdocs}\PotPlayerMini64\Capture";                             Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "AudioCaptureFolder"; ValueData: "{userdocs}\PotPlayerMini64\Capture";                             Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "MovieCaptureFolder"; ValueData: "{userdocs}\PotPlayerMini64\Capture";                             Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "BroadcastSaveFolder"; ValueData: "{userdocs}\PotPlayerMini64\Capture";                            Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "BdaSaveFolder"; ValueData: "{userdocs}\PotPlayerMini64\Capture";                                  Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "PlayListFolder"; ValueData: "{userdocs}\PotPlayerMini64\Playlist";                                Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "TempFolder"; ValueData: "{userdocs}\PotPlayerMini64\Temp";                                        Tasks: "savedocs"; Flags: createvalueifdoesntexist 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "WinampDspPath"; ValueData: "{userdocs}\PotPlayerMini64\Plugins";                                  Tasks: "savedocs"; Flags: createvalueifdoesntexist
; ;Domyœlne dzia³anie otwierania
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DefOpenMode"; ValueData: "$1";                                                                     Tasks: "opendef\url"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DefOpenMode"; ValueData: "$2";                                                                     Tasks: "opendef\folder"; Flags: uninsdeletekey;
; ; Ustawienia Nawigatora po plikach
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_WindowSize"; ValueData: "$3";                                                                   Tasks: "opendef\navig"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DefOpenMode"; ValueData: "$3";                                                                     Tasks: "opendef\navig"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_FontSize"; ValueData: "$14";                                                                    Tasks: "opendef\navig"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_RightList"; ValueData: "$1";                                                                    Tasks: "opendef\navig\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_RightList"; ValueData: "$2";                                                                    Tasks: "opendef\navig\b"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_LargeSelect"; ValueData: "$0";                                                                  Tasks: "opendef\navig\disable_zoom"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_LargeFrame"; ValueData: "$1";                                                                   Tasks: "opendef\navig\large_frame"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SO_NoClose"; ValueData: "$1";                                                                      Tasks: "opendef\navig\no_close"; Flags: uninsdeletekey;
; ; Automatyczne wczytywanie URL ze schowka
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "UseClipboardUrl"; ValueData: "$1";                                                                 Tasks: "loadurl"; Flags: uninsdeletekey;
; Ustawienia odtwarzacza
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PauseOnMin"; ValueData: "$1";                                                                      Tasks: "pauseonmin\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PauseOnMin"; ValueData: "$2";                                                                      Tasks: "pauseonmin\b"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SkinDefaultStart"; ValueData: "$1";                                                                Tasks: "skinstart"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "SkinSizePersist"; ValueData: "$1";                                                                 Tasks: "skinsize"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MoveSizeByCenter"; ValueData: "$1";                                                                Tasks: "sizebycenter"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "StartCenterPos"; ValueData: "$1";                                                                  Tasks: "startcenter"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DefSizeOnClose"; ValueData: "$1";                                                                  Tasks: "sizeonclose"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PlayScreenMoveCenter"; ValueData: "$1";                                                            Tasks: "movecenter"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CloseOnComplete"; ValueData: "$1";                                                                 Tasks: "closecomplete"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DVDRestorePosition"; ValueData: "$2";                                                              Tasks: "remposvideo"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "RememberPosition"; ValueData: "$1";                                                                Tasks: "remposvideo"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "RememberPositionAudio"; ValueData: "$1";                                                           Tasks: "remposaudio"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "ShowRememberList"; ValueData: "$1";                                                                Tasks: "rememberlist"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PlaybackFailSkip"; ValueData: "$1";                                                                Tasks: "failskip_a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PlaybackFailSkip"; ValueData: "$2";                                                                Tasks: "failskip_b"; Flags: uninsdeletekey;
;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PreviewSeekTime"; ValueData: "$1";                                                                 Tasks: "seektime"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "DisplayBookmark";                                                                                                    Tasks: "dispbookmark"; Flags: deletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PreviewThumbnail"; ValueData: "$1";                                                                Tasks: "prevthumb"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "ScreenFitBySize"; ValueData: "$1";                                                                 Tasks: "screenfitbysize\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "ScreenFitBySize"; ValueData: "$2";                                                                 Tasks: "screenfitbysize\b"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessagePlayInfo"; ValueData: "$1";                                                                 Tasks: "mesplayinfo"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessagePlayInfoFull"; ValueData: "$1";                                                             Tasks: "mesplayinfo"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessagePlayTime"; ValueData: "$7";                                                                 Tasks: "mesplayinfo"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessageFileName"; ValueData: "$0";                                                                 Tasks: "mesplayinfo"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessageChapter"; ValueData: "$0";                                                                  Tasks: "mesplayinfo\a"; Flags: deletekey;

; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "Win7WorkTool"; ValueData: "$2";                                                                    Tasks: "win7worktool"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "OnTopMode"; ValueData: "$2";                                                                       Tasks: "ontopmode"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MousePanScanControl"; ValueData: "$1";                                                             Tasks: "mouse_ps"; Flags: uninsdeletekey;
;;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "DisplayAsThumbnail"; ValueData: "$2";                                                              Tasks: "dispasthumb"; Flags: uninsdeletekey;
; ; Zak³adki do PBF
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "BookmarkSaveExternal"; ValueData: "$1";                                                            Tasks: "bookmark"; Flags: uninsdeletekey;
; ; Zapisz na Pulpit lub galeria
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: String; ValueName: "VideoCaptureFolder"; ValueData: "{userdesktop}";                                                  Tasks: "savedesktop"; Flags: createvalueifdoesntexist;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "ThumbnailSameDir"; ValueData: "$1";                                                                Tasks: "savegalery"; Flags: uninsdeletekey;
; ; Format przechwytu obrazków
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "VideoCaptureFormat"; ValueData: "$0";                                                              Tasks: "saveformat\bmp"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "VideoCaptureFormat"; ValueData: "$2";                                                              Tasks: "saveformat\png"; Flags: uninsdeletekey;
; ;Domyœlne dzia³anie otwierania - pliki
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "OpenWithSameName"; ValueData: "$2";                                                                Tasks: "openwithsamename_a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AppendFilePL"; ValueData: "$1";                                                                    Tasks: "openwithsamename_a\1"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "OpenWithSameName"; ValueData: "$0";                                                                Tasks: "openwithsamename_b"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "SavePlayList"; ValueData: "$0";                                                                    Tasks: "openwithsamename_b\savepl"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "PlaybackSearchFile"; ValueData: "$1";                                                              Tasks: "openwithsamename_sf"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: Dword; ValueName: "AttachOpenFullScreen"; ValueData: "$0";                                                            Tasks: "playlistopenfullscreen"; Flags: uninsdeletekey;
; ; Ustawienia napisów
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionVisible"; ValueData: "$0";                                                                                Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "DVDCaptionVisible"; ValueData: "$0";                                                                             Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "CaptionVisible";                                                                                                     Tasks: "sub"; Flags: deletevalue 
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "DVDCaptionVisible";                                                                                                  Tasks: "sub"; Flags: deletevalue 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "UseCaptionBinFilter"; ValueData: "$1";                                                             Tasks: "subfilter"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "ForceCaptionLoad"; ValueData: "$1";                                                                Tasks: "force_sub\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MouseCaptionMove"; ValueData: "$1";                                                                Tasks: "pos_sub"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IdxSubOverridePos"; ValueData: "$1";                                                               Tasks: "pos_pgs"; Flags: uninsdeletekey;
;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "PrefCapLang"; ValueData: "forced&polish default&polish plcc pol pl polish";                       Tasks: "subpol"; Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "PrefCapLang"; ValueData: "forced&english default&english encc eng en english";                    Tasks: "subeng"; Flags: uninsdeletekey; 
; ; Pobieranie napisów
; ; OSDB - u¿ywaj tylko wtedy gdy brak napisów, wczytaj pierwsze dostêpne
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionDownloadBefore"; ValueData: "$1";                                                           Tasks: "downsub_first"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionDownloadAfter"; ValueData: "$1";                                                            Tasks: "downsub_first"; Flags: uninsdeletekey;
; ; W³¹czenie LEKTORA
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: string; ValueName: "CaptionStyle"; ValueData: "5;5;5;5;2;0;2.000000;2.000000;3.000000;3.000000;0xffffff;0x000000;0x000000;0x000000;0x00;0x00;0x00;0x90;1;Segoe UI;0.000000;100.000000;100.000000;0.000000;700;0;0;0;0;0.000000;0.000000;0.000000;0.000000;2;0;1;50;95;0.000000;0;0"; Tasks: "lektor"; Flags: uninsdeletekey;
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionTTS"; ValueData: "$1";                                                                      Tasks: "lektor"; Flags: uninsdeletekey;
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "EngineTTS"; ValueData: "$0";                                                                       Tasks: "lektor"; Flags: uninsdeletekey;
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "SpeedTTS"; ValueData: "$0";                                                                        Tasks: "lektor"; Flags: uninsdeletekey;
Root: HKCU; SubKey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioVolume"; ValueData: "$2d";                                                                    Tasks: "lektor"; Flags: uninsdeletekey;
; ; Zmniejszenie Interlinii
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionLineSpace"; ValueData: "$ffffffec";                                                         Tasks: "interlinia"; Flags: uninsdeletekey;
; ; Maksymalny czas ukazywania napisów
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionMaxVisUse"; ValueData: "$1";                                                                Tasks: "maxtime"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: binary; ValueName: "CaptionMaxVisTime"; ValueData: "00 00 e0 40";                                                     Tasks: "maxtime"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "CaptionForceSecond"; ValueData: "$1";                                                              Tasks: "subsecond"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "PrefCapLangHide"; ValueData: "$1";                                                                 Tasks: "hidesub"; Flags: uninsdeletekey;
; ; Imported Registry File: "MPC Video Renderer"
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "UseD3D11"; ValueData: "$1";                                                                        Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "ShowStatistics"; ValueData: "$0";                                                                  Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "TextureFormat"; ValueData: "$0";                                                                   Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "VPEnableNV12"; ValueData: "$1";                                                                    Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "VPEnableP01x"; ValueData: "$1";                                                                    Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "VPEnableYUY2"; ValueData: "$1";                                                                    Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "VPEnableOther"; ValueData: "$1";                                                                   Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "DoubleFramerateDeinterlace"; ValueData: "$1";                                                      Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "VPScaling"; ValueData: "$1";                                                                       Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "ChromaScaling"; ValueData: "$0";                                                                   Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "Upscaling"; ValueData: "$2";                                                                       Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "Downscaling"; ValueData: "$2";                                                                     Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "InterpolateAt50pct"; ValueData: "$1";                                                              Tasks: "extmpcvr"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyMVR}"; ValueType: dword; ValueName: "SwapEffect"; ValueData: "$0";                                                                      Tasks: "extmpcvr"; Flags: uninsdeletekey;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessageBetery"; ValueData: "$1";                                                                   Tasks: "powerststus\a"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "MessageBetery"; ValueData: "$2";                                                                   Tasks: "powerststus\b"; Flags: uninsdeletekey;
; ; Eksternal audio, gain
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AutoLoadExtAudio"; ValueData: "$1";                                                                Tasks: "extaudio"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueName: "AudioNormalize";                                                                                                     Tasks: "gain"; Flags: deletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "Ac3DtsVolumeControl"; ValueData: "$1";                                                             Tasks: "gain2"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioVolumeMaxVal"; ValueData: "$c8";                                                              Tasks: "gain3"; Flags: uninsdeletekey;
; ;<-- // Dodajemy ustawienia g³oœników // -->
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudSpkIndex_new"; ValueData: "$1";                                                                 Tasks: "stereo"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudSpkIndex_new"; ValueData: "$11";                                                                Tasks: "ch6"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudSpkIndex_new"; ValueData: "$16";                                                                Tasks: "asis"; Flags: uninsdeletevalue;
; ;< --// Próbkowanie audio // -->
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudOutBit_new"; ValueData: "$0";                                                                   Tasks: "bit_depth16"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudOutBit_new"; ValueData: "$1";                                                                   Tasks: "bit_depth24"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudOutBit_new"; ValueData: "$2";                                                                   Tasks: "bit_depth32"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudOutBit_new"; ValueData: "$3";                                                                   Tasks: "bit_depth32f"; Flags: uninsdeletevalue;
; ;Virtual Dolby Decoder
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudSpkIndex_new"; ValueData: "19";                                                                 Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "Ac3Drc_new"; ValueData: "$1";                                                                      Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "UseOnly48000"; ValueData: "$0";                                                                    Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioResampleMode"; ValueData: "$2";                                                               Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioResampleQuality"; ValueData: "$0";                                                            Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntMp1_0"; ValueData: "$4";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntMp2_0"; ValueData: "$4";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntMp3_0"; ValueData: "$5";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntAac_0"; ValueData: "$4";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntLatm"; ValueData: "$2";                                                                         Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntAc3_0"; ValueData: "$3";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntEac3_0"; ValueData: "$2";                                                                       Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntTrueHD_0"; ValueData: "$1";                                                                     Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntMlp_0"; ValueData: "$1";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "IntDts_0"; ValueData: "$3";                                                                        Tasks: "virtual_dolby"; Flags: uninsdeletevalue;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioVolumeStart"; ValueData: "$1";                                                                Tasks: "audio_start"; Flags: uninsdeletevalue;
; ;<-- // W³¹czenie Sanear // -->
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "AudioRen"; ValueData: "@device:sw:{{E0F158E1-CB04-11D0-BD4E-00A0C911CE86}\{{DF557071-C9FD-433A-9627-81E0D3640ED9}"; Tasks: "extsanear"; Flags: uninsdeletevalue;
; ;<-- // W³¹czenie WASAPI // -->
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "AudioRen"; ValueData: "{{EE9109D9-1534-4B24-B86E-EAADE6850E59}";                                  Tasks: "wasapi"; Flags: uninsdeletevalue;
; ;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: dword; ValueName: "AudioCrossfeedUse"; ValueData: "$1";                                                               Tasks: "crossfeed"; Flags: uninsdeletevalue;
; ; Imported Registry File: "Sanear Audio Renderer"
Root: HKCU; Subkey: "Software\sanear";                                                                                                                            Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: string; ValueName: "DeviceId"; ValueData: "";                                                                   Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: dword; ValueName: "DeviceExclusive"; ValueData: "$0";                                                           Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: dword; ValueName: "DeviceBufferDuration"; ValueData: "$c8";                                                     Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: dword; ValueName: "AllowBitstreaming"; ValueData: "$1";                                                         Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: dword; ValueName: "CrossfeedEnabled"; ValueData: "$0";                                                          Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: dword; ValueName: "CrossfeedCutoffFrequency"; ValueData: "$2bc";                                                Tasks: "extsanear"; Flags: uninsdeletekey;
Root: HKCU; Subkey: "Software\sanear"; ValueType: dword; ValueName: "CrossfeedLevel"; ValueData: "$3c";                                                           Tasks: "extsanear"; Flags: uninsdeletekey;
; ; Zewnêtrzne splittery MPC
Root: HKCU; Subkey: "{#keyPMOS}";                                                                                                                                 Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: dword; ValueName: "Type"; ValueData: "$1";                                                                      Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: dword; ValueName: "Disabled"; ValueData: "$1";                                                                  Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf}\DAUM\PotPlayer\Module\AviSplitter.ax";                        Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: string; ValueName: "Name"; ValueData: "MPC AVI Source";                                                         Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: string; ValueName: "CLSID"; ValueData: "{{CEA8DEFF-0AF7-4DB9-9A38-FB3C3AEFC0DE}";                               Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: dword; ValueName: "FilterType"; ValueData: "$0";                                                                Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: dword; ValueName: "Merit"; ValueData: "$600001";                                                                Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: dword; ValueName: "MeritHi"; ValueData: "$0";                                                                   Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: dword; ValueName: "Type"; ValueData: "$1";                                                                      Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: dword; ValueName: "Disabled"; ValueData: "$1";                                                                  Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf}\DAUM\PotPlayer\Module\MatroskaSplitter.ax";                   Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: string; ValueName: "Name"; ValueData: "MPC Matroska Source";                                                    Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: string; ValueName: "CLSID"; ValueData: "{{0A68C3B5-9164-4A54-AFAF-995B2FF0E0D4}";                               Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: dword; ValueName: "FilterType"; ValueData: "$0";                                                                Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: dword; ValueName: "Merit"; ValueData: "$600000";                                                                Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: dword; ValueName: "MeritHi"; ValueData: "$0";                                                                   Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: dword; ValueName: "Type"; ValueData: "$1";                                                                      Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: dword; ValueName: "Disabled"; ValueData: "$1";                                                                  Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: string; ValueName: "Path"; ValueData: "{commonpf}\DAUM\PotPlayer\Module\MP4Splitter.ax";                        Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: string; ValueName: "Name"; ValueData: "MPC MP4/MOV Source";                                                     Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: string; ValueName: "CLSID"; ValueData: "{{3CCC052E-BDEE-408A-BEA7-90914EF2964B}";                               Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: dword; ValueName: "FilterType"; ValueData: "$0";                                                                Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: dword; ValueName: "Merit"; ValueData: "$600000";                                                                Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: dword; ValueName: "MeritHi"; ValueData: "$0";                                                                   Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0003"; ValueType: dword; ValueName: "Type"; ValueData: "$FFFFFFFE";                                                               Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0000"; ValueType: dword; ValueName: "Disabled"; ValueData: "$0";                                                                  Flags: uninsdeletekey;
Root: HKCU; Subkey: "{#keyPMOS}\0001"; ValueType: dword; ValueName: "Disabled"; ValueData: "$0";                                                                  Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMOS}\0002"; ValueType: dword; ValueName: "Disabled"; ValueData: "$0";                                                                  Flags: uninsdeletekey;
;
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "PrefAudLang"; ValueData: "pol";                                                                   Tasks: "audpol"; Flags: uninsdeletekey; 
Root: HKCU; Subkey: "{#keyPMS}"; ValueType: string; ValueName: "PrefAudLang"; ValueData: "eng";                                                                   Tasks: "audeng"; Flags: uninsdeletekey;


[INI]
Filename: "{app}\FanPack64 w sieci.url";                Section: "InternetShortcut"; Key: "URL"; String: "http://www.potplayerclub.pl/"
Filename: "{app}\Addons Mozilla PotPlayer YouTube.url"; Section: "InternetShortcut"; Key: "URL"; String: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/"
Filename: "{app}\Addons Chrome PotPlayer YouTube.url";  Section: "InternetShortcut"; Key: "URL"; String: "https://chrome.google.com/webstore/search/potplayer"

[Icons]
Name: "{group}\Addons Mozilla PotPlayer YouTube.url"; Filename: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/"; Tasks: "addon\1";
Name: "{group}\Addons Chrome PotPlayer YouTube.url";  Filename: "https://chrome.google.com/webstore/search/potplayer";                     Tasks: "addon\2";
Name: "{group}\CzytajTo";                             Filename: "{app}\CzytajTo.txt"; Languages: "pl";
Name: "{group}\Licencja";                             Filename: "{app}\Licencja.txt"; Languages: "pl";
Name: "{group}\ReadMe";                               Filename: "{app}\Readme.txt";   Languages: "en";
Name: "{group}\License";                              Filename: "{app}\License.txt";  Languages: "en";
Name: "{group}\Reset madVR";                          Filename: "{userappdata}\madVR\restore default settings.bat";                        Components: "madvr";
Name: "{group}\Addons Mozilla PotPlayer YouTube";     Filename: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/";
Name: "{group}\Addons Chrome PotPlayer YouTube";      Filename: "https://chrome.google.com/webstore/search/potplayer";
Name: "{group}\FanPack64 w sieci";                    Filename: "{#URL}"                 
Name: "{group}\{cm:UninstallProgram,{#brandname}}";   Filename: "{uninstallexe}";

[InstallDelete]
Type: filesandordirs; Name: "{commonpf}\DAUM\PotPlayer\PxShader";     Components: "program";
Type: filesandordirs; Name: "{commonpf}\DAUM\PotPlayer\AviSynth";     Components: "SVP";
Type: files;          Name: "{commonpf}\DAUM\PotPlayer\FileList.txt"; Components: "program";
Type: filesandordirs; Name: "{commonpf}\DAUM\PotPlayer\Html";         Components: "program";


[Run]
#if localize == "true"
Filename: "{tmp}\madVR_v0.9.17.exe";                                                           WorkingDir: {tmp}; Description: "{cm:msg_install_madVR}";  StatusMsg: "{cm:msg_install_madVR}";  Components: "madVR";  Check: IsmadVRInstalled;
Filename: "{tmp}\Icaros.exe";           Parameters: "/VERYSILENT";                             WorkingDir: {tmp}; Description: "{cm:msg_install_icaros}"; StatusMsg: "{cm:msg_install_icaros}"; Components: "icaros"; Check: IsIcarosInstalled; 
Filename: "{tmp}\TS.MatriX.Setup.exe";  Parameters: "/VERYSILENT";                             WorkingDir: {tmp}; Description: "{cm:msg_install_tor}";    StatusMsg: "{cm:msg_install_tor}";    Components: "TOR";    Check: IsTORInstalled;
Filename: "{tmp}\ace_engine_setup.exe"; Parameters: "/VERYSILENT";                             WorkingDir: {tmp}; Description: "{cm:msg_install_ace}";    StatusMsg: "{cm:msg_install_ace}";    Components: "ace";    Check: IsACEInstalled;
Filename: "{win}\Regedit.exe";          Parameters: "/S ""{tmp}\Icaros_HKCU.reg /reg:64""";    WorkingDir: {tmp}; Description: "{cm:msg_conf_icaros}";    StatusMsg: "{cm:msg_conf_icaros}";    Components: "icaros"; Check: IsIcarosInstalled; Flags: shellexec runhidden
Filename: "{win}\Regedit.exe";          Parameters: "/S ""{tmp}\icaros_HKLM_64.reg /reg:64"""; WorkingDir: {tmp}; Description: "{cm:msg_conf_icaros}";    StatusMsg: "{cm:msg_conf_icaros}";    Components: "icaros"; Check: IsIcarosInstalled; Flags: shellexec runhidden
Filename: "{win}\Regedit.exe";          Parameters: "/S ""{tmp}\icaros_HKLM_32.reg /reg:32"""; WorkingDir: {tmp}; Description: "{cm:msg_conf_icaros}";    StatusMsg: "{cm:msg_conf_icaros}";    Components: "icaros"; Check: IsIcarosInstalled; Flags: shellexec runhidden
Filename: "{tmp}\7za.exe";              Parameters: "x ""{tmp}\yt-dlp-parser.7z"" -o""{commonpf}\DAUM\PotPlayer\"" * -r -aoa";                                                                  Components: "ext/ytdlp"; Flags: runhidden runascurrentuser;
Filename: "{tmp}\7za.exe";              Parameters: "x ""{tmp}\Module64.7z"" -o""{commonpf}\DAUM\PotPlayer\Module"" * -r -aoa";                                                                 Components: "program"; Flags: runhidden runascurrentuser;
Filename: "{tmp}\7za.exe";              Parameters: "x ""{tmp}\PxShader.7z"" -o""{commonpf}\DAUM\PotPlayer\PxShader"" * -r -aoa";                                                               Components: "program"; Flags: runhidden runascurrentuser; 
Filename: "{commonpf}\DAUM\PotPlayer\PotPlayerMini64.exe";                                                        Description: "{cm:LaunchProgram}";                                                            Flags: postinstall skipifsilent nowait
Filename: "https://addons.mozilla.org/pl/firefox/addon/potplayer-youtube-shortcut/";                              Description: "{cm:tsk_addon1}";                                               Tasks: addon\1; Flags: postinstall ShellExec
Filename: "https://chrome.google.com/webstore/search/potplayer";                                                  Description: "{cm:tsk_addon2}";                                               Tasks: addon\2; Flags: postinstall ShellExec
#endif

#if localize == "true"
[UninstallRun]
Filename: "delete madVR.bat";                    WorkingDir: "{app}";                     StatusMsg: "{cm:msg_un_madVR}"; RunOnceId: "DelService"; Flags: shellexec runhidden 
Filename: "unins000.exe"; Parameters: "/SILENT"; WorkingDir: "{userappdata}\TorrServer\"; StatusMsg: "{cm:msg_un_tor}";   RunOnceId: "Uninstall";  Flags: shellexec
Filename: "unins000.exe"; Parameters: "/SILENT"; WorkingDir: "{userappdata}\ACEStream\";  StatusMsg: "{cm:msg_un_ace}";   RunOnceId: "DelAce";     Flags: shellexec
#endif

[Tasks]
#if localize == "true"
;<-- // Integracja // -->
Name: "minfo1";                     Description: "{cm:tsk_minfo1}";                     GroupDescription: "{cm:tsk_group1}"; Flags: unchecked; Components: "minfo"
Name: "addon";                      Description: "{cm:tsk_addon}";                      GroupDescription: "{cm:tsk_group1}"; Flags: unchecked;
Name: "addon\1";                    Description: "{cm:tsk_addon1}";                     GroupDescription: "{cm:tsk_group1}"; Flags: exclusive unchecked;
Name: "addon\2";                    Description: "{cm:tsk_addon2}";                     GroupDescription: "{cm:tsk_group1}"; Flags: exclusive unchecked;
;<-- // Ustawienia skórek // -->
Name: "skin0";                      Description: "{cm:tsk_skin0}";                      GroupDescription: "{cm:tsk_group2}"; Flags: exclusive;
Name: "skin1";                      Description: "{cm:tsk_skin1}";                      GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked;
Name: "fixpot";                     Description: "{cm:tsk_fixpot}";                     GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked;
Name: "skin2";                      Description: """FMOD""";                            GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked;
Name: "skin3";                      Description: """PotMPC""";                          GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked;
Name: "skin4";                      Description: """PotXMP""";                          GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked; 
Name: "skinmenu";                   Description: "{cm:tsk_skinmenu}";                   GroupDescription: "{cm:tsk_group2}";
Name: "skinfix";                    Description: "{cm:tsk_skinfix}";                    GroupDescription: "{cm:tsk_group2}"; 
Name: "skinfix\a";                  Description: "720x404";                             GroupDescription: "{cm:tsk_group2}"; Flags: exclusive; 
Name: "skinfix\b";                  Description: "800x450";                             GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked; 
Name: "skinfix\c";                  Description: "1280x720";                            GroupDescription: "{cm:tsk_group2}"; Flags: exclusive unchecked;
Name: "skinsize";                   Description: "{cm:tsk_skinsize}";                   GroupDescription: "{cm:tsk_group2}";
Name: "skinstart";                  Description: "{cm:tsk_skinstart}";                  GroupDescription: "{cm:tsk_group2}";
;<-- // Listy odtwarzania, Obrazy, Audio, Wideo, Zak³adki // -->
Name: "savedef";                    Description: "{cm:tsk_savedef}";                    GroupDescription: "{cm:tsk_group3}"; Flags: exclusive;
Name: "savedocs";                   Description: "{cm:tsk_savedocs}";                   GroupDescription: "{cm:tsk_group3}"; Flags: exclusive unchecked;
Name: "playlist";                   Description: "{cm:tsk_playlist}";                   GroupDescription: "{cm:tsk_group3}";
Name: "bookmark";                   Description: "{cm:tsk_bookmark}";                   GroupDescription: "{cm:tsk_group3}"; Flags: unchecked;
Name: "savedesktop";                Description: "{cm:tsk_savedesktop}";                GroupDescription: "{cm:tsk_group3}"; Flags: unchecked;
Name: "saveformat\bmp";             Description: ".BMP";                                GroupDescription: "{cm:tsk_group3}"; Flags: exclusive unchecked;
Name: "saveformat\jpg";             Description: ".JPG";                                GroupDescription: "{cm:tsk_group3}"; Flags: exclusive unchecked;
Name: "saveformat\png";             Description: ".PNG";                                GroupDescription: "{cm:tsk_group3}"; Flags: exclusive;
Name: "savegalery";                 Description: "{cm:tsk_savegalery}";                 GroupDescription: "{cm:tsk_group3}";
Name: "loadurl";                    Description: "{cm:tsk_loadurl}";                    GroupDescription: "{cm:tsk_group3}";
Name: "dispasthumb";                Description: "{cm:tsk_dispasthumb}";                GroupDescription: "{cm:tsk_group3}";
;<-- // Odtwarzacz // -->
Name: "opendef";                    Description: "{cm:tsk_opendef}";                    GroupDescription: "{cm:tsk_group4}";
Name: "opendef\file";               Description: "{cm:tsk_opendef_file}";               GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "opendef\url";                Description: "{cm:tsk_opendef_url}";                GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "opendef\folder";             Description: "{cm:tsk_opendef_folder}";             GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "opendef\navig";              Description: "{cm:tsk_opendef_navig}";              GroupDescription: "{cm:tsk_group4}"; Flags: exclusive;
Name: "opendef\navig\a";            Description: "{cm:tsk_opendef_navig_a}";            GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "opendef\navig\b";            Description: "{cm:tsk_opendef_navig_b}";            GroupDescription: "{cm:tsk_group4}"; Flags: exclusive;
Name: "opendef\navig\disable_zoom"; Description: "{cm:tsk_opendef_navig_disable_zoom}"; GroupDescription: "{cm:tsk_group4}"; Flags: unchecked; 
Name: "opendef\navig\large_frame";  Description: "{cm:tsk_opendef_navig_large_frame}";  GroupDescription: "{cm:tsk_group4}:";
Name: "opendef\navig\no_close";     Description: "{cm:tsk_opendef_navig_no_close}";     GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "openwithsamename_a";         Description: "{cm:tsk_openwithsamename_a}";         GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "openwithsamename_a\1";       Description: "{cm:tsk_openwithsamename_a_1}";       GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "openwithsamename";           Description: "{cm:tsk_openwithsamename}";           GroupDescription: "{cm:tsk_group4}"; Flags: exclusive;
Name: "openwithsamename_b";         Description: "{cm:tsk_openwithsamename_b}";         GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "openwithsamename_b\savepl";  Description: "{cm:tsk_openwithsamename_b_savepl}";  GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "openwithsamename_sf";        Description: "{cm:tsk_openwithsamename_sf}";        GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "playlistopenfullscreen";     Description: "{cm:tsk_playlistopenfullscreen}";     GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "autoresfullscr";             Description: "{cm:tsk_autoresfullscr}";             GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "startcenter";                Description: "{cm:tsk_startcenter}";                GroupDescription: "{cm:tsk_group4}";
Name: "rememberlist";               Description: "{cm:tsk_rememberlist}";               GroupDescription: "{cm:tsk_group4}";
Name: "remposvideo";                Description: "{cm:tsk_remposvideo}";                GroupDescription: "{cm:tsk_group4}";
Name: "remposaudio";                Description: "{cm:tsk_remposaudio}";                GroupDescription: "{cm:tsk_group4}";
Name: "pauseonmin";                 Description: "{cm:tsk_pauseonmin}";                 GroupDescription: "{cm:tsk_group4}";
Name: "pauseonmin\a";               Description: "{cm:tsk_pauseonmin_a}";               GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "pauseonmin\b";               Description: "{cm:tsk_pauseonmin_b}";               GroupDescription: "{cm:tsk_group4}"; Flags: exclusive; 
Name: "failskip_a";                 Description: "{cm:tsk_failskip_a}";                 GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "failskip_b";                 Description: "{cm:tsk_failskip_b}";                 GroupDescription: "{cm:tsk_group4}"; Flags: exclusive;
Name: "closecomplete";              Description: "{cm:tsk_closecomplete}";              GroupDescription: "{cm:tsk_group4}";
Name: "movecenter";                 Description: "{cm:tsk_movecenter}";                 GroupDescription: "{cm:tsk_group4}";
Name: "ontopmode";                  Description: "{cm:tsk_ontopmode}";                  GroupDescription: "{cm:tsk_group4}";
Name: "sizebycenter";               Description: "{cm:tsk_sizebycenter}";               GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "sizeonclose";                Description: "{cm:tsk_sizeonclose}";                GroupDescription: "{cm:tsk_group4}";
Name: "screenfitbysize";            Description: "{cm:tsk_screenfitbysize}";            GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "screenfitbysize\a";          Description: "{cm:tsk_screenfitbysize_a}";          GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "screenfitbysize\b";          Description: "{cm:tsk_screenfitbysize_b}";          GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "prevthumb";                  Description: "{cm:tsk_prevthumb}";                  GroupDescription: "{cm:tsk_group4}";
Name: "dispbookmark";               Description: "{cm:tsk_dispbookmark}";               GroupDescription: "{cm:tsk_group4}";
Name: "seektime";                   Description: "{cm:tsk_seektime}";                   GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "mesplayinfo";                Description: "{cm:tsk_mesplayinfo}";                GroupDescription: "{cm:tsk_group4}"; 
Name: "mesplayinfo\a";              Description: "{cm:tsk_mesplayinfo_a}";              GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "win7worktool";               Description: "{cm:tsk_win7worktool}";               GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "mouse_ps";                   Description: "{cm:tsk_mouse_ps}";                   GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "powerststus";                Description: "{cm:tsk_powerststus}";                GroupDescription: "{cm:tsk_group4}"; Flags: unchecked;
Name: "powerststus\a";              Description: "{cm:tsk_powerststus_a}";              GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
Name: "powerststus\b";              Description: "{cm:tsk_powerststus_b}";              GroupDescription: "{cm:tsk_group4}"; Flags: exclusive unchecked;
;<-- // Ustawienia wideo // -->
Name: "dxva";                       Description: "{cm:tsk_dxva}";                       GroupDescription: "{cm:tsk_group5}";
Name: "renderer";                   Description: "{cm:tsk_renderer}";                   GroupDescription: "{cm:tsk_group5}";
Name: "renderer\auto";              Description: "{cm:tsk_renderer_auto}";              GroupDescription: "{cm:tsk_group5}"; Flags: exclusive;
Name: "renderer\opengl";            Description: "{cm:tsk_renderer_opengl}";            GroupDescription: "{cm:tsk_group5}"; Flags: exclusive unchecked;
Name: "renderer\d3d11";             Description: "{cm:tsk_renderer_d3d11}";             GroupDescription: "{cm:tsk_group5}"; Flags: exclusive unchecked;
Name: "renderer\madVR";             Description: "{cm:tsk_renderer_m}";                 GroupDescription: "{cm:tsk_group5}"; Flags: exclusive unchecked; Components: "madVR"
Name: "extmpcvr";                   Description: "{cm:tsk_extmpcvr}";                   GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "hwcc";                       Description: "{cm:tsk_hwcc}";                       GroupDescription: "{cm:tsk_group5}";
Name: "tsh";                        Description: "{cm:tsk_tsh}";                        GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "ffmpeg";                     Description: "{cm:tsk_ffmpeg}";                     GroupDescription: "{cm:tsk_group5}";
Name: "resizer";                    Description: "{cm:tsk_resizer}";                    GroupDescription: "{cm:tsk_group5}";
Name: "sharpen";                    Description: "{cm:tsk_sharpen}";                    GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "deband";                     Description: "{cm:tsk_deband}";                     GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "levelfix";                   Description: "{cm:tsk_levelfix}";                   GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "HqRgbConv";                  Description: "{cm:tsk_HqRgbConv}";                  GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "ThreadConv";                 Description: "{cm:tsk_ThreadConv}";                 GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "playpriority";               Description: "{cm:tsk_playpriority}";               GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
Name: "mvc3d";                      Description: "{cm:tsk_mvc3d}";                      GroupDescription: "{cm:tsk_group5}"; Flags: unchecked;
;<-- // Ustawienia napisów // -->
Name: "sub";                        Description: "{cm:tsk_sub}";                        GroupDescription: "{cm:tsk_group6}";
Name: "subfilter";                  Description: "{cm:tsk_subfilter}";                  GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
Name: "interlinia";                 Description: "{cm:tsk_interlinia}";                 GroupDescription: "{cm:tsk_group6}";
Name: "maxtime";                    Description: "{cm:tsk_maxtime}";                    GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
Name: "subsecond";                  Description: "{cm:tsk_subsecond}";                  GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
Name: "hidesub";                    Description: "{cm:tsk_hidesub}";                    GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
Name: "force_sub";                  Description: "{cm:tsk_force_sub}";                  GroupDescription: "{cm:tsk_group6}";
Name: "force_sub\a";                Description: "{cm:tsk_force_sub_a}";                GroupDescription: "{cm:tsk_group6}"; Flags: exclusive unchecked;
Name: "force_sub\b";                Description: "{cm:tsk_force_sub_b}";                GroupDescription: "{cm:tsk_group6}"; Flags: exclusive;
Name: "pos_sub";                    Description: "{cm:tsk_pos_sub}";                    GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
Name: "pos_pgs";                    Description: "{cm:tsk_pos_pgs}";                    GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
Name: "downsub_first";              Description: "{cm:tsk_downsub_first}";              GroupDescription: "{cm:tsk_group6}";
Name: "lektor";                     Description: "{cm:tsk_lektor}";                     GroupDescription: "{cm:tsk_group6}"; Flags: unchecked;
;
Name: "subpol";                     Description: "POL";                                 GroupDescription: "{cm:tsk_group7}"; Flags: exclusive;           Languages: "pl"; 
Name: "subeng";                     Description: "ENG";                                 GroupDescription: "{cm:tsk_group7}"; Flags: exclusive unchecked; Languages: "pl"
Name: "subpol";                     Description: "POL";                                 GroupDescription: "{cm:tsk_group7}"; Flags: exclusive unchecked; Languages: "en"; 
Name: "subeng";                     Description: "ENG";                                 GroupDescription: "{cm:tsk_group7}"; Flags: exclusive;           Languages: "en"; 
;<-- // Ustawienia audio // -->
Name: "stereo";                     Description: "{cm:tsk_stereo}";                     GroupDescription: "{cm:tsk_group8}"; Flags: exclusive;
Name: "ch6";                        Description: "{cm:tsk_ch6}";                        GroupDescription: "{cm:tsk_group8}"; Flags: exclusive unchecked;
Name: "asis";                       Description: "{cm:tsk_asis}";                       GroupDescription: "{cm:tsk_group8}"; Flags: exclusive unchecked;
Name: "virtual_dolby";              Description: "{cm:tsk_virtual_dolby}";              GroupDescription: "{cm:tsk_group8}"; Flags: exclusive unchecked;
Name: "audio_start";                Description: "{cm:tsk_audio_start}";                GroupDescription: "{cm:tsk_group8}"; Flags: unchecked;
;
Name: "gain";                       Description: "{cm:tsk_gain}";                       GroupDescription: "{cm:tsk_group8}";
Name: "gain2";                      Description: "{cm:tsk_gain2}";                      GroupDescription: "{cm:tsk_group8}"; Flags: unchecked;
Name: "gain3";                      Description: "{cm:tsk_gain3}";                      GroupDescription: "{cm:tsk_group8}"; Flags: unchecked;

;
Name: "bit_depth16";                Description: "{cm:tsk_bit_depth16}";                GroupDescription: "{cm:tsk_group8}"; Flags: exclusive unchecked;
Name: "bit_depth24";                Description: "{cm:tsk_bit_depth24}";                GroupDescription: "{cm:tsk_group8}"; Flags: exclusive;
Name: "bit_depth32";                Description: "{cm:tsk_bit_depth32}";                GroupDescription: "{cm:tsk_group8}"; Flags: exclusive unchecked;
Name: "bit_depth32f";               Description: "{cm:tsk_bit_depth32f}";               GroupDescription: "{cm:tsk_group8}"; Flags: exclusive unchecked;
;<-- // Renderer audio // -->
Name: "rendef";                     Description: "{cm:tsk_rendef}";                     GroupDescription: "{cm:tsk_group9}"; Flags: exclusive;
Name: "wasapi";                     Description: "{cm:tsk_wasapi}";                     GroupDescription: "{cm:tsk_group9}"; Flags: exclusive unchecked;
Name: "crossfeed";                  Description: "{cm:tsk_crossfeed}";                  GroupDescription: "{cm:tsk_group9}"; Flags: unchecked;
Name: "extsanear";                  Description: "{cm:tsk_extsanear}";                  GroupDescription: "{cm:tsk_group9}"; Flags: unchecked;
;<-- // Preferowany jêzyk audio // -->
Name: "audpol";                     Description: "POL";                                 GroupDescription: "{cm:tsk_group10}"; Languages: "pl"; Flags: exclusive;
Name: "audeng";                     Description: "ENG";                                 GroupDescription: "{cm:tsk_group10}"; Languages: "pl"; Flags: exclusive unchecked; 
Name: "audpol";                     Description: "POL";                                 GroupDescription: "{cm:tsk_group10}"; Languages: "en"; Flags: exclusive unchecked; 
Name: "audeng";                     Description: "ENG";                                 GroupDescription: "{cm:tsk_group10}"; Languages: "en"; Flags: exclusive;
Name: "extaudio";                   Description: "{cm:tsk_extaudio}";                   GroupDescription: "{cm:tsk_group10}"; Flags: unchecked; 
#endif

[Types]
#if localize == "true"
Name: "tweak";       Description: "{cm:comp_tweak}";
Name: "full";        Description: "{cm:comp_full}"
Name: "compact";     Description: "{cm:comp_compact}"
Name: "custom";      Description: "{cm:comp_custom}"; Flags: iscustom
#endif

[Components]
#if localize == "true"
Name: "program";     Description: "{cm:comp_program}";     Types: tweak full compact custom; Flags: fixed                                 
Name: "SVP";         Description: "{cm:comp_SVP}";         Types: tweak full custom;         Check: IsSVPInstalled;
Name: "madVR";       Description: "{cm:comp_madVR}";       Types: custom;                    Check: IsmadVRInstalled;
Name: "TOR";         Description: "{cm:comp_TOR}";         Types: tweak full custom;         Check: IsTORInstalled;    ExtraDiskSpaceRequired: 28735659;
Name: "ACE";         Description: "{cm:comp_ACE}";         Types: tweak full custom;         Check: IsACEInstalled;    ExtraDiskSpaceRequired: 23356723;
Name: "ext";         Description: "{cm:comp_ext}";         Types: custom;
Name: "ext/torrent"; Description: "{cm:comp_ext_torrent}"; Types: tweak full custom;         Check: IsTorrentInstalled;
Name: "ext/ytdlp";   Description: "{cm:comp_ext_ytdlp}";   Types: tweak full custom;         Check: IsDLPInstalled;    ExtraDiskSpaceRequired: 11970069;
Name: "ext/twich";   Description: "{cm:comp_ext_twich}";   Types: custom;                    Check: IsTwichInstalled;
Name: "icaros";      Description: "{cm:comp_icaros}";      Types: custom;                    Check: IsIcarosInstalled; ExtraDiskSpaceRequired: 10428416;
Name: "minfo";       Description: "{cm:comp_minfo}";       Types: custom;                    Check: IsMInfoInstalled; 
#endif

[UninstallDelete]
Type: files; Name: "{app}\FanPack.url"
Type: files; Name: "{app}\Addons Mozilla PotPlayer YouTube.url"
Type: files; Name: "{app}\Addons Chrome PotPlayer YouTube.url"
Type: filesandordirs; Name: "{app}";
Type: files; Name: "{localappdata}\madVR\settings.bin"; 
Type: files; Name: "{localappdata}\madVR\settings.bak"; 
Type: filesandordirs; Name: "{localappdata}\madVR";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Module\MI\MediaInfo.exe";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Module\MI\MediaInfo.dll";
Type: filesandordirs; Name: "{commonpf}\DAUM\PotPlayer\Module\MI";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Module\MpcVideoRenderer64.ax";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Module\sanear64.ax";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Module\libmfxsw64.dll";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Module\OpenCodec\OpenCodecUnity64.dll";
Type: filesandordirs; Name: "{commonpf}\DAUM\PotPlayer\Module\OpenCodec";
Type: files; Name: "{userappdata}\PotPlayerMini64\Playlist\AceTV.dpl"; 
Type: files; Name: "{userappdata}\PotPlayerMini64\Playlist\Ten komputer.dpl"; 
Type: files; Name: "{userappdata}\PotPlayerMini64\Playlist\FilmPolski.dpl"; 
Type: files; Name: "{userappdata}\PotPlayerMini64\Playlist\Torrent.dpl"; 
Type: files; Name: "{userappdata}\PotPlayerMini64\Playlist\YouTube.dpl"; 
Type: files; Name: "{userappdata}\PotPlayerMini64\Playlist\IPTV.dpl"; 
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse\yt-dlp_x86-parser.exe";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse\yt-dlp_x86.exe";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse\MediaPlayParse - yt-dlp.ico";
Type: files; Name: "{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse\MediaPlayParse - yt-dlp.as";


[Code]
function GetAppMajorVersion(param: String): String;
	begin
		Result:='{#vmajor}';
	end;

function GetAppMinorVersion(param: String): String;
	begin
		Result:='{#vminor}';
	end;

function GetAppCurrentVersion(param: String): String;
	begin
		Result:='{#vbuild}';
	end;

function GetAppID(param: String): String;
	begin
		Result := '{#appname}';
	end;

function GetPathInstalled(AppID: String): String;
	var
		PrevPath: String;
	begin
		PrevPath := '';
		if not RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\'+AppID+'_is1', 'Inno Setup: App Path', PrevPath) then begin
			RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\'+AppID+'_is1', 'Inno Setup: App Path', PrevPath);
		end;
		Result := PrevPath;
	end;

function GetInstalledVersion(): String;
	var
		InstalledVersion: String;
	begin
		InstalledVersion := '';
		RegQueryStringValue(HKLM, 'Software\{#appname}', 'Version', InstalledVersion);
		Result := InstalledVersion;
	end;

function GetInstalledCurrentVersion(): String;
	var
		InstalledCurrentVersion: String;
	begin
		InstalledCurrentVersion := '';
		RegQueryStringValue(HKLM, 'Software\{#appname}', 'CurrentVersion', InstalledCurrentVersion);
		Result := InstalledCurrentVersion;
	end;

function InitializeSetup(): Boolean;
	var
		Response: Integer;
		PrevDir: String;
		InstalledVersion: String;
		InstalledCurrentVersion: String;
		//VersionError: String;
	begin
		Result := true;

		// read the installation folder
		PrevDir := GetPathInstalled(getAppID(''));

		if length(Prevdir) > 0 then begin
			// I found the folder so it's an upgrade.
			
			// compare versions
			InstalledCurrentVersion := GetInstalledCurrentVersion();
			InstalledVersion := GetAppCurrentVersion('');
			if (InstalledCurrentVersion < InstalledVersion) then begin
				Result := True;
			end else if (InstalledCurrentVersion = InstalledVersion) then begin
				Response := MsgBox(
					'Wygl¹da na to, ¿e istniej¹ca instalacja aplikacji {#appname} jest ju¿ aktualna.' + #13#13 +
					'Czy chcesz kontynuowaæ instalacjê aktualizacji?', mbError, MB_YESNO
				);
				Result := (Response = IDYES);
			end else begin
				Response := MsgBox(
					'Wygl¹da na to, ¿e istniej¹ca instalacja aplikacji {#appname} jest nowsza ni¿ ta aktualizacja.' + #13#13 +
					'Istniej¹ca instalacja to v'+ GetAppMajorVersion('') + '.' + GetAppMinorVersion('')+'.'+InstalledCurrentVersion +'.  Ta aktualizacja zmieni instalacjê na v'+ GetAppMajorVersion('') + '.' + GetAppMinorVersion('')+'.'+ GetAppCurrentVersion('') + '.' + #13#13 +
					'Czy chcesz kontynuowaæ instalacjê aktualizacji?', mbError, MB_YESNO
				);
				Result := (Response = IDYES);
			end;
		end else begin
			// Didn't find the folder so its a fresh installation.
			Result:=true;
		end;
    end;

function ShouldSkipPage(PageID: Integer): Boolean;
  var
    PrevDir:String;
	begin
		PrevDir := GetPathInstalled(getAppID(''));
		if length(Prevdir) > 0 then begin
		  // skip selectdir if It's an upgrade
		  if (PageID = wpSelectDir) then begin
			 Result := true;
		  end else if (PageID = wpSelectProgramGroup) then begin
			 Result := true;
  		end else if (PageID = wpSelectTasks) then begin
	 		  Result := true;
  		end else begin
  			Result := false;
  		end;
		end;
	end;


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

function IsMInfoInstalled():Boolean;
begin
    Result := not RegKeyExists(HKEY_CURRENT_USER, 'SOFTWARE\MediaInfo'); 
end;

function IsTORInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{userappdata}\TorrServer\tsl.exe'));
end;

function IsACEInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{userappdata}\ACEStream\engine\ace_engine.exe'));
end;

function IsSVPInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{commonpf}\DAUM\PotPlayer\AviSynth.dll'));
end;

function IsTwichInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse\MediaPlayParse - Twitch.as'));
end;

function IsTorrentInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{commonpf}\DAUM\PotPlayer\Extension\Lib\TorrentReader64.dll'));
end;

function IsmadVRInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{localappdata}\madVR\madVR.ax'));
end;

function IsDLPInstalled():Boolean;
begin
    Result := not FileExists(ExpandConstant('{commonpf}\DAUM\PotPlayer\Extension\Media\PlayParse\yt-dlp_x86.exe'));
end;




procedure InitializeWizard;
begin
    idpDownloadAfter(wpReady);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
    if CurPageID = wpReady then
    begin
        // User can navigate to 'Ready to install' page several times, so we 
        // need to clear file list to ensure that only needed files are added.
        idpClearFiles;

        if WizardIsComponentSelected('icaros') then
            idpAddFile('http://www.potplayerclub.pl/ccount/click.php?id=27', ExpandConstant('{tmp}\Icaros.exe'));
        if WizardIsComponentSelected('TOR') then
            idpAddFile('http://www.potplayerclub.pl/ccount/click.php?id=33', ExpandConstant('{tmp}\TS.MatriX.Setup.exe'));
        if WizardIsComponentSelected('ACE') then
            idpAddFile('http://www.potplayerclub.pl/ccount/click.php?id=28', ExpandConstant('{tmp}\ace_engine_setup.exe'));
        if WizardIsComponentSelected('ext/ytdlp') then
            idpAddFile('http://www.potplayerclub.pl/ccount/click.php?id=34', ExpandConstant('{tmp}\yt-dlp-parser.7z'));
  end;
end;
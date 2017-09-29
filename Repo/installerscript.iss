; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Pong"
#define MyAppVersion "1.0"
#define MyAppPublisher "Jackson Moore"
#define MyAppExeName "pong.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9A61F469-0E67-4AB5-A1C5-1AC87DE01A79}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir=D:\miniweb\C_C++\Pong\Build_Latest\Executable
OutputBaseFilename=pong_installer
SetupIconFile=D:\miniweb\C_C++\Pong\Repo\icon.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\pong.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\openal32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-audio-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-audio-d-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-graphics-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-graphics-d-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-network-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-network-d-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-system-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-system-d-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-window-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\sfml-window-d-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\Consolas.ttf"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\paddle.png"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\miniweb\C_C++\Pong\Build_Latest\Full\icon.png"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent


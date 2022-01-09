program WestPak2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MainForm},
  codec in 'codec.pas',
  CPSFile in 'CPSFile.pas',
  uPakFile in 'uPAKFile.pas',
  SHPFile in 'SHPFile.pas',
  utils in 'utils.pas',
  GFXUtils in 'GFXUtils.pas',
  VOCFile in 'VOCFile.pas',
  FileLoader in 'FileLoader.pas',
  GfxFile in 'GfxFile.pas',
  AnimationFile in 'AnimationFile.pas',
  Global in 'Global.pas',
  AboutBoxUnit in 'AboutBoxUnit.pas' {AboutBoxForm},
  DLEFile in 'DLEFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.

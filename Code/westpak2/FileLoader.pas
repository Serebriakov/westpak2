{
$Id: FileLoader.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** Base Class for loading file from disk or from a .PAK archive
 ***
}

unit FileLoader;

interface

uses Classes, Windows, uPAKFile;

type TFileLoader = class
  protected
    fFileName: string; //unused for now
    fFileVersion: Shortint;
    function LoadFromStream(aStream: TStream): boolean; virtual; abstract;
  public
    constructor Create;
    procedure SetFileVersion(version: shortint);
    function LoadFromFile(const FileName: string): boolean;
    function LoadFromPakFile(const num: integer; const PakFile: TPakFile): boolean;
    destructor Destroy; override;
  end;

implementation

Uses SysUtils;

constructor TFileLoader.Create;
begin
  inherited Create;
  fFileName := '';
  fFileVersion := -1;
end;

procedure TFileLoader.SetFileVersion(version: shortint);
begin
  fFileVersion := version;
end;

function TFileLoader.LoadFromFile(const FileName: string): boolean;
var tmpFile: TFileStream;
begin
  result := false;
  tmpFile := TFileStream.Create(FileName, $0000); //$0000 = fmOpenRead
  try
    result := LoadFromStream(tmpFile);
  finally
    tmpFile.Free;
  end;
end;

function TFileLoader.LoadFromPakFile(const num: integer; const PakFile: TPakFile): boolean;
var tmpData: TMemoryStream;
decomp: Boolean;
filename: String;
begin
  result := false;
  tmpData := TMemoryStream.Create;
  try
    //if FileVersion isn't forced get the correct one from pakfile
    if (fFileVersion = -1) then fFileVersion := PakFile.Version;

    filename := PakFile.GetFileNameInfo(num);
    (*
    if (fFileVersion = 3) and (ExtractFileExt(filename) = '.SHP') then decomp := True
    else if (filename = 'WRITING.CPS') or (filename = 'BEAD.CPS') then decomp := True //Those Kyrandia1 CPS really are SHP!
    else decomp := false;
    *)
    decomp := false;
    PakFile.ExtractFile(num, tmpData, decomp);
    result := LoadFromStream(tmpData);
  finally
    tmpData.Free;
  end;
end;

destructor TFileLoader.Destroy;
begin
  inherited Destroy;
end;

end.


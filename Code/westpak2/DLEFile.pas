{
$Id: DLEFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** DiaLog English file
 ***
}

unit DLEFile;

interface

uses Classes, Windows, Graphics, FileLoader, Global;

type
  TDLEFile = class(TFileLoader)
  protected
    fTextTable: TStringList;
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    constructor Create;
    function GetText: string;
    destructor Destroy; override;
  end;

implementation

constructor TDLEFile.Create;
begin
  inherited Create;
  fTextTable := TStringList.Create;
end;

function TDLEFile.LoadFromStream(aStream: TStream): boolean;
var
  off, size, code, stringsize, id, unk: word;
  arr_off: array of word;
  tmpStr, buf: string;
  CDVersion, endblock: Boolean;
  totOffs, BlockSize, i, FirstOffs, TotFrasi: integer;

begin
  Result := false;
  CDVersion := (fFileVersion >= CD_GAME);

  fTextTable.Clear;
  aStream.position := 8; //8

  totOffs := 0;
  aStream.Read(off, 2);
  while (off <> $0005) do
  begin
    setLength(arr_off, totOffs + 1);
    arr_off[totOffs] := off;
    inc(totOffs);
    aStream.Read(off, 2);
  end;
  setLength(arr_off, totOffs + 1);
  arr_off[totOffs] := aStream.Size;

  endblock := false;
  i := 1;
  while (aStream.Position < aStream.Size) do
  begin
    aStream.Read(code, 2);
    case code of
      $000B..$003C:
        begin
          aStream.Read(stringsize, 2);
          if (CDVersion) then aStream.Read(id, 2);
          SetLength(tmpStr, stringsize);
          aStream.Read(tmpStr[1], stringsize);
          OEMToCharBuff(pChar(tmpStr + #0), pChar(tmpStr), length(tmpStr));
          fTextTable.Add(tmpStr);
        end;
      $000A:
        begin
          if aStream.Position < aStream.Size then aStream.Read(unk, 2);
          endblock := true;
        end;
      $0004: aStream.Read(unk, 2);
    else
      begin
        //arr_off := nil;
        //exit;
        //showmessage('Unknown code!');
      end;
    end;
    if (endblock) then
    begin
      off := aStream.Position;
      //assert(off = arr_off[i], 'New block start doesn''t mach!!');
      endblock := false;
      inc(i);
    end;
  end; //while

  arr_off := nil;
  Result := True;
end;

function TDLEFile.GetText: string;
begin
  Result := fTextTable.Text;
end;

destructor TDLEFile.Destroy;
begin
  fTextTable.Free;
  inherited Destroy;
end;

end.

 
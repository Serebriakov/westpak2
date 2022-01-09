{
$Id: ENGFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** ENGlish text file
 ***
}

unit ENGFile;

interface

uses Classes, Windows, Graphics, FileLoader;

type
  TENGFile = class(TFileLoader)
  protected
    fTextTable: TStringList;
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    constructor Create;
    function GetText: string;
    destructor Destroy; override;
  end;

implementation

Uses Global, Utils, StrUtils;

constructor TENGFile.Create;
begin
  inherited Create;
  fTextTable := TStringList.Create;
end;

function Compress_DecompressAlfa(s: string; decompress: Boolean = true): string;
const MainTable = ' etainosrlhcdupm';
  SubTable: array[0..15] of string[8] = (
    'tasio wb',
    ' rnsdalm',
    'h ieoras',
    'nrtlc sy',
    'nstcloer',
    ' dtgesio',
    'nr ufmsw',
    ' tep.ica',
    'e oiadur',
    ' laeiyod',
    'eia otru',
    'etoakhlr',
    ' eiu,.oa',
    'nsrctlai',
    'leoiratp',
    'eaoip bm'
    );
var i, j: Integer;
  c, c1, c2: byte;
  ch1, ch2: char;
begin
  Result := '';

  if (Decompress) then
  begin
    //decompression
    i := 1;
    while (i <= length(s)) do
    begin
      c := byte(s[i]);
      if (c and $80) > 0 then //bit 7
      begin
        c1 := ((c shr 3) and $0F); //bit 6,5,4,3
        ch1 := MainTable[c1 + 1];
        c2 := (c and $07); //bit 2,1,0
        ch2 := SubTable[c1][c2 + 1];
        Result := Result + ch1 + ch2;
      end else if (c < 32) then
      begin
        if (c = $1B) then
        begin
          inc(i);
          c1 := byte(s[i]);
          ch1 := char(127 + c1);
          Result := Result + ch1;
        end else if (c = 13) then Result := Result + '\r'
        else Result := Result + '§'; //ShowMessage('Found strange char in decryption!');
      end
      else Result := Result + s[i];
      inc(i);
    end; //while
  end else
  begin
    //compression
    //s := Q_ReplaceText(s, '\r', #13);
    s := AnsiReplaceText(s, '\r', #13);
    i := 1;
    while (i <= length(s)) do
    begin
      ch1 := s[i];
      inc(i);
      c := byte(ch1);
      if (c > 127) then
      begin
        dec(c, 127);
        Result := Result + #27 + char(c);
      end else
      begin
        c1 := pos(ch1, MainTable);
        if (c1 > 0) then
        begin
          ch2 := s[i];
          c2 := pos(ch2, SubTable[c1 - 1]);
          if (c2 > 0) then
          begin
            c := (c1 - 1) shl 3;
            c := c or (c2 - 1);
            c := c or $80;
            Result := Result + char(c);
            inc(i);
          end else Result := Result + ch1;
        end else Result := Result + ch1;
      end;
    end; //while
  end; //else
end;

function TENGFile.LoadFromStream(aStream: TStream): boolean;
var tmpStr: string;
  i, FirstOff: word;
  b: byte;
  compressed: Boolean;
begin
  Result := false;

  fTextTable.Clear;
  aStream.Seek(-1, soEnd);
  aStream.Read(b, 1);
  aStream.Position := 0;
  compressed := (b <> $1A);

  if (compressed) then
  begin
    aStream.Read(FirstOff, 2);
    aStream.Seek(FirstOff, soFromBeginning);
    while (aStream.Position < aStream.Size) do
    begin
      tmpStr := readNullString(aStream);
      if (tmpStr <> '') then
      begin
        tmpStr := Compress_DecompressAlfa(tmpStr);
        OEMToCharBuff(pChar(tmpStr + #0), pChar(tmpStr), length(tmpStr));
        fTextTable.Add(tmpStr);
      end;
    end; //while
  end else
  begin
    fTextTable.LoadFromStream(aStream);
    fTextTable.Delete(fTextTable.Count - 1);
    for i := 0 to fTextTable.Count - 1 do // iterate
    begin
      tmpStr := fTextTable.Strings[i];
      OEMToCharBuff(pChar(tmpStr + #0), pChar(tmpStr), length(tmpStr));
      fTextTable.Strings[i] := tmpStr;
    end; //for
  end;

  Result := True;
end;

function TENGFile.GetText: string;
begin
  Result := fTextTable.Text;
end;

destructor TENGFile.Destroy;
begin
  fTextTable.Free;
  inherited Destroy;
end;

end.

 
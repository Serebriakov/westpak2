{
$Id: uPAKFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** PAKing archive file
 ***
}
unit uPAKFile;

interface

uses Classes;

type

  THead = record
    Filename: string;
    OffName, FileSize, Unk1, PakOffs: integer;
    PAKfileidx, Unk2: word;
  end;

  TPakFile = class
  protected
    fVersion: byte;
    fName: array of string;
    fOffs, fSize: array of integer;
    fLastOff: integer;
    fTotals: integer;
    fFileName: string;
    fStream: TMemoryStream;
    fOpen: boolean;
    fIdxItems: array of THead;
    fTotalIdxItems: Integer;
  private
    procedure LoadIDX(Path: string);
    procedure UpdateIDX;
    procedure SaveIDX(Path: string);
  public
    property FileName: string read fFileName write fFileName;
    property TotalFiles: integer read fTotals;

    constructor Create;
    destructor Destroy; override;
    function LoadFromFile(FileName: string): boolean;
    function SaveToFile(FileName: string): boolean;
    procedure GetFileInfo(const num: integer; var name: string; var size: integer; var off: integer);
    function GetFileNameInfo(const num: integer): string;
    function GetFileNum(const filename: string): integer;

    function Seek(off: integer): integer;
    function SeekTo(FileNum: integer): boolean;
    function ReadByte: byte;
    function ReadWord: word;
    function ReadLong: integer;
    function Read(var buf; const size: integer): integer;

    function ExtractFile(const num: integer; var memStream: TMemoryStream; decompress: boolean): boolean;
    function ExtractToFile(const num: integer; const DestFileName: string; decompress: boolean): boolean;

    function ReplaceFile(const num: integer; const Stream: TStream): boolean; overload;
    function ReplaceFile(const num: integer; const NewFileName: string): boolean; overload;

    procedure Close;

    property Version: byte read fVersion;
  end;

function readNullString(const st: TStream): string;

implementation

uses SysUtils, utils, codec;

var HeadRec1: record
    OffName, FileSize, Unk1, PakOffs: integer;
    PAKfileidx, Unk2: word;
  end;


function readNullString(const st: TStream): string;
var c: char;
begin
  Result := '';
  st.Read(c, 1);
  while (c <> #0) do
  begin
    Result := Result + c;
    st.Read(c, 1);
  end;
end;

procedure writeNullString(st: TStream; s: string);
var c: char;
begin
  st.Write(s[1], length(s));
  c := #0;
  st.Write(c, 1);
end;

constructor TPakFile.Create;
begin
  inherited Create;
  fOpen := false;
  fFileName := '';
  fTotals := 0;
  fVersion := 0;
  fTotalIdxItems := 0;
  fOffs := nil;
  fName := nil;
  fSize := nil;
  fIdxItems := nil;
end;

procedure TPakFile.LoadIDX(Path: string);
var idxStream: TFileStream;
  firstOff, i: integer;
begin
  idxStream := TFileStream.Create(Path + 'FILEDATA.FDT', fmOpenRead);

  idxStream.read(firstOff, 4);
  fTotalIdxItems := firstOff div 20;
  SetLength(fIdxItems, fTotalIdxItems);
  dec(fTotalIdxItems);

  idxStream.Position := 0;

  for i := 0 to fTotalIdxItems do //read also null
  begin
    idxStream.Read(HeadRec1, SizeOf(HeadRec1));
    with fIdxItems[i] do
    begin
      Offname := HeadRec1.Offname;
      Filesize := HeadRec1.Filesize;
      Unk1 := HeadRec1.Unk1;
      PakOffs := HeadRec1.PakOffs;
      PAKfileidx := HeadRec1.PAKfileidx;
      Unk2 := HeadRec1.Unk2;
    end;
  end; //for

  for i := 0 to fTotalIdxItems - 1 do
    fIdxItems[i].filename := readNullString(idxStream);

  idxStream.Free;
end;

procedure TPakFile.SaveIDX(Path: string);
var idxStream: TFileStream;
  i: integer;
begin
  idxStream := TFileStream.Create(Path + 'FILEDATA.FDT', fmCreate);

  for i := 0 to fTotalIdxItems do //write also null
  begin
    with fIdxItems[i] do
    begin
      HeadRec1.Offname := Offname;
      HeadRec1.Filesize := Filesize;
      HeadRec1.Unk1 := Unk1;
      HeadRec1.PakOffs := PakOffs;
      HeadRec1.PAKfileidx := PAKfileidx;
      HeadRec1.Unk2 := Unk2;
    end;
    idxStream.write(HeadRec1, SizeOf(HeadRec1));
  end;
{
    with IdxHead[i] do
    begin
      idxStream.write(offname, 4);
      idxStream.write(fsize, 4);
      idxStream.write(unk1, 4);
      idxStream.write(offs, 4);
      idxStream.write(PAKfileidx, 2);
      idxStream.write(unk2, 2);
    end;
}
  for i := 0 to fTotalIdxItems - 1 do
    writeNullString(idxStream, fIdxItems[i].filename);

  idxStream.Free;
end;

function TPakFile.LoadFromFile(FileName: string): boolean;
var offs, tot, HeaderSize, fileSize, firstOffset: integer;
  b: byte;
begin
(************
FileVersion:
0 EOB1
1 DUNE2
2 LOL1
3 All other floppy games
4 CD games
*************)

  tot := 0;
  if (fOpen) then Close;
  fFileName := FileName;

  fStream := TMemoryStream.Create;
  fStream.LoadFromFile(FileName);
  //fStream := TFileStream.Create(FileName, fmOpenRead);
  FileSize := fStream.Size;
  fStream.Position := 0;

  repeat
    fStream.Read(offs, 4);
    if tot = 0 then firstOffset := offs;

    if (offs = 0) then
    begin
      //DUNE2
      fVersion := 1;
      fLastOff := 0;
    end else if (offs = FileSize) then
    begin
      fLastOff := -1; //last offset is the size of file .pak

      //check if is a EOB1 correct pak or a new pak (HoF, LoL, Kyr3)
      if (fStream.position = firstOffset) then
      begin
        fVersion := 0; //EOB1
        offs := 0; //exit;
      end else
      begin
        //check if next data is 0
        fStream.Read(b, 1);
        fStream.Read(offs, 4);
        if (b <> 0) or (offs <> 0) then raise Exception.Create('Warning: unknown PAK file version (seem type 3)!');

        //check for filedata.fdt
        if FileExists(ExtractFilePath(Filename) + 'filedata.fdt') then
        begin
          fVersion := 4; //CD games
          LoadIDX(ExtractFilePath(Filename));
        end
        else
        begin
          fVersion := 3; //Other games
        end;
      end;

    end else if (fStream.position >= firstOffset) then
    begin
      //EOB1 strange final offset
      //memorize maybe can be useful ??
      fVersion := 0;
      fLastOff := offs;
      offs := 0; //exit
    end else
    begin
      //file offset
      setlength(fOffs, tot + 1);
      setlength(fName, tot + 1);
      setlength(fSize, tot + 1);
      fOffs[tot] := offs;
      fName[tot] := readNullString(fStream);
      if tot > 0 then fSize[tot - 1] := offs - fOffs[tot - 1];
      inc(tot);
    end;
  until (offs = 0);
  fTotals := tot;

  //aggiusta la size dell'ultimo file non calcolata nel ciclo while
  fSize[tot - 1] := FileSize - fOffs[tot - 1];
  fOpen := true;

  result := fOpen;
end;

procedure TPakFile.UpdateIDX;
var i, j: Integer;
  pakfilename: string;

begin
  for i := 0 to fTotals - 1 do
  begin
    for j := 0 to fTotalIdxItems - 1 do
    begin
      if (fName[i] = fIdxItems[j].Filename) then
      begin
        fIdxItems[j].FileSize := fSize[i];
        fIdxItems[j].PakOffs := fOffs[i];
        break;
      end;
    end; //for j
  end; //for i

  pakfilename := UpperCase(ExtractFileName(fFileName));
  for j := 0 to fTotalIdxItems - 1 do
  begin
    if (pakfilename = fIdxItems[j].Filename) then
    begin
      fIdxItems[j].FileSize := fStream.Size;
      break;
    end;
  end; //for j

end;

function TPakFile.SaveToFile(FileName: string): boolean;
begin
  fStream.SaveToFile(FileName);
  if (fVersion >= 4) then
  begin
    //rebuild filedata.fdt if version >= 4
    UpdateIDX;
    SaveIDX(ExtractFilePath(Filename));
  end;
  result := true;
end;

procedure TPakFile.GetFileInfo(const num: integer; var name: string; var size: integer; var off: integer);
begin
  if (num < fTotals) then
  begin
    name := fName[num];
    size := fSize[num];
    off := fOffs[num];
  end else
  begin
    name := '';
    size := 0;
    off := 0;
  end;
end;

function TPakFile.GetFileNameInfo(const num: integer): string;
begin
  result := fName[num];
end;

function TPakFile.GetFileNum(const filename: string): integer;
var i: integer;
begin
  Result := -1; //not found
  for i := 0 to fTotals - 1 do
    if Q_SameText(filename, fName[i]) then
    begin
      Result := i;
      break;
    end;
end;

function TPakFile.Seek(off: integer): integer;
begin
  result := fStream.Seek(off, soFromBeginning);
end;

function TPakFile.SeekTo(FileNum: integer): boolean;
begin
  fStream.Seek(fOffs[FileNum], soFromBeginning);
  result := true;
end;

function TPakFile.ReadByte: byte;
begin
  fStream.Read(result, 1);
end;

function TPakFile.ReadWord: word;
begin
  fStream.Read(result, 2);
end;

function TPakFile.ReadLong: integer;
begin
  fStream.Read(result, 4);
end;

function TPakFile.Read(var buf; const size: integer): integer;
begin
  result := fStream.Read(buf, size);
end;

function TPakFile.ExtractFile(const num: integer; var memStream: TMemoryStream; decompress: boolean): boolean;
var FileSize, dummy: integer;
  BlockSize, CompType, DestSize, AdditionalData: word;
  buf1, buf2: array of byte;

begin
  if (num < fTotals) then
  begin
    FileSize := fSize[num];

    memStream.SetSize(FileSize);
    memStream.Position := 0;
    fStream.Seek(fOffs[num], soFromBeginning);

    if not decompress then begin
      memStream.CopyFrom(fStream, FileSize);
    end else
    begin
      fStream.read(BlockSize, 2); //filesize-2
      fStream.read(CompType, 2); //always $0004 ???
      if (BlockSize <> FileSize - 2) and (CompType <> $0004) then
      begin
        //BlockSize is not FileSize-2 and CompType different from 4,
        //maybe the file is uncompressed, so force a simple copy
        fStream.Seek(-4, soFromCurrent);
        memStream.CopyFrom(fStream, FileSize);
      end else
      begin
        //decompression
        fStream.read(DestSize, 2); //size of uncompressed
        fStream.read(dummy, 2); //dummy value???
        fStream.read(AdditionalData, 2); //size of additional data present

        fStream.Seek(AdditionalData, soFromCurrent); //skip additionaldata (usually a palette)

        setLength(buf1, FileSize);
        setLength(buf2, DestSize);
        fStream.read(buf1[0], FileSize - 10);
        dummy := Decompress_format80(buf1, buf2, FileSize - 10);
        memStream.Write(buf2[0], DestSize);
        buf1 := nil; buf2 := nil;
      end; //else

    end; //else
    memStream.Position := 0;
  end;
end;

function TPakFile.ExtractToFile(const num: integer; const DestFileName: string; decompress: boolean): boolean;
var dest: TMemoryStream;
begin
  if (num < fTotals) then
  begin
    dest := TMemoryStream.Create;
    ExtractFile(num, dest, decompress);
    dest.SaveToFile(DestFileName);
    dest.Free;
  end;
end;

function TPakFile.ReplaceFile(const num: integer; const Stream: TStream): boolean;
var temp: TMemoryStream;
  oldSize, newSize, diffSize, oldOffs, i: integer;

begin
  if (num > 0) and (num < fTotals) then
  begin
    //fName[num] := ExtractFileName(NewFileName); //maybe change name??
    Stream.Position := 0;
    oldSize := fSize[num];
    newSize := Stream.Size;
    fSize[num] := newSize;
    diffSize := newSize - oldSize;

    temp := TMemoryStream.Create;
    oldOffs := fOffs[num];

    fStream.Position := 0;
    temp.CopyFrom(fStream, oldOffs);
    temp.CopyFrom(Stream, 0);

    if (num < fTotals - 1) then
    begin
      fStream.Seek(fOffs[num + 1], soFromBeginning);
      temp.CopyFrom(fStream, fStream.Size - fOffs[num + 1]);
      for i := num + 1 to fTotals - 1 do
        inc(fOffs[i], diffSize);
    end;
    temp.Position := 0;
    for i := 0 to fTotals - 1 do
    begin
      temp.Write(fOffs[i], 4);
      writeNullString(temp, fName[i]);
    end;

    NewSize := temp.Size;
    if (fVersion >= 3) then temp.Write(NewSize, 4);

    fStream.Clear;
    fStream.CopyFrom(temp, 0);

    temp.Free;
  end;
end;

function TPakFile.ReplaceFile(const num: integer; const NewFileName: string): boolean;
var
  newFile: TFileStream;
begin
  newFile := TFileStream.Create(NewFileName, fmOpenRead);
  ReplaceFile(num, newFile);
  newFile.Free;
end;

procedure TPakFile.Close;
begin
  if (fOpen) then
  begin
    fOpen := false;
    fFileName := '';
    fTotals := 0;
    fVersion := 0;
    fOffs := nil;
    fName := nil;
    fSize := nil;
    if (fStream <> nil) then fStream.Free;
    fTotalIdxItems := 0;
    fIdxItems := nil;
  end;
end;

destructor TPakFile.Destroy;
begin
  Close;
  inherited Destroy;
end;

end.


{
$Id: VOCFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** Creative VOiCe file
 ***
}

unit VOCFile;

interface

uses Classes, FileLoader, Audio;

type
  TVOCFile = class(TFileLoader)
  protected
    fChannels: TChannels;
    fBitsPerSample: TBPS;
    fSampleRate: word;
    fRawdata: TMemoryStream;
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    constructor Create;
    property Channels: TChannels read fChannels;
    property BitsPerSample: TBPS read fBitsPerSample;
    property SampleRate: word read fSampleRate;
    property RawData: TMemoryStream read fRawdata;
    function SaveAsWAV(const NewName: string): boolean;
    destructor Destroy; override;
  end;

implementation

constructor TVOCFile.Create;
begin
  inherited Create;
  fRawdata := TMemoryStream.Create;
end;

function TVOCFile.LoadFromStream(aStream: TStream): boolean;
var id: string[20];
  BlockType, CompType, sr: byte;
  offset: word;
  version, blockSize, ChunkLength, SampleRate: integer;

begin
  result := false;

  aStream.Position := 0;
  id[0] := #20;
  aStream.Read(id[1], 20); //read ID "Creative Voice File"
  aStream.Read(offset, 2);

  aStream.Read(version, 4);
  fChannels := Mono;
  fBitsPerSample := _8;

  fRawdata.Clear;

  repeat
    aStream.Read(BlockType, 1);
    case BlockType of
      1: begin
          ChunkLength := 0;
          aStream.Read(ChunkLength, 3);
          aStream.Read(sr, 1);
          SampleRate := 1000000 div (256 - sr);
          aStream.Read(CompType, 1); //read compType
          fRawdata.CopyFrom(aStream, ChunkLength - 2);
        end;
      2: begin
          aStream.Read(ChunkLength, 3);
          aStream.Seek(ChunkLength, soFromCurrent);
        end;
      3: aStream.Seek(6, soFromCurrent);
      4: aStream.Seek(5, soFromCurrent);
      5: begin
          aStream.Read(ChunkLength, 3);
          aStream.Seek(ChunkLength, soFromCurrent);
        end;
      6: aStream.Seek(5, soFromCurrent);
      8: aStream.Seek(7, soFromCurrent);
    end;
  until BlockType = 0;

  fSampleRate := SampleRate; //take the last SampleRate value??
  fRawdata.Position := 0;

  result := true;
end;

procedure WriteWAVHeader(OutputFile: TFileStream; DataSize, Channels, SampleRate, BitsPerSample: cardinal);
type
  THugeBuffer = array[0..$7FFFFFFF - 1] of byte;
var
  Buffer: Pointer;
  BytesPerSec: cardinal;
  BlockAlign: cardinal;
begin
  GetMem(Buffer, 44);
  FillChar(Buffer^, 44, 0);

  THugeBuffer(Buffer^)[0] := ord('R');
  THugeBuffer(Buffer^)[1] := ord('I');
  THugeBuffer(Buffer^)[2] := ord('F');
  THugeBuffer(Buffer^)[3] := ord('F');
  THugeBuffer(Buffer^)[4] := lo(DataSize + 36); // Size
  THugeBuffer(Buffer^)[5] := lo((DataSize + 36) shr 8);
  THugeBuffer(Buffer^)[6] := lo((DataSize + 36) shr 16);
  THugeBuffer(Buffer^)[7] := lo((DataSize + 36) shr 24);
  THugeBuffer(Buffer^)[8] := ord('W');
  THugeBuffer(Buffer^)[9] := ord('A');
  THugeBuffer(Buffer^)[10] := ord('V');
  THugeBuffer(Buffer^)[11] := ord('E');
  THugeBuffer(Buffer^)[12] := ord('f');
  THugeBuffer(Buffer^)[13] := ord('m');
  THugeBuffer(Buffer^)[14] := ord('t');
  THugeBuffer(Buffer^)[15] := ord(' ');
  THugeBuffer(Buffer^)[16] := 16; // fmt chunk size
  THugeBuffer(Buffer^)[17] := 0;
  THugeBuffer(Buffer^)[18] := 0;
  THugeBuffer(Buffer^)[19] := 0;
  THugeBuffer(Buffer^)[20] := 1; // wFormatTag
  THugeBuffer(Buffer^)[21] := 0;
  THugeBuffer(Buffer^)[22] := lo(Channels);
  THugeBuffer(Buffer^)[23] := hi(Channels);
  THugeBuffer(Buffer^)[24] := lo(SampleRate);
  THugeBuffer(Buffer^)[25] := lo(SampleRate shr 8);
  THugeBuffer(Buffer^)[26] := lo(SampleRate shr 16);
  THugeBuffer(Buffer^)[27] := lo(SampleRate shr 24);
  BytesPerSec := Channels * SampleRate * (BitsPerSample div 8);
  THugeBuffer(Buffer^)[28] := lo(BytesPerSec);
  THugeBuffer(Buffer^)[29] := lo(BytesPerSec shr 8);
  THugeBuffer(Buffer^)[30] := lo(BytesPerSec shr 16);
  THugeBuffer(Buffer^)[31] := lo(BytesPerSec shr 24);
  BlockAlign := Channels * (BitsPerSample div 8);
  THugeBuffer(Buffer^)[32] := lo(BlockAlign);
  THugeBuffer(Buffer^)[33] := hi(BlockAlign);
  THugeBuffer(Buffer^)[34] := lo(BitsPerSample);
  THugeBuffer(Buffer^)[35] := hi(BitsPerSample);
  THugeBuffer(Buffer^)[36] := ord('d');
  THugeBuffer(Buffer^)[37] := ord('a');
  THugeBuffer(Buffer^)[38] := ord('t');
  THugeBuffer(Buffer^)[39] := ord('a');
  THugeBuffer(Buffer^)[40] := lo(DataSize);
  THugeBuffer(Buffer^)[41] := lo(DataSize shr 8);
  THugeBuffer(Buffer^)[42] := lo(DataSize shr 16);
  THugeBuffer(Buffer^)[43] := lo(DataSize shr 24);

  OutputFile.Position := 0;
  OutputFile.Write(Buffer^, 44);
  FreeMem(Buffer);
end;

function TVOCFile.SaveAsWAV(const NewName: string): boolean;
var
  BitsPerSample: cardinal;
  SampleRate: cardinal;
  Channels: cardinal;
  DataSize: cardinal;
  OutputFile: TFileStream;
  tmpData: TMemoryStream;
  Offset: cardinal;
  BlockType, sr: byte;
  Buffer: Pointer;
  ChunkLength: cardinal;
  EndPos: cardinal;
  version: integer;

begin
  Result := False;
  BitsPerSample := 8;
  SampleRate := 11111;
  Channels := 1;
  DataSize := 0;
//  tmpData := TMemoryStream.Create;
//  PakFile.ExtractFile(numFile, tmpData, false);

  OutputFile := TFileStream.Create(NewName, fmCreate);
  try
    DataSize := fRawdata.Size;
    SampleRate := fSampleRate;
    //fBitPerSample
    //fChannels
    WriteWAVHeader(OutputFile, DataSize, Channels, SampleRate, BitsPerSample);
    OutputFile.CopyFrom(fRawdata, 0);
(*
    tmpData.Seek($14, soFromBeginning);
    tmpData.Read(offset, 2);
    tmpData.Read(version, 4);
    repeat
      tmpData.Read(BlockType, 1);
      case BlockType of
        1: begin
            tmpData.Read(ChunkLength, 3);
            tmpData.Read(sr, 1);
            SampleRate := 1000000 div (256 - sr);
            tmpData.Read(sr, 1); //read compType
            OutputFile.CopyFrom(tmpData, ChunkLength - 2);
            Inc(DataSize, ChunkLength - 2);
          end;
        2: begin
            tmpData.Read(ChunkLength, 3);
            tmpData.Seek(ChunkLength, soFromCurrent);
          end;
        3: tmpData.Seek(6, soFromCurrent);
        4: tmpData.Seek(5, soFromCurrent);
        5: begin
            tmpData.Read(ChunkLength, 3);
            tmpData.Seek(ChunkLength, soFromCurrent);
          end;
        6: tmpData.Seek(5, soFromCurrent);
        8: tmpData.Seek(7, soFromCurrent);
      end;
    until BlockType = 0;
*)
  finally
//    tmpData.Free;
//    OutputFile.Position := 0;
//    WriteWAVHeader(OutputFile, DataSize, Channels, SampleRate, BitsPerSample);
    OutputFile.Free;
  end;
  Result := True;
end;

destructor TVOCFile.Destroy;
begin
  fRawdata.Free;
  inherited Destroy;
end;

end.


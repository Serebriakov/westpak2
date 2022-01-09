{
$Id: SHPFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** SHP class: SHApe file which contains "sprite" or "animations"
 ***
}

unit SHPFile;

interface

uses Classes, Windows, Graphics, uPAKFile, AnimationFile, Global;

type TSHPFile = class(TAnimationFile)
  protected
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    constructor Create;
  end;

implementation

uses codec, SysUtils;

constructor TSHPFile.Create;
begin
  inherited Create;
end;

(*
FileVersion:
0: eob1
1: Dune2
2: LoL1
*)

function TSHPFile.LoadFromStream(aStream: TStream): boolean;
//const ActorPal: array[0..15] of byte = (
//    80, 115, 116, 117, 122, 121, 114, 113, 112, 124, 125, 126, 120, 119, 118, 123);
var Buf1, Buf2, Buf3: array of byte;
  frameOffs: array of integer;
  ActorPal: array of byte;
  size, x, y, i: integer;
  SS, CK, numFrame: integer;
  CompType, compression, celWidth, sizeOrig, sizeDest, FileSize, DestSize, dummy, AdditionalData: word;
  celHeight, NN, ActorPalSize: byte;
  P: PByteArray;
  mStream:TMemoryStream;

begin
  mStream := TMemoryStream.Create;
  fTotalFrames := 0;
  aStream.Read(fTotalFrames, 2);
  if (fTotalFrames = aStream.Size - 2) then
  begin
    //first we must decompress the data
    FileSize := fTotalFrames;
    aStream.read(CompType, 2); //always $0004 ???

    aStream.read(DestSize, 2); //size of uncompressed
    aStream.read(dummy, 2); //dummy value???
    aStream.read(AdditionalData, 2); //size of additional data present
    aStream.Seek(AdditionalData, soFromCurrent); //skip additionaldata (usually a palette)

    if (CompType = $0004) then
    begin
      //decompress stream
      setLength(buf1, FileSize);
      setLength(buf2, DestSize);
      aStream.read(buf1[0], FileSize - 10);
      dummy := Decompress_format80(buf1, buf2, FileSize - 10);
      mStream.Size := DestSize;
      mStream.Write(buf2[0], DestSize);
      buf1 := nil; buf2 := nil;
      mStream.Seek(0, soFromBeginning);
      mStream.Read(fTotalFrames, 2);
    end;
  end else
  begin
    mStream.CopyFrom(aStream, 0);
    mStream.Seek(2, soFromBeginning);
  end; //if compressed stream

//  setLength(fFrames, fTotalFrames);
  setLength(frameOffs, fTotalFrames);
  for i := 0 to fTotalFrames - 1 do
  begin
    if (fFileVersion = DUNE2_GAME) then
    begin
      //dune 2 SHP
      frameOffs[i] := 0;
      mStream.Read(frameOffs[i], 2);
      mStream.Read(x, 2);
      //some Dune2 shp doesn't have a terminator and the offset point is 2byte too long
      if frameOffs[i] = 6 then frameOffs[i] := 4;
    end else
    begin
      mStream.Read(frameOffs[i], 4);
    end;
  end; //for i

  mStream.Read(y, 4); //read last offs (EOF)
  for numFrame := 0 to fTotalFrames - 1 do
  begin
    mStream.Seek(frameOffs[numFrame], soFromBeginning); //goto frame 0
    mStream.Read(x, 2); //last image end??
    mStream.Read(compression, 2);
    //aStream.Read(TT, 1); //type??
    //aStream.Read(NN, 1); //null
    mStream.Read(celHeight, 1);
    mStream.Read(celWidth, 2);
    mStream.Read(celHeight, 1); //again???
    mStream.Read(sizeOrig, 2); //size??
    mStream.Read(sizeDest, 2); //CRC???
    size := sizeOrig;
    if (compression > 5) then
    begin
      raise ERangeError.CreateFmt('Errore! Tipo: %d non gestito!', [compression]);
      exit;
    end;
    case compression of
      0: dec(size, 10);
      2: dec(size, 10);
      1, 3: begin
          ActorPalSize := 16;
          setLength(ActorPal, ActorPalSize);
          mStream.Read(ActorPal[0], ActorPalSize);
          //dec(size, 11 + x); //imgsize = size - headersize(=10)
          dec(size, 10 + ActorPalSize);
        end;
      5: begin
          mStream.Read(ActorPalSize, 1);
          setLength(ActorPal, ActorPalSize);
          mStream.Read(ActorPal[0], ActorPalSize);
          dec(size, 11 + ActorPalSize); //imgsize = size - headersize(=10)
        end;
    end; //case

    setLength(buf1, size);
    mStream.Read(buf1[0], size);

    //if sizeDest<(celWidth*celHeight) then ShowMessage('Attenzione sizeDest minore della dimensione minima!');

    setLength(buf2, sizeDest);
    //setLength(buf2, celWidth * celHeight); //max size of buf2

    if compression = 3 then compression := 2; //??do not decompress type 3 but only correct_lf ???

    try
      if (compression <> 2) then x := Decompress_format80(buf1, buf2, size);
    except
      raise ERangeError.CreateFmt('Error decompressing frame #%d', [numFrame]);
    end;

    setlength(buf2, x); //ridimensiona l'array alla corretta lunghezza
    setlength(buf3, celWidth * celHeight);
    if (compression = 2) then begin
      correct_lf(buf1, buf3);
    end else if (compression <> 0) then
    begin
      correct_lf(buf2, buf3);

      if (fFileVersion <> LOL1_GAME) then //not a LoL file
      begin
        //LoL bug?? some SHP doesn't support this kind of 16pal maybe a 255???, so only skip 16 byte??
        for x := 0 to (celWidth * celHeight) - 1 do
        try
          buf3[x] := ActorPal[buf3[x]];
        except
          raise ERangeError.CreateFmt('Errore assign ActorPal: buf3[x]=%d', [buf3[x]]);
        end; //for x
      end; //if
    end else
    begin
      correct_lf(buf2, buf3);
      //buf3 := buf2;
    end;

    fFrames[numFrame] := TBitmap.Create;
    with fFrames[numFrame] do
    begin
      Width := celWidth;
      Height := celHeight;
      PixelFormat := pf8bit;
      Palette := CreatePalette(PLogPalette(@fInternalPal)^);
      Transparent := (fFileVersion <> DUNE2_GAME); //dune2 = no transparency!
      TransparentMode := tmAuto;
    end; // with

    //skip 10 byte in buf1 ???
    for y := 0 to celHeight - 1 do
    begin
      try
        p := fFrames[numFrame].ScanLine[y];
        move(buf3[y * celWidth], p^, celWidth);
      except
        //
        NN := 0;
      end;
    end; //for y

  end; //for numFrame - readed all frame

  mStream.Free;
  //maybe incorrect because exist multisize SHP ????
  fCelWidth := fFrames[0].Width;
  fCelHeight := fFrames[0].Height;
  fPosX := 0;
  fPosY := 0;
  buf1 := nil; buf2 := nil; buf3 := nil; frameOffs := nil;
end;

end.


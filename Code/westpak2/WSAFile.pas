{
$Id: WSAFile.pas,v 1.2 2006/02/13 14:09:46 dk2it Exp $
 ***
 ** WSA class: animations file
 ***
}

unit WSAFile;

interface

uses Classes, Windows, Graphics, uPAKFile, AnimationFile, Global;

type TWSAFile = class(TAnimationFile)
  protected
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    constructor Create;
  end;

implementation

uses codec, SysUtils;

constructor TWSAFile.Create;
begin
  inherited Create;
end;

function TWSAFile.LoadFromStream(aStream: TStream): boolean;
var Buf1, Buf2, Buf3: array of byte;
  size, x, y, Delta: integer;
  celWidth, celHeight, posx, posy: word;
  //img: TDIBUltra;
  frameOffs: array of integer;
  FrameTot, SS, CK, numFrame: integer;
  TT, NN, oldPosX, oldPosY: byte;
  P: PByteArray;

  mFile: TMemoryStream;
  numFile: integer;

//Play WSA - Testing!!!!!!!
begin
  fTotalFrames := 0;
  aStream.Read(fTotalFrames, 2);

  //Try to guess WSA version
  //read posx and posy
  aStream.Read(posx, 2);
  aStream.Read(posy, 2);

  //read width and height of cell
  aStream.Read(celWidth, 2);
  aStream.Read(celHeight, 2);

  if (celWidth > 320) then
  begin
    //old WSA version (DUNE2 - KYRANDIA1)
    //no posx and posy
    //in fact in this case celWidth value is delta -- check if delta is always > 320
    aStream.Seek(-4, soFromCurrent); //go back 4 byte

    delta := 0;
    fCelWidth := posx;
    fCelHeight := posy;
    aStream.Read(oldPosX, 1);
    aStream.Read(oldPosY, 1);
    fPosX := 320 - fCelWidth - oldPosX; // (?)
    fPosY := 200 - fCelHeight - oldPosY; // (?)

    //aStream.Read(delta, 2);
    aStream.Read(NN, 1);
    if NN = 0 then
      while (NN = 0) do
        aStream.Read(NN, 1);

    aStream.Seek(-1, soFromCurrent);
  end else
  begin
    fPosX := posx;
    fPosY := posy;
    fCelWidth := celWidth;
    fCelHeight := celHeight;
    aStream.Read(delta, 4); //frame/sec = delta/1024

    //fix for some LoL WSA. Seems first frame is at offset 0??? Maybe do not exists.
    aStream.Read(NN, 1);
    if NN = 0 then
    begin
      while (NN = 0) do
        aStream.Read(NN, 1);
      aStream.Seek(-1, soFromCurrent);
    end else aStream.Seek(-1, soFromCurrent);
  end;

  setLength(frameOffs, fTotalFrames + 2);
  for y := 0 to fTotalFrames + 1 do
  begin
    aStream.Read(frameOffs[y], 4);
    if (frameOffs[y] = 0) then break;
  end;
  fTotalFrames := y - 1; //correct for other games??? see below +1
  //maybe HFinalC continue with precedent??? A+B+C is the correct stream???

  (*
  if frameOffs[fTotalFrames + 1] <> 0 then //last frame points to the end of the file
  begin
     //last-1 used for loop animation
  end;
  *)

  numFrame := 0;
  //se esiste il frame di loop il ciclo finisce a FrameTot invece che FrameTot-1!
  for numFrame := 0 to fTotalFrames - 1 do
  begin
    //dune2 the first frame sometime is equals to 0 ???
    aStream.Seek(frameOffs[numFrame], soFromBeginning); //goto frame 0
    size := frameOffs[numFrame + 1] - frameOffs[numFrame];
    setLength(buf1, size);
    setLength(buf3, 65535);
    aStream.Read(buf1[0], size);
    setLength(buf2, fCelWidth * fCelHeight);

  //black screen first image //must be only for DUNE2 ???
  //fillchar(buf2[0], celWidth * celHeight, 0);
  //  for x := 0 to (celWidth * celHeight) - 1 do
  //    buf2[x] := 0;
    try
      x := decompress_format80(buf1, buf3, size);
      x := decompress_format40(buf3, buf2, x);
      //Memo1.Lines.Add('decompresso frame ' + inttostr(numFrame));
    except
      raise Exception.Create('Error while decompressing frame #' + IntToStr(numFrame));
      //ShowMessageFmt('Error while decompressing frame #%d', [numFrame]);
    end;
    setlength(buf2, x);

    fFrames[numFrame] := TBitmap.Create;
    with fFrames[numFrame] do
    begin
      Width := fCelWidth;
      Height := fCelHeight;
      PixelFormat := pf8bit;
      Palette := CreatePalette(PLogPalette(@fInternalPal)^);
      Transparent := (fFileVersion <> DUNE2_GAME); //dune2 = no transparency!
      TransparentMode := tmAuto;
    end; // with

    for y := 0 to fCelHeight - 1 do
    try
      p := fFrames[numFrame].ScanLine[y];
      move(buf2[y * fCelWidth], p^, fCelWidth);
      //SHPFrame[numFrame].PixelsIndex[x, y] := buf2[((y * celWidth) + x)];
    except
      NN := 0;
    end;
(*    for y := 0 to celHeight - 1 do
      for x := 0 to celWidth - 1 do
      try
        SHPFrame[numFrame].PixelsIndex[x, y] := buf2[((y * celWidth) + x)];
      except
        TT := 0;
      end;*)
//    SHPFrame[numFrame].MakeTransparent(SHPFrame[numFrame].Pixels[0,0]);
  end; //for numFrame

//  image1.Canvas.Brush.Color := clBtnFace;
//  image1.Canvas.FillRect(image1.ClientRect);
//  posRect := Rect(posx, posy, posx + celWidth, posy + celHeight);
  //SHPFrame[0].DrawOn(posRect, Image1.Canvas, 0, 0);
//  image1.Picture.Bitmap.Assign(bmpBackground);
//  Image1.Canvas.Draw(posRect.Left, posRect.Top, SHPFrame[0]);
//  image1.Refresh;
  buf1 := nil; buf2 := nil; buf3 := nil; frameOffs := nil;
end;

end.


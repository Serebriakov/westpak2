{
$Id: CPSFile.pas,v 1.2 2005/11/27 08:42:32 dk2it Exp $
 ***
 ** CPS: ComPreSed image file
 ***
}

unit CPSFile;

interface

uses Classes, Windows, Graphics, GfxFile;

type TCPSFile = class(TGfxFile)
  protected
    fCompressedSize: word;
    fCompressionType: byte;
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    property CompressedSize: word read fCompressedSize;
    property CompressionType: byte read fCompressionType;
    constructor Create;
    //destructor Destroy; override;
  end;

implementation

{ Use HQ2X directive to abilitate the experimentale HQ2X scaling }
{.$DEFINE HQ2X}

uses
{$IFDEF HQ2X}hq2x, {$ENDIF}
  Dialogs,
  SysUtils,
  codec;

type
  TFileHeader = record
    FileSize, //filesize (sometime is - 2 ?? why??)
      CompressionType, //$0000 = uncompressed / $0003 = LBM similar / $0004 = Format80 / other unknown
      UncompressedSize, //for CPS always $FA00 = 64000 = 320x200
      Unknown1, //always $0000 ??
      PaletteSize: word; //0 = no internal palette (usually $300 for standard 256colors pal)
  end;

constructor TCPSFile.Create;
begin
  inherited Create;
  fCompressedSize := 0;
  fCompressionType := 0;
end;

function TCPSFile.LoadFromStream(aStream: TStream): boolean;
var Buf1, Buf2: array of byte;
  size, i, y, col: integer;
  CPSHeader: TFileHeader;
  FileSize, UncompressedSize, DecompSize: word;
  r, g, b: byte;
  P: PByteArray;
  AmigaVersion: Boolean;
{$IFDEF HQ2X}
  r1, g1, b1: integer;
  Buf16, BufFinal: array of word;
  PW: PWordArray;
{$ENDIF}
  bit1, bit2, bit3, bit4, bit5,
    p1, p2, p3, p4, p5, j: byte;
  x: Integer;
  SourceBitPos, TargetBitPos, lineNum: integer;
  bytePos, targetPos: Integer;
  f1:file;

  function GetBit(const value: byte; bit: byte): byte;
  var res: Integer;
  begin
    res := value and (1 shl bit);
    result := byte(boolean(res <> 0));
    if (result>1) then ShowMessage('errore!');
  end;

begin
  //size := aStream.Size;
  aStream.Read(CPSHeader, SizeOf(CPSHeader));
  fCompressionType := CPSHeader.CompressionType;
  UncompressedSize := CPSHeader.UncompressedSize;
  AmigaVersion := (UncompressedSize = 40000) or (UncompressedSize=40064);
  fHasPalette := (CPSHeader.PaletteSize <> 0);

  if (UncompressedSize <> 64000) and (aStream.Size = 64768) then
  begin
    //German EoB CPS uncompressed version but without header
    fHasPalette := True;
    fCompressionType := 0;
    UncompressedSize := 64000;
    aStream.Seek(-SizeOf(CPSHeader), soFromCurrent);
  end;

  if fHasPalette then
  begin
    //read and set palette
    fInternalPal.palVersion := $300;
    fInternalPal.palNumEntries := 256;
    for i := 0 to 255 do
    begin
      aStream.Read(r, 1);
      aStream.Read(g, 1);
      aStream.Read(b, 1);

      r := byte(r shl 2);
      g := byte(g shl 2);
      b := byte(b shl 2);

      fInternalPal.palPalEntry[i].peRed := r;
      fInternalPal.palPalEntry[i].peGreen := g;
      fInternalPal.palPalEntry[i].peBlue := b;
    end;
  end;

  fCompressedSize := aStream.Size - aStream.Position;
  setLength(Buf1, fCompressedSize);
  setLength(Buf2, UncompressedSize);
  aStream.Read(Buf1[0], fCompressedSize);

  if (fCompressionType = 4) then DecompSize := Decompress_format80(Buf1, Buf2, fCompressedSize)
  else if (fCompressionType = 3) then DecompSize := Decompress_LBM(Buf1, Buf2, fCompressedSize)
  else if (fCompressionType = 0) then begin
    DecompSize := UncompressedSize;
    move(Buf1[0], Buf2[0], DecompSize);
  end else raise Exception.Create('Found compression type ' + IntToStr(fCompressionType) + '! Further investigation required :)');
  if (DecompSize<40000) then ShowMessage('less than 40000');
  if AmigaVersion and (DecompSize > 40000) then
  begin
    //AMIGA Palette
    fHasPalette := true;
    //read and set palette
    x := 40000;
    for i := 0 to 31 do
    begin
      col := buf2[x]*256+buf2[x+1];
      inc(x,2);

      r := byte( ((col and $0F00) shr 8) shl 4);
      g := byte( ((col and $00F0) shr 4) shl 4);
      b := byte( (col and $000F) shl 4);

      fInternalPal.palPalEntry[i].peRed := r;
      fInternalPal.palPalEntry[i].peGreen := g;
      fInternalPal.palPalEntry[i].peBlue := b;
    end;
    for i := 32 to 255 do
    begin
      fInternalPal.palPalEntry[i].peRed := $FF;
      fInternalPal.palPalEntry[i].peGreen := $FF;
      fInternalPal.palPalEntry[i].peBlue := $FF;
    end;
  end;

{
  //old code NO SCANLINE
  for y := 0 to 199 do
    for x := 0 to 319 do
    begin
      dibImage1.Pixel[x, y] := buf2[i];
      inc(i);
    end;
}

{$IFNDEF HQ2X}

  with fBitmap do
  begin
    Width := 320;
    Height := 200;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@fInternalPal)^);
  end; // with

  if (not AmigaVersion) then
  begin
    //PC Bitmap
    for y := 0 to 199 do
    begin
      p := fBitmap.ScanLine[y];
      move(Buf2[y * 320], p^, 320);
  {
     //old unoptimized code
     for x := 0 to 319 do
       p[x] := buf2[((y * 320) + x)];
  }
    end;
  end else
  begin
    //AMIGA Bitmap
    bytePos := 0;
    targetPos := 0;
    Buf1 := nil;
    setLength(Buf1, 64000);
    for y := 0 to 8000 - 1 do
    begin
      SourceBitPos := 1;
      for j := 0 to 7 do
//      while (SourceBitPos < 256) do
      begin
        b := 0;
        TargetBitPos := 1;
        for lineNum := 0 to 4 do
        begin
          //bit1 := byte(boolean((buf2[y + lineNum * 8000] and SourceBitPos)<>0));
          bit1 := byte(boolean((buf2[y + lineNum * 8000] and (1 shl j))<>0));
          b := b or (bit1 * TargetBitPos);
          TargetBitPos := TargetBitPos * 2;
        end;
        buf1[targetPos + (8 - bytePos)] := b;
        inc(bytePos);
        bytePos := bytePos mod 8;
        if (bytePos = 0) then inc(targetPos, 8);
        //SourceBitPos := SourceBitPos * 2;
      end; //while
    end; //for y
    for y := 0 to 199 do
    begin
      p := fBitmap.ScanLine[y];
      move(Buf1[y * 320], p^, 320);
    end;
  end; //else

{$ELSE}
(***********************************************
 **************** HQ2X scaling code ************
 ***********************************************)
  with fBitmap do
  begin
    Width := 320 * 2;
    Height := 200 * 2;
    PixelFormat := pf16bit;
  end; // with

    //convert 8bit image to 16bit
  SetLength(Buf16, DecompSize); //DecompSize should be always 64000 for CPS file
  for y := 0 to DecompSize - 1 do
  begin
    r1 := fInternalPal.palPalEntry[buf2[y]].peRed shr 3;
    g1 := fInternalPal.palPalEntry[buf2[y]].peGreen shr 2;
    b1 := fInternalPal.palPalEntry[buf2[y]].peBlue shr 3;
    buf16[y] := (r1 shl 11) + (g1 shl 5) + b1;
  end;
  SetLength(BufFinal, fBitmap.Width * fBitmap.Height);
  _hq2x_16(Buf16, BufFinal, 320, 200, fBitmap.Width * 2);
  buf16 := nil;

  for y := 0 to (fBitmap.Height - 1) do
  begin
    pw := fBitmap.ScanLine[y];
    move(BufFinal[y * fBitmap.Width], pw^, fBitmap.Width * 2);
  end;
  BufFinal := nil;

{$ENDIF}
  //image1.Picture.Bitmap.Assign(bmpBackground);
  buf1 := nil; buf2 := nil;
  result := true;
end;

(*
//maybe useless, automatically use the parent TGfxFile.Destroy to free the bitmap
destructor TCPSFile.Destroy;
begin
  inherited Destroy;
end;
*)

end.


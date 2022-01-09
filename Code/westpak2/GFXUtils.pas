{
$Id: GFXUtils.pas,v 1.2 2005/11/27 08:42:32 dk2it Exp $
 ***
 ** Various graphics routines
 ***
}

unit GFXUtils;

interface

uses Classes, Windows, ExtCtrls, SysUtils, Graphics;

procedure LoadPaletteFromStream(const Stream: TStream; var aPal: TMaxLogPalette);
procedure LoadPaletteFromFile(const FileName: string; var aPal: TMaxLogPalette);
procedure RenderPal(const aPal: TMaxLogPalette; const Dest: TImage);

implementation


{ ** }

procedure LoadPaletteFromStream(const Stream: TStream; var aPal: TMaxLogPalette);
var r, g, b, i: byte;
w:word;
begin
  Stream.Position := 0;
  if (Stream.Size = 768) then
  begin
    with aPal do
    begin
      palVersion := $300;
      palNumEntries := 256;
      for i := 0 to 255 do
      begin
        Stream.Read(r, 1);
        Stream.Read(g, 1);
        Stream.Read(b, 1);

        palPalEntry[i].peRed := byte(r shl 2);
        palPalEntry[i].peGreen := byte(g shl 2);
        palPalEntry[i].peBlue := byte(b shl 2);
      end;
    end; //with
  end else
  begin
    //AMIGA palette
    with aPal do
    begin
      palVersion := $300;
      palNumEntries := 256;
      for i := 0 to 31 do
      begin
        Stream.Read(r, 1);
        Stream.Read(g, 1);
        w := r*256+g;

        r := byte(((w and $0F00) shr 8) shl 4);
        g := byte(((w and $00F0) shr 4) shl 4);
        b := byte((w and $000F) shl 4);

        palPalEntry[i].peRed := r;
        palPalEntry[i].peGreen := g;
        palPalEntry[i].peBlue := b;
      end;
      for i := 32 to 255 do
      begin
        palPalEntry[i].peRed := $FF;
        palPalEntry[i].peGreen := $FF;
        palPalEntry[i].peBlue := $FF;
      end;
    end; // with
  end; //else
end;

{ ** }

procedure LoadPaletteFromFile(const FileName: string; var aPal: TMaxLogPalette);
var f: TFileStream;
begin
  f := TFileStream.Create(FileName, fmOpenRead);
  LoadPaletteFromStream(f, aPal);
  f.Free;
end;

{ ** }

procedure RenderPal(const aPal: TMaxLogPalette; const Dest: TImage);
var
  sl: PByteArray;
  x, y, w, h: integer;
  bmpPalette: TBitmap;

begin
  w := 16;
  h := 256 div w;
  bmpPalette := TBitmap.Create;
  with bmpPalette do
  begin
    Width := w;
    Height := h;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@aPal)^);
  end; // with

  for y := 0 to h - 1 do
  begin
    sl := bmpPalette.ScanLine[y];
    for x := 0 to w - 1 do
      sl[x] := (y * w) + x;
  end;
  Dest.Canvas.StretchDraw(Dest.ClientRect, bmpPalette);
  bmpPalette.Free;
  Dest.Refresh;
end;

end.


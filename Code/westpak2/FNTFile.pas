{
$Id: FNTFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** FoNT file
 ***
}

unit FNTFile;

interface

uses Classes, Windows, Graphics, GfxFile, uPAKFile;

type TFNTFile = class(TGfxFile)
  protected
    fTotalChars: byte;
    fCharWidth: byte;
    fCharHeight: byte;
    function LoadFromStream(aStream: TStream): boolean; override;
  public
    property TotalChars: byte read fTotalChars;
    property CharWidth: byte read fCharWidth; //font is proportional, this is the max char width
    property CharHeight: byte read fCharHeight;
    constructor Create;
  end;

implementation

uses codec;

constructor TFNTFile.Create;
begin
  inherited Create;
  fTotalChars := 0;
  fCharWidth := 0;
  fCharHeight := 0;
end;

function TFNTFile.LoadFromStream(aStream: TStream): boolean;
var
  i, x, y, px, py, offy: Integer;
  c, c1, c2: byte;
  FntHeader: record
    fsize: word; // Size of the file
    unknown1: word; // Unknown entry (always 0x0500 or 0x0002)
    unknown2: word; // Unknown entry (always 0x000e)
    unknown3: word; // Unknown entry (always 0x0014)
    wpos: word; // Offset of char. widths array  (abs. from beg. of file)
    cdata: word; // Offset of char. graphics data (abs. from beg. of file)
    hpos: word; // Offset of char. heights array (abs. from beg. of file)
    unknown4: word; // Unknown entry (always 0x1012 or 0x1011) maybe a file version??
    zero: byte; //zero value
    nchars: byte; // Number of characters in font minus 1
    maxh: byte; // Font height
    maxw: byte; // Max. character width
  end;
  GfxDataOffset, hchar: array of word;
  wchar: array of byte;

begin
  aStream.Read(FntHeader, SizeOf(FntHeader));
  with FntHeader do
  begin
    if (unknown2 <> $000E) and (unknown3 <> $0014) then
    begin
      //not a valid font file
      result := false;
      exit;
    end;

    fTotalChars := nchars;
    fCharWidth := maxw;
    fCharHeight := maxh;

    SetLength(GfxDataOffset, nchars + 1);
    SetLength(wchar, nchars + 1);
    SetLength(hchar, nchars + 1);
    aStream.Read(GfxDataOffset[0], (nchars + 1) * 2); //offset gfx data array of word (2byte)
    aStream.Read(wchar[0], (nchars + 1) * 1); //char width table
    //skip gfx data for now
    aStream.Seek(hpos, soFromBeginning);
    aStream.Read(hchar[0], (nchars + 1) * 2);

    with fBitmap do
    begin
      Width := maxw;
      Height := nchars * maxh;
      PixelFormat := pf8bit;
      Palette := CreatePalette(PLogPalette(@fInternalPal)^);

      Canvas.Brush.Color := clBtnFace;
      Canvas.FillRect(Canvas.ClipRect);
      Transparent := True;
      TransparentMode := tmFixed;
      TransparentColor := Canvas.Pixels[0, 0];

      px := 0;
      py := 0;
      for i := 0 to nchars do
      begin
        aStream.Seek(GfxDataOffset[i], soFromBeginning);
        offy := hchar[i] and $FF; //offset y for the char
        inc(py, offy);
        for y := 0 to (hchar[i] shr 8) - 1 do // (hchar[i]/256)
        begin
          px := 0;
          for x := 0 to (wchar[i] div 2) - 1 do //4bit packed
          begin
            aStream.Read(c, 1);
            c1 := c and $0F;
            c2 := c shr 4;
            if c1 = 1 then c1 := $FF;
            if c2 = 1 then c2 := $FF;
            if c1 = 3 then c1 := $1;
            if c2 = 3 then c2 := $1;
            if c1 <> 0 then Canvas.Pixels[px, py] := c1; //white
            inc(px);
            if c2 <> 0 then Canvas.Pixels[px, py] := c2; //white
            inc(px);
          end;
          if (wchar[i] mod 2 <> 0) then
          begin
            aStream.Read(c, 1);
            c1 := c and $0F;
            if c1 = 1 then c1 := $FF;
            if c1 = 3 then c1 := $1;
            if c1 <> 0 then Canvas.Pixels[px, py] := c1; //white
          end;
          inc(py);
        end;
        inc(py, offy);
      end; //for i
    end; // with fBitmap
  end; //with FntHeader

  hchar := nil; wchar := nil;
  GfxDataOffset := nil;

  result := true;
end;

end.


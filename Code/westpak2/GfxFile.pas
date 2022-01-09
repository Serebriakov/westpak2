{
$Id: GfxFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** Base class for graphic file
 ***
}

unit GfxFile;

interface

uses Windows, Graphics, FileLoader;

type
  TGfxFile = class(TFileLoader)
  protected
    fBitmap: TBitmap;
    fHasPalette: boolean;
    fInternalPal: TMaxLogPalette;
  public
    property HasPalette: boolean read fHasPalette;
    property GetBitmap: TBitmap read fBitmap;
    property GetPalette: TMaxLogPalette read fInternalPal;
    constructor Create;
    procedure SetPalette(const aPal:TMaxLogPalette);
    destructor Destroy; override;
  end;

implementation

constructor TGfxFile.Create;
begin
  inherited Create;
  fBitmap := TBitmap.Create;
  fHasPalette := false;
end;

procedure TGfxFile.SetPalette(const aPal:TMaxLogPalette);
begin
  fInternalPal := aPal;
end;

destructor TGfxFile.Destroy;
begin
  fBitmap.Free;
  inherited Destroy;
end;

end.

 
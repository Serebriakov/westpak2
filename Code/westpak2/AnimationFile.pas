{
$Id: AnimationFile.pas,v 1.1 2005/07/11 21:10:44 dk2it Exp $
 ***
 ** Base class for SHP and WSA File
 ***
}

unit AnimationFile;

interface

uses Classes, Windows, Graphics, uPAKFile, FileLoader;

type TAnimationFile = class(TFileLoader)
  protected
    //Dynamic array bug!!!! When destroyed cause exception!!!!
    //for now use static - max 400 frames
    fFrames: array[0..399] of TBitmap;
    fBackground:TBitmap;
    fWorkBmp:TBitmap;
    fCurFrame: integer;
    fHasPalette: boolean;
    fInternalPal: TMaxLogPalette;
    fTotalFrames: integer;
    fCelWidth: word;
    fCelHeight: word;
    fPosX: word;
    fPosY: word;
    fUseBackground: Boolean;
  private
    function GetFrame(Index: integer): TBitmap;
  public
    property CelWidth:  word read fCelWidth;
    property CelHeight:  word read fCelHeight;
    property PosX:  word read fPosX;
    property PosY:  word read fPosY;
    property UseBackground: Boolean read fUseBackground write fUseBackground;
    property Frame[Index: integer]: TBitmap read GetFrame;
    property HasPalette: boolean read fHasPalette;
    property GetPalette: TMaxLogPalette read fInternalPal;
    procedure SetPalette(const aPal: TMaxLogPalette);
    property TotalFrames: integer read fTotalFrames;
    constructor Create;
    function GetFirstFrame: TBitmap;
    function GetNextFrame: TBitmap;
    function GetPrevFrame: TBitmap;
    procedure SetBackground(const BmpBack:TBitmap);
    procedure SetXYPos(const x,y:word);
    destructor Destroy; override;
  end;

implementation
uses SysUtils;

constructor TAnimationFile.Create;
begin
  inherited Create;
  fTotalFrames := 0; //no frames
  fCurFrame := -1;
  fCelWidth := 0;
  fCelHeight := 0;
  fUseBackground := false;
  fBackground:=TBitmap.Create;
  fWorkBmp:=TBitmap.Create;
end;

procedure TAnimationFile.SetPalette(const aPal: TMaxLogPalette);
begin
  fInternalPal := aPal;
end;

function TAnimationFile.GetFrame(Index: integer): TBitmap;
begin
  if (Index < 0) or (Index > fTotalFrames) then raise Exception.Create('Frame #' + IntToStr(Index) + ' out of bound!');
  if fUseBackground then
  begin
    fWorkBmp.Assign(fBackground);
    fWorkBmp.Canvas.Draw(fPosX, fPosY, fFrames[Index]);
  end else
  begin
    fWorkBmp.Width := fFrames[Index].Width;
    fWorkBmp.Height := fFrames[Index].Height;
    fWorkBmp.Canvas.Brush.Color := clBlack;
    fWorkBmp.Canvas.FillRect(fWorkBmp.Canvas.ClipRect);
    fWorkBmp.Canvas.Draw(0,0,fFrames[Index]);
  end;
  result := fWorkBmp; //fFrames[Index];
end;

function TAnimationFile.GetFirstFrame: TBitmap;
begin
  fCurFrame := 0;
  //result := fFrames[fCurFrame];
  result := GetFrame(fCurFrame);
end;

function TAnimationFile.GetNextFrame: TBitmap;
begin
  if (fCurFrame < fTotalFrames - 1) then inc(fCurFrame);
  //result := fFrames[fCurFrame];
  result := GetFrame(fCurFrame);
end;

function TAnimationFile.GetPrevFrame: TBitmap;
begin
  if (fCurFrame > 0) then dec(fCurFrame);
  //result := fFrames[fCurFrame];
  result := GetFrame(fCurFrame);
end;

procedure TAnimationFile.SetBackground(const BmpBack:TBitmap);
begin
  fBackground.Assign(BmpBack);
  fUseBackground := true;
end;

procedure TAnimationFile.SetXYPos(const x,y:word);
begin
  fPosX := x;
  fPosY := y;
end;

destructor TAnimationFile.Destroy;
var i: Integer;
begin
  //free mem
  fWorkBmp.Free;
  fBackground.Free;
  for i := 0 to fTotalFrames - 1 do
  begin
    //fFrames[i] := nil;
    fFrames[i].Free;
  end;
//  fFrames := nil;
  inherited Destroy;
end;

end.


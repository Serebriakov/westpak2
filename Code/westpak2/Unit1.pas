{
WestPak2
$Id: Unit1.pas,v 1.3 2006/02/13 14:09:46 dk2it Exp $
}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, StdCtrls, ImgList, ToolWin, ActnList,
  Grids, MPHexEditor, Buttons, Audio;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    lvFiles: TListView;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    SelectGameDir: TAction;
    ExtractFromPAK: TAction;
    imglistType: TImageList;
    ToolButton3: TToolButton;
    PageControl: TPageControl;
    tabGraphics: TTabSheet;
    tabAudio: TTabSheet;
    Fix1: TMenuItem;
    Dune21: TMenuItem;
    LandofLore1: TMenuItem;
    None1: TMenuItem;
    Audio1: TAudio;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    AddFile: TAction;
    RemoveFile: TAction;
    PopupMenu1: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    btnDrawWall: TButton;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button8: TButton;
    Button5: TButton;
    Button4: TButton;
    udStartColor: TUpDown;
    Edit1: TEdit;
    Button7: TButton;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    PlayCtrlPanel: TPanel;
    btnPlay: TSpeedButton;
    btnNext: TSpeedButton;
    btnPrev: TSpeedButton;
    frameBar: TScrollBar;
    edFrameNum: TEdit;
    udFrameNum: TUpDown;
    GroupBox2: TGroupBox;
    imgPAL: TImage;
    cbSelPalette: TComboBox;
    btnSavePal: TButton;
    btnImportPal: TButton;
    btnRotPal: TButton;
    ProgressBar: TProgressBar;
    Extract2: TMenuItem;
    tabScript: TTabSheet;
    tabPAKPreview: TTabSheet;
    btnExpWAV: TButton;
    lbTextTable: TListBox;
    Label6: TLabel;
    GroupBox4: TGroupBox;
    lbGFXInfo: TLabel;
    btnExpGIF: TButton;
    btnExpGraphics: TButton;
    ReplaceFile: TAction;
    ExtractDecompFromPAK: TAction;
    ReplaceFile1: TMenuItem;
    Panel1: TPanel;
    btnPlay1: TSpeedButton;
    tabTextView: TTabSheet;
    GroupBox5: TGroupBox;
    lbPAKInfo: TLabel;
    btnOpenPAK: TButton;
    lbPAKPreview: TListBox;
    Help1: TMenuItem;
    About1: TMenuItem;
    tabHex: TTabSheet;
    GroupBox3: TGroupBox;
    lbGenericInfo: TLabel;
    btnDecompressHex: TButton;
    btnSave: TButton;
    btnSaveDecomp: TButton;
    MPHexEditor: TMPHexEditor;
    MemoText: TMemo;
    imglistType2: TImageList;
    PreserveBackCheckBox: TCheckBox;
    Button3: TButton;
    TabSheet1: TTabSheet;
    GroupBox6: TGroupBox;
    LabelInfoTest: TLabel;
    btnDecompress80: TButton;
    btnDecompress40: TButton;
    btnDecompressLBM: TButton;
    btnDecodeLF: TButton;
    TestHexEditor: TMPHexEditor;
    TestImage: TImage;
    btnShowPic: TButton;
    btnReset: TButton;
    btnSaveHex: TButton;
    SpeedButton1: TSpeedButton;
    btnSelectHex: TButton;
    edSelStart: TEdit;
    edSelEnd: TEdit;
    Label7: TLabel;
    procedure Exit1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CPSfromfile1Click(Sender: TObject);
    procedure btnExpGraphicsClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure frameBarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectGameDirExecute(Sender: TObject);
    procedure ExtractFromPAKExecute(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure btnDecompressHexClick(Sender: TObject);
    procedure None1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExpWAVClick(Sender: TObject);
    procedure Audio1Played(Sender: TObject);
    procedure lvFilesClick(Sender: TObject);
    procedure cbSelPaletteChange(Sender: TObject);
    procedure lvFilesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnPlayClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure btnSavePalClick(Sender: TObject);
    procedure btnImportPalClick(Sender: TObject);
    procedure btnRotPalClick(Sender: TObject);
    procedure AddFileExecute(Sender: TObject);
    procedure RemoveFileExecute(Sender: TObject);
    procedure btnDrawWallClick(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure ExtractDecompFromPAKExecute(Sender: TObject);
    procedure ReplaceFileExecute(Sender: TObject);
    procedure btnOpenPAKClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure lvFilesDblClick(Sender: TObject);
    procedure btnExpGIFClick(Sender: TObject);
    procedure lvFilesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDecompress80Click(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnShowPicClick(Sender: TObject);
    procedure btnSaveHexClick(Sender: TObject);
    procedure btnSelectHexClick(Sender: TObject);
  private
   { Private declarations }
    procedure FillListView(const pathfile: string; const isPAKFile: boolean);
    procedure ScrollListView(const idx: integer);
    procedure ExtractDialog(const ResourceNum: integer; const decompress: boolean);
    procedure LoadPaletteFromResource(const ResourceNum: integer; var aPal: TMaxLogPalette);

    procedure ViewAsHex(numFile: integer);
    procedure DisplayPAL(const numFile: integer);
    procedure DisplayCPS(const numFile: integer);
    procedure DisplayFNT(const numFile: integer);
    procedure DisplayText(const numFile: integer);
    procedure DisplayTextTable(const numFile: integer);
    procedure DisplayPAK(const numfile: integer);
    procedure DisplayWSA_SHP(const numFile: integer; SHPMode: Boolean);
    procedure DisplayVCN(const numFile: integer);
    procedure DisposeAllPalette;

    procedure OpenPAKFile(const filename: string);
    procedure ClosePAKFile;

    procedure Decode_Dune2_ICON(const numFile: integer);
    procedure ViewItem(numFile: integer);

    procedure ApplyPal(const aPal: TMaxLogPalette; const Dest: TImage);
    procedure PlayAudio(const numFile: integer);
  public
   { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
{$R XPStyle.RES}

uses (*DIBType, *) pngimage, cUtils, (*Dibs, *)//gfx_png;
  codec, utils, GFXUtils,
  uPAKFile, CPSFile, SHPFile, VOCFile, FNTFile, WSAFile, AnimationFile, DLEFile, ENGFile,
  gfx_effects, FTGifAnimate, AboutBoxUnit;

type dims = record
    off: word;
    w, h: byte;
  end;

const AppVersion = '0.67c';
  FORM_CAPTION = 'WestPak2 v' + AppVersion + ' (Preview) © 2002,2005 by DK';
  WALL_GAMMA = 1; //0.3
  WALL_SCALE = 2; //2

  WallDims: array[0..8] of dims = (
    (off: 0; w: 3; h: 15),
    (off: 45; w: 3; h: 12),
    (off: 81; w: 2; h: 8),
    (off: 97; w: 1; h: 5),
    (off: 102; w: 3; h: 5),
    (off: 117; w: 2; h: 6),
    (off: 129; w: 6; h: 5),
    (off: 159; w: 10; h: 8),
    (off: 239; w: 16; h: 12)
    );
(*
    330, 375, 411, 427, 432, 447, 459, 489, 569
    //second wall set (like first, light different)
    (off:761; w:3; h:15),
    ...
    (off:1000; w:16; h:12),

    (off:1294; w:3; h:5),
    (off:1321; w:6; h:5),
    (off:1351; w:10; h:8),
    (off:1431; w:16; h:12),
    );
    *)

var
  AppPath, PAKFileName, CurrentDirectory: string;
  PAKMode: boolean;
  BookmarkSelection1,
    lvFiles_CurrentSelection: integer;
  PakFile: TPakFile;

  MyPAL: TMaxLogPalette;

  GlobalPalettes: array of TMaxLogPalette;
  TotalPalettes, CurPalette: byte;

  bmpBackground: TBitmap;
  Frames: array of TBitmap;
  posRect: TRect;

  global_gonext: boolean;
  FileVersion: shortint;
  Dune2Mode, LoL1Mode: boolean;
  bStopFlag: boolean;
  PlayMode: shortint;
  gAnimationFile: TAnimationFile;
  //gWSAFile: TWSAFile;

  TileData: array of word;
  VCNBitmap: TBitmap;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i: byte;
begin
  AppPath := ExtractFilePath(Application.ExeName);
  Caption := FORM_CAPTION;
  (*
  Dune2Mode := Dune21.Checked;
  LoL1Mode := LandofLore1.Checked;
  *)
  FileVersion := 0;
  None1.Checked := True;

  TotalPalettes := 0;
  PlayMode := -1;
  for i := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[i].TabVisible := false;
  PageControl.Pages[PageControl.PageCount - 2].TabVisible := True;
  PageControl.ActivePageIndex := PageControl.PageCount - 2;
  //tabGraphics.DoubleBuffered := True;
  ScrollBox1.DoubleBuffered := True;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if PakFile <> nil then PakFile.Free;
  PakFile := nil;
  if gAnimationFile <> nil then gAnimationFile.Free;
  bmpBackground.Free;
  //PAKstream.Free;
end;

{ Save content of Image1 as BMP/PNG }

procedure TMainForm.btnExpGraphicsClick(Sender: TObject);
var fPNG: TPNGObject;
  tmpFileName: string;
begin
  SaveDialog.Filter := 'PNG files (*.png)|*.png|BMP files (*.bmp)|*.bmp';

  if (PakMode) then
  begin
    tmpFileName := lowerCase(PakFile.GetFileNameInfo(lvFiles_CurrentSelection));
  end else
  begin
    tmpFileName := lowerCase(lvFiles.ItemFocused.Caption);
  end;
  SaveDialog.DefaultExt := '.png';
  SaveDialog.FileName := ChangeFileExt(tmpFileName, '.png');

  if SaveDialog.Execute then
  begin
    tmpFileName := SaveDialog.FileName;
    case SaveDialog.FilterIndex of //
      1: begin
          fPNG := TPNGObject.Create;
          fPNG.CompressionLevel := 9;
          fPNG.Filters := [pfNone, pfSub, pfUp, pfAverage, pfPaeth];
          fPNG.Assign(Image1.Picture.Bitmap);
          fPNG.SaveToFile(ChangeFileExt(tmpFileName, '.png'));
          fPNG.Free;
        end;
      2: begin
          Image1.Picture.Bitmap.SaveToFile(ChangeFileExt(tmpFileName, '.bmp'));
        end;
    end; // case
  end;
end;

procedure TMainForm.frameBarChange(Sender: TObject);
var width, height, Frame: Integer;
begin
  //SHPFrame[frameBar.Position].DrawOn(posRect, Image1.Canvas, 0, 0);
  //image1.Picture.Bitmap.Assign(bmpBackground);
  //Image1.Canvas.Draw(posRect.Left, posRect.Top, SHPFrame[frameBar.Position]);

//  image1.Canvas.FillRect(image1.ClientRect); //maybe not for SHP
  //Image1.Canvas.Draw(gAnimationFile.PosX, gAnimationFile.PosY, gAnimationFile.Frame[frameBar.Position]);
  Frame := frameBar.Position;
  width := gAnimationFile.Frame[Frame].Width;
  height := gAnimationFile.Frame[Frame].Height;
  //image1.Picture.Bitmap.Width := width;
  //image1.Picture.Bitmap.Height := height;
  //image1.Width := width;
  //image1.Height := height;
  Image1.Canvas.Draw(posRect.Left, posRect.Top, gAnimationFile.Frame[Frame]);
  Image1.Refresh;
end;

procedure TMainForm.FillListView(const pathfile: string; const isPAKFile: boolean);
var sr: TSearchRec;
  name: string;
  ext: string[3];
  ListItem: TListItem;
begin
  lvFiles.Clear;
  if (not isPAKFile) then
  begin
    if FindFirst(pathfile + '*.*', faAnyFile - faDirectory, sr) = 0 then
    begin
      repeat
        ListItem := lvFiles.Items.Add;
        name := sr.name;
        ListItem.Caption := name;
        ListItem.ImageIndex := GetFileIcon(name);
        ListItem.SubItems.Add(IntToStr(sr.size));
        //ListItem.SubItems.Add(IntToStr(off));

        ext := Q_UpperCase(Q_CopyRight(name, 3)); //extract extension - last 3 chars
        if (ext = 'COL') or (ext = 'PAL') then
        begin
          btnSavePal.Enabled := True;
          setlength(GlobalPalettes, TotalPalettes + 1);
          LoadPaletteFromFile(pathfile + name, GlobalPalettes[TotalPalettes]);
          inc(TotalPalettes);
          cbSelPalette.Items.Add(name);
        end;

      until FindNext(sr) <> 0;
      FindClose(sr);
    end; //if
  end else
  begin

  end;
end;

procedure TMainForm.SelectGameDirExecute(Sender: TObject);
var i, size, off: integer;
  name: string;
begin
  OpenDialog.Filter := 'Any files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    DisposeAllPalette;
    CurrentDirectory := ExtractFilePath(OpenDialog.FileName);
    PAKMode := false;
    MainForm.Caption := CurrentDirectory + ' - ' + FORM_CAPTION;
    FillListView(CurrentDirectory, PAKMode);

    if (TotalPalettes > 0) then
    begin
      CurPalette := TotalPalettes - 1;
      cbSelPalette.ItemIndex := CurPalette;
      RenderPal(GlobalPalettes[CurPalette], imgPAL);
    end;
  end; //if
end;

procedure TMainForm.ExtractDialog(const ResourceNum: integer; const decompress: boolean);
begin
  if (ResourceNum <> -1) then
  begin
    SaveDialog.FileName := PAKFile.GetFileNameInfo(ResourceNum);
    SaveDialog.DefaultExt := Q_CopyRight(SaveDialog.FileName, 3);
    SaveDialog.Filter := 'All files (*.*)|*.*';
    if SaveDialog.Execute then
      PAKFile.ExtractToFile(ResourceNum, SaveDialog.FileName, decompress);
  end;
end;

procedure TMainForm.ExtractFromPAKExecute(Sender: TObject);
begin
  ExtractDialog(lvFiles_CurrentSelection, false);
end;

procedure TMainForm.ExtractDecompFromPAKExecute(Sender: TObject);
begin
  ExtractDialog(lvFiles_CurrentSelection, true);
end;

procedure TMainForm.Button7Click(Sender: TObject);
begin
  global_gonext := true;
end;

procedure TMainForm.ViewAsHex(numFile: integer);
var memStream: TMemoryStream;
begin
  if numFile <> -1 then
  begin
    if (PAKMode) then
    begin
      memStream := TMemoryStream.Create;
      PakFile.ExtractFile(numFile, memStream, false);
      MPHexEditor.LoadFromStream(memStream);
      memStream.Free;
    end else
    begin
      MPHexEditor.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
    end;
  end; //if
end; //ViewAsHex

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  if (PageControl.ActivePageIndex = PageControl.PageCount - 2) then
    ViewAsHex(lvFiles_CurrentSelection);
end;

procedure TMainForm.btnDecompressHexClick(Sender: TObject);
var memStream: TMemoryStream;
  numFile: integer;
begin
  //numFile := lvFiles.ItemIndex;
  numFile := lvFiles_CurrentSelection;
  if numFile <> -1 then
  begin
    memStream := TMemoryStream.Create;
    //controllare se è nel pak file o meno!!!!!
    PakFile.ExtractFile(numFile, memStream, true);
    MainForm.MPHexEditor.LoadFromStream(memStream);
    memStream.Free;
  end;
end;

procedure TMainForm.PlayAudio(const numFile: integer);
var VOCFile: TVOCFile;
begin
  VOCFile := TVOCFile.Create;
  if (PAKMode) then VOCFile.LoadFromPakFile(numFile, PakFile)
  else VOCFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);

  Audio1.Player.BitsPerSample := VOCFile.BitsPerSample;
  Audio1.Player.Channels := VOCFile.Channels;
  Audio1.Player.SampleRate := VOCFile.SampleRate;
  Audio1.Player.Play(VOCFile.RawData, nil, 0);
  VOCFile.Free;

  btnPlay1.Enabled := False;
end;

procedure TMainForm.None1Click(Sender: TObject);
begin
  TMenuItem(Sender).Checked := true;
  FileVersion := TMenuItem(Sender).tag;
  (*
  Dune2Mode := Dune21.Checked;
  LoL1Mode := LandofLore1.Checked;
  *)
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  (*
  if WinWaveOut.IsOpened then begin
    AudioBuffer.Unprepare;
    WinWaveOut.Stop;
    WinWaveOut.Close;
  end;
  *)
end;

procedure TMainForm.btnExpWAVClick(Sender: TObject);
var tmpFileName: string;
  VOCFile: TVOCFile;
begin
  tmpFileName := lowerCase(lvFiles.ItemFocused.Caption);
  SaveDialog.Filter := 'Windows RIFF Wave (.wav)|*.wav';
  SaveDialog.Title := 'Save as...';
  SaveDialog.DefaultExt := '.wav';
  SaveDialog.FileName := ChangeFileExt(tmpFileName, '.wav');
  if SaveDialog.Execute then
  begin
    VOCFile := TVOCFile.Create;
    if (PAKMode) then VOCFile.LoadFromPakFile(lvFiles_CurrentSelection, PakFile)
    else VOCFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
    VOCFile.SaveAsWAV(SaveDialog.FileName);
    VOCFile.Free;
  end;
end;

procedure TMainForm.Audio1Played(Sender: TObject);
begin
  btnPlay1.Enabled := true;
end;

procedure TMainForm.DisplayCPS(const numFile: integer);
var CPSFile: TCPSFile;
begin
  CPSFile := TCPSFile.Create;
  if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];
  try
    CPSFile.SetPalette(MyPAL);
    if (PAKMode) then CPSFile.LoadFromPakFile(numFile, PakFile)
    else CPSFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
  except
  end;
  if CPSFile.HasPalette then
  begin
    btnSavePal.Enabled := True;
    inc(TotalPalettes);
    setlength(GlobalPalettes, TotalPalettes);
    CurPalette := TotalPalettes - 1;
    GlobalPalettes[CurPalette] := CPSFile.GetPalette;

    if (PAKMode) then cbSelPalette.Items.Add(PakFile.GetFileNameInfo(numFile))
    else cbSelPalette.Items.Add(lvFiles.ItemFocused.Caption);

    cbSelPalette.ItemIndex := CurPalette;
    RenderPal(GlobalPalettes[CurPalette], imgPAL);
  end;
  lbGFXInfo.Caption := Format('CPS File'#13#10'Dims: 320x200 pixel'#13#10'Compressed size: %d (%d%%)'#13#10'Compression type: %d'#13#10'Has palette: ',
    [CPSFile.CompressedSize, Round(CPSFile.CompressedSize * 100 / 64000), CPSFile.CompressionType]);
  if CPSFile.HasPalette then lbGFXInfo.Caption := lbGFXInfo.Caption + 'yes'
  else lbGFXInfo.Caption := lbGFXInfo.Caption + 'no';

  Image1.Picture.Bitmap := nil;
  image1.Width := CPSFile.GetBitmap.Width;
  image1.Height := CPSFile.GetBitmap.Height;
  ScrollBox1.HorzScrollBar.Range := image1.Width;
  ScrollBox1.HorzScrollBar.Position := 0;
  ScrollBox1.VertScrollBar.Range := image1.Height;
  ScrollBox1.VertScrollBar.Position := 0;
  image1.Picture.Bitmap.Assign(CPSFile.GetBitmap);
  InvalidateRect(image1.Canvas.Handle, nil, FALSE);
  CPSFile.Free;
end;

procedure TMainForm.DisplayFNT(const numFile: integer);
var FNTFile: TFNTFile;
begin
  FNTFile := TFNTFile.Create;
  FNTFile.SetPalette(MyPAL);
  if (PAKMode) then FNTFile.LoadFromPakFile(numFile, PakFile)
  else FNTFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
(*
  image1.Picture.Bitmap.Width := FNTFile.GetBitmap.width*4;
  image1.Picture.Bitmap.Height := FNTFile.GetBitmap.height*4;
  image1.Width := image1.Picture.Bitmap.Width;
  image1.Height := image1.Picture.Bitmap.Height;
  image1.Canvas.StretchDraw(image1.ClientRect, FNTFile.GetBitmap);
  ScrollBox1.VertScrollBar.Range := image1.Height;
  ScrollBox1.VertScrollBar.Position := 0;
  *)
  image1.Picture.Bitmap.Height := FNTFile.GetBitmap.height;
  image1.Height := image1.Picture.Bitmap.Height;
  image1.Picture.Bitmap.Assign(FNTFile.GetBitmap);
  ScrollBox1.VertScrollBar.Range := image1.Height;
  ScrollBox1.VertScrollBar.Position := 0;
  FNTFile.Free;
(*
  lbGFXInfo.Caption := Format('CPS File'#13#10'Dims: 320x200 pixel'#13#10'Compressed size: %d (%d%%)'#13#10'Compression type: %d'#13#10'Has palette: ',
    [CPSFile.CompressedSize, Round(CPSFile.CompressedSize * 100 / 64000), CPSFile.CompressionType]);
  if CPSFile.HasPalette then lbGFXInfo.Caption := lbGFXInfo.Caption + 'yes'
  else lbGFXInfo.Caption := lbGFXInfo.Caption + 'no';


  CPSFile := TCPSFile.Create;
  if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];
  try
    if (PAKMode) then CPSFile.LoadFromPakFile(numFile, PakFile, MyPAL)
    else CPSFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption, MyPAL);
  except
  end;
  if CPSFile.HasPalette then
  begin
    btnSavePal.Enabled := True;
    inc(TotalPalettes);
    setlength(GlobalPalettes, TotalPalettes);
    CurPalette := TotalPalettes - 1;
    GlobalPalettes[CurPalette] := MyPAL;

    if (PAKMode) then cbSelPalette.Items.Add(PakFile.GetFileNameInfo(numFile))
    else cbSelPalette.Items.Add(lvFiles.ItemFocused.Caption);

    cbSelPalette.ItemIndex := CurPalette;
    RenderPal(GlobalPalettes[CurPalette], imgPAL);
  end;
  lbGFXInfo.Caption := Format('CPS File'#13#10'Dims: 320x200 pixel'#13#10'Compressed size: %d (%d%%)'#13#10'Compression type: %d'#13#10'Has palette: ',
    [CPSFile.CompressedSize, Round(CPSFile.CompressedSize * 100 / 64000), CPSFile.CompressionType]);
  if CPSFile.HasPalette then lbGFXInfo.Caption := lbGFXInfo.Caption + 'yes'
  else lbGFXInfo.Caption := lbGFXInfo.Caption + 'no';

  image1.Picture.Bitmap.Assign(CPSFile.GetBitmap);
  InvalidateRect(image1.Canvas.Handle, nil, FALSE);
  CPSFile.Free;
*)
end;

procedure TMainForm.DisplayText(const numFile: integer);
var memStream: TMemoryStream;
begin
  if numFile <> -1 then
  begin
    MemoText.Clear;
    if (PAKMode) then
    begin
      memStream := TMemoryStream.Create;
      PakFile.ExtractFile(numFile, memStream, false);
      MemoText.Lines.LoadFromStream(memStream);
      memStream.Free;
    end else
    begin
      MemoText.Lines.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
    end;
  end; //if
end;

procedure TMainForm.DisplayTextTable(const numFile: integer);
var DLEFile: TDLEFile;
  ENGFile: TENGFile;
  ext: string;
begin
  if (numFile <> -1) then
  begin
    ext := ExtractFileExt(lvFiles.ItemFocused.Caption);
    MemoText.Clear;
    if (ext[2] = 'D') then
    begin
      DLEFile := TDLEFile.Create;
      if (PAKMode) then DLEFile.LoadFromPakFile(numFile, PakFile)
      else DLEFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
      MemoText.Lines.Text := DLEFile.GetText;
      DLEFile.Free;
    end else
    begin
      ENGFile := TENGFile.Create;
      if (PAKMode) then ENGFile.LoadFromPakFile(numFile, PakFile)
      else ENGFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
      MemoText.Lines.Text := ENGFile.GetText;
      ENGFile.Free;
    end;
  end; //if
end;

procedure TMainForm.DisplayVCN(const numFile: integer);
var memStream: TMemoryStream;
  i, j: word;
  w, h, x, y, p, tilenum, TotTiles, TotWallStartpos, ActorPalLength: word;
  b, b1,
    r, g: byte;
  GameVersion: byte;
  ActorPal: array of byte;
  buf: array[0..176 * 2] of byte;
//  TileData: array of word;
  block1, block2, bmpOrig, bmpDest: TBitmap;
  sl, sl1: PByteArray;

  function getColorIndex(color: byte): byte;
  var k: byte;
  begin
    //if color = 3 then color := 231;
    //if color = 19 then color := 238;
    //if color = 0 then color := 225;
    //if color= then color:=

    for k := 0 to 31 do // iterate
      if (color = ActorPal[k]) then
      begin
        result := k;
        exit;
      end; // for k
    raise Exception.Create('Index out of range!');
  end;

  procedure FillBlock(_from, _to: integer; col: byte);
  var z, z1: integer;
  begin
    for z := _from to _to do // iterate
    begin
      for z1 := 0 to 8 - 1 do // Iterate
      begin
        sl := VCNBitmap.ScanLine[(z * 8) + z1];
        fillchar(sl^, 8, col);
      end; // for
    end; // for i
  end;

begin
  memStream := TMemoryStream.Create;
  if (PakMode) then PakFile.ExtractFile(numFile, memStream, true)
  else memStream.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);

  //memStream.LoadFromFile('D:\Westwood\eob2\forest1.vcn');
  if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];

  w := 8;
  memStream.Read(TotTiles, 2); // # of tiles
  h := TotTiles * 8;

  if (PakMode) then GameVersion := PakFile.Version
  else GameVersion := 0;

  case GameVersion of //
    0, 1: ActorPalLength := 16 * 2; //EOB1 / EOB2
    3: ActorPalLength := 16 * 8; //LoL
  end; // case

  SetLength(ActorPal, ActorPalLength);
  memStream.Read(ActorPal[0], ActorPalLength);

  if (GameVersion > 2) then //LoL Floppy or CD
  begin
    //modify first 128 color of current palette
    for i := 0 to 127 do
    begin
      memStream.Read(r, 1);
      r := byte(r shl 2);
      //MyPal.palPalEntry[i].peRed := r;

      memStream.Read(g, 1);
      g := byte(g shl 2);
      //MyPal.palPalEntry[i].peGreen := g;

      memStream.Read(b, 1);
      b := byte(b shl 2);
      //MyPal.palPalEntry[i].peBlue := b;
    end;
  end;

  VCNBitmap := TBitmap.Create;
  with VCNBitmap do
  begin
    Width := w;
    Height := h;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@MyPAL)^);
  end; // with

  for y := 0 to h - 1 do
  begin
    i := 0;
    for x := 0 to (w div 2) - 1 do
    begin
      memStream.Read(b, 1);
      b1 := b and $0F;
      b := b shr 4;
      if (GameVersion < 2) then
      begin
        if (y < 2104) then r := 0
        else r := 16;
        buf[i] := ActorPal[b + r];
        buf[i + 1] := ActorPal[b1 + r];
      end else
      begin
        buf[i] := b;
        buf[i + 1] := b1;
      end;
      inc(i, 2);
    end;

    sl := VCNBitmap.ScanLine[y];
    move(buf[0], sl^, w);
    (*
    for j := 0 to w - 1 do
      if sl[j]<>buf[j] then raise ERangeError.Create('Not equals!');
    *)
  end;

  //save VCN bitmap
  //VCNBitmap.SaveToFile('D:\Westwood\eob1\brick-vcn.bmp');

  (*
  bmp.Canvas.Font.Name := 'Small Fonts';
  bmp.Canvas.Font.Size := 5;
  bmp.Canvas.Font.Color := 238;
  bmp.Canvas.Brush.Style := bsClear;
  bmp.Canvas.Pen.Color := clLime;
  i := 0; //340
  x := 10;
  for y := i to x - 1 do
  begin
    bmp.Canvas.TextOut(0, y * 8, IntToStr(y - i));
    bmp.Canvas.Rectangle(0, y * 8, 8, (y * 8) + 8);
  end;
  *)


  (*
  FillBlock(0, 330, 242); //color 4 - light green

  memStream.Clear;
  memStream.position := 0;
  memStream.Write(TotTiles, 2);
  memStream.Write(ActorPal[0], ActorPalLength);
  //memStream.Seek(ActorPalLength+2, soFromBeginning);

  for y := 0 to h - 1 do // iterate
  begin
    sl := VCNBitmap.ScanLine[y];
    for x := 0 to (w div 2) - 1 do // iterate
    begin
      b := getColorIndex(sl[x * 2]);
      b1 := getColorIndex(sl[(x * 2) + 1]);
      b := (b shl 4) or b1;
      memStream.write(b, 1);
    end; //for x
  end; //for y
  memStream.SaveToFile('D:\Westwood\eob1\wall01.vcn');
  *)

  if (PakMode) then PakFile.ExtractFile(numFile + 1, memStream, (FileVersion = 2)) //read .VMP
  else memStream.LoadFromFile(CurrentDirectory + ChangeFileExt(lvFiles.ItemFocused.Caption, '.VMP'));
  memStream.Read(TotWallStartpos, 2); //size of file data / 2

  setLength(TileData, TotWallStartpos);

  Edit6.Text := IntToStr(TotWallStartpos); //DEBUG - print total tilespos

  for i := 0 to (TotWallStartpos) - 1 do // iterate
    memStream.Read(TileData[i], 2);

  block1 := TBitmap.Create;
  with block1 do
  begin
    Width := 176;
    Height := 120;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@MyPAL)^);
  end; // with

  p := 1;
  for y := 0 to (120 div 8) - 1 do // iterate
  begin
    for x := 0 to (176 div 8) - 1 do // iterate
    begin
      tilenum := (TileData[p] and $3FFF); //AND $FF ????
      //if (tilenum > TotTiles) then tilenum := tilenum and $FF;

      //if ((tilenum > 0) and not boolean(tilenum AND $8000)) then
      if (tilenum > 0) then
      begin
        //if (tilenum AND $4000) then MirrorBlock;
        bitblt(block1.Canvas.Handle, x * 8, y * 8, 8, 8, VCNBitmap.Canvas.Handle, 0, (tilenum) * 8, SRCCOPY);
      end;
      inc(p);
    end; // for x
  end; // for y

  w := 10 * 8;
  h := 8 * 8;
  block2 := TBitmap.Create;
  with block2 do
  begin
    Width := w;
    Height := h;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@MyPAL)^);
  end; // with

  //p := 0;
  //memStream.Seek($22, soFromBeginning);
  p := 491;
  for y := 0 to (h div 8) - 1 do // iterate
  begin
    for x := 0 to (w div 8) - 1 do // iterate
    begin
      tilenum := (TileData[p] and $3FFF); //AND $FF ????
      if boolean(tilenum and $4000) then showMessage('mirror');

      if (tilenum > 0) then
        bitblt(block2.Canvas.Handle, x * 8, y * 8, 8, 8, VCNBitmap.Canvas.Handle, 0, (tilenum) * 8, SRCCOPY);
      inc(p);
    end; // for x
  end; // for y

  bmpOrig := TBitmap.Create;
  bmpOrig.Assign(block1);
  bmpOrig.PixelFormat := pf24bit;
  bmpDest := TBitmap.Create;
  EffectGamma(bmpOrig, bmpDest, WALL_GAMMA, nil);
  image1.Canvas.StretchDraw(Rect(0, 0, block1.width * WALL_SCALE, block1.Height * WALL_SCALE), bmpDest);
  //image1.Canvas.StretchDraw(Rect(0, 0, block1.width * WALL_SCALE, block1.Height * WALL_SCALE), block1);
  bmpDest.Free;
  bmpOrig.Free;

  //image1.Canvas.Draw(0, 0, block1);
  //image1.Picture.Bitmap.Assign(block1);
  InvalidateRect(image1.Canvas.Handle, nil, FALSE);

  block2.Free;
  block1.Free;
  //bmp.Free;
  memStream.Free;
end;

procedure TMainForm.LoadPaletteFromResource(const ResourceNum: integer; var aPal: TMaxLogPalette);
var tmpData: TMemoryStream;
begin
  tmpData := TMemoryStream.Create;
  PakFile.ExtractFile(ResourceNum, tmpData, true);
  LoadPaletteFromStream(tmpData, aPal);
  tmpData.Free;
end;

procedure TMainForm.DisplayPAL(const numFile: integer);
var PALFile: TMaxLogPalette;
begin
  if (PAKMode) then LoadPaletteFromResource(numFile, PALFile)
  else LoadPaletteFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption, PALFile);
  Image1.Picture.Bitmap := nil;
  Image1.Width := 320;
  Image1.Height := 200;
  RenderPal(PALFile, Image1);
end;

procedure TMainForm.DisplayWSA_SHP(const numFile: integer; SHPMode: Boolean);
var width, height: Integer;
  info, tmpStr: string;
begin
  //bug freeing the WSA file
  if gAnimationFile <> nil then gAnimationFile.Free;

  if SHPMode then gAnimationFile := TSHPFile.Create
  else gAnimationFile := TWSAFile.Create;

  if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];

  gAnimationFile.SetPalette(MyPAL);
  if (PAKMode) then gAnimationFile.LoadFromPakFile(numFile, PakFile)
  else
  begin
    gAnimationFile.SetFileVersion(FileVersion); //set correct version
    gAnimationFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
  end;
  //LoadPaletteFromFile(lvFiles.ItemFocused.Caption, PALFile);

  //maybe incorrect because exist multisize SHP ????
  width := gAnimationFile.CelWidth;
  height := gAnimationFile.CelHeight;

  if (not SHPMode) then
  begin
    image1.Picture.Bitmap.Width := 320;
    image1.Picture.Bitmap.Height := 200;
    image1.Width := 320;
    image1.Height := 200;

    if (PreserveBackCheckBox.Checked) then
    begin
      posRect.Left := 0;
      posRect.Top := 0;
      gAnimationFile.SetBackground(image1.Picture.Bitmap)
    end
    else
    begin
      posRect.Left := (320 - width) div 2;
      posRect.Top := (200 - height) div 2;
      image1.Canvas.Brush.Color := clBlack;
      image1.Canvas.FillRect(image1.ClientRect);
    end;
  end else
  begin
    posRect.Left := 0;
    posRect.Top := 0;
    image1.Picture.Bitmap.Width := width;
    image1.Picture.Bitmap.Height := height;
    image1.Width := width;
    image1.Height := height;
  end;
  ScrollBox1.HorzScrollBar.Range := image1.Width;
  ScrollBox1.HorzScrollBar.Position := 0;
  ScrollBox1.VertScrollBar.Range := image1.Height;
  ScrollBox1.VertScrollBar.Position := 0;

  if SHPMode then info := 'SHP'
  else info := 'WSA';

  if gAnimationFile.HasPalette then tmpStr := 'yes'
  else tmpStr := 'no';

  info := Format('%s File'#13#10'Dims: %dx%d pixel (position x:%d - y:%d)'#13#10'Total frames: %d'#13#10'Has palette: %s',
    [info, Width, Height, gAnimationFile.PosX, gAnimationFile.PosY, gAnimationFile.TotalFrames, tmpStr]);

  lbGFXInfo.Caption := info;

  //if gAnimationFile.HasPalette then RenderPal(MyPAL, imgPAL);
  //posRect := Image1.ClientRect;

  udFrameNum.Position := 0;
  udFrameNum.Max := gAnimationFile.TotalFrames - 1;

  frameBar.Position := 0;
  frameBar.Max := gAnimationFile.TotalFrames - 1;

  //image1.Canvas.Brush.Color := clBtnFace;
  //img.DrawOn(Image1.ClientRect, Image1.Canvas, 0, 0);
  (*
  bigSHP := TDIBUltra.Create(celWidth * 2, celHeight * 2, DUpf8, @MyPal);
  img.StretchOn(Rect(0, 0, celWidth * 2, celHeight * 2), bigSHP.Canvas);
  img.Free;
  bigSHP.DrawOn(image1.ClientRect, Image1.Canvas, 0, 0);
  *)
  //  SHPFrame[0].DrawOn(Image1.ClientRect, Image1.Canvas, 0, 0);
  //  image1.Canvas.Brush.Color := clBlack;
  //  image1.Canvas.FillRect(image1.ClientRect);
  //image1.Canvas.Draw(gAnimationFile.PosX, gAnimationFile.PosY, gAnimationFile.GetFirstFrame);
  image1.Canvas.Draw(posRect.Left, posRect.Top, gAnimationFile.GetFirstFrame);
  image1.Refresh;
end;

procedure TMainForm.DisplayPAK(const numfile: integer);
var
  i: Integer;
  tmpPAKFile: TPAKFile;
begin
  if (not PAKMode) then
  begin
    lbPAKPreview.Clear;
    tmpPAKFile := TPAKFile.Create;
    tmpPAKFile.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
    lbPAKInfo.Caption := Format('PAK File'#13#10'File size: %s'#13#10'Total files in PAK: %d'#13#10'Version: %d',
      [lvFiles.ItemFocused.SubItems[0], tmpPAKFile.TotalFiles, tmpPAKFile.Version]);

    for i := 0 to tmpPAKFile.TotalFiles - 1 do // iterate
      lbPAKPreview.Items.Add(tmpPAKFile.GetFileNameInfo(i));

    tmpPAKFile.Free;
  end;
end;

procedure TMainForm.ViewItem(numFile: integer);
var Filename: string;
  CompSize, Offset: integer;
  i, kind: byte;
  ListItem: TListItem;
begin
  for i := 0 to PageControl.PageCount - 1 do // Iterate
    PageControl.Pages[i].TabVisible := false;
  PageControl.Pages[PageControl.PageCount - 2].TabVisible := True;

  if (PAKMode) and (lvFiles.ItemIndex = 0) then
  begin
    PageControl.Pages[3].TabVisible := true;
    PageControl.ActivePageIndex := 3;
    exit;
  end;

  PlayMode := -1;
  btnExpGraphics.Enabled := False;
  btnExpWAV.Enabled := False;
  btnExpGIF.Enabled := False;
  PlayCtrlPanel.Visible := false;

  if PAKMode then
  begin
    PakFile.GetFileInfo(numFile, Filename, CompSize, Offset);
    lbGenericInfo.Caption := Format('Size: %d'#13#10'Current Size: %d'#13#10'Offset (in pak): %d'#13#10'Type: %s',
      [CompSize, CompSize, Offset, GetFileDescr(Filename)]);
  end else
  begin
    filename := lvFiles.ItemFocused.Caption;
    CompSize := StrToInt(lvFiles.ItemFocused.SubItems[0]);
    lbGenericInfo.Caption := Format('Size: %d'#13#10'Current Size: %d'#13#10'Type: %s',
      [CompSize, CompSize, GetFileDescr(Filename)]);
  end;

  kind := GetFileKind(Filename);
  case kind of
    1, 2: begin //palette
        PageControl.Pages[0].TabVisible := true;
        if (PageControl.ActivePageIndex <> 0) then PageControl.ActivePageIndex := 0;
        btnExpGraphics.Enabled := True;
        lbGFXInfo.Caption := 'Colors: 256';
        DisplayPAL(numFile);
      end;
    3, 4, 5, 6: begin //CPS
        PageControl.Pages[0].TabVisible := true;
        if (PageControl.ActivePageIndex <> 0) then PageControl.ActivePageIndex := 0;
        btnExpGraphics.Enabled := True;
        DisplayCPS(numFile);
      end;

    7, 8: begin //WSA=7, SHP=8
        PageControl.Pages[0].TabVisible := true;
        if (PageControl.ActivePageIndex <> 0) then PageControl.ActivePageIndex := 0;
        btnExpGraphics.Enabled := True;
        btnExpGIF.Enabled := True;
        PlayCtrlPanel.Visible := True;
        PlayMode := 1;
        DisplayWSA_SHP(numFile, (Kind = 8));
      end;

    15: begin //VOC
        PageControl.Pages[1].TabVisible := true;
        if (PageControl.ActivePageIndex <> 1) then PageControl.ActivePageIndex := 1;
        btnExpWAV.Enabled := true;
        PlayCtrlPanel.Visible := true;
        PlayMode := 0;
        //display a wave form???
      end;
    17: begin //FNT
        PageControl.Pages[0].TabVisible := true;
        if (PageControl.ActivePageIndex <> 0) then PageControl.ActivePageIndex := 0;
        btnExpGraphics.Enabled := True;
        DisplayFNT(numFile);
      end;
    (*
    21: begin //ICN
        PageControl.Pages[0].TabVisible := true;
        PageControl.ActivePageIndex := 0;
        //check if game is Dune2
        btnExpGraphics.Enabled := True;
        Decode_Dune2_ICON(numFile);
      end;
    *)

    22: begin //VCN
        PageControl.Pages[0].TabVisible := true;
        if (PageControl.ActivePageIndex <> 0) then PageControl.ActivePageIndex := 0;
        btnExpGraphics.Enabled := True;
        DisplayVCN(numFile);
      end;

    23, 24, 25: begin //PAK, APK, VRM
        PageControl.Pages[3].TabVisible := true;
        if (PageControl.ActivePageIndex <> 3) then PageControl.ActivePageIndex := 3;
        DisplayPAK(numFile);
      end;
    26, 27: begin //BAT, INI
        PageControl.Pages[4].TabVisible := true;
        if (PageControl.ActivePageIndex <> 4) then PageControl.ActivePageIndex := 4;
        DisplayText(numFile);
      end;
    28, 29, 30: begin //ENG, FRE, GER
        PageControl.Pages[4].TabVisible := true;
        if (PageControl.ActivePageIndex <> 4) then PageControl.ActivePageIndex := 4;
        DisplayTextTable(numFile);
      end;
    31, 32, 33: begin //DLE, DLF, DLG
        PageControl.Pages[4].TabVisible := true;
        if (PageControl.ActivePageIndex <> 4) then PageControl.ActivePageIndex := 4;
        DisplayTextTable(numFile);
      end;
  else begin
      PageControl.ActivePageIndex := PageControl.PageCount - 2;
      ViewAsHex(numFile);
    end;
  end;
end;

procedure TMainForm.lvFilesClick(Sender: TObject);
begin
  lvFiles_CurrentSelection := lvFiles.ItemIndex;
  if (lvFiles_CurrentSelection <> -1) then
  begin
    if (PAKMode) then dec(lvFiles_CurrentSelection); //in pakmode listview first item is .. so do not is a filename
    ViewItem(lvFiles_CurrentSelection);
  end;
end;

procedure TMainForm.ApplyPal(const aPal: TMaxLogPalette; const Dest: TImage);
var rgbQ: array[0..255] of RGBQUAD;
  colors, i: integer;
begin
  colors := 0;
  if (not Dest.Picture.Bitmap.Empty) then
  begin
    colors := GetDIBColorTable(Dest.Canvas.Handle, 0, 256, rgbQ);
    //move(aPal.palPalEntry[0], rgbQ[0], 256*SizeOf(TPaletteEntry)); //seems do not work!!! :(

    with aPal do
      for i := 0 to 255 do
      begin
        rgbQ[i].rgbRed := palPalEntry[i].peRed;
        rgbQ[i].rgbGreen := palPalEntry[i].peGreen;
        rgbQ[i].rgbBlue := palPalEntry[i].peBlue;
      end; //for
    SetDIBColorTable(Dest.Canvas.Handle, 0, 256, rgbQ);
    Dest.Invalidate;
    Dest.Refresh;
  end;
end;

procedure TMainForm.cbSelPaletteChange(Sender: TObject);
begin
  CurPalette := cbSelPalette.ItemIndex;
  RenderPal(GlobalPalettes[CurPalette], imgPAL);
  ApplyPal(GlobalPalettes[CurPalette], Image1);
end;

procedure TMainForm.lvFilesChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  //if (Change = ctState) and (Item.Selected) then ViewItem(Item.Index);
end;

procedure TMainForm.btnPlayClick(Sender: TObject);
begin
  case TSpeedButton(Sender).Tag of //
    0: ;
    1: PlayAudio(lvFiles_CurrentSelection);
    2: ;
    3: ;
  end; // case
end;

procedure TMainForm.btnNextClick(Sender: TObject);
begin
  case PlayMode of //
    1: begin
        udFrameNum.Position := udFrameNum.Position + 1;
        image1.Canvas.FillRect(image1.ClientRect);
        image1.Canvas.Draw(0, 0, gAnimationFile.GetNextFrame);
        image1.Refresh;
      end;
    2: ;
    3: ;
  end; // case
end;

procedure TMainForm.btnPrevClick(Sender: TObject);
begin
  case PlayMode of //
    1: begin
        udFrameNum.Position := udFrameNum.Position - 1;
        image1.Canvas.FillRect(image1.ClientRect);
        image1.Canvas.Draw(0, 0, gAnimationFile.GetPrevFrame);
        image1.Refresh;
      end;
    2: ;
    3: ;
  end; // case
end;

procedure TMainForm.btnSavePalClick(Sender: TObject);
var destf: TFileStream;
  tmpFileName: string;
  i: byte;
begin
  if (TotalPalettes > 0) then
  begin
    SaveDialog.Filter := 'PAL files (*.pal)|*.pal';
    tmpFileName := lowerCase(cbSelPalette.Items[cbSelPalette.ItemIndex]);
    SaveDialog.DefaultExt := '.pal';
    SaveDialog.FileName := ChangeFileExt(tmpFileName, '.pal');

    if SaveDialog.Execute then
    begin
      destf := TFileStream.Create(SaveDialog.FileName, fmCreate);
      for i := 0 to 255 do
      begin
        destf.Write(GlobalPalettes[CurPalette].palPalEntry[i].peRed, 1);
        destf.Write(GlobalPalettes[CurPalette].palPalEntry[i].peGreen, 1);
        destf.Write(GlobalPalettes[CurPalette].palPalEntry[i].peBlue, 1);
      end;
      destf.Free;
    end;
  end;
end;

procedure TMainForm.btnImportPalClick(Sender: TObject);
var destf: TFileStream;
  tmpFileName: string;
  r, g, b, i: byte;
begin
  OpenDialog.Filter := 'PAL/COL files (*.col;*.pal)|*.col;*.pal|All files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    tmpFileName := OpenDialog.FileName;
    inc(TotalPalettes);
    setlength(GlobalPalettes, TotalPalettes);
    CurPalette := TotalPalettes - 1;

    GlobalPalettes[CurPalette].palVersion := $300;
    GlobalPalettes[CurPalette].palNumEntries := 256;
    destf := TFileStream.Create(tmpFileName, fmOpenRead);
    LoadPaletteFromStream(destf, GlobalPalettes[CurPalette]);
    (*
    for i := 0 to 255 do
    begin
      destf.Read(r, 1);
      destf.Read(g, 1);
      destf.Read(b, 1);

      GlobalPalettes[CurPalette].palPalEntry[i].peRed := byte(r shl 2);
      GlobalPalettes[CurPalette].palPalEntry[i].peGreen := byte(g shl 2);
      GlobalPalettes[CurPalette].palPalEntry[i].peBlue := byte(b shl 2);
    end;
    *)
    destf.Free;

    cbSelPalette.Items.Add(ExtractFileName(tmpFileName));
    cbSelPalette.ItemIndex := CurPalette;
    RenderPal(GlobalPalettes[CurPalette], imgPAL);
    ApplyPal(GlobalPalettes[CurPalette], Image1);
  end;
end;

procedure TMainForm.btnRotPalClick(Sender: TObject);
var rgbQ: array[0..255] of RGBQUAD;
  colors, i: integer;
  r, g, b: byte;
begin
  colors := 0;
  if (not Image1.Picture.Bitmap.Empty) then
  begin
    colors := GetDIBColorTable(Image1.Canvas.Handle, 0, 256, rgbQ);
    with GlobalPalettes[CurPalette] do
    begin
      r := palPalEntry[0].peRed;
      g := palPalEntry[0].peGreen;
      b := palPalEntry[0].peBlue;
      for i := 0 to 255 do
      begin
        if i < 255 then
        begin
          palPalEntry[i].peRed := palPalEntry[i + 1].peRed;
          palPalEntry[i].peGreen := palPalEntry[i + 1].peGreen;
          palPalEntry[i].peBlue := palPalEntry[i + 1].peBlue;
          (*
          rgbQ[i].rgbRed := rgbQ[i+1].rgbRed;
          rgbQ[i].rgbGreen := rgbQ[i+1].rgbGreen;
          rgbQ[i].rgbBlue := rgbQ[i+1].rgbBlue;
          *)
        end else
        begin
          palPalEntry[i].peRed := r;
          palPalEntry[i].peGreen := g;
          palPalEntry[i].peBlue := b;
          (*
          rgbQ[i].rgbRed := r;
          rgbQ[i].rgbGreen := r;
          rgbQ[i].rgbBlue := R;
          *)
        end;
        rgbQ[i].rgbRed := palPalEntry[i].peRed;
        rgbQ[i].rgbGreen := palPalEntry[i].peGreen;
        rgbQ[i].rgbBlue := palPalEntry[i].peBlue;
      end; //for
    end; //with
    SetDIBColorTable(Image1.Canvas.Handle, 0, 256, rgbQ);
    RenderPal(GlobalPalettes[CurPalette], imgPAL);
    Image1.Invalidate;
    Image1.Refresh;
  end;
end;

procedure TMainForm.AddFileExecute(Sender: TObject);
begin
  ShowMessage('Not available...yet :)');
end;

procedure TMainForm.ReplaceFileExecute(Sender: TObject);
begin
  //intelligent file extension proposal basing on the current file extension selected
  OpenDialog.Filter := 'All files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    PakFile.ReplaceFile(lvFiles_CurrentSelection, OpenDialog.FileName);
    PakFile.SaveToFile(CurrentDirectory + PAKFileName);
  end;
end;

procedure TMainForm.RemoveFileExecute(Sender: TObject);
begin
  ShowMessage('Not available...yet :)');
end;

{
function bitOn(const Value: byte; const TheBit: TBit): byte;
begin
  Result := Value or (1 shl 7);
end;

function bitOff(const Value: byte; const TheBit: TBit): byte;
begin
  Result := Value and ((1 shl 7) xor $FF);
end;
}

procedure bitbltMirror(var DestBmp: TBitmap; DestX, DestY, bWidth, bHeight: integer; var SrcBmp: TBitmap; SrcX, SrcY: integer; Transparent: boolean);
var SrcPtr, DestPtr: PByteArray;
  x, y: integer;
  c, b: byte;
begin
  if (not Transparent) then
  begin
    for y := 0 to bHeight - 1 do
    begin
      SrcPtr := SrcBmp.ScanLine[SrcY + y];
      DestPtr := DestBmp.ScanLine[DestY + y];
      for x := 0 to bWidth - 1 do
        DestPtr[DestX + x] := SrcPtr[SrcX + bWidth - x - 1];
    end; //for y
  end else
  begin
//ONLY for 2bit color!!!
    if DestBmp.PixelFormat <> pf1bit then exit;

    for y := 0 to bHeight - 1 do
    begin
      SrcPtr := SrcBmp.ScanLine[SrcY + y];
      DestPtr := DestBmp.ScanLine[DestY + y];

      b := $FF; //check what is white and what is black
      for x := 0 to bWidth - 1 do
      begin
        c := SrcPtr[SrcX + bWidth - x - 1];
        if (c <> 0) then
          b := b and ((1 shl (7 - (x mod 8))) xor $FF);
      end;
      DestPtr[DestX] := b;

    end; //for y
  end;
end;

procedure TMainForm.btnDrawWallClick(Sender: TObject);
var totalset, i, j, w, h, x, y, tilenum, t: word;
  p, px, py, WallsetRow: integer;
  block2, mskBlock2, WallsetBmp, bmpOrig, bmpDest: TBitmap;
  isTransparent, isMirrored: boolean;
  info: string;
begin
  totalset := (high(tiledata) - 329) div 431;

  WallsetBmp := TBitmap.Create;
  with WallsetBmp do
  begin
    w := 0;
    for i := 0 to 8 do
      inc(w, WallDims[i].w + 3);

    Width := w * 8;
    Height := 123 * totalset;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@MyPAL)^);

    Canvas.Brush.Color := clAqua;
    Canvas.FillRect(Canvas.ClipRect);
  end;
  ScrollBox1.VertScrollBar.Range := WallsetBmp.Height * 2;
  ScrollBox1.VertScrollBar.Position := 0;
  ScrollBox1.HorzScrollBar.Range := WallsetBmp.Width * 2;
  ScrollBox1.HorzScrollBar.Position := 0;

  ProgressBar.Position := 0;
  ProgressBar.Max := high(tiledata);

  p := StrToInt(Edit2.Text);
  ProgressBar.Position := p;

  py := 0;
  px := 0;
  WallsetRow := 120;

  for j := 0 to totalset - 1 do
  begin

    px := 0;
    for i := 0 to 8 do
    begin

      w := WallDims[i].w * 8;
      h := WallDims[i].h * 8;

      block2 := TBitmap.Create;
      with block2 do
      begin
        Width := w;
        Height := h;
        PixelFormat := pf8bit;
        Palette := CreatePalette(PLogPalette(@MyPAL)^);

        Transparent := True;
        TransparentMode := tmFixed;
        TransparentColor := Canvas.Pixels[0, 0];
      end; // with

      mskBlock2 := TBitmap.Create;
      with mskBlock2 do
      begin
        Width := w;
        Height := h;
        PixelFormat := pf1bit;
        Canvas.Brush.Color := clWhite;
        Canvas.FillRect(Canvas.ClipRect);
      end; // with

      for y := 0 to (h div 8) - 1 do // iterate
      begin
        for x := 0 to (w div 8) - 1 do // iterate
        begin
          tilenum := (TileData[p] and $3FFF); //AND $FF ????
          isTransparent := (TileData[p] and $8000) > 0;
          isMirrored := (TileData[p] and $4000) > 0;

        (*
        info := format('%d: 0x%x ( ', [p, TileData[p]]);
        if isTransparent then info := info + 'transparent ';
        if isMirrored then
        begin
          info := info + 'mirror ';
          memo1.Lines.Add(info);
        end;
        info := info + ')';
        memo1.Lines.Add(info);
        *)

          if (tilenum > 0) then //and (not isTransparent) then
          begin
            if (not isMirrored) then bitblt(block2.Canvas.Handle, x * 8, y * 8, 8, 8, VCNBitmap.Canvas.Handle, 0, tilenum * 8, SRCCOPY)
            else
            begin
            //if (not isTransparent) then
              bitbltMirror(block2, x * 8, y * 8, 8, 8, VCNBitmap, 0, tilenum * 8, False);
            end;

            if (not isTransparent) then
            begin
              mskBlock2.Canvas.Brush.Color := clBlack;
              mskBlock2.Canvas.FillRect(Rect(x * 8, y * 8, (x * 8) + 8, (y * 8) + 8));
            //if (not isMirrored) then bitblt(mskBlock2.Canvas.Handle, x * 8, y * 8, 8, 8, VCNBitmap.Canvas.Handle, 0, (tilenum) * 8, BLACKNESS)
            //else bitblt(mskBlock2.Canvas.Handle, x * 8, y * 8, 8, 8, VCNBitmap.Canvas.Handle, 0, (tilenum) * 8, BLACKNESS)
            end else
            begin
//            if (not isMirrored) then
//            begin
              mskBlock2.Canvas.Brush.Color := clWhite;
              mskBlock2.Canvas.BrushCopy(Rect(x * 8, y * 8, (x * 8) + 8, (y * 8) + 8), VCNBitmap, Rect(0, (tilenum * 8), 8, (tilenum * 8) + 8), 0);
//            end else bitbltMirror(mskBlock2, x * 8, y * 8, 8, 8, VCNBitmap, 0, tilenum * 8, True);
            end;
          end else bitblt(block2.Canvas.Handle, x * 8, y * 8, 8, 8, VCNBitmap.Canvas.Handle, 0, 0, SRCCOPY);
          inc(p);
        end; // for x
      end; // for y

      ProgressBar.Position := p;
      bitblt(block2.Canvas.Handle, 0, 0, Block2.Width, Block2.Height, mskBlock2.Canvas.Handle, 0, 0, SRCINVERT);
      mskBlock2.Free;

    //bitblt(WallsetBmp.Canvas.Handle, 0, py, w, h, Block2.Canvas.Handle, 0, 0, SRCCOPY);
      py := ((123 * (j + 1)) - h);
      WallsetBmp.Canvas.Draw(px, py, Block2);
      Block2.Free;

      inc(px, w + 3);
    end; //for i
    //inc(py, h+3);
  end; //for j

  image1.Picture.bitmap.Width := WallsetBmp.Width * 2;
  image1.Picture.bitmap.Height := WallsetBmp.Height * 2;
  image1.Width := image1.Picture.bitmap.Width;
  image1.Height := image1.Picture.bitmap.Height;
  image1.Canvas.StretchDraw(Image1.ClientRect, WallsetBmp);

  //image1.Picture.Bitmap.Assign(WallsetBmp);
  WallsetBmp.Free;
  InvalidateRect(image1.Canvas.Handle, nil, FALSE);
end;

procedure read_BE_long(const st: tStream; var n: integer);
var b0, b1, b2, b3: byte;
begin
  st.read(b0, 1);
  st.read(b1, 1);
  st.read(b2, 1);
  st.read(b3, 1);
  n := (b0 shl 24) + (b1 shl 16) + (b2 shl 8) + (b3);
end;

procedure TMainForm.Decode_Dune2_ICON(const numFile: integer);
var memStream: TMemoryStream;
  dummy, IconBlockSize, TotIcons, bkm1, RPALNum, RTBLSize: integer;
  tag: string;
  i, j, palnum: word;
  RPAL: array of array[0..15] of byte;
  RTBL: array of byte;
  buf: array[0..15] of byte;
  IconsBmp: TBitmap;
  sl: PByteArray;
  b, b1: byte;
  x, y: word;

begin
  memStream := TMemoryStream.Create;
  PakFile.ExtractFile(numFile, memStream, false);
  if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];

  memStream.Seek($22, soFromBeginning);
  memStream.Read(IconBlockSize, 4);
  memStream.Read(dummy, 2); //0000
  bkm1 := memStream.Position;
  memStream.Seek(IconBlockSize, soFromCurrent);
  TotIcons := IconBlockSize div 128; //16x16x4bit = 128byte

  SetLength(tag, 4);
  memStream.Read(tag[1], 4); //RPAL tag
  read_BE_long(memStream, RPALNum); //get RPAL size
  RPALNum := RPALNum div 16;
  SetLength(RPAL, RPALNum);
  for i := 0 to RPALNum - 1 do // iterate
    memStream.Read(RPAL[i][0], 16);

  memStream.Read(tag[1], 4); //RTBL tag
  read_BE_long(memStream, RTBLSize); //get RTBL size
  SetLength(RTBL, RTBLSize);
  memStream.Read(RTBL[0], RTBLSize);

  memStream.Seek(bkm1, soFromBeginning);

  IconsBmp := TBitmap.Create;
  with IconsBmp do
  begin
    Width := 16;
    Height := 16 * TotIcons;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@MyPAL)^);
  end; // with

  y := 0;
  for i := 0 to TotIcons do // iterate
  begin
    x := 0;
    palnum := RTBL[i];
    for j := 0 to 7 do
    begin
      memStream.Read(b, 1);
      b1 := b and $0F;
      b := b shr 4;
      buf[x] := RPAL[palnum][b];
      buf[x + 1] := RPAL[palnum][b1];
      inc(x, 2);
    end; // for j
    sl := IconsBmp.ScanLine[y];
    move(buf[0], sl^, 16);
    inc(y);
  end; // for i
  RTBL := nil;
  RPAL := nil;

  //image1.Canvas.Draw(0, 0, IconsBmp);
  image1.Picture.Assign(IconsBmp);
  InvalidateRect(image1.Canvas.Handle, nil, FALSE);
  IconsBmp.Free;
end;

procedure TMainForm.Replace1Click(Sender: TObject);
begin
  //intelligent file extension proposal basing on the current file extension selected
  OpenDialog.Filter := 'All files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    PakFile.ReplaceFile(lvFiles_CurrentSelection, OpenDialog.FileName);
    PakFile.SaveToFile(PAKFileName);
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Edit2.Text := IntToStr(StrToInt(Edit2.Text) + (StrToInt(Edit4.Text) * StrToInt(Edit5.Text)));
end;

procedure TMainForm.Button8Click(Sender: TObject);
begin
  Memo1.Lines.Add(format('(off:%s; w:%s; h:%s),', [Edit2.Text, Edit5.Text, Edit4.Text]));
end;

procedure TMainForm.DisposeAllPalette;
var
  i: integer;
begin
  TotalPalettes := 0;
  cbSelPalette.Clear;
  GlobalPalettes := nil;
  btnSavePal.Enabled := False;
end;

procedure TMainForm.OpenPAKFile(const filename: string);
var
  i, size, off: integer;
  name: string;
  ext: string[3];
  ListItem: TListItem;

begin
    //PageControl.Pages[3].TabVisible := false;
    //PageControl.ActivePageIndex := PageControl.PageCount - 1;
  PAKMode := true;
  PAKFileName := ExtractFileName(filename);
  MainForm.Caption := PAKFileName + ' - ' + FORM_CAPTION;

  if PakFile = nil then PakFile := TPakFile.Create;
  PakFile.LoadFromFile(PAKFileName);

  lvFiles.Clear;
  lvFiles.AllocBy := PakFile.TotalFiles + 1;

  ListItem := lvFiles.Items.Add;
  ListItem.Caption := '..';
  ListItem.ImageIndex := 11;
  lvFiles.ItemIndex := 0;
  lvFiles_CurrentSelection := 0;

  for i := 0 to PakFile.TotalFiles - 1 do
  begin
    ListItem := lvFiles.Items.Add;
    PakFile.getFileInfo(i, name, size, off);
    ListItem.Caption := name;
    ListItem.ImageIndex := GetFileIcon(name);
    ListItem.SubItems.Add(IntToStr(size));
      //ListItem.SubItems.Add(IntToStr(off));

    ext := Q_UpperCase(Q_CopyRight(name, 3));
    if (ext = 'COL') or (ext = 'PAL') then
    begin
      btnSavePal.Enabled := True;
      setlength(GlobalPalettes, TotalPalettes + 1);
      LoadPaletteFromResource(i, GlobalPalettes[TotalPalettes]);
      inc(TotalPalettes);
      cbSelPalette.Items.Add(name);
    end;
  end;
  ExtractFromPAK.Enabled := True;
  ExtractDecompFromPAK.Enabled := True;
  AddFile.Enabled := True;
  RemoveFile.Enabled := True;
  ReplaceFile.Enabled := True;

  if (TotalPalettes > 0) then
  begin
    CurPalette := TotalPalettes - 1;
    cbSelPalette.ItemIndex := CurPalette;
    RenderPal(GlobalPalettes[CurPalette], imgPAL);
  end;

  btnOpenPAK.Caption := 'Close PAK';
end;

procedure TMainForm.ClosePAKFile;
begin
  btnOpenPAK.Caption := 'Open PAK';
  PakFile.Free;
  PakFile := nil;

  PAKMode := False;

  ExtractFromPAK.Enabled := False;
  ExtractDecompFromPAK.Enabled := False;
  AddFile.Enabled := False;
  RemoveFile.Enabled := False;
  ReplaceFile.Enabled := False;

  MainForm.Caption := CurrentDirectory + ' - ' + FORM_CAPTION;
  FillListView(CurrentDirectory, PAKMode);
  //close PAK
end;

procedure TMainForm.ScrollListView(const idx: integer);
var
  CharHeight, ToScroll: integer;
begin
  if (idx > (lvFiles.TopItem.Index + lvFiles.VisibleRowCount)) then
  begin
    CharHeight := lvFiles.Canvas.TextHeight('H');
    ToScroll := (idx - (lvFiles.TopItem.Index + lvFiles.VisibleRowCount)) + (lvFiles.VisibleRowCount div 2);
    lvFiles.scroll(0, ToScroll * CharHeight);
  end;
end;

procedure TMainForm.btnOpenPAKClick(Sender: TObject);
begin
  if (not PAKMode) then
  begin
    BookmarkSelection1 := lvFiles.ItemIndex;
    OpenPAKFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
  end else begin
    ClosePAKFile();
    lvFiles.ItemIndex := BookmarkSelection1;
    lvFiles_CurrentSelection := lvFiles.ItemIndex;
    ScrollListView(BookmarkSelection1);
  end;
end;

{ ************************************************************
    OLD PROCS
  ************************************************************ }

procedure TMainForm.CPSfromfile1Click(Sender: TObject);
var CPSFile: TCPSFile;
  CPSFileName: string;
begin
{
  OpenDialog.Filter := 'CPS files (*.cps)|*.cps|All files (*.*)|*.*';
  if OpenDialog.Execute then
  begin
    btnExpGraphics.Enabled := True;
    CPSFile := TCPSFile.Create;
    CPSFileName := OpenDialog.FileName;

    if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];
    CPSFile.LoadFromFile(CPSFileName);
    if CPSFile.HasPalette then
    begin
      inc(TotalPalettes);
      setlength(GlobalPalettes, TotalPalettes);
      CurPalette := TotalPalettes - 1;
      GlobalPalettes[CurPalette] := MyPAL;
      RenderPal(GlobalPalettes[CurPalette], imgPAL);

      cbSelPalette.Items.Add(CPSFileName);
      cbSelPalette.ItemIndex := CurPalette;
      RenderPal(GlobalPalettes[CurPalette], imgPAL);
    end;
    image1.Picture.Bitmap.Assign(CPSFile.GetBitmap);
    InvalidateRect(image1.Canvas.Handle, nil, FALSE);
    CPSFile.Free;

    (*
    st := TFileStream.Create(CPSfilename, fmOpenRead);

    setLength(buf1, st.size - 10);
    setLength(buf2, 64000);
    st.Seek(10, soFromBeginning);
    st.Read(buf1[0], st.size - 10);

    //x := IDecompress_format80(buf1, buf2, st.size - 10);
    x := Decompress_format80(buf1, buf2, st.size - 10);
    st.Free;

    buf1 := nil;
    setLength(buf1, 64000);
    cmpSize := Compress_format80(buf2, buf1, 64000); //src, dst, srcSize
    setLength(buf1, cmpSize);
    st := TFileStream.Create(ChangeFileExt(CPSfilename, '_X.CPS'), fmCreate);
    aValue := cmpSize - 2;
    st.Write(aValue, 2);
    aValue := $0004;
    st.Write(aValue, 2);
    aValue := $FA00;
    st.Write(aValue, 2);
    x := 0;
    st.Write(x, 4);
    st.Write(buf1[0], cmpSize);
    st.Free;

    img := TDIBUltra.Create(320, 200, DUpf8, @MyPal);
    for y := 0 to 199 do
      for x := 0 to 319 do
        img.PixelsIndex[x, y] := buf2[((y * 320) + x)];
    img.DrawOn(Image1.ClientRect, Image1.Canvas, 0, 0);
    img.Free;
    image1.Refresh;

    buf1 := nil; buf2 := nil;
    *)
  end;
}
end;

(*
procedure TMainForm.Button3Click(Sender: TObject);
//DECODE SHP Button
var MemFile: TMemoryStream;
  numFile: integer;
begin
  // property
  numFile := lvFiles.ItemIndex;
  memFile := TMemoryStream.Create;
  memFile.SetSize(PAKHeader.fSize[numFile]);
  memFile.Position := 0;
  PAKstream.Seek(PAKHeader.fOffs[numFile], soFromBeginning);
  memFile.CopyFrom(PAKStream, PAKHeader.fSize[numFile]);
  DecodeSHP(memFile);
  memFile.Free;
  posRect := Image1.ClientRect;
end;
*)

procedure TMainForm.Button4Click(Sender: TObject);
//Load & Mix PAL Buttons
var x, y, colors: integer;
//  bmpPalette: TDIBUltra;
  numFile: integer;
  i, size, destsize: integer;
  Buf1, Buf2: array of byte;
  tmpExt: string;
  tmpData: TMemoryStream;
  Mix: boolean;
  r, g, b: byte;
  xSelPalette: HPALETTE;

  //Bmp: TDIB256;
  //Bmp2: TFastDIB;

  bmpPalette1: TBitmap;
  OldPal: HPalette;
  col: TColor;
  rgbQ: array[0..255] of RGBQUAD;

begin
  colors := 0;

  Mix := boolean(TButton(Sender).Tag); //se premuto Mix Button fonde la palette dove i colori sono trasparenti
  numFile := lvFiles_CurrentSelection;
  if numFile <> -1 then
  begin
    if (not image1.Picture.Bitmap.Empty) then
    begin
   //bmpBackground.Assign(image1.Picture.Bitmap);
   //colors := GetDIBColorTable(bmpBackground.Canvas.Handle, 0, 256, rgbQ);
      colors := GetDIBColorTable(image1.Canvas.Handle, 0, 256, rgbQ);
    end;

    tmpExt := ExtractFileExt(PakFile.GetFileNameInfo(numFile));
    if (tmpExt = '.COL') or (tmpExt = '.PAL') then
    begin
   //load selected PAL file
      tmpData := TMemoryStream.Create;
      PakFile.ExtractFile(numFile, tmpData, false);
    end else
    begin
      OpenDialog.Filter := 'PAL/COL files (*.col;*.pal)|*.col;*.pal|All files (*.*)|*.*';
      if OpenDialog.Execute then
      begin
        tmpData := TMemoryStream.Create;
        tmpData.LoadFromFile(OpenDialog.FileName);
        tmpData.Position := 0;
      end else exit;
    end;
    size := tmpData.Size;
    if size <> 768 then //check if is compressed
    begin
      dec(size, 10); //size = size - headersize
      setLength(buf1, size);

      tmpData.read(i, 2); //filesize-2
      tmpData.read(i, 2); //always $0004 ???
      tmpData.read(destsize, 2); //size of uncompressed
      tmpData.read(i, 4); //palette ??
      setLength(buf2, destsize);
      tmpData.Read(buf1[0], size);

      i := Decompress_format80(buf1, buf2, size);
    end else begin
      setLength(buf2, size);
      tmpData.Read(buf2[0], size);
    end;
    tmpData.Free;

    with MyPAL do
    begin
      palVersion := $300;
      palNumEntries := 256;
      for i := 0 to 255 do
      begin
        r := byte(buf2[(i * 3)] shl 2);
        g := byte(buf2[(i * 3) + 1] shl 2);
        b := byte(buf2[(i * 3) + 2] shl 2);
        if (mix) and (r = $3F) and (g = $3F) and (b = $3F) then
        begin
 //lascia il vecchio colore
        end else begin
          palPalEntry[i].peRed := r;
          palPalEntry[i].peGreen := g;
          palPalEntry[i].peBlue := b;

          rgbQ[i].rgbRed := r;
          rgbQ[i].rgbGreen := g;
          rgbQ[i].rgbBlue := b;

 //dibImage1.Color[i] := RGB(r, g, b);
        end;
      end;
    end; //with
{
 dibImage1.UpdateColors;
 dibImage1.Draw(image1.Canvas.Handle);
 image1.Refresh;
}
    buf1 := nil; buf2 := nil;
{
 bmp2 := TFastDIB.Create;
 bmp2.SetSize(16,16,8);
 for y := 0 to 16 - 1 do
   for x := 0 to 16 - 1 do
  //bmpPalette.PixelsIndex[x, y] := (y * 16) + x;
  bmp2.PixelsB[y,x] := (y * 16) + x;
 //palette??!!!
 bmp2.Stretch(imgPAL.Canvas.Handle, 0, 0, 160, 160);
 bmp2.Free;
}

 //bmpPalette := TDIBUltra.Create(16, 16, DUpf8, @MyPal);
 {
 bmp := TDIB256.Create(Self);
 bmp.Width := 16;
 bmp.Height := 16;
 for i := 0 to 255 do
   with MyPal.palPalEntry[i] do
  bmp.Color[i] := RGB(peRed, peGreen, peBlue);
 bmp.UpdateColors;

 for y := 0 to 16 - 1 do
   for x := 0 to 16 - 1 do
  //bmpPalette.PixelsIndex[x, y] := (y * 16) + x;
  bmp.Pixel[x, y] := (y * 16) + x;

 //bmpPalette.StretchOn(imgPAL.ClientRect, imgPAL.Canvas);
 //bmpPalette.Free;

//    bmp.StretchDraw(imgPAL.Canvas.Handle, 160, 160);
 bmp.Free;
 imgPAL.Refresh;
}
    RenderPal(MyPAL, imgPAL);
    if (colors > 0) then
    begin
   //SetDIBColorTable(image1.Picture.Bitmap.Canvas.Handle, 0, 256, rgbQ);
   //SetDIBColorTable(bmpBackground.Canvas.Handle, 0, 256, rgbQ);
      SetDIBColorTable(image1.Canvas.Handle, 0, 256, rgbQ);
   //image1.Picture.Bitmap.Assign(bmpBackground);
      image1.Invalidate;
      image1.Refresh;
    end;

{
  image1.Picture.Bitmap.ReleasePalette;
  image1.Picture.Bitmap.IgnorePalette:=true;
  image1.Picture.Bitmap.Palette := CreatePalette(PLogPalette(@MyPAL)^);
  image1.Picture.Bitmap.IgnorePalette:=false;
  updatecolors(image1.Picture.Bitmap.Canvas.Handle);
  SelectPalette (image1.Picture.Bitmap.Canvas.Handle, CreatePalette(PLogPalette(@MyPAL)^), false);
  image1.Refresh;
}

 //SelectPalette (image1.Picture.Bitmap.Canvas.Handle,
//    image1.Picture.Bitmap.ReleasePalette;
 (*
 deleteobject(xSelPalette);
 xSelPalette:=

 updatecolors(image1.Picture.Bitmap.Canvas.Handle);
 *)

//    SelectPalette(image1.Picture.Bitmap.Canvas.Handle, xSelPalette, true);
//    image1.Picture.Bitmap.Palette := CreatePalette(PLogPalette(@MyPAL)^);
  end; //if numfile<>-1
end;

procedure TMainForm.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var findCOL, x1, y1: integer;
begin
(*
  findCOL := Image1.Canvas.Pixels[x, y];
  //findCOL := bigSHP.PixelsIndex[x, y];
  udStartColor.position := findCOL;
  y1 := findCOL div 16;
  x1 := findCOL mod 16;
  imgPAL.Canvas.brush.Color := clYellow;
  imgPAL.Canvas.FrameRect(rect(x1 * 10, y1 * 10, x1 * 10 + 10, y1 * 10 + 10));
  imgPAL.Canvas.FrameRect(rect(0, 0, 10, 10));
  imgPAL.Refresh;
 *)
end;

procedure TMainForm.About1Click(Sender: TObject);
begin
  AboutBoxForm := TAboutBoxForm.Create(nil);
  //AboutBox.Label2.Caption := 'XView v' + Version;
  AboutBoxForm.ShowModal;
  AboutBoxForm.Free;
end;

procedure TMainForm.lvFilesDblClick(Sender: TObject);
var
  kind: byte;
  filename: string;
begin
  filename := lvFiles.ItemFocused.Caption;
  if (PAKMode) and (filename = '..') then
  begin
    ClosePAKFile();
    (*
    lvFiles.ItemIndex := BookmarkSelection1;
    lvFiles_CurrentSelection := lvFiles.ItemIndex;
    ScrollListView(BookmarkSelection1);
    *)
    lvFiles.ItemIndex := BookmarkSelection1;
    lvFiles_CurrentSelection := lvFiles.ItemIndex;
    lvFiles.Selected.MakeVisible(False);
  end else
  begin
    //not PAKMode
    BookmarkSelection1 := lvFiles.ItemIndex;
    kind := GetFileKind(Filename);
    if (kind in [23..25]) then OpenPAKFile(CurrentDirectory + filename);
  end;
end;

procedure TMainForm.btnExpGIFClick(Sender: TObject);
var tmpPicture: TPicture;
  tmpFileName: string;
  FrameIndex: Integer;
begin
  SaveDialog.Filter := 'GIF files (*.gif)|*.gif'; //AVI ????

  if (PakMode) then
  begin
    tmpFileName := lowerCase(PakFile.GetFileNameInfo(lvFiles_CurrentSelection));
  end else
  begin
    tmpFileName := lowerCase(lvFiles.ItemFocused.Caption);
  end;
  SaveDialog.DefaultExt := '.gif';
  SaveDialog.FileName := ChangeFileExt(tmpFileName, '.gif');

  //bug - after this operation the gAnimationFile palette is changed with the GIF optimized one???!!!
  //and the resultant gif has no all the animation! (but the total frames number is correct!!!)
  if SaveDialog.Execute then
  begin
    tmpFileName := SaveDialog.FileName;

    try
      tmpPicture := TPicture.Create;
      GifAnimateBegin;
      {Step through each frame in in-memory list}
      for FrameIndex := 0 to gAnimationFile.TotalFrames - 1 do
      begin
      // add frame to animated gif
        GifAnimateAddImage(gAnimationFile.Frame[FrameIndex], False, 200);
      end;
      // We are using a TPicture but we could have used a TGIFImage instead.
      // By not using TGIFImage directly we do not have to add GIFImage to the uses clause.
      // By using TPicture we only need to add GifAnimate to the uses clause.
      tmpPicture := GifAnimateEndPicture;
      tmpPicture.SaveToFile(tmpFileName); // save gif
      //ImageMovieFrame.Picture.Assign(Picture);  // display gif
      tmpPicture.Free;
    finally
    end; //try
  end; //if
end;

procedure TMainForm.lvFilesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then lvFilesDblClick(Self);
end;

procedure TMainForm.btnDecompress80Click(Sender: TObject);
var buf1, buf2: array of byte;
  sTmp: string;
  mStream: TMemoryStream;
  SelCount, DecompSize: Integer;
begin
  mStream := TMemoryStream.Create;
  SelCount := TestHexEditor.SelCount;
  if (SelCount > 0) then
  begin
    sTmp := TestHexEditor.SelectionAsText;
    setLength(buf1, SelCount);
    Move(sTmp[1], buf1[0], SelCount);
  end else
  begin
    TestHexEditor.SaveToStream(mStream);
    mStream.Position := 0;
    SelCount := mStream.Size;
    setLength(buf1, SelCount);
    mStream.Read(buf1[0], SelCount);
  end;
  mStream.Clear;

  DecompSize := 1000000;
  SetLength(buf2, DecompSize);
  FillChar(buf2[0], DecompSize, 0);

  case TComponent(Sender).Tag of
    0: DecompSize := Decompress_format80(Buf1, Buf2, SelCount);
    1: DecompSize := Decompress_format40(Buf1, Buf2, SelCount);
    2: DecompSize := Decompress_LBM(Buf1, Buf2, SelCount);
    3: correct_lf(Buf1, Buf2);
  end;
  SetLength(buf2, DecompSize);
  mStream.Write(buf2[0], DecompSize);
  TestHexEditor.LoadFromStream(mStream);
  LabelInfoTest.Caption := 'Current size = ' + IntToStr(DecompSize);
  mStream.Free;
end;

procedure TMainForm.btnResetClick(Sender: TObject);
var lvFiles_CurrentSelection: Integer;
  memStream: TMemoryStream;
begin
  TestImage.Picture.Bitmap := nil;

  lvFiles_CurrentSelection := lvFiles.ItemIndex;
  if (PAKMode) then
  begin
    dec(lvFiles_CurrentSelection); //in pakmode listview first item is .. so do not is a filename
    memStream := TMemoryStream.Create;
    PakFile.ExtractFile(lvFiles_CurrentSelection, memStream, false);
    TestHexEditor.LoadFromStream(memStream);
    memStream.Free;
  end else TestHexEditor.LoadFromFile(CurrentDirectory + lvFiles.ItemFocused.Caption);
  LabelInfoTest.Caption := 'Current size = ' + IntToStr(TestHexEditor.DataSize);
end;

procedure TMainForm.btnShowPicClick(Sender: TObject);
var aBitmap: TBitmap;
  y, SelCount, maxY: Integer;
  mStream: TMemoryStream;
  buf1: array of byte;
  P: PByteArray;
begin
  //
  if (TotalPalettes > 0) then MyPAL := GlobalPalettes[CurPalette];
  aBitmap := TBitmap.Create;
  with aBitmap do
  begin
    Width := 320;
    Height := 200;
    PixelFormat := pf8bit;
    Palette := CreatePalette(PLogPalette(@MyPAL)^);
  end; // with

  mStream := TMemoryStream.Create;
  TestHexEditor.SaveToStream(mStream);
  mStream.Position := 0;
  SelCount := mStream.Size;
  setLength(buf1, SelCount);
  mStream.Read(buf1[0], SelCount);
  mStream.Free;

  maxY := SelCount div 320;
  if (maxY > 200) then maxY := 200;
  for y := 0 to maxY - 1 do
  begin
    p := aBitmap.ScanLine[y];
    move(Buf1[y * 320], p^, 320);
  end;
  TestImage.Picture.Bitmap := nil;
  TestImage.Picture.Bitmap.Assign(aBitmap);
  InvalidateRect(TestImage.Canvas.Handle, nil, FALSE);
  aBitmap.Free;
end;

procedure TMainForm.btnSaveHexClick(Sender: TObject);
begin
  SaveDialog.Filter := 'All files (*.*)|*.*';
  if SaveDialog.Execute then
    TestHexEditor.SaveToFile(SaveDialog.FileName);
end;

procedure TMainForm.btnSelectHexClick(Sender: TObject);
begin
  TestHexEditor.SelStart := StrToInt(edSelStart.Text);
  TestHexEditor.SelEnd := StrToInt(edSelEnd.Text);
end;

end.


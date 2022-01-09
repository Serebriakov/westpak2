object MainForm: TMainForm
  Left = 213
  Top = 110
  Width = 818
  Height = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    810
    530)
  PixelsPerInch = 96
  TextHeight = 13
  object lvFiles: TListView
    Left = 0
    Top = 32
    Width = 228
    Height = 497
    Anchors = [akLeft, akTop, akBottom]
    Columns = <
      item
        Caption = 'Filename'
        Width = 130
      end
      item
        Alignment = taRightJustify
        Caption = 'Size'
        Width = 80
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    PopupMenu = PopupMenu1
    SmallImages = imglistType2
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvFilesChange
    OnClick = lvFilesClick
    OnDblClick = lvFilesDblClick
    OnKeyDown = lvFilesKeyDown
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 810
    Height = 29
    Caption = 'ToolBar1'
    Flat = True
    Images = ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = SelectGameDir
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Action = ExtractFromPAK
      ImageIndex = 2
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Hint = 'Save PAK'
      Caption = 'ToolButton3'
      Enabled = False
      ImageIndex = 6
      Visible = False
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 7
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton5: TToolButton
      Left = 77
      Top = 0
      Action = AddFile
      Visible = False
    end
    object ToolButton6: TToolButton
      Left = 100
      Top = 0
      Action = RemoveFile
      Visible = False
    end
  end
  object PageControl: TPageControl
    Left = 228
    Top = 28
    Width = 581
    Height = 501
    ActivePage = tabGraphics
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    OnChange = PageControlChange
    object tabGraphics: TTabSheet
      Caption = 'Media View'
      DesignSize = (
        573
        473)
      object GroupBox1: TGroupBox
        Left = 366
        Top = 104
        Width = 393
        Height = 345
        Anchors = [akTop, akRight]
        Caption = 'Testing commands'
        TabOrder = 0
        Visible = False
        object Label1: TLabel
          Left = 64
          Top = 80
          Width = 61
          Height = 13
          Caption = 'VMP list start'
        end
        object Label2: TLabel
          Left = 64
          Top = 104
          Width = 118
          Height = 13
          Caption = 'VMP display foreground[]'
        end
        object Label3: TLabel
          Left = 64
          Top = 128
          Width = 91
          Height = 13
          Caption = 'heigth (pixelsquare)'
        end
        object Label4: TLabel
          Left = 64
          Top = 152
          Width = 87
          Height = 13
          Caption = 'width (pixelsquare)'
        end
        object Label5: TLabel
          Left = 64
          Top = 176
          Width = 121
          Height = 13
          Caption = 'width to skip (pixelsquare)'
        end
        object Memo1: TMemo
          Left = 8
          Top = 240
          Width = 377
          Height = 57
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 8
          Top = 80
          Width = 57
          Height = 21
          TabOrder = 1
          Text = '330'
        end
        object Edit3: TEdit
          Left = 8
          Top = 104
          Width = 57
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object Edit4: TEdit
          Left = 8
          Top = 128
          Width = 57
          Height = 21
          TabOrder = 3
          Text = '15'
        end
        object Edit5: TEdit
          Left = 8
          Top = 152
          Width = 57
          Height = 21
          TabOrder = 4
          Text = '3'
        end
        object Edit6: TEdit
          Left = 8
          Top = 176
          Width = 57
          Height = 21
          Enabled = False
          TabOrder = 5
          Text = '0'
        end
        object btnDrawWall: TButton
          Left = 8
          Top = 204
          Width = 113
          Height = 25
          Caption = 'Draw Wall!'
          TabOrder = 6
          OnClick = btnDrawWallClick
        end
        object CheckBox1: TCheckBox
          Left = 120
          Top = 192
          Width = 97
          Height = 17
          Caption = 'leave background'
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object Button1: TButton
          Left = 136
          Top = 72
          Width = 41
          Height = 25
          Caption = 'NEXT'
          TabOrder = 8
          OnClick = Button1Click
        end
        object Button8: TButton
          Left = 160
          Top = 120
          Width = 65
          Height = 25
          Caption = 'ADD'
          TabOrder = 9
          OnClick = Button8Click
        end
        object Button5: TButton
          Tag = 1
          Left = 168
          Top = 305
          Width = 105
          Height = 25
          Caption = 'Mix PAL'
          TabOrder = 10
          OnClick = Button4Click
        end
        object Button4: TButton
          Left = 280
          Top = 305
          Width = 105
          Height = 25
          Caption = 'LoadPAL'
          TabOrder = 11
          OnClick = Button4Click
        end
        object udStartColor: TUpDown
          Left = 145
          Top = 309
          Width = 16
          Height = 21
          Associate = Edit1
          Max = 255
          Position = 128
          TabOrder = 12
        end
        object Edit1: TEdit
          Left = 104
          Top = 309
          Width = 41
          Height = 21
          TabOrder = 13
          Text = '128'
        end
        object Button7: TButton
          Left = 14
          Top = 305
          Width = 75
          Height = 25
          Caption = 'next decomp'
          TabOrder = 14
          OnClick = Button7Click
        end
        object Button3: TButton
          Left = 8
          Top = 48
          Width = 81
          Height = 25
          Caption = 'Decode SHP'
          TabOrder = 15
        end
      end
      object ScrollBox1: TScrollBox
        Left = 8
        Top = 232
        Width = 352
        Height = 241
        HorzScrollBar.Smooth = True
        HorzScrollBar.Tracking = True
        VertScrollBar.Smooth = True
        VertScrollBar.Tracking = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoScroll = False
        BorderStyle = bsNone
        TabOrder = 1
        DesignSize = (
          352
          241)
        object Image1: TImage
          Left = 0
          Top = 0
          Width = 318
          Height = 200
          Cursor = crCross
          Anchors = [akLeft, akTop, akRight, akBottom]
          OnMouseDown = Image1MouseDown
        end
      end
      object PlayCtrlPanel: TPanel
        Left = 8
        Top = 176
        Width = 321
        Height = 49
        TabOrder = 2
        Visible = False
        object btnPlay: TSpeedButton
          Left = 5
          Top = 4
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400040404000404040004040400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000404040077777700777777007777770004040400FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400B2B2B200B2B2B200B2B2B200777777000404
            0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400B2B2B200B2B2B200B2B2B200B2B2B2007777
            770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400B2B2B200B2B2B200B2B2B200B2B2B200B2B2
            B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400E3E3E300B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B200B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400E3E3E300B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400E3E3E300B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400FFFFFF00B2B2B200B2B2B200B2B2B200B2B2
            B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400FFFFFF00B2B2B200B2B2B200B2B2B2000404
            0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400FFFFFF00E3E3E300B2B2B20004040400FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400040404000404040004040400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Visible = False
          OnClick = btnPlayClick
        end
        object btnNext: TSpeedButton
          Left = 70
          Top = 4
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000404
            040004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400040404000404040004040400FF00FF00FF00FF00FF00FF000404
            04007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400777777007777770004040400FF00FF00FF00FF00FF00FF000404
            0400B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00
            FF0004040400B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400CCCCCC00B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00
            FF0004040400B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400CCCCCC00B2B2B200B2B2B200B2B2B2007777770004040400FF00FF00FF00
            FF0004040400CCCCCC00B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400E3E3E300B2B2B200B2B2B200B2B2B200B2B2B2007777770004040400FF00
            FF0004040400CCCCCC00B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400E3E3E300B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20004040400FF00
            FF0004040400E3E3E300B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400E3E3E300B2B2B200B2B2B200B2B2B200B2B2B20004040400FF00FF00FF00
            FF0004040400E3E3E300B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00B2B2B200B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00
            FF0004040400E3E3E300B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00
            FF0004040400FFFFFF00B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400FFFFFF00B2B2B20004040400FF00FF00FF00FF00FF00FF000404
            0400B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400FFFFFF00E3E3E30004040400FF00FF00FF00FF00FF00FF000404
            040004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400040404000404040004040400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Visible = False
          OnClick = btnNextClick
        end
        object btnPrev: TSpeedButton
          Left = 46
          Top = 4
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000404
            0400040404000404040004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000404040004040400FF00FF00FF00FF00FF00FF000404
            0400777777007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00040404007777770004040400FF00FF00FF00FF00FF00FF000404
            0400B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400777777007777770004040400FF00FF00FF00FF00FF00FF000404
            0400B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF000404
            040077777700B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF00040404007777
            7700B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400CCCCCC00B2B2B20004040400FF00FF00FF00FF000404040077777700B2B2
            B200B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400CCCCCC00B2B2B20004040400FF00FF000404040077777700B2B2B200B2B2
            B200B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400E3E3E300B2B2B20004040400FF00FF0004040400CCCCCC00B2B2B200B2B2
            B200B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400E3E3E300B2B2B20004040400FF00FF00FF00FF0004040400E3E3E300B2B2
            B200B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400E3E3E300B2B2B20004040400FF00FF00FF00FF00FF00FF0004040400FFFF
            FF00B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00B2B2B2007777770004040400FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0004040400E3E3E3007777770004040400FF00FF00FF00FF00FF00FF000404
            0400FFFFFF00E3E3E30004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0004040400CCCCCC0004040400FF00FF00FF00FF00FF00FF000404
            0400040404000404040004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000404040004040400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Visible = False
          OnClick = btnPrevClick
        end
        object frameBar: TScrollBar
          Left = 5
          Top = 31
          Width = 310
          Height = 13
          Max = 0
          PageSize = 0
          TabOrder = 0
          OnChange = frameBarChange
        end
        object edFrameNum: TEdit
          Left = 96
          Top = 5
          Width = 33
          Height = 21
          BorderStyle = bsNone
          TabOrder = 1
          Text = '0'
          Visible = False
        end
        object udFrameNum: TUpDown
          Left = 129
          Top = 5
          Width = 16
          Height = 21
          Associate = edFrameNum
          TabOrder = 2
          Visible = False
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 98
        Width = 321
        Height = 73
        Caption = 'Palette'
        TabOrder = 3
        object imgPAL: TImage
          Left = 11
          Top = 18
          Width = 32
          Height = 16
        end
        object SpeedButton1: TSpeedButton
          Left = 280
          Top = 32
          Width = 23
          Height = 22
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BD4A
            0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
            0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000FF00FF00BD4A
            0000FFFFFF00FFFFFF00FFFFF700FFEFDE00FFE7CE00FFDEB500FFD6A500FFCE
            9400FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400BD4A0000FF00FF00BD4A
            0000FFFFFF00FFFFFF00FFFFFF00FFFFF700FFEFDE00FFE7CE00FFDEB500FFD6
            A500FFCE9400FFCE9400FFCE9400FFCE9400FFCE9400BD4A0000FF00FF00BD4A
            0000FFFFFF002952FF002952FF002952FF00FFFFF7008C2900008C2900008C29
            0000FFD6A5000084BD000084BD000084BD00FFCE9400BD4A0000FF00FF00BD4A
            0000FFFFFF002952FF002952FF002952FF00FFFFFF008C2900008C2900008C29
            0000FFDEB5000084BD000084BD000084BD00FFCE9400BD4A0000FF00FF00BD4A
            0000FFFFFF002952FF002952FF002952FF00FFFFFF008C2900008C2900008C29
            0000FFE7CE000084BD000084BD000084BD00FFCE9400BD4A0000FF00FF00BD4A
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            F700FFEFDE00FFE7CE00FFDEB500FFD6A500FFCE9400BD4A0000FF00FF00BD4A
            0000FFFFFF00BD848400BD848400BD848400FFFFFF00DE630000DE630000DE63
            0000FFFFF700008400000084000000840000FFD6A500BD4A0000FF00FF00BD4A
            0000FFFFFF00BD848400BD848400BD848400FFFFFF00DE630000DE630000DE63
            0000FFFFFF00008400000084000000840000FFDEB500BD4A0000FF00FF00BD4A
            0000FFFFFF00BD848400BD848400BD848400FFFFFF00DE630000DE630000DE63
            0000FFFFFF00008400000084000000840000FFE7CE00BD4A0000FF00FF00BD4A
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFEFDE00BD4A0000FF00FF00BD4A
            0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
            0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object cbSelPalette: TComboBox
          Left = 48
          Top = 16
          Width = 161
          Height = 21
          AutoComplete = False
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbSelPaletteChange
        end
        object btnSavePal: TButton
          Left = 8
          Top = 42
          Width = 81
          Height = 25
          Caption = 'Save palette...'
          Enabled = False
          TabOrder = 1
          OnClick = btnSavePalClick
        end
        object btnImportPal: TButton
          Left = 96
          Top = 42
          Width = 81
          Height = 25
          Caption = 'Import palette...'
          TabOrder = 2
          OnClick = btnImportPalClick
        end
        object btnRotPal: TButton
          Left = 184
          Top = 42
          Width = 89
          Height = 25
          Caption = 'Rotate Pal +'
          TabOrder = 3
          OnClick = btnRotPalClick
        end
      end
      object ProgressBar: TProgressBar
        Left = 376
        Top = 132
        Width = 185
        Height = 13
        TabOrder = 4
        Visible = False
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = 1
        Width = 563
        Height = 96
        Caption = 'Info'
        TabOrder = 5
        object lbGFXInfo: TLabel
          Left = 8
          Top = 19
          Width = 337
          Height = 69
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object btnExpGIF: TButton
          Left = 360
          Top = 44
          Width = 89
          Height = 25
          Caption = 'Export to GIF...'
          Enabled = False
          TabOrder = 0
          OnClick = btnExpGIFClick
        end
        object btnExpGraphics: TButton
          Left = 360
          Top = 13
          Width = 121
          Height = 25
          Caption = 'Export to PNG/BMP...'
          Enabled = False
          TabOrder = 1
          OnClick = btnExpGraphicsClick
        end
        object PreserveBackCheckBox: TCheckBox
          Left = 360
          Top = 75
          Width = 129
          Height = 17
          Caption = 'Preserve background'
          TabOrder = 2
        end
      end
    end
    object tabAudio: TTabSheet
      Caption = 'Media View'
      ImageIndex = 1
      object btnExpWAV: TButton
        Left = 16
        Top = 232
        Width = 105
        Height = 25
        Caption = 'Convert to WAV...'
        Enabled = False
        TabOrder = 0
        OnClick = btnExpWAVClick
      end
      object Panel1: TPanel
        Left = 8
        Top = 192
        Width = 321
        Height = 30
        BevelOuter = bvLowered
        TabOrder = 1
        object btnPlay1: TSpeedButton
          Tag = 1
          Left = 5
          Top = 4
          Width = 23
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400040404000404040004040400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000404040077777700777777007777770004040400FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400B2B2B200B2B2B200B2B2B200777777000404
            0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400B2B2B200B2B2B200B2B2B200B2B2B2007777
            770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400B2B2B200B2B2B200B2B2B200B2B2B200B2B2
            B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400CCCCCC00B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B200B2B2B2007777770004040400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400E3E3E300B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B200B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400E3E3E300B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400E3E3E300B2B2B200B2B2B200B2B2B200B2B2
            B200B2B2B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400FFFFFF00B2B2B200B2B2B200B2B2B200B2B2
            B20004040400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400FFFFFF00B2B2B200B2B2B200B2B2B2000404
            0400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400FFFFFF00E3E3E300B2B2B20004040400FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0004040400040404000404040004040400FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPlayClick
        end
      end
    end
    object tabScript: TTabSheet
      Caption = 'String Table'
      ImageIndex = 2
      DesignSize = (
        573
        473)
      object Label6: TLabel
        Left = 0
        Top = 8
        Width = 54
        Height = 13
        AutoSize = False
        Caption = 'TEXT table'
      end
      object lbTextTable: TListBox
        Left = 0
        Top = 24
        Width = 567
        Height = 369
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object tabPAKPreview: TTabSheet
      Caption = 'PAK Preview'
      ImageIndex = 3
      DesignSize = (
        573
        473)
      object GroupBox5: TGroupBox
        Left = 6
        Top = 1
        Width = 563
        Height = 89
        Caption = 'Info'
        TabOrder = 0
        object lbPAKInfo: TLabel
          Left = 8
          Top = 20
          Width = 305
          Height = 53
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object btnOpenPAK: TButton
          Tag = 1
          Left = 328
          Top = 20
          Width = 113
          Height = 25
          Caption = 'Open PAK'
          TabOrder = 0
          OnClick = btnOpenPAKClick
        end
      end
      object lbPAKPreview: TListBox
        Left = 8
        Top = 96
        Width = 559
        Height = 369
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelKind = bkSoft
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object tabTextView: TTabSheet
      Caption = 'Text View'
      ImageIndex = 4
      object MemoText: TMemo
        Left = 0
        Top = 0
        Width = 573
        Height = 473
        Align = alClient
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object tabHex: TTabSheet
      Caption = 'Hex View'
      ImageIndex = 5
      object GroupBox3: TGroupBox
        Left = 6
        Top = 1
        Width = 563
        Height = 89
        Caption = 'Info'
        TabOrder = 0
        object lbGenericInfo: TLabel
          Left = 8
          Top = 20
          Width = 305
          Height = 53
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object btnDecompressHex: TButton
          Left = 320
          Top = 28
          Width = 105
          Height = 25
          Caption = 'Try decompression'
          TabOrder = 0
          OnClick = btnDecompressHexClick
        end
        object btnSave: TButton
          Left = 432
          Top = 28
          Width = 113
          Height = 25
          Action = ExtractFromPAK
          TabOrder = 1
        end
        object btnSaveDecomp: TButton
          Tag = 1
          Left = 432
          Top = 60
          Width = 113
          Height = 25
          Action = ExtractDecompFromPAK
          TabOrder = 2
        end
      end
      object MPHexEditor: TMPHexEditor
        Left = 0
        Top = 96
        Width = 573
        Height = 377
        Cursor = crIBeam
        Align = alBottom
        Anchors = [akTop, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        BytesPerRow = 16
        Translation = tkAsIs
        OffsetFormat = '-!10:0x|'
        Colors.Background = clWindow
        Colors.ChangedBackground = 11075583
        Colors.ChangedText = clMaroon
        Colors.CursorFrame = clNavy
        Colors.Offset = clBlack
        Colors.OddColumn = clBlue
        Colors.EvenColumn = clNavy
        Colors.CurrentOffsetBackground = clBtnShadow
        Colors.OffsetBackGround = clBtnFace
        Colors.CurrentOffset = clBtnHighlight
        Colors.Grid = clBtnFace
        Colors.NonFocusCursorFrame = clAqua
        Colors.ActiveFieldBackground = clWindow
        FocusFrame = True
        DrawGridLines = False
        ReadOnlyView = True
        Version = 'May 23, 2005; '#169' markus stephany, vcl[at]mirkes[dot]de'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Lab'
      ImageIndex = 6
      object GroupBox6: TGroupBox
        Left = 6
        Top = 1
        Width = 563
        Height = 224
        Caption = 'Info'
        TabOrder = 0
        object LabelInfoTest: TLabel
          Left = 8
          Top = 20
          Width = 217
          Height = 37
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object TestImage: TImage
          Left = 232
          Top = 16
          Width = 320
          Height = 200
        end
        object Label7: TLabel
          Left = 144
          Top = 192
          Width = 17
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = '-'
        end
        object btnDecompress80: TButton
          Left = 8
          Top = 60
          Width = 105
          Height = 25
          Caption = 'Decompress80'
          TabOrder = 0
          OnClick = btnDecompress80Click
        end
        object btnDecompress40: TButton
          Tag = 1
          Left = 120
          Top = 60
          Width = 105
          Height = 25
          Caption = 'Decompress40'
          TabOrder = 1
          OnClick = btnDecompress80Click
        end
        object btnDecompressLBM: TButton
          Tag = 2
          Left = 8
          Top = 92
          Width = 105
          Height = 25
          Caption = 'DecompressLBM'
          TabOrder = 2
          OnClick = btnDecompress80Click
        end
        object btnDecodeLF: TButton
          Tag = 3
          Left = 120
          Top = 92
          Width = 105
          Height = 25
          Caption = 'DecodeLF'
          TabOrder = 3
          OnClick = btnDecompress80Click
        end
        object btnShowPic: TButton
          Left = 120
          Top = 124
          Width = 105
          Height = 25
          Caption = 'Show as pic'
          TabOrder = 4
          OnClick = btnShowPicClick
        end
        object btnReset: TButton
          Left = 8
          Top = 124
          Width = 105
          Height = 25
          Caption = 'Reset'
          TabOrder = 5
          OnClick = btnResetClick
        end
        object btnSaveHex: TButton
          Left = 8
          Top = 156
          Width = 105
          Height = 25
          Caption = 'Save As ...'
          TabOrder = 6
          OnClick = btnSaveHexClick
        end
        object btnSelectHex: TButton
          Left = 8
          Top = 192
          Width = 75
          Height = 25
          Caption = 'Select'
          TabOrder = 7
          OnClick = btnSelectHexClick
        end
        object edSelStart: TEdit
          Left = 88
          Top = 192
          Width = 57
          Height = 21
          TabOrder = 8
        end
        object edSelEnd: TEdit
          Left = 160
          Top = 192
          Width = 65
          Height = 21
          TabOrder = 9
        end
      end
      object TestHexEditor: TMPHexEditor
        Left = 0
        Top = 232
        Width = 573
        Height = 241
        Cursor = crIBeam
        Align = alBottom
        Anchors = [akTop, akBottom]
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        BytesPerRow = 16
        Translation = tkAsIs
        OffsetFormat = '-!10:0x|'
        Colors.Background = clWindow
        Colors.ChangedBackground = 11075583
        Colors.ChangedText = clMaroon
        Colors.CursorFrame = clNavy
        Colors.Offset = clBlack
        Colors.OddColumn = clBlue
        Colors.EvenColumn = clNavy
        Colors.CurrentOffsetBackground = clBtnShadow
        Colors.OffsetBackGround = clBtnFace
        Colors.CurrentOffset = clBtnHighlight
        Colors.Grid = clBtnFace
        Colors.NonFocusCursorFrame = clAqua
        Colors.ActiveFieldBackground = clWindow
        FocusFrame = True
        DrawGridLines = False
        Version = 'May 23, 2005; '#169' markus stephany, vcl[at]mirkes[dot]de'
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 136
    Top = 24
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Action = SelectGameDir
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Fix1: TMenuItem
      Caption = 'Fix'
      object None1: TMenuItem
        Caption = 'None'
        Checked = True
        GroupIndex = 1
        RadioItem = True
        OnClick = None1Click
      end
      object Dune21: TMenuItem
        Tag = 1
        Caption = 'Dune2'
        GroupIndex = 1
        RadioItem = True
        OnClick = None1Click
      end
      object LandofLore1: TMenuItem
        Tag = 2
        Caption = 'Land of Lore 1'
        GroupIndex = 1
        RadioItem = True
        OnClick = None1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About...'
        OnClick = About1Click
      end
    end
  end
  object ImageList1: TImageList
    Left = 96
    Top = 32
    Bitmap = {
      494C010109000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0025A1D10072C7E70085D7
      FA0066CDF90065CDF90065CDF90065CDF90065CDF80065CDF90065CDF80066CE
      F90039ADD800078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE004CBCE70039A8D100A0E2
      FB006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D90084D7EB00078DBE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900AEF1F900078DBE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0079DDFB001899C7009ADF
      F30092E7FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00B3F4F900078DBE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0082E3FC0043B7DC0065C3
      E000ACF0FD008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD000C85
      18004CBBDA00B6F7F9006DCAE000078DBE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE008AEAFC0077DCF300229C
      C600FDFFFF00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE000C8518003CBC
      5D000C851800DEF9FB00D6F6F900078DBE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE0093F0FE0093F0FD001697
      C500078DBE00078DBE00078DBE00078DBE00078DBE000C85180052D97F0062ED
      970041C465000C851800078DBE00078DBE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE000C85180046CE6C0059E4880058E1
      880061EB940040C165000C851800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE000C8518000C8518000C8518000C85180056E1
      840047CD6E000C8518000C8518000C8518000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078CB60043B7DC0043B7DC0043B7DC000C8518004EDD
      790036BA54000C85180000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000000000000C85180040D0
      65000C8518000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C8518002AB743002DBA
      49000C8518000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C85180021B538000C85
      1800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518000C8518000C8518000C8518000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000C8518000C8518000C8518000C85180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4D4D200BCA19800B299
      9000B3989600B1989700B3989600B3989700B3979600B4989500AF989800B597
      8F00B4979000B6979200B59B9500D5CFD1000000000000000000AD5A5A00AD52
      5200A54A4A00AD949400C6CEC600CECEC600CECEC600C6CEC600C6CEC600B59C
      9C009C4242009C424200A5525200000000000000000000000000000000000000
      0000000000003131310000000000000000000000000000000000000000000000
      000000000000000000000000000031313100000000001894CE0021A5D6001094
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2CBCA00BB6D4A00E87D3A00E976
      3100CF806000C7A5A100C7A4A300C8A6A400C7A5A300C8A6A500C7A6A200E467
      1E00E75D0600EB691600C9561200B69B930000000000BD7B7300CE636300CE6B
      6B00B55A5A009C848400BDA5A500E7CECE00FFF7F700FFFFF700F7F7F700CEB5
      B500942929009C313100C65A5A00AD5A5A000000000000000000000000000000
      0000000000003131310000000000D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100000000001894CE009CEFFF006BE7
      F70031B5DE0031B5DE0031B5DE0021A5D6001094CE0000000000000000000000
      000000000000000000000000000000000000C5837400EE853D00FB803400F882
      2C00D99A6E00C6BDBA00C1B0AF00D4C6C500D5C7C600D5C8C800D4C5C100E06D
      2000EE640500F2650200D0570200B299920000000000BD7B7300CE636300CE63
      6300B55A5A009C7B7B009C424200B5737300E7DEDE00FFF7F700FFFFFF00D6B5
      B500943131009C313100BD5A5A00AD5A5A000000000008080800080808000000
      0000000000003131310000004A0000004A00D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100000000001894CE0094E7F70084FF
      FF007BF7FF0084F7FF007BF7FF0073EFFF006BE7F70031B5DE0031B5DE0021A5
      D60000000000000000000000000000000000CA846F00F6853B00FA823800FB83
      2B00DD947200C8BBBA00AFA4A100DBD2D300DCD2D300DFD3D200DBCCC800D368
      1B00DC600100F1670200D5550200B69A910000000000BD7B7300CE636300CE63
      6300B55A5A00AD8484009C3939009C393900CEBDBD00EFEFEF00FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A00080808000808A5000808BD000808
      080000000000000000000810CE0010107B0000004A00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100000000001894CE0073CEE70094FF
      FF0073F7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF007BEFFF005AD6
      F700189CCE00000000000000000000000000CA846E00F8853C00FD833300FE82
      3000D0946E00C2BDC000A7A0A200E0D8DB00E5DBDE00E5DBDB00DAD0D900C061
      1A00CE5A0200F5650300D2570200B799930000000000BD7B7300CE636300CE63
      6300B55A5A00B58C8C009C4A4A0094313100A59C9C00D6D6D600FFFFFF00E7C6
      C6009429290094313100BD5A5A00AD5A5A00080808003131F7000810DE000808
      BD00000000000810D6000810E7000810DE0000004A00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100000000001894CE0031B5DE0094E7
      F7007BF7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF005AD6
      F70039BDE700000000000000000000000000CD876F00F8863A00FE843300F980
      3100CA886000DECBC600DAC8C400D9C9C300DAC8C200DBC8C300DABFB700B55A
      1600BF540200F0670100D15A0200B59A910000000000BD7B7300CE636300CE63
      6300BD5A5A00C6948C00C6949400B5848400AD8C8C00BDA5A500E7C6C600DEAD
      AD00A5393900A5393900C65A5A00AD5A5A0008080800848CFF00636BF7001010
      F7000810D6000810F7001821F7000810CE0000004A00DEDEDE00D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100000000001894CE0063DEF70031B5
      DE0084FFFF0073F7FF0073EFFF0000630800006B0800007308000063080052D6
      EF005AD6F700189CCE000000000000000000CF876F00F6853900FC853200F580
      3000EB812E00E8833900EB854000EB863C00EB833A00E77F3200E5782800F26E
      0C00E8650900FA670200CF5A0200B39C910000000000BD7B7300CE636300CE63
      6300CE636300CE636300CE636300CE636300CE636300C65A5A00C65A5A00CE63
      6300CE636300CE636300CE6B6B00AD525A0000000000080808004A4AF7002931
      F7000810F7001821F7001818F70000004A00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600D6D6D600D6D6D6000000000031313100000000001894CE007BF7FF0031B5
      DE0094E7F70094E7F7008CEFFF008CF7FF0073EFFF00006B0800008C08000063
      08006BE7F70039BDE7000000000000000000CE896D00F8853900EC8E4E00E8BF
      A400E7C3A800E5C1A600E3BEA200E0BC9E00DCB89A00D8B59800D7B29400D9AE
      8A00D59E6F00EF6B0800D6580600B59E8F0000000000BD7B7300B5525200B55A
      5A00C6848400D6A5A500D6ADAD00D6ADA500D6ADAD00D6A5A500D6A5A500D6AD
      A500D6ADAD00D69C9C00CE636300AD52520000000000080808000810E7002931
      F7006B73FF00424AF7000810DE0000004A00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00D6D6D600D6D6D6000000000031313100000000001894CE0084FFFF006BEF
      FF0031B5DE0031B5DE0031B5DE0031B5DE009CEFFF0073EFFF0000730800008C
      080063DEF70063DEF7001094CE0000000000CF8C6F00F4944D00EAB18800FAF7
      F900F9F7F700F4F0F100F0ECEC00EEE9E900E9E4E400E7E0E200E3DBDE00DBD9
      DA00D7CEC700EC8B3F00D2601300B69D910000000000BD7B7300AD524A00E7CE
      CE00F7F7F700F7F7EF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700DEBDBD00C65A5A00AD525A00080808000810F7006B73FF009C9C
      FF005A5AF7007B7BFF002121F7000810CE0000004A00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00D6D6D6000000000031313100000000001894CE0084F7FF007BF7
      FF007BF7FF007BF7FF0073F7FF0052D6EF0031B5DE0084DEF70000630800089C
      1800006B080094EFFF0031A5D60000000000CF8C6F00F8A77000EAB79300F5F4
      F100E2E3E400DEDFE100DBDBDC00D8D8D900D5D4D600D4D2D200D2CECC00D0CB
      CC00E0D0CC00EB985600DA7D3800B89D910000000000BD7B7300B5524A00EFD6
      D600FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00F7F7F700DEBDBD00C65A5A00AD525A00080808006B73FF009C9CFF006B73
      F700181818007B7BFF007B7BFF002121F70000004A00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE000000000031313100000000001894CE0084FFFF007BF7
      FF007BF7FF007BEFFF007BF7FF007BF7FF006BE7F70031B5DE000873100018B5
      31000884100031A5D600189CCE0000000000D18F6E00F8AD7B00EEBD9C00FCFB
      FA00F9F9F900F6F6F600F3F2F200F1EFEF00EDEBEB00EAE8E800E7E5E500E3E1
      E100E2D7D100EFA16600DB854200B69C950000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A0008080800B5B5FF006B6BF7001818
      18000000000018181800424AF7007373FF0000004A00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE000000000031313100000000001894CE008CFFFF007BF7
      FF007BF7FF007BF7FF0073E7FF007BE7FF007BE7FF00005A000031CE5A0029C6
      520018B53100005A00000000000000000000D3916E00F9B38500EFC3A500F6F6
      F300E5E5E500E3E3E300DFDEDE00DDDBDB00D9D7D700D8D6D600D6D4D400D6D4
      D400E3DAD500F0AA7700DB8C4E00B89D920000000000BD7B7300B5524A00EFD6
      D600EFEFEF00DED6D600DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DED6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000008080800080808000000
      0000000000003131310000004A0000004A00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE000000000031313100000000001094CE001894CE008CEF
      FF0084F7FF006BE7F700189CCE001094CE001894CE001894CE00005A000042E7
      7300005A0000000000000000000000000000D5936E00F9B88F00F0C9AE00FAF9
      F600F3F3F300F0F0F000EEEDED00EDEBEB00E9E7E700E6E4E500E4E2E200E4E2
      E200E7DEDB00F1B38600DC935800BA9E910000000000BD7B7300B5524A00EFD6
      D600F7F7EF00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DEDE00E7DE
      DE00EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000313131000000000000000000000000001894
      CE00189CCE001894CE000000000000000000000000000000000000000000005A
      000000000000000000000000000000000000D7956E00DAA28400E3C5A800F5F6
      F700F0F0F100F0F0F100EDEDEF00EBEAEC00E8E8E900E7E5E700E6E2E500E5E2
      E400EBE3E100CFA67E00CE8D5B00B69F900000000000BD7B7300B5524A00EFD6
      D600EFEFEF00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6
      D600EFEFEF00DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D19A7200DCAD8A00E2C6B400F9F7
      F300FAF9F400FAF9F400F9F8F300F8F7F100F6F4EF00F5F3EE00F3F0ED00F2EF
      EC00EAE5E000D9AE8E00D3906400C0A89C0000000000BD7B7300B5524A00E7D6
      CE00FFF7F700F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      EF00FFF7F700DEBDBD00C65A5A00AD525A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EDCCB700D9A37C00DCA58000DAB0
      9600DBB29600DCB39700DBB29500DBB29500DAB19500DBB19500DBB09300DAB0
      9300DCAD9000D49E7800D79D7400E8DDD5000000000000000000AD524A00CEB5
      B500D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00D6D6D600CEADAD00A54A4A00000000000000000000000000C8D0E20091A3
      BC00ADB6C000CDCFD100E1E4E200EEF1EC00F9F9F90000000000000000000000
      00000000000000000000000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000088CC600088CC6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310031313100313131003131310031313100313131003131
      31003131310031313100313131003131310000000000000000006791CB006BC4
      FB005FB5E90063A4D7006898C6007594BA00909EB700B3B9C400CFD1D300E4E5
      E500F1F1F100F8FBF6000000000000000000078DBE0063CBF800078DBE00A3E1
      FB0066CDF90065CDF80065CDF90065CDF90065CDF80065CDF90065CDF80066CD
      F8003AADD800ACE7F500078DBE0000000000088CC60094E7F7005ADEEF00088C
      C600088CC600088CC600088CC600088CC6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310000000000000000000000000000000000000000000000
      00000000000000000000000000003131310000000000F3F2F7004883CA0064C4
      F60067D0FB006BD4F90071D7FC0076D9FC0072D1F40068BCE30065A9D4006B9B
      C5007997B8009EA6BD00EAE8E90000000000078DBE006AD1F900078DBE00A8E5
      FC006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D900B1EAF500078DBE0000000000088CC600A5E7F7008CFFFF0084FF
      FF0084F7FF0084F7FF007BF7FF0063DEFF00088CC600088CC600006B0800106B
      0800000000000000000000000000000000000000000000000000000000000000
      0000080808000808080008080800DEDEDE00D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100D5CDC600ADB0B2004182BD005CB5
      E7006BCEF80074D2F50075D5F60077D9F6007DDCF8007CDFFD007CE2FC0080E5
      FB0081E4FA005FA9D400C0C6CC0000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900B6EEF600078DBE00000000000894CE0042ADD6009CFFFF0073F7
      FF007BF7FF0042B594002194420021944A00299C4A00218C4200007B1000008C
      0800087B18000000000000000000000000000000000000000000000000000808
      080000BD390000BD390000BD390000521800D6D6D600D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100CBB18C00E6DDCD00CED3D6006CAA
      E10088D8F2008EDAF70090DCF50093E0F50087D9EF0086E7FE0085E8FD0085E8
      FE0084E8FE0068BAE600A6AFBB00F8FAFC00078DBE0079DDFB00078DBE00B5EE
      FD0083E4FB0044B181000A8313000C8D170044B0810079DBE90083E4FB0084E5
      FC0048B9DA00BBF2F600078DBE000000000021A5D60042ADD6009CF7F70073F7
      FF0084FFFF0031945A0029BD4A0029BD4A0021B5420018AD420010A5310008A5
      180000940800006B000000000000000000000000000000000000000000000808
      080010E7520010D64A0000BD390000521800DEDEDE00D6D6D600D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100D0BFA500FCFDFC00F4F8FB006BAB
      E0008CE1FB0093E3FD009BE7FD00A5ECFD009BE2F2009AECFE009BEFFD0099EF
      FE0097EFFE007FD3F3008B9AB500F7F7F700078DBE0081E2F900078DBD00BAF3
      FD008DEBFC008DEBFC0053BE96000D9718000C981800279747008AE9F8008DEB
      FC004CBBDA00BEF4F700078DBE000000000029A5D6005ADEEF0042ADD60084FF
      FF0084FFFF0031945A0031C6520039D6630029BD4A0021B5420021B5420010A5
      310008A51800008C080000520000000000000000000008080800080808000808
      080018EF5A0010D64A0000BD3900005218000052180000521800D6D6D600D6D6
      D600D6D6D600D6D6D6000000000031313100D1BFA400FCFDFA00FAFBFB0078AC
      E00094E0FB009EE4FB00A9E8FB00B4ECFB00AAE7F200AEF2FE00AFF4FD00ACF5
      FD00A9F5FE0091E4F6007A93BA00F2F2F000078DBE0089EAFB00078DBD00FFFF
      FF00C9F7FE00C8F7FE00C9F7FE0073C396000E9D1B000C96170033994600C8F7
      FE009BD5E700DEF9FB00078DBE000000000029A5D6007BEFF70042ADD600A5FF
      FF0073FFFF0042B5940031AD5A0029AD630029AD6300088CC60010A5390018B5
      5200089C210010843100088CC600000000000808080008CE4A0008CE4A0008CE
      4A0021EF5A0018E7520000BD390000BD390000BD390000BD390000521800D6D6
      D600D6D6D600D6D6D6000000000031313100CDB8A100F6F3EF00F8F4F20088AE
      D70099DEF700A7E4F700B2E9F700BDEDF900B9EDF400BCF7FE00BFF8FD00BBF8
      FE00B6F7FE00A2EBF800749EC200E7E7E700078DBE0093F0FE00078DBE00078D
      BE00078DBE00078DBE00078DBE0007868A000E9B1A000FA71C0008822200078A
      AF00078DBE00078DBE00078DBE000000000029A5D6008CF7F7006BA5B50042AD
      D60094F7FF0094F7FF0094FFFF008CFFFF0073F7FF0073F7FF0018A531001094
      2900188442007BEFF70021A5D6000000000008080800B5FFB50029F7630029F7
      630029F7630018E7520018E7520010D64A0010D64A0000BD390000521800DEDE
      DE00D6D6D600D6D6D6000000000031313100C7B19C00EFE6E000F6E7E1009FB4
      CF0099DAF300B3E5F500BDEAF500C8EFF600C9F0F500CAF8FD00CEFBFE00CCFC
      FE00C4F8FB00B5F1F80078ADCF00D7D9DA00078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE0076D4C1001698260016AF26000C94180064C5
      A7000989BA0000000000000000000000000029A5D60084F7F700DEBDAD0042AD
      D60042ADD60042ADD60042ADD60042ADD6009CF7FF006BEFF700087B18003194
      5A0052CEF70084F7FF004ACEEF00000000000808080039BD0000B5FFB500B5FF
      B5008CFF8C0029EF630021EF5A0084FF940084FF940000BD390000521800DEDE
      DE00DEDEDE00D6D6D6000000000031313100C2AA9100EBDBD300EFDBD000C3C4
      CD007DA7CF0082B5E0009ACCE900B6E3F000C8F0F500DAFAFB00DDFBFA00D8FC
      FC00CAF7F900C1F7FA0080C0DA00C4C6CC00078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE0086E2D5001F9E340025BB3D0014A4230045AC
      6F000989BA0000000000000000000000000029A5D60084F7F700D6C6BD00FFFF
      F700FFE7D600FFE7BD00DED6B5009CBDB50042ADD60094E7F70073D6C60094F7
      FF006BDEFF0094F7FF0084F7FF00189CD6000000000008080800080808000808
      0800B5FFB50029F7630000BD3900005218000052180000521800DEDEDE00DEDE
      DE00DEDEDE00DEDEDE000000000031313100BCA18A00E4D0C000E1CFC400E5D3
      C200ECD6C900E4D0CA00CAC2C600AFB4C4007698B8007DB7E30092C3E500DCFB
      FB00D4F4F800CBF7FC009FDAEC00A0ABBC0000000000078DBE00FEFEFE00A5FE
      FF000C8518000C8518000C8518000C85180027A9420034C5520023B539000C85
      18000C8518000C8518000C8518000000000029A5D60084F7F700D6C6BD00FFFF
      FF00FFEFE700F7E7D600F7E7C600FFDEB500B5C6B50042ADD60042ADD60042AD
      D60042ADD60042ADD60042ADD60031A5D6000000000000000000000000000808
      0800B5FFB50031F7630000BD390000521800DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00000000003131310099806E00C4A88E00CBBDAF00C9BB
      B300F2E7DE00EEE7DD00F1E6DE00F2E7DE009AB3AC00A6F5FC008BD1E8007EB9
      E00090C2E600A2DCED00A2E2F80092A6C0000000000000000000078DBE00078D
      BE00078CAE000C8518002095320050D97B004BD575003ECB620032C1500026B8
      3E00159E24000C851800000000000000000031A5D60084F7F700DECEC600FFFF
      FF00FFFFF700FFEFE700F7E7D600F7E7C600FFDEB500FFD69C0073A5AD005AEF
      FF00189CD6000000000000000000000000000000000000000000000000000808
      080039BD0000B5FFB50039BD000000521800E7E7E700DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE000000000031313100EAE5E000AD8E7700EDDDCD00CFC7
      C000F4ECE300F3EAE400F4E9E400F5EBE6008D8B8D009ABBDA0090C0E20087BF
      E3007AA8D200C2CBE200B4C6E200DADFEA000000000000000000000000000000
      000000000000000000000C85180032AE4E005CE68E004FD8780043D068002EBA
      4B000C851800000000000000000000000000299CD6009CF7F700E7D6C600FFFF
      FF00FFFFFF00FFFFF700FFEFE700F7E7D600AD736300AD736300AD736300219C
      D600219CD6000000000000000000000000000000000000000000000000000000
      0000080808000808080000521800E7E7E700E7E7E700E7E7E700DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00000000003131310000000000EBE7E300B5A69A00CCC7
      BD00F7F5F000F9F4F000F9F4F000F9F4F200A3968C00F2EEEF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C8518003EBE600061EA93004ED677000C85
      18000000000000000000000000000000000000000000299CD600EFD6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6CE00AD736300DE844200BD5A63000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000313131000000000000000000EEE9E500A69A
      8F00BFABA400BEADA500BCADA500BCADA500B9ADA60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C85180046C86C000C8518000000
      0000000000000000000000000000000000000000000000000000E7D6C600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E7D6DE00AD736300DE8C5200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100313131000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C851800000000000000
      0000000000000000000000000000000000000000000000000000DEA58400DEA5
      8400DEA58400DEA58400DEA58400DEA58400AD73630000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080030000000000000003000000000000
      0001000000000000000100000000000000010000000000000000000000000000
      0000000000000000000000000000000000010000000000000000000000000000
      8003000000000000C3C7000000000000FF87000000000000FF8F000000000000
      FE1F000000000000F87F000000000000F800FFFF8000C001FBFE8FFF00008000
      FA02807F000080009802800F0000800008028007000080000002800700008000
      0002800300008000800280030000800080028001000080000002800100008000
      000280010000800008028003000080009802800700008000FBFEE3EF00008000
      F800FFFF00008000FFFFFFFF0000C001C07F80039FFFF800C003000100FFFBFE
      80010001000FF002000100010007E002000000010003E0020000000100018002
      0000000100010002000000010001000200000007000100020000000700008002
      000080010000E0020000C0030007E0020000FC070007F002803FFE0F801FFBFE
      C07FFF1FC03FF800FFFFFFBFC07FFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Images = ImageList1
    Left = 232
    object SelectGameDir: TAction
      Caption = 'Select directory...'
      Hint = 'Select directory where is game files'
      ImageIndex = 0
      ShortCut = 16463
      OnExecute = SelectGameDirExecute
    end
    object ExtractFromPAK: TAction
      Caption = 'Extract...'
      Enabled = False
      Hint = 'Extract file from PAK...'
      ImageIndex = 1
      OnExecute = ExtractFromPAKExecute
    end
    object AddFile: TAction
      Caption = 'Add file...'
      Enabled = False
      Hint = 'Add file into PAK...'
      ImageIndex = 3
      OnExecute = AddFileExecute
    end
    object RemoveFile: TAction
      Caption = 'Remove file'
      Enabled = False
      Hint = 'Remove file from PAK'
      ImageIndex = 4
      OnExecute = RemoveFileExecute
    end
    object ReplaceFile: TAction
      Caption = 'Replace File...'
      Enabled = False
      Hint = 'Replace a file of PAK'
      OnExecute = ReplaceFileExecute
    end
    object ExtractDecompFromPAK: TAction
      Caption = 'Extract && Decomp...'
      Enabled = False
      Hint = 'Extract and decompress file from PAK...'
      ImageIndex = 1
      OnExecute = ExtractDecompFromPAKExecute
    end
  end
  object imglistType: TImageList
    Left = 56
    Top = 200
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BCB3B200988C8C00A79C
      9B00C7BFC1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8C4CA00FBF1C600FFFFDB00FFFF
      E200D8D3B400BBB5A700A89F8F009C908800988B86008E807C009C908C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6B5AD00A5948400A5948400A594
      8400A5948400A5948400A5948400A5948400A5948400A5948400A5948400A594
      8400A5948400A5948400A5948400C6BDB500D3AEB300F3E8C500FFFFDB00FFFF
      DE00FFFFE300FFFFE800FFFFEF00FFFFF400FFFFF700FFFFFF00E4E0D900BFB8
      B400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C5A42005A3921005A3921005A39
      21005A3921005A3921005A3921005A3921005A3921005A3921005A3921005A39
      21005A3921005A39210073392100846B5A00D4B0B600F5EDCC00F6E3B300F2DB
      B000FAF4D200FEFFE600FFFFE800FFFFEC00FFFFEE00FFFFF800E3E5E000C2BA
      B600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B5A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000522910008C736300D4B0B600F4EBCC00FBF4C900FFFF
      E200FDF9E000FAF1DB00FDFDEB00FFFFF900FFFFFF00FFFFFF00F8BF8700BDB9
      B900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B5A4A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000522910008C736300D4B0B500F4EBCE00FEFAD700F4E0
      BB00F3DEBB00F6E9CD00FFF8DF00D5C1B500F58D2A009B9BA600000B7300C7A6
      88008E88A100A496920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B5A4A00000000004A4A4A00FFFF
      FF00FFFFFF004A4A4A00000000000000000000000000000000004A4A4A00FFFF
      FF000000000000000000522910008C736300D4B0B500F5EDD400F5E2B700F4DF
      BA00F6E5C600FCE9CC00FBF2E2000037960000317E0039688B0031CBFF00040A
      490000479D003A47610000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B524A0000000000FFFFFF004A4A
      4A004A4A4A00FFFFFF0000000000FFFFFF000000000000000000FFFFFF004A4A
      4A00000000000000000052291000846B5A00D4B0B500F5EDD700F8E8C100F2DF
      BB00F6E6C800FFF9DD00946A55004ECFFF0048C0F3002CABE5002FBCF1001699
      CF001AC1F20011447200A2929400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063524A0000000000FFFFFF000000
      000000000000000000000000000000000000000000004A4A4A00FFFFFF000000
      00000000000000000000522910008C736300D4B0B400F5EDD900F6E4BF00F3D9
      B500F8E7CC00FFFDEA00003B96004CB7ED004BC1F6004EC0EE00548FAB00108F
      CF000F9AD00000559E006B788200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063524A0000000000FFFFFF004A4A
      4A004A4A4A00FFFFFF0000000000FFFFFF0000000000FFFFFF004A4A4A000000
      00000000000000000000522910008C736300D4B0B400F4E9D600FFFFF800FFFF
      F900FFFDF000FFF6E10047CCFF0051C6FB0036B9F100D2E5EC008D6D5E000558
      8A000192CC0000A4E20095B5BF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B5A4A00000000004A4A4A00FFFF
      FF00FFFFFF004A4A4A00000000000000000000000000FFFFFF00000000000000
      00000000000000000000522910008C736300D4B0B400F5ECDC00F6E6C700F8EB
      D500FFFFF600FFFFFF00FFFFFF003796D50025B5F400C8E5F20086716900158E
      B800009FDF008879770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B524A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052291000846B5A00D4B0B300F4EADB00FFFFF800FBF8
      EA00F9EEE000F8EDE100FFFEF800BBE7FC008BD8F900DCD2C600483E3A00446E
      7E004CBEEA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B5200735A3100735A3100735A
      3100735A3100735A3100735A3100735A3100735A3100735A3100736339007363
      3900736339006B5A420084522900846B5A00D4B0B300F7F2E800FFEDD100F6E3
      C900FDE9D600FCF1E700FFFBF800FFFFFF00FFFFFF00FFF5E70098918A00BEAF
      A800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DE842100EF8C1800EF8C1800EF8C
      1800EF8C1800EF8C1800EF8C1800EF8C1800EF8C1800EF8C1800FFB55A00FFAD
      5200FFB56300A58C9400A55A39009C847300D6B4B600EFC5BB00A8DEEA00FAE9
      E500D9F3FD00EDE5E900FAFFFF00F8E6E500FAFEFF00FFFFFF00FDF3EF00C4BA
      B600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5845A00BD733900C6734200C673
      4200C6734200C6734200C6734200C6734200C6734200C6734200C67B4200C67B
      4200C67B4200B5734A00AD7B5A00C6BDB500E0C1C200C58586005C9BAB00EF83
      7F00448AA000EF7771004D98AF00FB918A004AA1B900F6B3B1004D8FA600DFD2
      CD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007FE2EE00B4E1E6006ADA
      E800C0E7EB0055D6E700A8D4DA005CB9C8008DC9D100548FA10079B9BD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A7A7A007A7A7A007A7A
      7A007A7A7A007A7A7A007A7A7A007A7A7A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000E0E0E000E0E0E000E0E0E000E0E
      0E000E0E0E000E0E0E000E0E0E007A7A7A000000000000000000000000000000
      000000000000000000000E0E0E000E0E0E000000000000000000000000000000
      000000000000000000000000000000000000000000001894CE0021A5D6001094
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000E0E0E00EAFBFB00EAFBFB00F3FC
      FD00F3FCFD00F9FEFE000E0E0E007A7A7A000000000000000000000000000000
      0000000000000E0E0E000092DC00007AB9000E0E0E000E0E0E00000000000000
      000000000000000000000000000000000000000000001894CE009CEFFF006BE7
      F70031B5DE0031B5DE0031B5DE0021A5D6001094CE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000009494004AFFFF00009494004AFFFF00009494004AFF
      FF00009494004AFFFF0000000000000000000000000000000000000000000000
      0000000000009292920092929200929292000E0E0E00E3F9FA00EAFBFB00EAFB
      FB00F3FCFD00F3FCFD000E0E0E007A7A7A000000000000000000000000000000
      00000E0E0E000092DC000092DC0000808000007AB900007AB9000E0E0E000E0E
      0E0000000000000000000000000000000000000000001894CE0094E7F70084FF
      FF007BF7FF0084F7FF007BF7FF0073EFFF006BE7F70031B5DE0031B5DE0021A5
      D60000000000000000000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0008080800000000000000000000000000000000000000
      0000262626002626260026262600262626000E0E0E00DEF8F900E3F9FA00EAFB
      FB00EAFBFB00F3FCFD000E0E0E007A7A7A000000000000000000000000000E0E
      0E000092DC000092DC000092DC00007AB900007AB900007AB900007AB900007A
      B9000E0E0E000E0E0E000000000000000000000000001894CE0073CEE70094FF
      FF0073F7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF007BEFFF005AD6
      F700189CCE00000000000000000000000000000000007BD67B00000000000000
      0000005A00000000000052525200399C3900399C390031943100298C29001884
      1800107B1000086B080000630000000000000000000000000000000000000000
      000026262600C3F3F400CCF5F600CCF5F6000E0E0E00DEF8F900DEF8F900E3F9
      FA00EAFBFB00EAFBFB000E0E0E007A7A7A0000000000000000000E0E0E000092
      DC000092DC000092DC000092DC0000808000007AB900007AB900007AB900007A
      B900007AB9000E0E0E000000000000000000000000001894CE0031B5DE0094E7
      F7007BF7FF007BEFFF0073EFFF0073EFFF0073EFFF0073EFFF0073EFFF005AD6
      F70039BDE700000000000000000000000000000000007BD67B009C9C9C009C9C
      9C007BD67B00C6C6C60052525200429C4200429C42009C9C9C00292929002184
      210084848400086B08000063000000000000000000009E9E9E009E9E9E009E9E
      9E0026262600C3F3F400C3F3F400CCF5F6000E0E0E00D3F6F700DEF8F900DEF8
      F900E3F9FA00EAFBFB000E0E0E007A7A7A0000000000000000000E0E0E000092
      DC000092DC000092DC0025AAFF000092DC00007AB900007AB900007AB900007A
      B900007AB9000E0E0E000000000000000000000000001894CE0063DEF70031B5
      DE0084FFFF0073F7FF0073EFFF0000630800006B0800007308000063080052D6
      EF005AD6F700189CCE000000000000000000000000007BD67B00000000000000
      0000005A0000000000005252520042A54200C6C6C60073DE73007BD67B00C6C6
      C6009CCE9C00086B080000630000000000003E3E3E003E3E3E003E3E3E003E3E
      3E0026262600BBF1F300C3F3F400C3F3F4000E0E0E00CCF5F600D3F6F700DEF8
      F900DEF8F900E3F9FA000E0E0E007A7A7A0000000000000000000E0E0E000092
      DC000092DC0025AAFF0048B8FF0048B8FF000092DC00007AB900007AB900007A
      B900007AB9000E0E0E000000000000000000000000001894CE007BF7FF0031B5
      DE0094E7F70094E7F7008CEFFF008CF7FF0073EFFF00006B0800008C08000063
      08006BE7F70039BDE7000000000000000000000000007BD67B009C9C9C009C9C
      9C007BD67B00C6C6C6005252520042A5420042A5420031313100313131003131
      3100107B10000873080000630000000000003E3E3E00A5ECEF00A5ECEF00ACEE
      F10026262600B6F0F200BBF1F300C3F3F4000E0E0E00CCF5F600CCF5F600D3F6
      F800DEF8F900DEF8F9000E0E0E007A7A7A0000000000000000000E0E0E000092
      DC0025AAFF0048B8FF0025AAFF0025AAFF0048B8FF0048B8FF000092DC00007A
      B900007AB9000E0E0E000000000000000000000000001894CE0084FFFF006BEF
      FF0031B5DE0031B5DE0031B5DE0031B5DE009CEFFF0073EFFF0000730800008C
      080063DEF70063DEF7001094CE0000000000000000007BD67B00000000000000
      0000005A0000000000005252520052AD52006B6B6B0094949400949494008484
      84003131310021842100187B1800000000003E3E3E009CEAED00A5ECEF00A5EC
      EF0026262600B3EFF200B6F0F200BBF1F3000E0E0E000E0E0E000E0E0E000E0E
      0E000E0E0E000E0E0E000E0E0E000000000000000000000000000E0E0E0025AA
      FF0048B8FF0025AAFF0025AAFF0025AAFF0025AAFF0025AAFF0048B8FF0048B8
      FF000092DC000E0E0E000000000000000000000000001894CE0084F7FF007BF7
      FF007BF7FF007BF7FF0073F7FF0052D6EF0031B5DE0084DEF70000630800089C
      1800006B080094EFFF0031A5D60000000000000000007BD67B009C9C9C009C9C
      9C006BC66B00C6C6C600525252005AB55A006B6B6B00D6D6D600D6D6D600C6C6
      C60031313100399C390031943100000000003E3E3E009CEAED009CEAED00A5EC
      EF0026262600ACEEF100B3EFF200B3EFF200BBF1F300C3F3F400262626009292
      92000000000000000000000000000000000000000000000000000E0E0E0048B8
      FF0025AAFF0025AAFF0025AAFF0025AAFF0025AAFF0025AAFF0025AAFF0025AA
      FF0048B8FF000E0E0E000000000000000000000000001894CE0084FFFF007BF7
      FF007BF7FF007BEFFF007BF7FF007BF7FF006BE7F70031B5DE000873100018B5
      31000884100031A5D600189CCE0000000000000000007BD67B007BD67B0073CE
      730073CE73006BC66B006BC66B0063C6630063C6630063BD63005ABD5A005AB5
      5A0052B5520052AD520000080000000000003E3E3E009CEAED009CEAED009CEA
      ED0026262600A8EDEF00ACEEF100B3EFF200B6F0F200BBF1F300262626009292
      9200000000000000000000000000000000000000000000000000000000000E0E
      0E000E0E0E0025AAFF0025AAFF0025AAFF0025AAFF0025AAFF0025AAFF0025AA
      FF000E0E0E00000000000000000000000000000000001894CE008CFFFF007BF7
      FF007BF7FF007BF7FF0073E7FF007BE7FF007BE7FF00005A000031CE5A0029C6
      520018B53100005A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3E0096E9EC0096E9EC009CEA
      ED00262626002626260026262600262626002626260026262600262626000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000E0E0E000E0E0E0025AAFF0025AAFF0025AAFF0025AAFF000E0E
      0E0000000000000000000000000000000000000000001094CE001894CE008CEF
      FF0084F7FF006BE7F700189CCE001094CE001894CE001894CE00005A000042E7
      7300005A00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3E0096E9EC0096E9EC009CEA
      ED009CEAED009CEAED003E3E3E009E9E9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000E0E0E000E0E0E0025AAFF000E0E0E000000
      0000000000000000000000000000000000000000000000000000000000001894
      CE00189CCE001894CE000000000000000000000000000000000000000000005A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3E0096E9EC0096E9EC0096E9
      EC0096E9EC009CEAED003E3E3E009E9E9E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000E0E0E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E3E3E003E3E3E003E3E3E003E3E
      3E003E3E3E003E3E3E003E3E3E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800080808000808
      0800080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000525252000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000008080800313131004A4A4A005A5A
      5A004A4A4A000808080000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEE7C600DEE7C6009CA5
      6B00DEE7C600D6DEC600D6DEC600D6DEC600CED6B500CED6B500CED6B500CED6
      B500CED6B500CED6B500CED6B500000000000000000000000000000000005252
      5200C6C6C600DEDEDE0052525200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080808004A4A4A00737373008C8C
      8C00737373000808080000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEE7C600DEE7C6009CA5
      6B00DEE7C600D6DEC6009CA56B00CED6B500CED6B500C6BD9400CED6B500CED6
      B500CED6B500CED6B5009C8C6300000000000000000000000000000000000000
      000094949400ADADAD0052525200ADADAD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080808005A5A5A008C8C8C00B5B5
      B5008C8C8C000808080000000000000000000000000008080800080808000808
      08000808080000000000000000000000000000000000BDC69400DEE7C6009C8C
      5200DEE7C600C6BD94008C734200CED6B500CED6B5009CA56B00CED6B500CED6
      B500CED6B500B5BD8C009C8C5200000000000000000000000000000000000000
      0000000000009494940052525200B5B5B500ADADAD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000008080800080808008C8C
      8C00737373000808080000000000000000000808080018181800393939004242
      42003939390008080800000000000000000000000000ADAD6B00D6DEC6008C84
      2900DEE7C600ADAD6B007B732100CED6B500CED6B5007B7321009CA56B00CED6
      B500CED6B5009CA56B007B732100000000000000000000000000000000000000
      00005252520052525200CECECE00C6C6C600B5B5B500A5A5A500000000000000
      00000000000000000000000000000000000000000000C6C6C600E7E7E7006363
      63000000000063636300E7E7E700B5B5B5000000000084848400E7E7E700E7E7
      E70084848400E7E7E70008080800000000000000000000000000000000000808
      08007B7B7B000808080000000000000000000808080039393900636363007373
      730063636300080808000000000000000000000000007B732100ADAD6B008C84
      2900CED6B500ADAD6B007B732100CED6B500CED6B5007B732100ADAD6B00ADAD
      6B00ADAD6B00ADAD6B008C842900000000000000000000000000000000000000
      000000000000E7E7E700DEDEDE00CECECE00C6C6C600ADADAD00A5A5A5000000
      00000000000000000000000000000000000000000000B5B5B500E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E7006363630000000000D6D6D600E7E7E7000000
      0000D6D6D600E7E7E70000000000000000000000000000000000000000000808
      0800848484000808080000000000000000000808080042424200737373009C9C
      9C007373730008080800000000000000000000000000847B2900ADAD6B008C84
      2900C6BD9400ADAD6B008C842900ADAD6B00CED6B5008C842900ADAD6B00ADAD
      6B00ADAD6B00ADAD6B008C842900000000000000000000000000000000000000
      000000000000F7F7F700E7E7E700DEDEDE00CECECE00C6C6C600ADADAD009C9C
      9C0000000000000000000000000000000000000000007B7B7B00E7E7E700C6C6
      C60063636300E7E7E700E7E7E70018181800000000004A4A4A0084848400D6D6
      D600D6D6D600E7E7E70000000000000000000000000000000000000000000808
      08008C8C8C000808080000000000000000000000000008080800080808007373
      730063636300080808000000000000000000000000008C7342009C8C63008C73
      42009C8C63008C7342008C7342009C8C6300ADAD6B008C7342009C8C63009C8C
      63009C8C63008C7342008C734200000000000000000000000000000000000000
      000000000000F7FFFF00F7F7F700DEDEDE00DEDEDE00CECECE00C6C6C600ADAD
      AD00000000000000000000000000000000000000000000000000D6D6D600E7E7
      E70000000000E7E7E700B5B5B500000000000000000063636300E7E7E7004A4A
      4A00B5B5B500D6D6D60000000000000000000000000000000000000000000808
      0800848484000808080000000000000000000000000000000000000000000808
      08004A4A4A0008080800000000000000000000000000B5BD8C008C8429009C8C
      5200ADAD6B00ADAD6B00ADAD6B00ADAD6B008C842900ADAD6B00ADAD6B00CED6
      B500ADAD6B00ADAD6B00ADAD6B00000000000000000000000000ADADAD000000
      00000000000000000000F7F7F700E7E7E700DEDEDE00DEDEDE00CECECE000000
      000000000000000000000000000000000000000000000000000084848400E7E7
      E700B5B5B500E7E7E7005A5A5A0000000000000000000808080084848400D6D6
      D600D6D6D6006363630000000000000000000000000000000000000000000808
      08007B7B7B000808080000000000000000000000000000000000000000000808
      08004242420008080800000000000000000000000000B5BD8C008C842900ADAD
      6B00ADAD6B00ADAD6B00C6BD9400ADAD6B008C842900ADAD6B00ADAD6B00CED6
      B500ADAD6B00ADAD6B00ADAD6B0000000000000000005252520094949400ADAD
      AD00525252000000000000000000F7F7F700E7E7E700DEDEDE00000000000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E700E7E7E700E7E7E70008080800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      0800737373000808080008080800000000000000000000000000000000000808
      08004242420008080800000000000000000000000000C6C694007B732100ADAD
      6B00ADAD6B00ADAD6B00CED6B500ADAD6B009C8C5200C6BD94009CA56B00CED6
      B5009CA56B009CA56B00B5BD8C00000000000000000000000000525252005252
      5200E7E7E700DEDEDE000000000000000000F7F7F70000000000000000000000
      0000000000000000000000000000000000000000000000000000080808008484
      8400B5B5B5008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000808
      08006B6B6B006B6B6B006B6B6B00080808000808080000000000000000000808
      08004242420008080800000000000000000000000000DEE7C6009C8C5200C6BD
      9400C6BD94009CA56B00CED6B5009CA56B009CA56B00CED6B500B5BD8C00CED6
      B500B5BD8C009CA56B00C6C69400000000000000000000000000000000000000
      0000F7F7F700DEDEDE00CECECE0000000000F7FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000808080008080800636363005A5A5A005252520008080800080808000808
      08003939390008080800000000000000000000000000DEE7C6009CA56B00DEE7
      C600D6DEC6009CA56B00CED6B5009CA56B009CA56B00CED6B500CED6B500CED6
      B500CED6B5009C8C6300C6C69400000000000000000000000000000000000000
      0000F7F7F700E7E7E700CECECE00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000808080008080800525252004A4A4A00424242000808
      08003939390008080800000000000000000000000000DEE7C6009CA56B00D6DE
      C600D6DEC600D6DEC600CED6B5009CA56B00CED6B500CED6B500CED6B500CED6
      B500CED6B500CED6B500C6C69400000000000000000000000000000000000000
      000000000000E7E7E700DEDEDE00C6C6C600B5B5B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000808080008080800393939003939
      39003131310008080800000000000000000000000000DEE7C600BDC69400D6DE
      C600D6DEC600D6DEC600CED6B500C6BD9400CED6B500CED6B500CED6B500CED6
      B500CED6B500CED6B500C6C69400000000000000000000000000000000000000
      00000000000000000000DEDEDE00CECECE00B5B5B50000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000080808000808
      0800080808000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080008080800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100313131003131310031313100313131000000000000000000313131003131
      3100313131003131310000000000000000000000000000000000000000000000
      0000000000000808080000FFFF0000FFFF0000FFFF0000BDBD00002121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000031520000315200003152000031520000315200000000000000
      00000000000000000000000000000000000094949400948C94008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C8C008C8C
      8C008C8C8C008C8C8C008C8C8C00737373000000000000000000313131000808
      08009C9C9C00C6C6C600C6C6C600F7F7F700F7F7F700F7F7F700636363006363
      6300636363003131310000000000000000000000000000000000000000000000
      0000000000000808080021DEDE0000FFFF0000FFFF00009C9C00080808000000
      0000000000000000000000000000000000000000000000000000000000000031
      5200003152000884BD00087BBD00087BBD00007BB500007BB500003152000031
      520000000000000000000000000000000000949494008CCE8C008CCE8C008CBD
      8C008CC6940094DEA50094DEA50094DEAD0094DEB5008CDEBD008CDEBD008CDE
      BD0094E7CE009CD6BD009CD6BD006B6B6B000000000031313100F7F7F7000808
      08009C9C9C00CECECE00E7E7E700F7F7F700F7F7F700F7F7F700636363003131
      3100313131003131310000000000000000000000000000000000000000000000
      0000000000000808080000212100004242000042420031525200080808000000
      000000000000000000000000000000000000000000000000000000315200108C
      C6000884C600006BA500006BA500006BA50000639C0000639C00007BB500007B
      B500003152000000000000000000000000009C9C9C00398C3900318C3100398C
      4200398C42003994420039944200429C520052A573005AAD7B006BC69C008CEF
      D60094FFE70094E7DE0094E7DE006B6B6B000808080039393900393939000808
      0800CECECE00E7E7E700E7E7E700E7E7E700F7F7F700F7F7F700636363006B6B
      6B006B6B6B003131310000000000000000000000000000000000000000000000
      000000000000080808007BFFFF0000FFFF0000BDBD0000BDBD00002121000000
      0000000000000000000000000000000000000000000000315200108CCE000073
      B5000073AD0000BDBD0000BDBD00006BA500006BA50000395A0000639C000063
      9C00003152000000000000000000000000009C9C9C0008520800004A00000052
      08000052080000520800005208000852080008420800297B390052A57300A5FF
      FF009CFFFF0094EFE70094EFE7006B6B6B003131310063636300636363006363
      6300DEDEDE00E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700636363003131
      3100313131003131310000000000000000000000000000000000000000000000
      000000000000080808007BFFFF0000FFFF0000FFFF0000BDBD00008484000000
      00000000000000000000000000000000000000000000003152001094CE000073
      B5000073B50000DEDE006BFFFF00006BAD0000426B000000000000395A000063
      9C0000315200000000000000000000000000A5A5A50008520800005200000039
      00000039000000390000003100000852080010631000318C31005ABD730084E7
      B50073E7AD0073CEA50073CEA5006B6B6B00313131007B7B7B007B7B7B006363
      6300DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700E7E7E700636363007B7B
      7B007B7B7B003131310000000000000000000000000000000000000000000000
      0000000000000808080039DEDE0000FFFF0000FFFF0000DEDE00009C9C000000
      000000000000000000000000000000000000003152001894D600319400000094
      31000073B5000073B5000073AD00004A7B000000000000000000004263000063
      940000315200000000000000000000000000A5A5A5001063100008630800004A
      0000003900000031000000310000106310001884290042B5520073D67B0094B5
      4A00B5AD2900B5A53900B5A539006B6B6B00313131007B7B7B007B7B7B006363
      6300DEDEDE00DEDEDE00DEDEDE00DEDEDE00E7E7E700E7E7E700636363007B7B
      7B007B7B7B003131310000000000000000000000000000000000000000000000
      000000000000000000000808080039FFFF0000FFFF0000FFFF0000DEDE000084
      84000000000000000000000000000000000000315200189CD60000BD39004ADE
      0000007BBD00007BB5000073B500004A7B0000000000004A7300006394000031
      520000000000000000000000000000000000ADADAD00429C4200429C4200106B
      180000390000004A0000004A0000427B180094B54A009CAD3900AD9C2100D68C
      0800F78C0000E78C1000E78C10006B6B6B003131310031313100313131006363
      6300DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00636363003131
      3100313131003131310000000000000000000000000000000000000000000000
      00000000000000000000000000000808080039FFFF0000FFFF0000DEDE0000BD
      BD000000000000000000000000000000000000315200219CDE000084C6000084
      C600007BBD00007BBD00004A7B000000000000000000004A7B00006394000031
      520000000000000000000000000000000000ADADB5005ABD630052BD5A00187B
      180000520000005A0000085A00006B6B0800C66B0000CE630000DE6B0000DE6B
      0000DE730000DE7B1000CE7B18006B6B6B003131310084848400848484006363
      6300CECECE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00636363008484
      84008484840031313100000000000000000000000000000000000808080000FF
      FF0000FFFF00009C9C0000000000000000000808080000FFFF0000FFFF0000BD
      BD000063630008080800000000000000000000315200219CDE000039BD000039
      BD000084C600007BBD00007BBD00004A7B00004A7B0000639400003152000000
      000000000000000000000000000000000000B5B5B5004AB542004AB54200529C
      3900529C3900429C3900849C4200DE8C3900DE7B2100CE6B1000C6630800C65A
      0800C6520000BD630800BD6B18006B6B6B003131310084848400848484006363
      6300CECECE00CECECE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00636363008484
      84008484840031313100000000000000000000000000000000000808080000FF
      FF0000FFFF0000BDBD0000636300000000000808080000FFFF0000FFFF0000BD
      BD000084840008080800000000000000000000315200219CDE000000FF006B6B
      FF000084C6000084C600007BBD00007BBD00007BBD0000639400003152000000
      000000000000000000000000000000000000BDBDBD0073BD420073BD4200A5BD
      5A00E7D68400E7D68400FFEF9C00F7CE7B00F7C66B00DE9C4200C6732900BD73
      3100AD4A0000AD4A08009C4208006B6B6B003131310031313100313131006363
      6300CECECE00CECECE00CECECE00CECECE00DEDEDE00DEDEDE00636363003131
      31003131310031313100000000000000000000000000000000000808080000FF
      FF0000FFFF0000FFFF0000BDBD00007B7B0000FFFF0000FFFF0000FFFF0000DE
      DE00008484000808080000000000000000000031520021A5E700008CCE00008C
      CE00BD7B0000BD7B00000084C600007BBD000073B50000315200000000000000
      000000000000000000000000000000000000BDBDBD00FFD68400FFD67B00FFCE
      6300FFC65200FFC66300FFCE6B00FFC65200FFCE6300F7CE7B00FFFFBD00E7C6
      9400D6AD7300AD6B4200AD6B42006B6B6B003131310094949400949494006363
      6300CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00636363009494
      94009494940031313100000000000000000000000000000000000808080000DE
      DE0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008CFF
      FF00009C9C00080808000000000000000000000000000031520021A5DE00008C
      D600FFAD0000FFBD4A00008CCE000073B5000063940000315200000000000000
      000000000000000000000000000000000000C6C6C600FFD68400FFD68C00FFB5
      4200FFAD2900FFBD4A00FFBD5A00FFB54200FFBD5A00FFDE9C00F7EFC600F7EF
      C600EFE7B500F7EFC600F7EFC6006B6B6B003131310094949400949494006363
      6300C6C6C600CECECE00CECECE00CECECE00CECECE00CECECE00636363009494
      9400949494003131310000000000000000000000000000000000000000000808
      080000EFEF0000EFEF0000EFEF0000EFEF0000EFEF0000EFEF0000EFEF00B5FF
      FF00009C9C00080808000000000000000000000000000000000000315200008C
      D600008CD600008CCE000073B500003152000031520000000000000000000000
      000000000000000000000000000000000000C6C6C600F7D6A500F7D6A500F7CE
      8C00F7CE8C00F7CE8C00F7D6AD00F7CE9400F7D6AD00F7D69C00EFCE9C00EFD6
      A500EFD6A500EFCEA500E7C69C00737373003131310031313100313131006363
      6300C6C6C600C6C6C600CECECE00CECECE00CECECE00CECECE00636363003131
      3100313131003131310000000000000000000000000000000000000000000000
      0000080808000808080000FFFF0000FFFF0000FFFF0000FFFF008CFFFF000808
      0800080808000000000000000000000000000000000000000000000000000031
      5200003152000031520000315200000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600EFCEA500EFCE9C00EFCE
      A500EFCEA500EFCE9C00E7C69C00E7C69C00E7C69C00E7C69C00E7C69C00E7C6
      9C00EFC69400E7C69400DEBD9400A5A5A500313131009C9C9C009C9C9C007B7B
      7B00F7F7F700F7F7F700F7F7F700F7F7F700E7E7E700E7E7E7007B7B7B009C9C
      9C009C9C9C003131310000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080008080800080808000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDC6C600BDC6C600BDBDC600BDBD
      BD00B5B5BD00B5B5BD00B5B5B500ADB5B500ADADB500ADADAD00A5A5AD00A5A5
      AD00A5A5A5009C9C9C009C9C9C00000000003131310031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      310031313100313131000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF87FF00000000FFFF001F00000000
      0000000F000000000000000F000000000000000F000000000000000300000000
      0000000300000000000000010000000000000001000000000000000100000000
      000000030000000000000007000000000000000F000000000000000F00000000
      0000000F00000000FFFF801F00000000FFFFFF80FFFFFFFFFFFFFF00FCFF8FFF
      FC03FF00F83F807F0001F800F00F800F0001F000E00380070000F000C0038007
      00008000C003800300000000C003800300000000C003800100000001C0038001
      0000000FC00380010001000FE00780030001001FF80F8007FFFF00FFFE1FE3EF
      FFFF00FFFFBFFFFFFFFF01FFFFFFFFFF87FFFFFFF1FFFFFF03FF8001E0FFFFFF
      03FF8001E07FFFFF03878001F03F888383038001F01F0001E3038001F00F0001
      E3038001E8070001E3838001D8078001E3E38001940F8081E3E38001821FC1C3
      E1E38001813FC1FFE0638001D03FE3FFF0038001E07FFFFFFC038001F03FFFFF
      FF038001F83FFFFFFFC7FFFFFC7FFFFFFC3FFFFFFFFFE003F81FF83F0000C003
      F81FE00F00008003F81FC00700000003F81F800700000003F80F804700000003
      F80F00C700000003FC07008F00000003E207018F00000003C103001F00000003
      C003001F00000003C003003F00000003C003803F00000003E003C07F00000003
      F007E1FF00000003FC1FFFFF0001000300000000000000000000000000000000
      000000000000}
  end
  object Audio1: TAudio
    Player.SampleRate = 14705
    Recorder.SampleRate = 14705
    Recorder.TrigLevel = 0
    Recorder.Triggered = False
    Version = '4.1 (32bit)'
    OnPlayed = Audio1Played
    Left = 184
    Top = 112
  end
  object OpenDialog: TOpenDialog
    Left = 40
    Top = 88
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 72
    Top = 88
  end
  object PopupMenu1: TPopupMenu
    Left = 152
    Top = 392
    object Extract2: TMenuItem
      Action = ExtractFromPAK
    end
    object ReplaceFile1: TMenuItem
      Action = ReplaceFile
    end
    object Add1: TMenuItem
      Action = AddFile
      Caption = 'Add...'
      SubMenuImages = ImageList1
    end
    object Delete1: TMenuItem
      Action = RemoveFile
      Caption = 'Remove'
    end
  end
  object imglistType2: TImageList
    Left = 80
    Top = 264
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840050515100555555005455
      5500545555005354540053535300535353005253530052535300525151005251
      510052515100525252004C4C4C00939393000000000000000000F1EFEF00786C
      6B00594C4C005C4E4F005E4F4F005E4F4F005F5050005F5051005E4E4E005849
      49008E8C8C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009E9B9B00CCC5C500CCC4C400CCC3
      C300C9C0C000C9C0C000CAC3C300CBC4C400CCC6C600CDC7C700CCC9C900CCCA
      CA00CBCACA00CACACA00AAA9A9004B4B4B000000000000000000977C7C009E48
      4B00B1555800B5585B00BE606200C7676900CF6F7000D4737400D9787900D57E
      7F0058414000F7F7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BBB7B700FAEEEE00DFD4D400D7CB
      CB00D5CACA00D6CACA00D7CDCD00D9D0D000DCD4D400DED8D800E1DDDD00E1E0
      E000E4E3E300FFFEFE00DCDBDB005151510000000000000000007F474A00F09B
      9400FFBBA400FEBDA900FFBCA800FFBEAB00FFBCA800FFBCA900FFBFAA00FFC3
      B800745B5B00F9F9F90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BFBBBB00C5BFBF00373636004242
      4200494949004F4F4F00565656005A5959005756560050515100494949003D3E
      3E0029292900A2A1A100DCDADA0052525200000000000000000092444600FCC6
      AC00FFF5D900F8EED900FAF4E200FBF4E400FFFCF100FFFEF900FFFCF800EDE1
      DD006C6363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C4C0C000B8B2B20040414100B3B3
      B3008C8C8C00555555005F606000585858005F5F5F00575757004C4C4C003D3D
      3D001E1F1F0094949400DDDADA005252520000000000D7CCCC00A5514F00FFD3
      B700FFF7DF009D8F8200514D49008E888C00C2B0AB00EAE0D100FFFFFE00CDC1
      C0008A8484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5C2C200BDB9B900252626006A6A
      6A00B8B8B8005D5D5D00959595008B8B8B004C4C4C0048484800424242003535
      35001A1A1A0096949400DDDADA005353530000000000A8858600BD655B00FFDE
      BE00FFF1D900C2B4A3005258530081A7C0001B57A7005A5A7A00EFDBC900A693
      8C00BABABA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C3C300BAB5B500494949009898
      98006060600045454500A8A8A8008C8C8C003D3D3D003A3A3A00353535002929
      29001010100094919100DDD8D80053535300000000007F515400D2776300FFE5
      C300F0DAC200E9D9C200B0A7A7008CBFE80017AFFF000173D2006D71A2007253
      5200E6E6E6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8C6C600B4B1B10066676700BBBB
      BB00616161003D3D3D00434343002E2E2E00303030002A2A2A00222222001C1C
      1C0006070700918D8D00DDD7D70054545400000000007B323400E3917500FFED
      CA00E7CFB600E5D0BA00DAC4B600547DA7006CD9F7002BCEFF00009AEC000E32
      6F0058585900F7F7F70000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8C6C600BEBCBC00424242008E8F
      8F00878787004E4E4E0051515100535353005151510049494900292929000606
      0600010101008F8B8B00DCD6D60054545400DDD3D30089292800F3AD8B00FBE5
      C500D1B9A400C6B2A000EDD8C100CCBEB900568BB3006CDDF30046F0FF0001C5
      FB00065190003B394500E2E2E200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C9C7C700BFBEBE00656565007272
      7200747474007E7E7E007E7E7E007E7E7E007F7F7F00828282007F7F7F003434
      3400000000008D898900DBD4D40055555500B69D9D009B372F00FEC19900DEC8
      AE00C5AE9A00D0BFA800D3C2AD00DFCDB300B8A09B0043689B0064CEEB0058FD
      FF0005DDFF00026BAC0025284100C8C8C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAC9C900BFBFBF0087878700ACAC
      AC00A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800A8A8A800AEAEAE00A7A7
      A7002B2B2B00827C7C00DAD3D3005555550094676900BA4C3900F3C09800D6C2
      A400D0B89E00C6958D00CB878D00C7838D00D5909400D4829300665B9B0058B3
      DE0061F6FF0018DFFF004373A7002F2A48000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00BDBDBD00A5A5A500DADB
      DB00D3D4D400D3D4D400D3D4D400D4D4D400D4D4D400D4D3D300D2D3D300DFDF
      DF009D9F9F008D868600D3CACA0055565600793C3F00CA614700E0BE9800D3B5
      9700D3968D00F1A2A500FEB3B400FEB4B600FEB7B900FFC4C200F9B8BA008380
      B80053AEE500ADF2F3007AB0EC00172F78000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCACA00CBCACA00818080009595
      9500979696009796960097979700989797009A9898009A9999009B9A9A009D9C
      9C0092909000B4ABAB00CEC5C5005757570085232200BE725300CCA28400D48E
      8700F7ABA900FFB7B200FFB6B300FFBEBC00FFC6C500FFD9D700FFFCFA00E6B1
      BD004B336500587EBD002765CA00707089000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C8C8C800FFFFFF00EBEAEA00E5E5
      E500E8E7E700E9E5E500E8E2E200E6E0E000E5DEDE00E4DBDB00E2D9D900E0D5
      D500DFD4D400F6E8E800D4CBCB005353530085231E00B66F5A00E8ABA000FFC6
      C000FFCFC700FFD4CD00FFDED700FFE6E100FFEFE900FFFAFA00D099AE009A61
      6D00F9F9F9008F8FBF007071A300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00AFAFAF00B0B0B000B0AF
      AF00AEADAD00ACABAB00ABA9A900A9A7A700A6A5A500A4A2A200A2A0A000A09D
      9D009E9B9B009E9B9B008E8B8B007F7F7F0097282700AC414000C7666500C265
      6700C1676C00BF697200C06C7700BE6B7800C1708100AA5E72009F858A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054545400505050005151
      5100515151005151510051515100515151005151510051515100515151005252
      5200525252004F4F4F0049494900AAAAAA000000000000000000000000000000
      00000000000000000000EFEFEF008D8282006C554E006A4D4400694B4100694C
      4300644D470071676700CACACA00000000000000000000000000000000000000
      000000000000EBEBEB0075788100252D39001B202C0066666600D4D4D4000000
      0000000000000000000000000000000000000000000000000000C8D3E10091A1
      B900B2B5BE00D0D3D200E4E5E200F3F2EF00F8F8F80000000000000000000000
      00000000000000000000000000000000000080808000E4E4E400E1E1E100DADA
      DA00DEDEDE00DDDDDD00D9D9D900DFDFDF00D9D9D900D7D7D700DCDCDC00D5D5
      D500D8D8D800E5E5E500989898004A4A4A000000000000000000000000000000
      000000000000F3F3F300834A3C00C46F3900E4924E00ED9D5700ED9F5900EC9C
      5600E18F4C00BA653300582A2000B9B9B9000000000000000000000000009090
      91002B384900304458006389A3009BC7D80071B0C40038627B0014273C001D1F
      2A006E6E6E00EBEBEB0000000000000000000000000000000000648CC7006CC8
      FA0059B2E8005E9FD1006297BF007093B2008D99B100B4B8C200D3D4D400E7E7
      E500F4F2F000F8FAF7000000000000000000AEAEAE00F2F2F200D5D5D500F3F3
      F300DDDDDD00DADADA00EDEDED00D1D1D100E4E4E400E4E4E400CDCDCD00E4E4
      E400D1D1D100DFDFDF00C8C8C8004F4F4F000000000000000000AFAFAF00807C
      7C007B7B7B006F494200F4975500FFCD7C00FFC98300FFCB8800FFCC8A00FFCC
      8900FFCB8300FFCE7D00D481490063514D00CCD1D500393D4600223850005B79
      9200A0C2D400C9F1FA00C3FAFF00CAFEFF00B0FFFF00A4FBFF008FDEEC005F9C
      B6002F5875000C20360021232C009B9B9B0000000000F7F9F800427BC40063C6
      F70067CFFB006BD1FB0071D6FC0073DAFD006DD5F40066BAE10060A4CE006896
      BF00788FB50094A0B300DDD9DD0000000000B0B0B000D2D2D20097979700F0F0
      F000ACACAC00B4B4B400D3D3D30077777700B7B7B700CFCFCF0095959500DBDB
      DB008D8D8D0099999900BBBBBB0052525200CFCFCC003B55350029793400318E
      43002691450083743C00FFBF8200FFD19900FFD0A200FFD4A800FFD5AA00FFD5
      A900FFD0A200FFD59D00FABA7D006B4A3F00375C7E0090B0C600CCEBF700EAFF
      FF00E0FFFF00BFF4FF00A1E0FF00ACE8FF009CFEFF009DFFFF00A8FFFF00ACFF
      FF00A3FCFF0087D1E4004B84A5001521300000000000DCE5EE003590D5005CB7
      EE006BD1FA006CD7FC0071DAFE0076DBFC007ADDFC007ADFFC0079E2FC007BE4
      FA007CE7F8006CCCEF00909DAE00F7F7F800AEAEAE00E3E3E300C9C9C900F1F1
      F100C8C8C800D7D7D700E4E4E400B1B1B100D4D4D400D5D5D500C0C0C000E6E6
      E600B7B7B700C7C7C700C2C2C20050505000456C3D0043CA680051E484005CE3
      890056E78D0097A56700FFBE9200FFE1BB00FFE3C700FFE8D000FFEBD500FFE9
      D000FFE4C700FFE3BD00F7C09200765B510079A8C900F7FFFF00E8FFFF00D5FA
      FF00BBEFFF00A4E3FF008CD7FF009BDDFA006EBBE1007BD8EE0092F4FD009BFF
      FF00A4FFFF00B6FFFF008BDAE80017273B0000000000B5C9DC0049B5EB0052A5
      E5006DCEEF0072D8FE0076DBFD007CE0FD007EE2FB0082E5FD0086E6FD0086E6
      FD0084E7FD0077D9F600798FAF00F4F3F200ACACAC00FFFFFF00F3F3F300EDED
      ED00F1F1F100EFEFEF00ECECEC00F1F1F100EBEBEB00E7E7E700EAEAEA00E4E4
      E400E7E7E700F5F5F500C2C2C2005050500045A652006AE799007ADD9B0086E0
      A30086E6AA0097BB8800F0B69600FFECD900FFF7EB00FFFAEE00FFFAE800FFFA
      ED00FFF9EE00FFF3DF00E1AE8E00968B870074A2C300EAFFFF00D5FBFF00BDEF
      FF00A6E5FF008FD9FF0077CFFF008DD8FA003052A9002A54AC005698CE0086EA
      F80085E1F400A3FFFF0081D4E40017263B00F5FBF90099B6DE004CA1A6004888
      A6005DC6C00077DBFD0081DFFD0089E4FD008FE9FD0094EBFE0096EDFD0095EE
      FD0092EEFD007EDBF4006E96BA00ECEBE900ADADAD00FFFFFF00F7F7F700F2F2
      F200F5F5F500F2F2F200EBEBEB00F0F0F000EBEBEB00E9E9E900ECECEC00E4E4
      E400E7E7E700F6F6F600C2C2C200515151005DB66B0092EAB200A4E8BB00B0EC
      C600BDF7CF00B6EBC200D4BA9C00FBD5C500F9E6DC00DEC3C000C9A8A000E3C1
      B200FEDEC300FFE4D200A1776400EFEFEF0073A4C500E3FFFF00C1F1FF00A9E4
      FF0093DAFF007BCFFF0062C3FF007FD4FD003C74BF002856AF00284EA8004078
      BF00325AAC005896CE0063B5DA00182C3F00F3F6F3006F83810049A44000419C
      960063CAC40080E1FC0090E6FE009CEAFE00A1EEFD00A6F1FD00A7F2FD00A7F3
      FD00A4F3FC008BDCF10069A3C900E0DEDC00B2B2B200DADADA00B6B6B600E7E7
      E700BABABA00C3C3C300ECECEC00B5B5B500D7D7D700DCDCDC00AFAFAF00E4E4
      E400C2C2C200C4C4C400C8C8C8005252520063AB6500B5EFCA00D1F4DE00E9FA
      ED00E2EEEB00E4F5F100E9E9DC00E2B09C00BAADD100A5B2EA009AA8E60095A3
      E400BD9DB400AA735B00DBD5D300000000006CA5C800CFFCFF00ABE7FF0094DA
      FF007ED0FF0067C5FF004CB6FF0070CAFF0061CFF90054C0EF00428CCF003670
      BC002346A2002644A4003F82C4001B354400BEC4B8003D792C002D992A003387
      880077D5DD008CE4FB009CEAFB00ABEFFB00B3F3FD00BAF6FD00BBF6FC00B8F8
      FD00B3F9FD009EE0F1006DB4D800CBCDCD00B3B3B300BABABA008B8B8B00D4D4
      D400919191009F9F9F00EAEAEA009F9F9F00D8D8D800D8D8D8009D9D9D00EFEF
      EF00B0B0B000B9B9B900CFCFCF00515151007BB07900B7E0BF00F2FFF000E2F9
      D2006E74DA007A82D400CDFEC500B2C3DC00B7C6F900C7DBFC00C7D9FA00B9D0
      FC009BB2F6004C4C6A00F1F1F1000000000061A1CA00B8F1FF0096DBFF007FD0
      FF0069C6FF0053BBFF0037ACFF0062C1FF0055CCFF0051CFFF005CD7FF005ED3
      FB005DC7F1004D9DD8004496D000173144005F935300297E230073C5BC0055A5
      E10088E0F9008DD6DA00ADEBFA00B8F3FB00C1F7FD00C8F9FD00CBFAFD00C7FB
      FD00C3FCFD00A6E2F40089CFE800ADB4C000B3B3B300F3F3F300DCDCDC00F4F4
      F400DDDDDD00E0E0E000EEEEEE00D9D9D900EBEBEB00E3E3E300D9D9D900ECEC
      EC00D4D4D400E7E7E700CBCBCB0052525200F3F8F30070BD630094CC9C0073BB
      BC002F79C5002876B9003DAB96009AC2E900D7E0FF00CEDCFC00CBDAFC00CBD9
      F700C7DCFF00637AB600B0B0B40000000000559ECD00A3E5FF0082D1FF006BC5
      FF0052BBFF0036ADFF00179CFF0067BFFF0049BFFF0034B9FF0044C1FF004EC8
      FF0059D2FF0066E2FF0050C0E800122A41002B8A2200139E17005AAA860070C0
      E70068B2D8003D9545009DDED000C0F7FA00CDFAFD00D8FAFD00DBFBFD00D4FD
      FA00D1FDFD00ACE5F300A8EBFA008F99B300B3B3B300FFFFFF00FEFEFE00F6F6
      F600FCFCFC00F9F9F900F2F2F200FAFAFA00F1F1F100F1F1F100F6F6F600EAEA
      EA00EFEFEF00FCFCFC00C8C8C8005252520000000000D3E4D80043979E007DC7
      F70085D1F00076C7E7003F91CF009BB6EE00E7EEFF00DFE9FE00D7E3FE00CBDA
      FC00D5E5FF00788BC600B5B5BA00000000004B9BD0008CD9FF0067C4FF004DB6
      FF0042B1FF0049B4FF005EC0FF007ED2FF0083D5FF0065C8FF0049BEFF003ABA
      FF003CBBFF004CCCFF0042B5E800122C430042983E0027B2330039AC40005DB1
      7F006DBBA00049C764003C9979006FB1E10077B4E00084B7E100A6D1EA00E2FB
      FB00D2F8FB00B7E8F300B6F8FC007792AF00B6B6B600FCFCFC00EEEEEE00F8F8
      F800F4F4F400F2F2F200F6F6F600EDEDED00F1F1F100ECECEC00E5E5E500EBEB
      EB00E4E4E400F0F0F000CBCBCB00535353000000000083A1C80084C7F200A4E1
      FF009DDAFE0098DAFC0078C0EB0084A3E600F9F9FF00FDFFFF00EAF0FE00DCE9
      FF00D3E4FF0058639C00EDEDED00000000004098D30078CFFF006DC6FF007BCE
      FF008CDAFF0094E3FF0088E3FF0066CEFF0080E0FF0095E6FF009BE5FF0088D9
      FF006BCBFF004FC8FF0034AEEB00102D450092BC930041BA480059CB740063CC
      7B0050BB600078E19D004DBA5F00A3F0EE00AAF9FC00A9F5FA007FC9E70091B7
      E000B5E1EE00BDEFF700C0FCFB00759ABC00BCBCBC00DBDBDB00A8A8A800EAEA
      EA00A3A3A300B4B4B400DEDEDE0095959500CDCDCD00DEDEDE00A0A0A000EDED
      ED00BABABA00B6B6B600D2D2D2005454540000000000629AD500AFE5FF00BEE9
      FF00B9E5FF00A7DFFF0096DBFA0068A3E30099A3E800F4F2FB00F3F9FF00D1DE
      FB00707ACE00ABABBA0000000000000000004197D000A2E2FE00AAEAFF009AE2
      FE0087D8FB0079D0F80077CCF60055AEF3006FC4F30070C8F50079CFF70090DB
      FB00A9E7FF00ACEEFF0067BCEC00112E4900EDF5EE005CAD5C0067D07F008FE2
      A00097E4B40092EAB90073E29D00489476008FB2DE0088C2DF0086BFE40077BE
      E1005EA4DB007E9DC9008EB7DB0096B4D800BFBFBF00DADADA00B7B7B700EEEE
      EE009F9F9F00B2B2B200DDDDDD0092929200CBCBCB00DDDDDD00AEAEAE00F6F6
      F600B7B7B700C5C5C500D5D5D50053535300000000007EA8D800B9DFF500EBFB
      FF00DBF2FF00BBE5FF00A9E8FF0073BFE20046528C00737AE6006F87FC006269
      D200B9B9D0000000000000000000000000003586C1002E89C7005BB0DF0089D4
      F300A0E2FB00A0DFFA0090D0F20065A8DC0084C5EC0096D4F5009BDEFC008DD9
      FA0067BBE8003A90C6001C669C007C878F0000000000EAF5EA0081BF7E0061C7
      6D00B5EFCB00B8F1D1009CF6CB004DB15800DDE2D9000000000000000000E6EC
      F300CCD7E700F5F9F7000000000000000000BABABA00FFFFFF00FEFEFE00FFFF
      FF00FBFBFB00FCFCFC00FFFFFF00F9F9F900FDFDFD00F9F9F900F8F8F800FCFC
      FC00F3F3F300FFFFFF00D2D2D2005454540000000000DEE6F100729BC600F5F9
      FB00F6FFFF00CEF5FF00A4E4FF0047748D00E6E7EA0000000000000000000000
      000000000000000000000000000000000000000000000000000066A2D1002681
      C200459CD10083CBE900B8EEF800C0ECF200C3F8FF0097DAF10059A7CF002771
      A5002B6C9C009BB1C60000000000000000000000000000000000DCECDD004EC0
      5C007ADB95005CC8690069C97200A1D39F00F4F6F40000000000000000000000
      00000000000000000000000000000000000095959500C2C2C200C3C3C300C0C0
      C000C2C2C200C2C2C200C1C1C100C2C2C200C2C2C200C3C3C300C3C3C300C2C2
      C200C5C5C500CBCBCB008E8E8E009F9F9F000000000000000000C9D6E5007997
      B9009FBCD1008BB6D2005D7D9B00C5CACD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C4DAEC005096CF002C86C8004DA4D800357FB0002D6A9E008AADCD00F7F7
      F900000000000000000000000000000000000000000000000000C2E2C20081CF
      7D00BFDEC400F6F6F60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B8B8B800605959005E5A5A00D0D0D0000000
      000000000000F6F5F30000000000000000000000000054545400505050005151
      5100515151005151510051515100525252005151510051515100515151005151
      5100525252004F4F4F0049494900AAAAAA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F700858585006A606000A59C9C00AAA3A40073727200F4F3
      F20000000000B6B09F00DCD1CA000000000081818100E4E3E400E2E0E100DDDC
      DE00DBDADA00D9D9D800D8D8D800D8D8D700D7D7D700D5D5D500D5D5D500D4D4
      D400D3D3D300E0E0E000999999004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD00505050004D4D4D004F4F
      4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F
      4F004F4F4F004D4D4D0055555500B5B5B5000000000000000000000000000000
      0000DCDCDD005B57570067585800A99C9C0094979700C8C6C50073717300C9C8
      C200C0B0A000CCC5B900906E5700F3EBE900AEADAF00F2F9EE00DAE9D200E3ED
      DF00F0F2F100F2F2F300F0F1F000F0F0EE00EEEEEC00EFEFEC00EBEBEA00E9E9
      E800E7E7E500F5F5F500C6C6C6004F4F4F00A5A8A50063656300636663007173
      7000C0C0C0008A8A8800666463006865640076757300DADADA008E8F8E005054
      4E007C7B7B00737170005C5B5800B5B5B500242C300050667000516872004F65
      6F0050656F0050656F0050656F0050656F0050656F0050656F0050656F005065
      6F0050667000556D77002D3B410042424200BABBBC003B4E6E00485380005358
      7500544C510078615F00B0979700938F8F008B8E8E00D2D1D1008A868A00CDCA
      C500AC927C00D3BFB700AC8B7B00D7B5AF00ADADAB00D6DBEE00AFB6D400C1C7
      D700D6D6E700D9D8EC00D0D0E900C0C0EA00D2D2E600CECED400D9D9DC00DFDF
      E200DBDBDE00ECECEC00BDBDBD0050505000316E23004183340038802A002256
      11003C4A31002668120020691000227012001C41070040493A0030782300358F
      27001C4F0B001F6D100020630D004B4B430047515500EDFEFF00F4FFFF00ECFF
      FF00EDFFFF00EDFFFF00EDFFFF00EEFFFF00EDFFFF00EDFFFF00EEFFFF00EEFF
      FF00EFFFFF00FBFFFF0085949900373737006883880049B5FB00388AFD004D7C
      D5008F7576009B7B7700BDA6A6007977770080818100D7D6D6009D9DA000AFAB
      A600CFBAAD00BE918600CBB6AC00BC7D7300ACACAC00F4F4FA00DED0D200E4CD
      C600E5CEC800D0CDD300D3D5E800CBCAEB00CDCDE900BCBCE600CBCBE500CECE
      E600D1D1E100EFEFED00C0C0C00050505000438738008DDE88006DCA66002E60
      2300868E7F003281200036D637002DBA28002A4C17003A6B2E0072E06F003E99
      350033A3290035D23500227410007979730052545500F7FBFB00F9FFFF00F2FD
      FE00F4FEFF00F4FDFF00F4FDFF00F3FEFF00F3FDFF00F3FDFF00F3FEFF00F3FD
      FF00F5FEFF00FFFFFF00909495003A3A3A005C8F980060D4FF004AB6FF0070A0
      CB009F7D7600A2858500C7B7B70086777700645C5C00CCCDCD00B5B7B900A699
      9500F5ECEA00C1898100D7BBB500B6716700ADADAD00E3EDE600C3D6C400C9DA
      CA00C9CAD700BCBBC800C8C9E500D7D7ED00DDDDE300E0E0DD00E5E5E500E4E4
      E300E1E1E200EFEFEF00C1C1C10050505000D9E2D90055965200549C4A004141
      4100D7D7D700355C290043D94000255B1500C4C3C100569F500084E17F000E26
      0C002E6A280041C73B00293A1C00F5F5F50055565600F8F8F800FDFDFD00F9FE
      FF00FCFDFD00FAFDFF00F9FEFE00FBFDFD00F8FDFF00F7FDFE00FBFCFD00F9FD
      FE00F9FEFE00FFFFFF00949595003A3A3A0070B7BB0040EDFF0017D9FF0068B3
      CA00AC858300B0969700D1C4C400A18C8C007C6B6B00B0B2B100C7C9C900A394
      920000000000C4867F00E0BDB900BD807700AEAFAD00F3F0FF00E4D5E300DFC8
      D900DCCADB00D6D5E800BCBDF100BBBBF200B4B4E900C1C1E100DBDBE900D5D5
      E800D9D9E400F1F1F000C3C3C3005151510000000000709B6E0066B35B002863
      1E00255619003A9632004BCB4600354B2B0000000000699D660073C46E00428B
      37002E7B230049C2420029412000F7F7F7005D5E5D00D7D7D700A8A9A900DEDF
      DF00ACADAD00CDCFCF00C9CACA00A9AAAA00F2F3F300F1F3F300A8A8A900D2D3
      D200CDCDCD00BFC0C000919293003C3D3D0070B6B90080FFFF0027FFFF0059DD
      DE00B58F8F00BCA3A300D8CECE00B09F9F00988B8B00A7A8A800CBCDCE00A696
      930000000000C6867F00DFB9B600C2868000B0B1B100EDF7E500D3D9B800DDD9
      BC00F4E7DA00EDEAEB00E1E2EA00DEDFE500D7D7E900D4D4E800DEDEE700DADA
      E500DDDDE400F3F3F200C5C5C5005151510000000000B5CAB50068B0630071C5
      65004DA540006BDE680042A13900696D680000000000ABC3AB00196213004296
      370055B94C0055C84F0024411A00EDEDED0062616200C0C0C1006B6C6C00BBBB
      BC0076777700A8A9A900A4A5A5006E6E6E00E2E1E100E5E5E50071717200B0B0
      B000ABABAB008F8F90008C8D8C003E3E3E0088949900617F8C004D96A70065C4
      D200D9D2D300CBB1B100DAD1D100B3A6A6008E888800B7B7B700CBCCCD00A897
      950000000000C4857E00DFBAB600C1857E00B1B1B100F7FDF300E6E1CB00E6D7
      BC00E8D4C800D6D2D200D0D2D100D2D3D100DEDEDB00CCCCC900D6D6D500DADA
      D900E4E4E400F4F4F400C6C6C600525252000000000000000000549A51004789
      3E00154B0F0079E2750033742800BABABA0000000000588E55007DC77000184D
      11003470310069D8610027451F00F5F5F50063636300BBBCBB005E5F5E00BFBF
      C0006A6B6B00A5A6A6009FA0A10062626200E6E6E600E8E7E70062626200ADAE
      AE00A5A5A500818080008E8F8E003E3E3E000000000000000000D0D1D4008D97
      A100B5ACAB00F2E5E600E1D6D600766E6E00716E6E00D1D1D100C5C6C700A797
      950000000000C3878000DEBDBA00BA7A7100B5B5B500DFE8DA00ACC0A600C5D7
      C000DDE1DE00D1D1D100EDEDE800F4F4F100EFEFED00EEEEEB00ECECEA00ECEC
      E900E9E9E600F4F4F400C8C8C8005252520000000000000000006A9F69005BA1
      4D00408E360081DF7C002A4E2300F1F1F1000000000068A36700A3DB9D005394
      48005DAA560061BE5600546252000000000066666600ADADAD003D3E3D00C0C0
      C0004D4D4D00979797009090910045454400EAEAEA00E8E8E800404040009F9F
      9F009393930060606000919191003F3F3F000000000000000000000000000000
      00009B929000D5CFD000F8F4F4007F7F7F00898B8B00CFCECE00BCBCBE00AC9D
      9900E7DAD500C08B8200D5BBB400B36F6700B4B5B500F5F4F400D9C6C000E7CC
      C300F7E2D700E8E7EA00CED0F400DCDCF200DEDEF000DBDBEF00DBDBEC00D1D1
      EE00D3D3E700F3F3F200CACACA00525252000000000000000000ADC7AD0062AB
      560094E08A006BBB6500546054000000000000000000E2ECE20050934F0059A8
      510056A94E003C6E3700D9DAD900000000006B6B6B00A7A7A70029292900C4C4
      C40038383800949494008787870035353600F1F1F100ECECEC00252525009999
      99008787870049494900969696003D3D3D000000000000000000000000000000
      0000F8F8F8008F878800F8F6F6009D9C9C0086878700CCCBCB00B0ACB000A9A2
      9C00BAA49200C9A29900C9B1A600C4928900B4B5B500FFFFFF00FEEAE000FFD9
      CA00FDDBCB00E4E0E600BFC1F600C0C0F900D1D1F800CECEF000D1D1DF00DDDD
      EB00E1E1EB00F6F6F600CCCCCB00535353000000000000000000F1F5F1005B9D
      5700CEFFCB0043833800AAAAAA00000000000000000000000000F9FBF900ADC9
      AD00A4BEA300EBEEEB0000000000000000006B6B6B00A2A2A20027272700C3C3
      C30035353500949494008080800034343400F0F0F000E9E9E9001E1E1E009898
      9800828282004444440095959500404040000000000000000000000000000000
      000000000000E6E5E5009F969600BDB8B8008C8D8D00C4C1C100A19A9E00A6A1
      9800AA938000DFD3CD0094715B00E4CFCB00B8B8B800ECECED00DBDAD900E7E5
      E500E6E4E300E0E0E000EDEDEE00DBDBDF00D7D7D900E8E8EB00EFEFEF00F1F1
      EC00EEEEEB00F9F9F900CDCDCD0053535300000000000000000000000000629C
      6200AEE7A6002F5E2A00F5F5F500000000000000000000000000000000000000
      000000000000000000000000000000000000464646002E2E2E000F0F0F003838
      3800121212002B2B2B00272727001111110047474700434343000C0C0C002E2E
      2E00272727001414140032323200A0A0A0000000000000000000000000000000
      00000000000000000000C6C2C2009E959500938B8B00B5AFAF00938B8C00C0BC
      B300E4DED800BDB4A500A88D7B00FBF8F700BDBDBD00E5E5E500B2B3B300D4D6
      D700E0E2E300DADADA00EBEBE900D8D8D500D2D2D000EBEBEA00F2F2F200EDED
      ED00EBEBEB00F7F7F700CFCFCF0053535300000000000000000000000000A1C4
      A100398E3200687C680000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AAA3A300897B7B00A79D9E00857B7A000000
      000000000000CAC7BB00F3EFEC0000000000BBBBBB00FCFCFC00EBEBEB00FAFA
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FCFCFC00FAFA
      FA00F9F9F900FFFFFF00D3D3D300545454000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B919100776A6B00C8C3C4000000
      00000000000000000000000000000000000095959500C3C3C300C5C5C500C2C2
      C200C0C0C000C1C1C100C1C1C100C1C1C100C2C2C200C2C2C200C2C2C200C2C2
      C200C4C4C400CACACA008E8E8E009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000054545400505050005151
      5100515151005151510051515100525252005151510051515100515151005151
      5100525252004F4F4F0049494900AAAAAA000000000000000000000000000000
      00000000000099A9D10013449700134495004F68AB00CDD3E700000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE0079797900737373006F6F6F006F6F6F00707070006F6F6F00727272005252
      5200E4E4E4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000081818100E2E2E200DDDDDD00DADA
      DA00DADADA00D8D8D800D8D8D800D7D7D700D7D7D700D5D5D500D5D5D500D4D4
      D400D3D3D300E0E0E000999999004A4A4A000000000000000000000000000000
      0000EEF0F7003D6DB50067CEEC004EBFE9002C80BB001A479600A2ACD2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A2A2A200FAFAFA00F0F0F000F0F0F000EFEFEF00F2F2F200F2F2F2006565
      6500000000000000000000000000000000000000000000000000807E7E008784
      8400827F7F00827F7F00827F7F00827F7F00827F7F00827F7F00827F7F00827F
      7F00848080007F7C7C009F9F9F0000000000ACACAC00FFFFFF00F4F4F400F3F3
      F300F3F3F300F1F1F100F0F0F000EEEEEE00EDEDED00EBEBEB00EAEAEA00E8E8
      E800E5E5E500F5F5F500C6C6C6004F4F4F000000000000000000000000000000
      0000AFBCDF006CA2D6009AF0FF0067D3FF0066D5FF0045ADDE0013529E007685
      BC00F9F9FB00000000000000000000000000F9F9F900BEBEBE00949494007777
      770064646400BDBDBD00BFBFBF00BCBCBC00BDBDBD00BEBEBE00ADADAD004444
      44006E6F6E008A8A8A00B2B2B200E4E4E400000000000000000093909000FCF1
      F100ECE1E100ECE1E100ECE1E100ECE1E100ECE1E100ECE1E100ECE1E100ECE1
      E100EDE2E200EDE3E3007F7E7E0000000000AAAAAA00FBFBFB00EAEAEA00EBEB
      EB00EAEAEA00E8E8E800E7E7E700E6E6E600E4E4E400E3E3E300E2E2E200E0E0
      E000DEDEDE00ECECEC00BDBDBD0050505000F6F6FA0098A3CC00D6DDEE000000
      0000AABCE10078ADDC0094E8FF0065CEFF0069CEFF0067D2FF004BBBEC00185D
      A500707EB5000000000000000000000000007B7B7B0096969600B7B8B900D0D1
      D200CECFD100DADBDC00E4E5E600E2E2E300E2E3E400E4E5E600E5E5E700CDD1
      CF00BBC0BD00ACACAD008686860052525200000000000000000093909000F4EA
      EA00E5DBDB00E5DBDB00E5DBDB00E5DBDB00E5DBDB00E5DBDB00E5DBDB00E5DB
      DB00E6DCDC00E7DEDE008282820000000000ACACAC00FCFCFC00EDEDED00EDED
      ED00ECECEC00EAEAEA00E9E9E900E8E8E800E6E6E600E5E5E500E4E4E400E2E2
      E200E0E0E000EEEEEE00C0C0C00050505000B3BAD8002558A2003160AC00CED8
      EE00D2DDF10068A2DB009BEBFF006CD3FF0068CEFF0063C9FF0061CCFF0049BE
      F200185DA5007D83B6000000000000000000CECECF00F8F8F700DFD1D000E0CE
      CE00DECECF00DDCDCD00D3C2C200C3B2B300CAB9BA00DAC8C900DFCCCE00DDCC
      CD00DCC9CB00E2D6D700FFFFFF0080808000000000000000000094919100F8F0
      F000E9E1E100E9E1E100E9E1E100EAE1E100EAE1E100E9E1E100E9E1E100E9E1
      E100EAE2E200EAE3E3008382820000000000ADADAD00FDFDFD00EEEEEE00EEEE
      EE00EDEDED00EBEBEB00EAEAEA00E9E9E900E7E7E700E6E6E600E5E5E500E3E3
      E300E1E1E100EFEFEF00C1C1C100505050005F6FAE009FD4EB005FB4DA00205D
      AF006E91D10065A1DB00A1EFFF006FD5FF006BD0FF0063CAFF005EC4FF005FCF
      FF0046C3F100194C9700B3B3D00000000000CECED200BAB0A600447B30003E93
      41004293420043914200448F4000458F4000478C4000468B3F00488A3F004989
      3F0046893B00506A3500D9D1D30084858600000000000000000095939300FDF6
      F600EDE7E700EDE7E700EDE7E700EEE8E800EEE8E800EDE7E700EDE7E700EDE7
      E700EFE8E800EEE8E8008382820000000000ADADAD00FDFDFD00F0F0F000EFEF
      EF00EEEEEE00ECECEC00EBEBEB00EAEAEA00E9E9E900E7E7E700E6E6E600E4E4
      E400E3E3E300F0F0F000C3C3C30051515100546CAE00AFEDFE007FE8FF006DCB
      E9004D9ACE009DD3EC008FE7FF0071D6FF006BD0FF0064C9FF0061CFFF0058C1
      F20056C4F7003CB4E60035499100E8E8F000CDCCD100BAAFA10021B14E000ED4
      66001CC55F001BC6600017CC630019CA620018CC620016CD640016CE640016D0
      66000EDA68002F984900D9CACC0084858600000000000000000096949400FFFC
      FC00F2ECEC00F2ECEC00F2ECEC00F3EDED00F3EDED00F2ECEC00F2ECEC00F2EC
      EC00F4EEEE00F3EDED008383830000000000AFAFAF00FEFEFE00F1F1F100F1F1
      F100F0F0F000EEEEEE00EDEDED00ECECEC00EAEAEA00E9E9E900E8E8E800E6E6
      E600E4E4E400F2F2F200C5C5C50051515100677EB800A9EEFF006ECCF90081DB
      FC0093F1FE008DE8FF0078DAFF0072D4FF0069CFFF0066D2FF004492E3001227
      CA00101FBD002463C5001A5FA4009596BB00CECDD100B8B1A4002DA552001ACB
      6C0022BF66001FC26B001ACD72001ECD74001AD4780019D478001CD175001BC9
      6D0012C76400348B4700DACCCF0084858600000000000000000097959500FFFF
      FF00F7F2F200FEF7F700F9F3F300FBF6F600FDF8F800F7F2F200FEF8F800F9F3
      F300FDF8F800FCF7F7008585850000000000B0B0B000FFFFFF00F3F3F300F2F2
      F200F2F2F200F0F0F000EFEFEF00EDEDED00ECECEC00EAEAEA00E9E9E900E7E7
      E700E6E6E600F3F3F300C6C6C600525252006A7CB50096D1F2002598E0003196
      E1005FB1E5007ADDFC0074D8FF006DD1FF0067CDFF0063CEFA001B39C5000000
      EC000000ED000917BF002E8ACB0041508F00CFCED200B6B0A00025943D0017A0
      5C001F9552001B9B49001FAD5E0016B05A0012A44E00119844000F8C3A00117D
      30000A742A002E5E2700DAD0D1008485860000000000B0B0B0007A797900ABA8
      A800C4C0C000A19D9D00BAB6B600B4B0B000A5A2A200C3BFBF009F9B9B00BEB9
      B900B0ACAC00ABA7A7006F6E6E0000000000B1B1B100FFFFFF00F4F4F400F4F4
      F400F3F3F300F1F1F100F0F0F000EFEFEF00EDEDED00ECECEC00EBEBEB00E9E9
      E900E7E7E700F3F3F300C8C8C800525252005B62A5007DB4E20027E7FD0039E1
      FF003A9CE6005BAEE70074DCFF006DD4FF0064CCFF0061CDFF003E86DB000F21
      CB000A17E700316DE5004CC6F700264C9200CBCCD100BAAFA000AAAF8500BFC7
      BF00C9C3B500C2C6A600BDC6A100AABF9000A5BB890092B384006CA083005E95
      8A004F8E9900536E6900D6CFCA008585860000000000848383009C9A9A008988
      8800CAC8C80072707000CDCCCC00939090009A999900C9C6C60073727200D3D1
      D10088868600ABAAAA007D7C7C0000000000B4B4B400FFFFFF00F6F6F600F5F5
      F500F5F5F500F3F3F300F2F2F200F0F0F000EFEFEF00EDEDED00ECECEC00EBEB
      EB00E9E9E900F6F6F600C9C9C900525252008B8EBD005A83C00044E1FA0038C9
      F40048AEF10058B2F50065C0F80061BAF70064C8FF005DC6FF005DD2FF0041B1
      F60037A3F50054C6FE0051C6FE00265B9F00CACED100BCAEA200EFB9A300FFE6
      D800FFDFD100FFDED100FFDED200FFE0D400FFE2D600FFE6DC00FEEAE300F8EB
      E800F2F1F100B8A69B00CDC9C5008486870000000000817F7F007F7A7A003938
      380059575700787777009F9F9F00B6B6B600BEBEBE00B8B8B800B4B3B300B2B2
      B200B0B0B000B2B2B200C0C0C00000000000B4B4B400FFFFFF00F7F7F700F6F6
      F600F6F6F600F4F4F400F3F3F300F1F1F100F0F0F000EEEEEE00EDEDED00EBEB
      EB00EAEAEA00F7F7F700CBCBCB0053535300EAEAF200525B9F008EBEE40067C8
      FC005CC1FC004CACBF001B8E4D000E8E4D003296A60054C2FF004AADEC008A92
      94009990820053B3EB004DC6FF0028539900CACED100BBADA200E3A69500FFC7
      BF00FFC0B700FFBFB800FFBFB700FFC1B900FFC2BB00FFC5BF00FFD0CB00FFE0
      DE00FFF5F500C1ADA000CBC7C3008587880000000000828282006F6D6D009997
      9700C4BFBF004A4949008985850075747400A2A2A200DDDDDD00000000000000
      000000000000000000000000000000000000B6B6B600FFFFFF00F9F9F900F8F8
      F800F8F8F800F6F6F600F4F4F400F3F3F300F2F2F200F0F0F000EFEFEF00EDED
      ED00EBEBEB00F9F9F900CDCDCD005353530000000000C9C9DF004D589E008BC7
      E5007BE2FF0045B69A0018BA0F0000A80600149373006994C500D2723900FF94
      3000FA99370076A8C5003EB3F10039478B00CACDD000BBAEA200E8C3B000FFEA
      E100FFDFD300FFD7C700FFCFBB00FFC3AB00FFB99D00FFB99B00FFB99B00FFB9
      9C00FFC3A700C1907200CBC9C700858687000000000000000000ECECEC00BEBE
      BE008F8F8F0074747400BAB7B7006D6B6B00B4B0B0008A8585004C4B4B008380
      8000A4A3A300DBDBDB00F9F9F90000000000B8B8B800FFFFFF00FBFBFB00F9F9
      F900F8F8F800F6F6F600F4F4F400F3F3F300F2F2F200F1F1F100EFEFEF00EDED
      ED00EBEBEB00F7F7F700CFCFCF00535353000000000000000000D0D0E200545B
      9F005D8FC50071CEF0004BC9AA0036B1990047BCF3007BA8C800DF8A5000F98E
      4000EDA1580077B5D2001D5AAB00A2A2C000CCCFD500B4A79800CC8C4400E6AA
      6200E5A45E00E59F5400E59A4B00E4974700E4934200E4924100E4934100E491
      4100E5953E00AA6C2D00C9C9CA00868788000000000000000000000000000000
      00000000000000000000E3E3E300B1B1B100979797007473730086848400CEC9
      C9005D5B5B0079747400B8B8B80000000000B9B9B900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FDFDFD00FCFCFC00FAFA
      FA00F9F9F900FFFFFF00D3D3D30054545400000000000000000000000000F6F6
      F900A0A0C6004C5BA0003D72C00052ABEB0054CAF9004AD0FF004EC4F50066B0
      CF005998CA001E4D9D008989B00000000000D2D3D400DBD9D600B4A08D00BBA6
      9000BAA59100BAA69300BAA79400B9A79500B9A79500B9A79400B9A79400B8A6
      9400B8A59100B1A49800EDEDEE00858585000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D3D3D3009D9D
      9D0076767600807F7F00DBDBDB000000000095959500C2C2C200C2C2C200C1C1
      C100C1C1C100C1C1C100C1C1C100C1C1C100C2C2C200C2C2C200C2C2C200C2C2
      C200C4C4C400CACACA008E8E8E009F9F9F000000000000000000000000000000
      000000000000ECECF300B6B6D2006268A1002F478D001F4C95000F529F00114B
      9D003F519600B3B3CB000000000000000000ABABAB00D3D3D400CDD2D600CCD1
      D600CCD0D500CCD0D500CCD0D500CBCED400CBCFD400CBCFD400CACED300CACE
      D300C9CED200CCD0D300CFCFCF007F7F7E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C007000000000000C00300000000
      0000C003000000000000C0070000000000008007000000000000800700000000
      0000800700000000000080030000000000000001000000000000000000000000
      0000000000000000000000000000000000000000000000000000000100000000
      0000001F00000000FFFFFFFF000000008000FC01F81FC07F0000F800E003C003
      0000C00000008001000000000000800000000000000080000000000000000000
      0000000000000000000000010000000000000001000000000000000100000000
      0000800100000000000080010000000000008003000000000000800700008063
      0000807FC003C07F0000C0FFF00FC3FFFFFFFE1B8000FFFFFFFFF8090000FFFF
      0000F00000000000000000000000000000000000000000000000000000000000
      00000008000080800000000800008080000000080000C0800000C0080000C081
      0000F0000000C1810000F0000000C1C30000F8000000E1FF0000FC000000E3FF
      FFFFFE190000FFFFFFFFFF1F0000FFFF8000F83FE007FFFF0000F01FF00FC001
      0000F0070000C001000010070000C001000000030000C001000000010000C001
      000000000000C001000000000000C00100000000000080010000000000008001
      0000000000008001000000000000803F000080000000C0010000C0000000FC01
      0000E0010000FFC10000F8030000FFFF00000000000000000000000000000000
      000000000000}
  end
end

{
$Id: utils.pas,v 1.2 2006/02/13 14:09:46 dk2it Exp $
 ***
 ** Various utils routines
 ***
}

unit utils;

interface

uses Classes;

function GetFileKind(const fn: string): byte;
function GetFileIcon(const fn: string): byte;
function GetFileDescr(const fn: string): string;

function Q_SameText(const S1, S2: string): Boolean;
function Q_CopyRight(const S: string; Count: Integer): string;
function Q_UpperCase(const S: string): string;

function readNullString(const st: TStream): string;
procedure writeNullString(st: TStream; s: string);
function read_BE_long(const st: tStream): integer;
procedure write_BE_long(const st: tStream; num: integer);
function read_BE_short(const st: tStream): word;
procedure write_BE_short(const st: tStream; num: word);

implementation

type TFileInfo = record
    Ext: string[3];
    IdxDescr: byte;
    IdxIcon: byte;
  end;

const TOTAL_EXTENSION = 34;
  aFileExt: array[0..TOTAL_EXTENSION - 1] of TFileInfo = (
    (Ext: 'COL'; IdxDescr: 0; IdxIcon: 1), // 1
    (Ext: 'PAL'; IdxDescr: 0; IdxIcon: 1), // 2
    (Ext: 'CPS'; IdxDescr: 1; IdxIcon: 2), // 3
    (Ext: 'CMP'; IdxDescr: 1; IdxIcon: 2), // 4
    (Ext: 'EGA'; IdxDescr: 1; IdxIcon: 2), // 5
    (Ext: 'MSC'; IdxDescr: 12; IdxIcon: 2), // 6
    (Ext: 'WSA'; IdxDescr: 2; IdxIcon: 3), // 7
    (Ext: 'SHP'; IdxDescr: 3; IdxIcon: 9), // 8
    (Ext: 'MID'; IdxDescr: 4; IdxIcon: 4), // 9
    (Ext: 'ADL'; IdxDescr: 4; IdxIcon: 4), // 10
    (Ext: 'XMI'; IdxDescr: 4; IdxIcon: 4), // 11
    (Ext: 'PCS'; IdxDescr: 4; IdxIcon: 4), // 12
    (Ext: 'TAN'; IdxDescr: 4; IdxIcon: 4), // 13
    (Ext: 'C55'; IdxDescr: 4; IdxIcon: 4), // 14
    (Ext: 'VOC'; IdxDescr: 5; IdxIcon: 5), // 15
    (Ext: 'EMC'; IdxDescr: 6; IdxIcon: 6), // 16
    (Ext: 'FNT'; IdxDescr: 7; IdxIcon: 7), // 17
    (Ext: 'DRV'; IdxDescr: 8; IdxIcon: 8), // 18
    (Ext: 'ADV'; IdxDescr: 8; IdxIcon: 8), // 19
    (Ext: 'DAT'; IdxDescr: 8; IdxIcon: 8), // 20
    (Ext: 'ICN'; IdxDescr: 9; IdxIcon: 9), // 21
    (Ext: 'VCN'; IdxDescr: 10; IdxIcon: 2), // 22
    (Ext: 'PAK'; IdxDescr: 11; IdxIcon: 10), // 23
    (Ext: 'APK'; IdxDescr: 11; IdxIcon: 10), // 24
    (Ext: 'VRM'; IdxDescr: 11; IdxIcon: 10), // 25
    (Ext: 'BAT'; IdxDescr: 13; IdxIcon: 12), //26
    (Ext: 'INI'; IdxDescr: 14; IdxIcon: 13), //27
    (Ext: 'ENG'; IdxDescr: 15; IdxIcon: 6), //28
    (Ext: 'FRE'; IdxDescr: 16; IdxIcon: 6), //29
    (Ext: 'GER'; IdxDescr: 17; IdxIcon: 6), //30
    (Ext: 'DLE'; IdxDescr: 18; IdxIcon: 6), //31
    (Ext: 'DLF'; IdxDescr: 19; IdxIcon: 6), //32
    (Ext: 'DLG'; IdxDescr: 20; IdxIcon: 6), //33
    (Ext: 'DIP'; IdxDescr: 21; IdxIcon: 6)  //34
    );

  aFileDescr: array[0..22] of string = (
    'VGA palette',
    'Compressed background image',
    'Sprite animation',
    'Shape images',
    'Music',
    'Sound effect',
    'Script and text table', //6
    'Font',
    'Binary data',
    'Dune2 icons',
    'Walls graphics tile',
    'PAK archive',
    'Background Layer Z Mask', //12
    'DOS Batch File',
    'INI file',
    'English String Table', //15
    'French String Table',
    'German String Table',
    'English Dialogs Text',
    'French Dialogs Text',
    'German Dialogs Text', //20
    'Text Table', //21
    'Unknown file'
    );

  ToUpperChars: array[0..255] of Char =
  (#$00, #$01, #$02, #$03, #$04, #$05, #$06, #$07, #$08, #$09, #$0A, #$0B, #$0C, #$0D, #$0E, #$0F,
    #$10, #$11, #$12, #$13, #$14, #$15, #$16, #$17, #$18, #$19, #$1A, #$1B, #$1C, #$1D, #$1E, #$1F,
    #$20, #$21, #$22, #$23, #$24, #$25, #$26, #$27, #$28, #$29, #$2A, #$2B, #$2C, #$2D, #$2E, #$2F,
    #$30, #$31, #$32, #$33, #$34, #$35, #$36, #$37, #$38, #$39, #$3A, #$3B, #$3C, #$3D, #$3E, #$3F,
    #$40, #$41, #$42, #$43, #$44, #$45, #$46, #$47, #$48, #$49, #$4A, #$4B, #$4C, #$4D, #$4E, #$4F,
    #$50, #$51, #$52, #$53, #$54, #$55, #$56, #$57, #$58, #$59, #$5A, #$5B, #$5C, #$5D, #$5E, #$5F,
    #$60, #$41, #$42, #$43, #$44, #$45, #$46, #$47, #$48, #$49, #$4A, #$4B, #$4C, #$4D, #$4E, #$4F,
    #$50, #$51, #$52, #$53, #$54, #$55, #$56, #$57, #$58, #$59, #$5A, #$7B, #$7C, #$7D, #$7E, #$7F,
    #$80, #$81, #$82, #$81, #$84, #$85, #$86, #$87, #$88, #$89, #$8A, #$8B, #$8C, #$8D, #$8E, #$8F,
    #$80, #$91, #$92, #$93, #$94, #$95, #$96, #$97, #$98, #$99, #$8A, #$9B, #$8C, #$8D, #$8E, #$8F,
    #$A0, #$A1, #$A1, #$A3, #$A4, #$A5, #$A6, #$A7, #$A8, #$A9, #$AA, #$AB, #$AC, #$AD, #$AE, #$AF,
    #$B0, #$B1, #$B2, #$B2, #$A5, #$B5, #$B6, #$B7, #$A8, #$B9, #$AA, #$BB, #$A3, #$BD, #$BD, #$AF,
    #$C0, #$C1, #$C2, #$C3, #$C4, #$C5, #$C6, #$C7, #$C8, #$C9, #$CA, #$CB, #$CC, #$CD, #$CE, #$CF,
    #$D0, #$D1, #$D2, #$D3, #$D4, #$D5, #$D6, #$D7, #$D8, #$D9, #$DA, #$DB, #$DC, #$DD, #$DE, #$DF,
    #$C0, #$C1, #$C2, #$C3, #$C4, #$C5, #$C6, #$C7, #$C8, #$C9, #$CA, #$CB, #$CC, #$CD, #$CE, #$CF,
    #$D0, #$D1, #$D2, #$D3, #$D4, #$D5, #$D6, #$D7, #$D8, #$D9, #$DA, #$DB, #$DC, #$DD, #$DE, #$DF);

function Q_SameText(const S1, S2: string): Boolean;
asm
        CMP     EAX,EDX
        JE      @@08
        TEST    EAX,EAX
        JE      @@09
        TEST    EDX,EDX
        JE      @@07
        MOV     ECX,[EAX-4]
        CMP     ECX,[EDX-4]
        JE      @@im
        XOR     EAX,EAX
        RET
@@im:   TEST    ECX,ECX
        JE      @@07
        PUSH    ESI
        PUSH    EDI
        MOV     ESI,EAX
        MOV     EDI,EDX
@@00:   DEC     ECX
        JS      @@qt
@@01:   MOVZX   EAX,BYTE PTR [ESI+ECX]
        MOVZX   EDX,BYTE PTR [EDI+ECX]
        CMP     AL,DL
        JE      @@00
        MOV     AL,BYTE PTR [EAX+ToUpperChars]
        XOR     AL,BYTE PTR [EDX+ToUpperChars]
        JE      @@00
        POP     EDI
        POP     ESI
@@07:   XOR     EAX,EAX
@@09:   RET
@@qt:   POP     EDI
        POP     ESI
@@08:   MOV     EAX,1
end;

procedure Q_StrUpperMoveL(const Source: string; var Dest: string; MaxL: Cardinal);
asm
        MOV     EDX,[EDX]
        TEST    EAX,EAX
        JE      @@x2
        PUSH    EDI
        MOV     EDI,[EAX-4]
        TEST    EDI,EDI
        JE      @@x4
        CMP     ECX,EDI
        JB      @@x0
        MOV     ECX,EDI
@@x0:   MOV     [EDX-4],ECX
        MOV     BYTE PTR [ECX+EDX],$00
        DEC     ECX
        JS      @@qt
        MOV     EDI,EDX
@@1:    MOVZX   EDX,BYTE PTR [EAX+ECX]
        MOV     DL,BYTE PTR [EDX+ToUpperChars]
        MOV     BYTE PTR [EDI+ECX],DL
        DEC     ECX
        JNS     @@1
@@qt:   POP     EDI
        RET
@@x4:   POP     EDI
        XOR     EAX,EAX
@@x2:   TEST    EDX,EDX
        JE      @@x3
        MOV     [EDX-4],EAX
        MOV     BYTE PTR [EDX],AL
@@x3:
end;

function Q_CopyRight(const S: string; Count: Integer): string;
begin
  Result := Copy(S, Length(S) - Count + 1, Count);
end;

function Q_UpperCase(const S: string): string;
var
  L: Integer;
begin
  L := Length(S);
  SetString(Result, nil, L);
  Q_StrUpperMoveL(S, Result, L);
end;

function GetFileExtRecord(const fn: string): TFileInfo;
var ext: string[3];
  found: boolean;
  i: byte;
begin
  found := false;
  ext := Q_CopyRight(fn, 3);
  for i := 0 to TOTAL_EXTENSION - 1 do // iterate
    if Q_SameText(ext, aFileExt[i].Ext) then
    begin
      result := aFileExt[i];
      found := true;
      break;
    end;

  if (not found) then
  begin
    result.Ext := ext;
    result.IdxDescr := High(aFileDescr);
    result.IdxIcon := 0;
  end;
end;

function GetFileKind(const fn: string): byte;
var ext: string[3];
  i: byte;
begin
  result := 0;
  if (fn = 'WRITING.CPS') or (fn = 'BEAD.CPS') then
  begin
    result := 8; //Kyrandia1 filename mistake
    exit;
  end;

  ext := Q_CopyRight(fn, 3);
  for i := 0 to TOTAL_EXTENSION - 1 do // iterate
    if Q_SameText(ext, aFileExt[i].Ext) then
    begin
      result := i + 1;
      break;
    end;
end;

function GetFileIcon(const fn: string): byte;
begin
  result := GetFileExtRecord(fn).IdxIcon;
end;

function GetFileDescr(const fn: string): string;
begin
  result := aFileDescr[GetFileExtRecord(fn).IdxDescr];
end;

function readNullString(const st: TStream): string;
var c: char;
begin
  Result := '';
  st.Read(c, 1);
  while (c <> #0) do
  begin
    Result := Result + c;
    st.Read(c, 1);
  end;
end;

procedure writeNullString(st: TStream; s: string);
var c: char;
begin
  st.Write(s[1], length(s));
  c := #0;
  st.Write(c, 1);
end;

function read_BE_long(const st: tStream): integer;
var b0, b1, b2, b3: byte;
begin
  st.read(b0, 1);
  st.read(b1, 1);
  st.read(b2, 1);
  st.read(b3, 1);
  Result := (b0 shl 24) + (b1 shl 16) + (b2 shl 8) + (b3);
end;

procedure write_BE_long(const st: tStream; num: integer);
var b0, b1, b2, b3: byte;
begin
  b0 := num shr 24;
  dec(num, b0 shl 24);
  b1 := num shr 16;
  dec(num, b1 shl 16);
  b2 := num shr 8;
  dec(num, b2 shl 8);
  b3 := num;
  st.Write(b0, 1); st.Write(b1, 1); st.Write(b2, 1); st.Write(b3, 1);
end;

function read_BE_short(const st: tStream): word;
var b0, b1: byte;
begin
  st.read(b0, 1);
  st.read(b1, 1);
  Result := (b0 shl 8) + (b1);
end;

procedure write_BE_short(const st: tStream; num: word);
var b0, b1: byte;
begin
  b0 := num shr 8;
  dec(num, b0 shl 8);
  b1 := num;
  st.Write(b0, 1); st.Write(b1, 1);
end;

end.


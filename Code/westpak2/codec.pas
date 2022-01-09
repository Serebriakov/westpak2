{
$Id: codec.pas,v 1.2 2005/11/27 08:42:32 dk2it Exp $
 ***
 ** COmpression/DECompression routines
 ***
 CHECK FIX FOR EOB1
}

unit codec;

interface

function Decompress_format80(var Source, Dest: array of byte; len: integer): integer;
function Decompress_format40(var Source, Dest: array of byte; len: integer): integer;
function Decompress_LBM(var Source, Dest: array of byte; len: integer): integer;
procedure correct_lf(var b1, b2: array of byte);
//function Compress_format80(var Source, Dest: array of byte; len: integer): integer;

implementation

uses SysUtils, dialogs;

procedure correct_lf(var b1, b2: array of byte);
var count, i, SP, DP: integer;
begin
  SP := 0; DP := 0;
  while SP < high(b1) do
  begin
    if (b1[SP] = 0) then
    begin
      inc(SP);
      count := b1[SP];
      if count = 0 then break;
      for i := 0 to count - 1 do
      begin
        b2[DP] := 0;
        inc(DP);
      end;
      inc(SP);
    end else begin
      b2[DP] := b1[SP];
      inc(DP);
      inc(SP);
    end; //else
  end; //while
end;

function Decompress_format80(var Source, Dest: array of byte; len: integer): integer;
var DP, SP, Count, Posit, i, tmp: integer;
  com, b, b7, b6: byte;
begin
  SP := 0;
  DP := 0;
  try

    repeat
      Com := Source[SP];
      inc(SP);
      b7 := Com shr 7; {b7 is bit 7 of Com}
      case b7 of
        0: begin {copy command (2)}
   {Count is bits 4-6 + 3}
            Count := (Com and $7F) shr 4 + 3;
   {Position is bits 0-3, with bits 0-7 of next byte}
            Posit := (Com and $0F) shl 8 + Source[SP];
            Inc(SP);
   {Starting pos=Cur pos. - calculated value}
            Posit := DP - Posit;
            for i := Posit to Posit + Count - 1 do
            begin
              Dest[DP] := Dest[i];
              Inc(DP);
            end;
          end;
        1: begin
            {Check bit 6 of Com}
            b6 := (Com and $40) shr 6;
            case b6 of
              0: begin {Copy as is command (1)}
                  Count := Com and $3F; {mask 2 topmost bits}
                  if Count = 0 then break; {EOF marker}
                  for i := 1 to Count do
                  begin
                    Dest[DP] := Source[SP];
                    Inc(DP);
                    Inc(SP);
                  end;
                end; //case b6 - 0
              1: begin {large copy, very large copy and fill commands}
                    {Count = (bits 0-5 of Com) +3}
                    {if Com=FEh then fill, if Com=FFh then very large copy}
                  Count := Com and $3F;
                  if Count < $3E then {large copy (3)}
                  begin
                    Inc(Count, 3);
                  {Next word = pos. from start of image}
                    Posit := Source[SP + 1] * 256 + Source[SP];
                    Inc(SP, 2);
                    for i := Posit to Posit + Count - 1 do
                    begin
                      Dest[DP] := Dest[i];
                      Inc(DP);
                    end;
                  end
                  else if Count = $3F then {very large copy (5)}
                  begin
                      {next 2 words are Count and Pos}
                    Count := Source[Sp + 1] * 256 + Source[Sp];
                    Posit := Source[Sp + 3] * 256 + Source[Sp + 2];
                    Inc(SP, 4);
                    for i := Posit to Posit + Count - 1 do
                    begin
                      Dest[DP] := Dest[i];
                      Inc(DP);
                    end;
                  end else
                  begin {Count=$3E, fill (4)}
                      {Next word is count, the byte after is color}
                    Count := Source[Sp + 1] * 256 + Source[Sp];
                    Inc(SP, 2);
                    b := Source[SP];
                    Inc(SP);

                    //fix for  Eob1 - EOBDATA4.PAK -> EOBTITLE.CMP
                    //or check better this command (
                    //maybe ignore the command and continue decompression
                    if (DP + Count > High(Dest)) then
                    begin
                      //showmessage('overflow');
                      Result:=DP;
                      exit;

                      //break; //case
                      //dec(SP, 3);
                      (*
                      Posit := Count;
                      Count := $3E + 3;
                      Dec(SP);
                      for i := Posit to Posit + Count - 1 do
                      begin
                        Dest[DP] := Dest[i];
                        Inc(DP);
                      end;
                      *)
                    end else
                      for i := 0 to Count - 1 do
                      begin
                        Dest[DP] := b;
                        inc(DP);
                      end; //for

                  end;
                end; //case b6 - 1
            end; //end case b6
          end; //case b7 - 1
      end; //end case b7
    until (SP > len);
  except
    SP := 0;
  end;
  Result := DP;
end;

function Decompress_format40(var Source, Dest: array of byte; len: integer): integer;
(*
  DP = destination pointer
  SP = source pointer
  Source is buffer containing the Format40 data
  Dest   is the buffer containing the image over which the second has
   to be xor-ed
*)
var DP, SP, Tc, Count, Posit, i, tmp: integer;
  com, b, b7, b6: byte;
begin
  SP := 0;
  DP := 0;
  repeat
    Com := Source[SP];
    Inc(SP);

    if (Com and $80) <> 0 then {if bit 7 set}
    begin
      if Com <> $80 then {small skip command (1)}
      begin
        Count := Com and $7F;
        Inc(DP, Count);
      end
      else {Big commands}
      begin
        Count := Source[SP + 1] * 256 + Source[SP];
        if Count = 0 then break;
        Inc(SP, 2);

        Tc := (Count and $C000) shr 14; {Tc=two topmost bits of count}

        case Tc of
          0, 1: begin {Big skip (2)}
              Inc(DP, Count);
            end;
          2: begin {big xor (3)}
              Count := Count and $3FFF;
              for i := 1 to Count do
              begin
                Dest[DP] := Dest[DP] xor Source[SP];
                Inc(DP);
                Inc(SP);
              end;
            end;
          3: begin {big repeated xor (4)}
              Count := Count and $3FFF;
              b := Source[SP];
              Inc(SP);
              for i := 1 to Count do
              begin
                Dest[DP] := Dest[DP] xor b;
                Inc(DP);
              end;
            end;
        end;
      end;
    end else {xor command}
    begin
      Count := Com;
      if Count = 0 then
      begin {repeated xor (6)}
        Count := Source[SP];
        Inc(SP);
        b := Source[SP];
        Inc(SP);
        for i := 1 to Count do
        begin
          Dest[DP] := Dest[DP] xor b;
          Inc(DP);
        end;
      end else {copy xor (5)}
        for i := 1 to Count do
        begin
          try
            Dest[DP] := Dest[DP] xor Source[SP];
          except
            SP := 0;
          end;
          Inc(DP);
          Inc(SP);
        end;
    end;
  until (SP > len);
  Result := DP;
end;

function Decompress_LBM(var Source, Dest: array of byte; len: integer): integer;
var com: shortint;
  col, debug: byte;
  count, _UnpSizeLBM: integer;
  DP, SP, i: integer;

begin
  _UnpSizeLBM := 0;
  SP := 0;
  DP := 0;
  repeat
    try

      debug := 0;
      com := Source[SP];
      inc(SP);

      if (com > 0) then
      begin
      //  A Pixelstring is copied if 'com' > 0
      //UnpSizeLBM += cmp;
      //unpsize    -= cmp;  // Check the result

        debug := 1;
        for i := 0 to com - 1 do
        begin
          Dest[DP] := Source[SP];
          inc(DP);
          inc(SP);
        end; //while
      end
      else
      begin
        if (com < 0) then
        begin
          count := -com;
        end
        else
        begin // (cmp == 0)
        // Big sized repeat of pixels
          count := (Source[SP] * 256) + Source[SP + 1];
          inc(SP, 2);
        end;

        col := Source[SP]; // Get color of pixel
        inc(SP);

      //UnpSizeLBM + = count;
      //unpsize - = count; // Check the result
        debug := 2;
        for i := 0 to count - 1 do
      //while (count > 0) do
        begin
          Dest[DP] := col;
          inc(DP);
        end; //for
        //17355 - 31990 -c=0 7C F6 A0

      end;

    except
      raise Exception.Create('Error! SP=' + intToStr(SP) + ' / DP=' + intToStr(DP) + ' / com=' + intToStr(com) + '/ count=' + intToStr(count) + ' / debug=' + intToStr(debug));
    end;
  until (SP >= len);
  //while (unpsize > 0);
  Result := DP;
  // return _UnpSizeLBM
end;

(*
//compression
function Compress_format80(var Source, Dest: array of byte; len: integer): integer;
var SP, DP, Count, Posit, endpos, i: integer;
  com: word;
  c, c1, b: byte;
begin
  SP := 0;
  DP := 0;
  dec(len);
  repeat
    c := Source[SP];
    count := 0;
    repeat
      inc(SP);
      inc(count);
      if SP > 64000 then begin
        ShowMessage('ERROR!');
      end;
      c1 := Source[SP];
    until (c <> c1) or (SP >= len);
      //dec(count);
    if count > 1 then //run
    begin
      if (count < 3) then
      begin
        Dest[DP] := count or $80;
        inc(DP);
        for i := 1 to count do
        begin
          Dest[DP] := c;
          inc(DP);
        end;
      //Form1.memo1.Lines.Add('Copy Command 1');
      end else if (count <= 10) then
      begin
        if (SP - count) = 0 then begin
          Dest[DP] := $81;
          inc(DP);
          Dest[DP] := c;
          inc(DP);
        end;
        dec(count, 3);
        count := count shl 4;
        posit := 1;
        b := (posit shr 8);
        //invertire con quello sotto????
        Dest[DP] := count or b;
        inc(DP);
        Dest[DP] := (posit - (b shl 8));
        inc(DP);
        MainForm.memo1.Lines.Add('Copy Command 2');
        MainForm.memo1.Lines.Add(format('1byte=%d 2byte=%d', [Dest[dp - 2], dest[dp - 1]]));
      end else if (count <= 66) then
      begin
        if (SP - count) = 0 then begin
          Dest[DP] := $81;
          inc(DP);
          Dest[DP] := c;
          inc(DP);
        end;
        dec(count, 3);
        Dest[DP] := $C0 or count;
        inc(DP);
        posit := 1;
        b := (posit shr 8);
        Dest[DP] := (posit - (b shl 8));
        inc(DP);
        Dest[DP] := b;
        inc(DP);
        //Form1.memo1.Lines.Add('Copy Command 3');
      end else
      begin
        Dest[DP] := $FE; //11111110
        inc(DP);
        b := (count shr 8);
        Dest[DP] := count - (b shl 8);
        inc(DP);
        Dest[DP] := b;
        inc(DP);
        Dest[DP] := c;
        inc(DP);
        MainForm.memo1.Lines.Add('Copy Command 4');
      end;
    end else
    begin
      while (c <> c1) and (SP < len) do
      begin
        c := c1;
        inc(SP);
        inc(count);
        c1 := Source[SP];
      end;
      posit := SP - count;
      if SP < len then dec(count);
      Dest[DP] := count or $80;
      inc(DP);
      for i := posit to posit + count do
      begin
        Dest[DP] := Source[i];
        inc(DP);
      end;
      //Form1.memo1.Lines.Add('Copy Command 1');
    end;

  until (SP >= len);
  Result := DP;
end;
*)

(*
function IDecompress_format80(var Source, Dest: array of byte; len: integer): integer;
var DP, SP, Count, Posit, i, tmp: integer;
  com, b, b7, b6: byte;
  img: TDibUltra;
  x, y: integer;
begin
  for x := 0 to 64000 - 1 do Dest[i] := 0;

  SP := 0;
  DP := 0;
  repeat
    Com := Source[SP];
    inc(SP);

    b7 := Com shr 7; {b7 is bit 7 of Com}
    case b7 of
      0: begin {copy command (2)}
            {Count is bits 4-6 + 3}
          Count := (Com and $7F) shr 4 + 3;
            {Position is bits 0-3, with bits 0-7 of next byte}
          Posit := (Com and $0F) shl 8 + Source[SP];

          MainForm.memo1.Lines.Add('Copy Command 2');
          MainForm.memo1.Lines.Add(
            Format('%d (%s) - %d (%s)', [com, LongWordToBin(com, 8), Source[SP], LongWordToBin(Source[SP], 8)])
            );
          MainForm.memo1.Lines.Add(
            Format('Count = %d (%s) / Rel Pos = %d (%s)', [count - 3, LongWordToBin(count - 3, 3), posit, LongWordToBin(posit, 12)])
            );

          Inc(SP);
            {Starting pos=Cur pos. - calculated value}
          Posit := DP - Posit;
          for i := Posit to Posit + Count - 1 do
          begin
            Dest[DP] := Dest[i];
            Inc(DP);
          end;

        end;
      1: begin
            {Check bit 6 of Com}
          b6 := (Com and $40) shr 6;
          case b6 of
            0: begin {Copy as is command (1)}
                Count := Com and $3F; {mask 2 topmost bits}

                MainForm.memo1.Lines.Add('Copy Command 1');
                MainForm.memo1.Lines.Add(
                  Format('%d (%s)', [com, LongWordToBin(com, 8)])
                  );
                MainForm.memo1.Lines.Add(
                  Format('Count = %d (%s)', [count, LongWordToBin(count, 6)])
                  );

                if Count = 0 then break; {EOF marker}
                for i := 1 to Count do
                begin
                  Dest[DP] := Source[SP];
                  Inc(DP);
                  Inc(SP);
                end;
              end;
            1: begin {large copy, very large copy and fill commands}
                    {Count = (bits 0-5 of Com) +3}
                    {if Com=FEh then fill, if Com=FFh then very large copy}
                Count := Com and $3F;
                if Count < $3E then {large copy (3)}
                begin
                  Inc(Count, 3);
                  {Next word = pos. from start of image}
                  Posit := Source[SP + 1] * 256 + Source[SP];
                  Inc(SP, 2);

                  MainForm.memo1.Lines.Add('Copy Command 3');
                  MainForm.memo1.Lines.Add(
                    Format('%d (%s) - %d (%s)', [com, LongWordToBin(com, 8), posit, LongWordToBin(posit, 16)])
                    );
                  MainForm.memo1.Lines.Add(
                    Format('Count = %d (%s) / Pos = %d (%s)', [count - 3, LongWordToBin(count - 3, 6), posit, LongWordToBin(posit, 16)])
                    );

                  for i := Posit to Posit + Count - 1 do
                  begin
                    Dest[DP] := Dest[i];
                    Inc(DP);
                  end;
                end
                else if Count = $3F then {very large copy (5)}
                begin
                      {next 2 words are Count and Pos}
                  Count := Source[Sp + 1] * 256 + Source[Sp];
                  Posit := Source[Sp + 3] * 256 + Source[Sp + 2];

                  MainForm.memo1.Lines.Add('Copy Command 5');
                  MainForm.memo1.Lines.Add(
                    Format('%d (%s) - %d (%s) - %d (%s)', [com, LongWordToBin(com, 8), count, LongWordToBin(count, 16), posit, LongWordToBin(posit, 16)])
                    );

                  Inc(SP, 4);
                  for i := Posit to Posit + Count - 1 do
                  begin
                    Dest[DP] := Dest[i];
                    Inc(DP);
                  end;
                end else
                begin {Count=$3E, fill (4)}
                      {Next word is count, the byte after is color}
                  Count := Source[Sp + 1] * 256 + Source[Sp];
                  Inc(SP, 2);
                  b := Source[SP];

                  MainForm.memo1.Lines.Add('Fill Command 4');
                  MainForm.memo1.Lines.Add(
                    Format('%d (%s) - %d (%s) - %d (%s)', [com, LongWordToBin(com, 8), count, LongWordToBin(count, 16), b, LongWordToBin(b, 8)])
                    );

                  Inc(SP);
                  for i := 0 to Count - 1 do
                  begin
                    Dest[DP] := b;
                    inc(DP);
                  end;
                end;
              end;
          end;
        end;
    end;

    img := TDIBUltra.Create(320, 200, DUpf8, @MyPal);
    for y := 0 to 199 do
      for x := 0 to 319 do
        img.PixelsIndex[x, y] := Dest[((y * 320) + x)];
    img.DrawOn(MainForm.Image1.ClientRect, MainForm.Image1.Canvas, 0, 0);
    img.Free;
    MainForm.image1.Refresh;

    global_gonext := false;
    repeat
      Application.ProcessMessages;
    until (global_gonext);
    MainForm.memo1.Clear;

  until (SP > len);
  Result := DP;
end;
*)

end.


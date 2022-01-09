unit hq2x;

interface

procedure _hq2x_16(inbuffer, outbuffer: Pointer;
                   Xres, Yres, pitch: Longword); cdecl;

procedure _hq2x_32(inbuffer, outbuffer: Pointer;
                   Xres, Yres, pitch: Longword); cdecl;

function InitLUTs: Integer;

implementation

var
  _LUT16to32 : array[0..65535] of Longword;
  _RGBtoYUV  : array[0..65535] of Longword;

{$L hq2x16.obj}
procedure _hq2x_16; external;

{$L hq2x32.obj}
procedure _hq2x_32; external;

function InitLUTs: Integer;
var
  i, j, k, r, g, b, Y, u, v: Integer;
  nMMXsupport : Integer;
begin
  for i := 0 to 65535 do
  begin
    _LUT16to32[i] := ((i and $F800) shl 8) + ((i and $07E0) shl 5) +
                     ((i and $001F) shl 3);
  end;

  for i := 0 to 31 do
  begin
    for j := 0 to 63 do
    begin
      for k := 0 to 31 do
      begin
        r := i shl 3;
        g := j shl 2;
        b := k shl 3;

        Y := (r + g + b) shr 2;
        u := 128 + ((r - b) shr 2);
        v := 128 + ((-r + 2*g -b) shr 3);

        _RGBtoYUV[(i shl 11) + (j shl 5) + k] := (Y shl 16) + (u shl 8) + v;
      end;
    end;
  end;

  nMMXsupport := 0;

  asm
    PUSH  EBX
    MOV   EAX, 01h
    CPUID
    AND   EDX, 00800000h
    MOV   nMMXsupport, EDX
    POP   EBX
  end;

  Result := nMMXsupport;
end;

initialization

InitLUTs;

end.
unit Scaler;

interface
uses Windows, Graphics, SysUtils;

procedure Scale2x(SrcBitmap, DstBitmap : TBitmap);

implementation

function Blend2(C1, C2 : TColor) : TColor;
var R, G, B : byte;
begin;
// if C1 < C2 then result := C1 else result := C2;
  R := (((C1 and $00FF0000) shr 16) + ((C2 and $00FF0000) shr 16)) shr 1;
  G := (((C1 and $0000FF00) shr 08) + ((C2 and $0000FF00) shr 08)) shr 1;
  B := (((C1 and $000000FF) shr 00) + ((C2 and $000000FF) shr 00)) shr 1;

  Result := (R shl 16) + (G shl 8) + B;
end;

procedure Scale2x(SrcBitmap, DstBitmap : TBitmap);
{ Precondition : DstBitmap must be preinitialized to 2x width and 2x height of
                 SrcBitmap.
                 Both bitmaps must have pixelformat = pf32bit
}
var W, H : integer;
    X, Y : longword;
    A1, B1,
    A2, B2: TColor;
    NewScanLine1, NewScanLine2, OldScanLine1, OldScanLine2 : array of TColor;

begin;
  W := SrcBitmap.Width;
  H := SrcBitmap.Height;

  SetLength(NewScanLine1, W*2);
  SetLength(NewScanLine2, W*2);
  SetLength(OldScanLine1, W);
  SetLength(OldScanLine2, W);

  for Y := 0 to H-2 do begin;
    Move(SrcBitmap.ScanLine[Y]^, OldScanLine1[0], W*4);
    Move(SrcBitmap.ScanLine[Y+1]^, OldScanLine2[0], W*4);

    for X := 0 to W-2 do begin;
      A1 := OldScanLine1[X]; B1 := OldScanLine1[X+1];
      A2 := OldScanLine2[X]; B2 := OldScanLine2[X+1];

      if (A1 = A2) and (A2 = B2) and (B2 = B1) then begin; // all the same
        NewScanLine1[(X shl 1) + 1] := A1;
        NewScanLine2[X shl 1] := A1;
        NewScanLine2[(X shl 1) + 1]:=A2;
      end else
      if (A1 = A2) and (A2 = B2) then begin; // lower left
        NewScanLine1[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine2[(X shl 1)] := A1;
        NewScanLine2[(X shl 1) + 1] := A1;
      end else
      if (A2 = B2) and (B2 = B1) then begin; // lower right
        NewScanLine1[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine2[(X shl 1) + 1] := A2;
        NewScanLine2[(X shl 1)] := Blend2(A1, A2);
      end else
      if (B2 = B1) and (B1 = A1) then begin; // upper right
        NewScanLine1[( X shl 1) + 1] := A1;
        NewScanLine2[( X shl 1) + 1] := A1;
        NewScanLine2[( X shl 1)] := Blend2(A1, A2);
      end else
      if (B1 = A1) and (A1 = A2) then begin; // upper left
        NewScanLine1[(X shl 1) + 1] := A1;
        NewScanLine2[(X shl 1)] := A1;
        NewScanLine2[(X shl 1) + 1] := A1;
      end else
      if (A1 = A2) and (B1 = B2) then begin; // ||
        NewScanLine1[(X shl 1) + 1] := A1;//Blend2(A1, B1);
        NewScanLine2[(X shl 1) + 1] := Blend2(A1,A2);//Blend2(A1, B1);
        NewScanLine2[(X shl 1)] := A1;
      end else
      if (A2 = B2) and (A1 = B1) then begin; //  =
        NewScanLine1[(X shl 1) + 1] := A1;
        NewScanLine2[(X shl 1)] := A1;//Blend2(A1, A2);
        NewScanLine2[(X shl 1)+1] := A1;//Blend2(A1, A2);
      end else
      if (A1 = A2) then begin; // |:
        NewScanLine1[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine2[(X shl 1)] := A1;
        NewScanLine2[(X shl 1) + 1] := Blend2(A1, B1{Blend2(B1, B2)});
      end else
      if (B1 = B2) then begin; // :|
        NewScanLine1[(X shl 1) + 1] := A1;//Blend2(A1, B1);
//        NewScanLine2[(X shl 1) + 1] := Blend2(B1, Blend2(A1, A2));
//        NewScanLine2[(X shl 1)] := Blend2(Blend2(A1, B2), NewScanLine2[(X shl 1) + 1]);
        NewScanLine2[(X shl 1)] := Blend2(A1, A2);
        NewScanLine2[(X shl 1) + 1] := Blend2(A1, A2);
      end else
      if (A1 = B1) then begin; // top half equal
        NewScanLine1[(X shl 1) + 1] := A1;
        NewScanLine2[(X shl 1)] := A1;//Blend2(A1, A2);
        NewScanLine2[(X shl 1) + 1] := A1;//Blend2(A1, Blend2(A2, B2));
      end else
      if (A2 = B2) then begin; // bottom half equal
        NewScanLine1[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine2[(X shl 1)] := A1;//Blend2(A1, A2);
        NewScanLine2[(X shl 1) + 1] := Blend2(A1,B1);//Blend2(NewScanLine1[(X shl 1) + 1], Blend2(B2, B1));
      end else
      if (A1 = B2) and (B1 = A2) then begin; // diagonals equal, X
        NewScanLine2[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine1[(X shl 1) + 1] := {Blend2(}NewScanLine2[(X shl 1) + 1];{, Blend2(}
        NewScanLine2[(X shl 1)] := Blend2(A1, B1);
      end else
      if (A1 = B2) then begin; // \
        NewScanLine1[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine2[(X shl 1) + 1] := A1;
        NewScanLine2[(X shl 1)] := Blend2(A1, A2);
      end else
      if (A2 = B1) then begin; // /
        NewScanLine1[(X shl 1) + 1] := Blend2(B1, A1);
        NewScanLine2[(X shl 1) + 1] := B1;
        NewScanLine2[(X shl 1)] := Blend2(B1, A1);
      end else
      begin; // none equal
        NewScanLine1[(X shl 1) + 1] := Blend2(A1, B1);
        NewScanLine2[(X shl 1)] := Blend2(A1, A2);
        NewScanLine2[(X shl 1) + 1] := Blend2(Blend2(A1, B1), Blend2(A2, B2));
      end;

      NewScanLine1[X shl 1] := A1;

    end;

    Move(NewScanLine1[0], DstBitmap.ScanLine[Y*2]^, W*4*2);
    Move(NewScanLine2[0], DstBitmap.ScanLine[Y*2+1]^, W*4*2);

  end;

end;


end.
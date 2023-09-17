const
  s: string = ' e239093nnAz';
var
  solve : Longword;
function Base36ToUL(const Str: string): Longword;
var
  cp: PChar;
  Result : integer;
begin
  Result := 0;
  cp := PChar(str);
  // skip whitespace
  while cp^ in [#1..#32] do
    Inc(cp);
  if cp^ = #0 then
    raise Exception.Create('Unexpected end of string');
  // read in string
  while True do
  begin
    case cp^ of
      '0'..'9':
        Result := Result * 36 + Ord(cp^) - Ord('0');
      'a'..'z':
        Result := Result * 36 + Ord(cp^) - Ord('a') + 10;
      'A'..'Z':
        Result := Result * 36 + Ord(cp^) - Ord('A') + 10;
    else
      Break;
    end;
    Inc(cp);
  end;
  // skip whitespace
  while cp^ in [#1..#32] do
    Inc(cp);
  if cp^ <> #0 then
    raise Exception.Create('Unexpected garbage at end of string');
end;

begin
  solve := Base36ToUL(s);
  Writeln('the value is:', solve);
end.
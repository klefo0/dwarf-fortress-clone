{$mode objfpc}
{$typedAddress on}
uses SysUtils;
function StringToInt(var str: string; var endPtr: PChar): Integer;
var
  tempStr: string;
  i: Integer;
begin
  // Trim leading whitespace
  while (str <> '') and (str[1] <= ' ') do
    Delete(str, 1, 1);
  
  // Find the end of the string
  endPtr := Addr(str);

  while endPtr^ <> #0 do
    Inc(endPtr);

  // Convert the string to integer
  tempStr := Copy(str, 1, endPtr - Addr(str)); // Get substring until endPtr
  Val(tempStr, Result, i);
  
  // Update endPtr to point to the actual end of the substring
  Dec(endPtr);
  
  // Trim trailing whitespace
  while (tempStr <> '') and (tempStr[Length(tempStr)] <= ' ') do
    Delete(tempStr, Length(tempStr), 1);
  
  // Return the integer value
  Result := StrToInt(tempStr);
end;


var
  str: string;
  endPtr: PChar;
  intValue: Integer;
begin
  str := '12345   ';
  
  intValue := StringToInt(str, endPtr);
  
  // Access the end position using endPtr
  Writeln('End position pointer: ', Ord(endPtr^));
  writeln('somthing', Addr(str));
  // Print the converted integer value
  Writeln('Integer value: ', intValue);
end.


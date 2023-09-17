unit C_func;
interface
function StringToInt(var str: string; var endPtr: PChar): Integer; public;

implementation
var
  tempStr: string;
  i: Integer;

function StringToInt(var str: string; var endPtr: PChar): Integer;
(*
  Input string convert to integer number and 
  the pointer point to the end of the string
*)
  begin
    // Trim leading whitespace
    while (str <> '') and (str[1] <= ' ') do
      Delete(str, 1, 1);
    
    // Find the end of the string
    endPtr := Addr(str); {endptr points to str}

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
end.
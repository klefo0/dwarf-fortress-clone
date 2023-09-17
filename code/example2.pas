{$mode objfpc}
Uses strings;

{ Program to demonstrate the StrScan and StrRScan functions. }

Const P : PChar = '23445563';
      //S : Char = 's' ;
var  number :integer;

function strtol (str: PChar): integer; public;
const whitespace : char = ' ';
var
    endptr : PChar;
    //pos    : integer;

begin
    endptr := Nil;
    if endptr = StrLen(str) then Raise Exception.Create('This is end of string');
    if  (endptr^ = whitespace) then Inc(endptr);
    while True do 
        begin
            strtol := StrToInt(string);
            Inc(endptr);
        end;
end;

begin
    number := strtol(P);
    Writeln('string is', number);
end.
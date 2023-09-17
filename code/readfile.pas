
program ReadFile;
{$I+}
{$mode objfpc}
{$INLINE ON}
uses
 Sysutils;

const
  C_FNAME = 'init.txt';

type
    name = Record
        element : string;
        state_n : boolean;
        num     : integer;
        mode    : string; 
    end;
var
  tfIn: TextFile;
  s: string;
  //string_read: ShortString;

function Positive (which: integer):boolean;
begin
    if which > 0 then
        exit(True)
    else
        exit(False);
end;

function grab_token_string_pos(dest: string; source: string; pos: Integer; compc: Char): Boolean;
var l,i: integer;
begin
    l := Length(dest);
    Delete(dest, 0, l);
  if Length(source) = 0 then
    exit(False);
  if pos > Length(source) then
    exit(False);

  // GO UNTIL YOU HIT A :, ], or the end
  for i := pos to Length(source) - 1 do begin
    if (source[i] = compc) or (source[i] = ']') then
      break;
    dest += source[i];
  end;
  exit(Length(dest) > 0);
end;

function grab_variable_token(str: string; token: string; sec_comp: char; pos: Integer; i_pos: Integer): Char;
var l: integer;
begin
    l := Length(token);
    Delete(token, 0, l);
    while (pos = i_pos) and (pos<Length(str)) do
        begin
        pos:=pos+1;
        if ((str[pos] = '[') and (pos + 1 < Length(str))) or (str[pos] = sec_comp) then 
        begin
            if (str[pos] = '[') and (sec_comp <> '') then pos := pos + 1;
            grab_token_string_pos(token, str, pos, ':');
            pos := pos - 1;
        if Length(token) > 0 then
            Positive(1);
        end;
    end;
  Positive(0);
end;

function ReadConfigPart(configElement: ShortString):string;
var
    s_1 : string;
begin
    s_1 := '';
    try
        if (configElement = '[SOUND:') then write(s_1);
    except
        on E: EInOutError do 
            writeln('File handling error occurred. Details: ', E.Message);
    end;


end;


begin
  // Give some feedback
  writeln('Reading the contents of file: ', C_FNAME);
  writeln('=========================================');

  // Set the name of the file that will be read
  AssignFile(tfIn, C_FNAME);

  // Embed the file handling in a try/except block to handle errors gracefully
  try
    // Open the file for reading
    reset(tfIn);

    // Keep reading lines until the end of the file is reached
    while not eof(tfIn) do
    begin
      readln(tfIn, s);
      ReadConfigPart(s);
      //writeln(s);
    end;

    // Done so close the file
    CloseFile(tfIn);

  except
    on E: EInOutError do
     writeln('File handling error occurred. Details: ', E.Message);
  end;

  // Wait for the user to end the program
  writeln('=========================================');
  writeln('File ', C_FNAME, ' was probably read. Press enter to stop.');
  readln;
end.
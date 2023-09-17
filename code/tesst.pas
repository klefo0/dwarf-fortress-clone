procedure DoAnExit (Yes:boolean);
begin
    writeln('hi');
    if Yes then
        begin
            writeln('bailing out early');
            exit;
        end;
    writeln('continue to the end.');
end;

function Positive (which: integer):boolean;
begin
    if which > 0 then
        exit(True)
    else
        exit(False);
end;

begin
    DoAnExit(False);
    DoAnExit(True);

    if Positive(-1) then
        writeln('The compiler is wrong')
    else
        writeln('The compiler is not so bad');
end.
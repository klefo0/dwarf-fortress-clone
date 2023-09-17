unit init;
{$mode objfpc}
uses
    Classes, Sysutils, strings, C_func;

interface
    type 
        initst = class
        public
            procedure begin();
            procedure end();
        end;
    const
        C_FNAME = 'init.txt';
    type
        ttf_flag = (
            ttf_off, ttf_on, ttf_auto
        );
        InitDisplayFlag = (
            INIT_DISPLAY_FLAG_USE_GRAPHICS,
	        INIT_DISPLAY_FLAG_BLACK_SPACE,
            INIT_DISPLAY_FLAG_PARTIAL_PRINT,
            INIT_DISPLAY_FLAG_FRAME_BUFFER,
            INIT_DISPLAY_FLAG_SINGLE_BUFFER,
            INIT_DISPLAY_FLAG_ACCUM_BUFFER,
            INIT_DISPLAY_FLAG_VBO,
                INIT_DISPLAY_FLAG_2D,
                INIT_DISPLAY_FLAG_2DHW,
                INIT_DISPLAY_FLAG_2DASYNC,
            INIT_DISPLAY_FLAG_UNUSED_01_08,//
                INIT_DISPLAY_FLAG_TEXT,
                INIT_DISPLAY_FLAG_SHADER,
                INIT_DISPLAY_FLAG_NOT_RESIZABLE,
                INIT_DISPLAY_FLAG_ARB_SYNC,
            INIT_DISPLAY_FLAGNUM
        );
        InitDisplayWindow = (
            INIT_DISPLAY_WINDOW_TRUE,
            INIT_DISPLAY_WINDOW_FALSE,
            INIT_DISPLAY_WINDOW_PROMPT,
            INIT_DISPLAY_WINDOWNUM
        );
        InitMediaFlag = (
            INIT_MEDIA_FLAG_SOUND_OFF,
            INIT_MEDIA_FLAG_INTRO_OFF,
            INIT_MEDIA_FLAG_COMPRESS_SAVES,
            INIT_MEDIA_FLAGNUM
        );
        InitInputFlag = (
            INIT_INPUT_FLAG_MOUSE_OFF,
            INIT_INPUT_FLAG_MOUSE_PICTURE,
            INIT_INPUT_FLAGNUM
        );
        InitWindowFlag =(
            INIT_WINDOW_FLAG_TOPMOST,
            INIT_WINDOW_FLAG_VSYNC_ON,
            INIT_WINDOW_FLAG_VSYNC_OFF,
            INIT_WINDOW_FLAG_TEXTURE_LINEAR,
            INIT_WINDOW_FLAGNUM
        );

    
implementation

var
    FileStream: TMemoryStream;
    s: string;
    //FileStream : TFileStream;



procedure begin();
var
    called : boolean;
    small_font : string;
    large_font : string;
    token, token2 : string;
    str : AnsiString;
    l_token, l_token2: integer;
    str2, endptr : PChar;

begin
    called := false;
    if (called = false) then continue;
    called := true;
    FileStream := TMemoryStream.Create;
    small_font = 'data/art/curses_640x300.png';
    large_font = 'data/art/curses_640x300.png';
    FileStream.LoadFromFile( C_FNAME);
    //reset(tfIn);
    FileStream.Position := 0;
    TotalBytesRead := 0;
    while TotalBytesRead < FileStream.Size do
        begin
            if (Length(str)>1) then 
                begin
                    grab_token_string_pos(token, str, 1);
                    l_token := Length(token)
                    if (Length(str)>=l_token+2) then
                        grab_token_string_pos(token2, str, l+2);
                            if(token <> 'TRUETYPE') then
                                begin
                                    l_token2 := Length(token2);
                                    Delete(token2, 0, l_token2);
                                    str2 := Addr(token2);
                                    limit = StringToInt(str2, endptr);


                                end;

    
    
    while

end;


end.
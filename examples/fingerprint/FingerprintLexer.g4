lexer grammar FingerprintLexer;

// Whitespace and Newlines
WS        : [ \t\f]+ -> skip;
NL        : '\r'? '\n';

// Keywords and Commands (case-insensitive)
ABS       : [Aa][Bb][Ss];
ACTLEN    : [Aa][Cc][Tt][Ll][Ee][Nn];
ALIGN     : [Aa][Ll][Ii][Gg][Nn];
AN        : [Aa][Nn];                           // abbreviation for ALIGN
ASC       : [Aa][Ss][Cc];
BARADJUST : [Bb][Aa][Rr][Aa][Dd][Jj][Uu][Ss][Tt];
BARCODENAME_S : [Bb][Aa][Rr][Cc][Oo][Dd][Ee][Nn][Aa][Mm][Ee] '$';
BARFONT   : [Bb][Aa][Rr][Ff][Oo][Nn][Tt];
BF        : [Bb][Ff];                           // abbreviation for BARFONT
BARHEIGHT : [Bb][Aa][Rr][Hh][Ee][Ii][Gg][Hh][Tt];
BH        : [Bb][Hh];                           // abbreviation for BARHEIGHT
BARMAG    : [Bb][Aa][Rr][Mm][Aa][Gg];
BARRATIO  : [Bb][Aa][Rr][Rr][Aa][Tt][Ii][Oo];
BARSET    : [Bb][Aa][Rr][Ss][Ee][Tt];
BARTYPE   : [Bb][Aa][Rr][Tt][Yy][Pp][Ee];
BATTERY_S : [Bb][Aa][Tt][Tt][Ee][Rr][Yy] '$';
BEEP      : [Bb][Ee][Ee][Pp];
BREAK     : [Bb][Rr][Ee][Aa][Kk];
BUSY      : [Bb][Uu][Ss][Yy];
CHDIR     : [Cc][Hh][Dd][Ii][Rr];
CHECKSUM  : [Cc][Hh][Ee][Cc][Kk][Ss][Uu][Mm];
CHR_S     : [Cc][Hh][Rr] '$';
CLEANFEED : [Cc][Ll][Ee][Aa][Nn][Ff][Ee][Ee][Dd];
CLEAR     : [Cc][Ll][Ee][Aa][Rr];
CLIP      : [Cc][Ll][Ii][Pp];
CLL       : [Cc][Ll][Ll];
CLOSE     : [Cc][Ll][Oo][Ss][Ee];
COM_ERROR : [Cc][Oo][Mm][ \t]* [Ee][Rr][Rr][Oo][Rr]; // "COM ERROR"
COMBUF_S  : [Cc][Oo][Mm][Bb][Uu][Ff] '$';
COMSET    : [Cc][Oo][Mm][Ss][Ee][Tt];
COMSTAT   : [Cc][Oo][Mm][Ss][Tt][Aa][Tt];
CONT      : [Cc][Oo][Nn][Tt];
COPY      : [Cc][Oo][Pp][Yy];
COUNT_AMP : [Cc][Oo][Uu][Nn][Tt] '&';
CSUM      : [Cc][Ss][Uu][Mm];
CURDIR_S  : [Cc][Uu][Rr][Dd][Ii][Rr] '$';
CUT       : [Cc][Uu][Tt];
DATE_S    : [Dd][Aa][Tt][Ee] '$';
DATEADD_S : [Dd][Aa][Tt][Ee][Aa][Dd][Dd] '$';
DATEDIFF  : [Dd][Aa][Tt][Ee][Dd][Ii][Ff][Ff];
DBBREAK   : [Dd][Bb][Bb][Rr][Ee][Aa][Kk];
DBEND     : [Dd][Bb][Ee][Nn][Dd];
DBSTDIO   : [Dd][Bb][Ss][Tt][Dd][Ii][Oo];
DBSTEP    : [Dd][Bb][Ss][Tt][Ee][Pp];
DELETE    : [Dd][Ee][Ll][Ee][Tt][Ee];
DELETEPFSVAR: [Dd][Ee][Ll][Ee][Tt][Ee][Pp][Ff][Ss][Vv][Aa][Rr];
DEVICES   : [Dd][Ee][Vv][Ii][Cc][Ee][Ss];
DIM       : [Dd][Ii][Mm];
DIR       : [Dd][Ii][Rr];
DIRNAME_S : [Dd][Ii][Rr][Nn][Aa][Mm][Ee] '$';
DISPLAY   : [Dd][Ii][Ss][Pp][Ll][Aa][Yy];
END       : [Ee][Nn][Dd];                        // program END or subroutine END
ENDIF     : [Ee][Nn][Dd][ \t]* [Ii][Ff];         // "END IF" or "ENDIF"
EOF_FUNC  : [Ee][Oo][Ff];                        // EOF function
ERL       : [Ee][Rr][Ll];
ERR       : [Ee][Rr][Rr];
ERR_S     : [Ee][Rr][Rr] '$';
ERROR     : [Ee][Rr][Rr][Oo][Rr];                // ERROR statement
EXECUTE   : [Ee][Xx][Ee][Cc][Uu][Tt][Ee];
FIELD     : [Ff][Ii][Ee][Ll][Dd];
FIELDNO   : [Ff][Ii][Ee][Ll][Dd][Nn][Oo];
FILEAND   : [Ff][Ii][Ll][Ee] '&';                // "FILE&"
LOAD      : [Ll][Oo][Aa][Dd];                    // used after FILE& (LOAD)
FILES     : [Ff][Ii][Ll][Ee][Ss];
FLOATCALC_S: [Ff][Ll][Oo][Aa][Tt][Cc][Aa][Ll][Cc] '$';
FONT      : [Ff][Oo][Nn][Tt];
FONTD     : [Ff][Oo][Nn][Tt][Dd];
FONTNAME_S: [Ff][Oo][Nn][Tt][Nn][Aa][Mm][Ee] '$';
FONTS     : [Ff][Oo][Nn][Tt][Ss];
FOR       : [Ff][Oo][Rr];
FORMAT    : [Ff][Oo][Rr][Mm][Aa][Tt];
FORMAT_S  : [Ff][Oo][Rr][Mm][Aa][Tt] '$';
FORMFEED  : [Ff][Oo][Rr][Mm][Ff][Ee][Ee][Dd];
FF        : [Ff][Ff];                           // abbreviation for FORMFEED
FRE       : [Ff][Rr][Ee];
FUNCTEST  : [Ff][Uu][Nn][Cc][Tt][Ee][Ss][Tt];
FUNCTEST_S: [Ff][Uu][Nn][Cc][Tt][Ee][Ss][Tt] '$';
GET       : [Gg][Ee][Tt];
GETASSOC_S: [Gg][Ee][Tt][Aa][Ss][Ss][Oo][Cc] '$';
GETASSOCNAME_S: [Gg][Ee][Tt][Aa][Ss][Ss][Oo][Cc][Nn][Aa][Mm][Ee] '$';
GETPFSVAR : [Gg][Ee][Tt][Pp][Ff][Ss][Vv][Aa][Rr];
GOSUB     : [Gg][Oo][Ss][Uu][Bb];
GOTO      : [Gg][Oo][Tt][Oo];
HEAD      : [Hh][Ee][Aa][Dd];
IF        : [Ii][Ff];
IMMEDIATE : [Ii][Mm][Mm][Ee][Dd][Ii][Aa][Tt][Ee];
IMAGE     : [Ii][Mm][Aa][Gg][Ee];
INKEY_S   : [Ii][Nn][Kk][Ee][Yy] '$';
INPUT     : [Ii][Nn][Pp][Uu][Tt];
INPUT_S   : [Ii][Nn][Pp][Uu][Tt] '$';
INSTR     : [Ii][Nn][Ss][Tt][Rr];
INVIMAGE  : [Ii][Nn][Vv][Ii][Mm][Aa][Gg][Ee];
KEY       : [Kk][Ee][Yy];
KEYBMAP_S : [Kk][Ee][Yy][Bb][Mm][Aa][Pp] '$';
KILL      : [Kk][Ii][Ll][Ll];
LAYOUT    : [Ll][Aa][Yy][Oo][Uu][Tt];
LBLCOND   : [Ll][Bb][Ll][Cc][Oo][Nn][Dd];
LED       : [Ll][Ee][Dd];
LEFT_S    : [Ll][Ee][Ff][Tt] '$';
LEN       : [Ll][Ee][Nn];
LET       : [Ll][Ee][Tt];
LINE      : [Ll][Ii][Nn][Ee];
LIST      : [Ll][Ii][Ss][Tt];
LISTPFSVAR: [Ll][Ii][Ss][Tt][Pp][Ff][Ss][Vv][Aa][Rr];
// LOAD keyword already defined above for FILE& LOAD
// LOAD      : [Ll][Oo][Aa][Dd];
LOC       : [Ll][Oo][Cc];
LOF       : [Ll][Oo][Ff];
LSET      : [Ll][Ss][Ee][Tt];
LTS_AMP   : [Ll][Tt][Ss] '&';
MAG       : [Mm][Aa][Gg];
MAKEASSOC : [Mm][Aa][Kk][Ee][Aa][Ss][Ss][Oo][Cc];
MAP       : [Mm][Aa][Pp];
MERGE     : [Mm][Ee][Rr][Gg][Ee];
MIBVAR_AMP: [Mm][Ii][Bb][Vv][Aa][Rr] '&';
MID_S     : [Mm][Ii][Dd] '$';
MKDIR     : [Mm][Kk][Dd][Ii][Rr];
NAME      : [Nn][Aa][Mm][Ee];
NASC      : [Nn][Aa][Ss][Cc];
NASCD     : [Nn][Aa][Ss][Cc][Dd];
NEW       : [Nn][Ee][Ww];
NORIMAGE  : [Nn][Oo][Rr][Ii][Mm][Aa][Gg][Ee];
NI        : [Nn][Ii];                           // abbreviation for NORIMAGE
ON        : [Oo][Nn];
OPTIMIZE  : [Oo][Pp][Tt][Ii][Mm][Ii][Zz][Ee];
OUTPUT    : [Oo][Uu][Tt][Pp][Uu][Tt];
PORTIN    : [Pp][Oo][Rr][Tt][Ii][Nn];
PORTOUT   : [Pp][Oo][Rr][Tt][Oo][Uu][Tt];
POWER     : [Pp][Oo][Ww][Ee][Rr];
PRINT     : [Pp][Rr][Ii][Nn][Tt];
PRINTFEED : [Pp][Rr][Ii][Nn][Tt][Ff][Ee][Ee][Dd];
PF        : [Pp][Ff];                           // abbreviation for PRINTFEED
PRBAR     : [Pp][Rr][Bb][Aa][Rr];
PB        : [Pp][Bb];                           // abbreviation for PRBAR
PRBOX     : [Pp][Rr][Bb][Oo][Xx];
PX        : [Pp][Xx];                           // abbreviation for PRBOX
PRDIAGONAL: [Pp][Rr][Dd][Ii][Aa][Gg][Oo][Nn][Aa][Ll];
PD        : [Pp][Dd];                           // abbreviation for PRDIAGONAL
PRIMAGE   : [Pp][Rr][Ii][Mm][Aa][Gg][Ee];
PI        : [Pp][Ii];                           // abbreviation for PRIMAGE (assumed)
PRLINE    : [Pp][Rr][Ll][Ii][Nn][Ee];
PL        : [Pp][Ll];                           // abbreviation for PRLINE
PRPOS     : [Pp][Rr][Pp][Oo][Ss];
PP        : [Pp][Pp];                           // abbreviation for PRPOS
PRSTAT    : [Pp][Rr][Ss][Tt][Aa][Tt];
PRTXT     : [Pp][Rr][Tt][Xx][Tt];
PT        : [Pp][Tt];                           // abbreviation for PRTXT
PWRDIAG   : [Pp][Ww][Rr][Dd][Ii][Aa][Gg];       // example hypothetical (not in doc, skip if unknown)

// 'REM' and apostrophe for comments handled below (skipped from output)

// Continuing keywords:
REDIRECT  : [Rr][Ee][Dd][Ii][Rr][Ee][Cc][Tt];
REMOVE    : [Rr][Ee][Mm][Oo][Vv][Ee];
RENDER    : [Rr][Ee][Nn][Dd][Ee][Rr];
RESUME    : [Rr][Ee][Ss][Uu][Mm][Ee];
RETURN    : [Rr][Ee][Tt][Uu][Rr][Nn];
RND       : [Rr][Nn][Dd];                       // if random number function (not confirmed, optional)
RUN       : [Rr][Uu][Nn];
SET       : [Ss][Ee][Tt];                       // (used in context like SETPFSVAR but define separately if needed)
SETPFSVAR : [Ss][Ee][Tt][Pp][Ff][Ss][Vv][Aa][Rr];
SETSTDIO  : [Ss][Ee][Tt][Ss][Tt][Dd][Ii][Oo];
SETUP     : [Ss][Ee][Tt][Uu][Pp];
STEP      : [Ss][Tt][Ee][Pp];
STOP      : [Ss][Tt][Oo][Pp];
STORE     : [Ss][Tt][Oo][Rr][Ee];
STRIP     : [Ss][Tt][Rr][Ii][Pp];               // placeholder if exists
SYSVAR    : [Ss][Yy][Ss][Vv][Aa][Rr];
THEN      : [Tt][Hh][Ee][Nn];
TIME_S    : [Tt][Ii][Mm][Ee] '$';
TO        : [Tt][Oo];
TRANSFER  : [Tt][Rr][Aa][Nn][Ss][Ff][Ee][Rr];
VAL       : [Vv][Aa][Ll];
VERIFIER  : [Vv][Ee][Rr][Ii][Ff][Ii][Ee][Rr];
WAIT      : [Ww][Aa][Ii][Tt];
WEEKDAY_S : [Ww][Ee][Ee][Kk][Dd][Aa][Yy] '$';
WHILE     : [Ww][Hh][Ii][Ll][Ee];
WEND      : [Ww][Ee][Nn][Dd];
XORMODE   : [Xx][Oo][Rr][Mm][Oo][Dd][Ee];
ZMODEM    : [Zz][Mm][Oo][Dd][Ee][Mm];
ELSE      : [Ee][Ll][Ss][Ee];
NEXT      : [Nn][Ee][Xx][Tt];
HTTP      : [Hh][Tt][Tt][Pp];
OFF       : [Oo][Ff][Ff];
OPEN      : [Oo][Pp][Ee][Nn];
AS        : [Aa][Ss];
STANDBY   : [Ss][Tt][Aa][Nn][Dd][Bb][Yy];
FT        : [Ff][Tt];
REMAP     : [Rr][Ee][Mm][Aa][Pp];
OPTBool   : [Tt][Rr][Uu][Ee] | [Ff][Aa][Ll][Ss][Ee];
RIGHT_FUNC: [Rr][Ii][Gg][Hh][Tt] '$';
FEED      : [Ff][Ee][Ee][Dd];
PAUSE     : [Pp][Aa][Uu][Ss][Ee];
STARTPRINT: [Ss][Tt][Aa][Rr][Tt][Pp][Rr][Ii][Nn][Tt];
REPRINT   : [Rr][Ee][Pp][Rr][Ii][Nn][Tt];
DATAREADY : [Dd][Aa][Tt][Aa][Rr][Ee][Aa][Dd][Yy];

// Single-character tokens and punctuation
HASH      : '#';
COMMA     : ',';
SEMICOLON : ';';
COLON     : ':';
LPAREN    : '(';
RPAREN    : ')';
DOT       : '.';
QUOTE     : '"';  // used rarely on its own, mostly part of strings

// Operators and comparators
PLUS      : '+';
MINUS     : '-';
MUL       : '*';
DIV       : '/';
MOD       : [Mm][Oo][Dd];
EQ        : '=';
NEQ       : '<>';
LE        : '<=';
GE        : '>=';
LT        : '<';
GT        : '>';
AND       : [Aa][Nn][Dd];
OR        : [Oo][Rr];
NOT       : [Nn][Oo][Tt];

// Special cases
QUOTEDBATCH : '"' [Bb][Aa][Tt][Cc][Hh] '"';     // for OPTIMIZE "BATCH"
REM        : [Rr][Ee][Mm] ~[\r\n]*;
APOSTROPHE_COMMENT : '\'' ~[\r\n]*;

// Literals
NUMBER    : [0-9]+ ('.' [0-9]+)?;
STRING    : '"' ( ~["\r\n] | '""' )* '"';
// Identifiers and labels
LABEL     : [A-Za-z][A-Za-z0-9_]*;
VARNUM    : [A-Za-z][A-Za-z0-9_]* '%';
VARSTR    : [A-Za-z][A-Za-z0-9_]* '$';

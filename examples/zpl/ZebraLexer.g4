lexer grammar ZebraLexer;

// ZPL command prefix tokens
CARET_XA  : '^XA';              // start format
CARET_XZ  : '^XZ';              // end format
CARET_DF  : '^DF';              // download format (stored format begin)
CARET_XF  : '^XF';              // recall format (stored format usage)
CARET_FD  : '^FD' -> pushMode(FIELD_DATA);  // field data start (enter data mode)
CARET_FX  : '^FX' -> pushMode(FIELD_DATA);  // comment start (enter data mode)
CARET_FS  : '^FS';              // field separator (ends ^FD or ^FX data block)
CARET_FO  : '^FO';
// ^A command with one-letter, digit, or '@' font designator
CARET_A   : '^A' [A-Za-z0-9@];
CARET_B   : '^B';
CARET_BY  : '^BY';
CARET_LH  : '^LH';
CARET_LR  : '^LR';
CARET_LS  : '^LS';
CARET_LT  : '^LT';
CARET_MT  : '^MT';
CARET_PW  : '^PW';
CARET_PR  : '^PR';
CARET_PM  : '^PM';
CARET_PON : '^PON';
CARET_POF : '^POF';
CARET_FN  : '^FN';
TILDE_CMD : '~' [A-Z0-9] [A-Z0-9]?;  // any ~ command (one or two chars, e.g. ~DG)

// General ^-commands (two-letter or one-letter+digit/@ codes) not handled above
CARET_CMD : '^' [A-Z0-9@] [A-Z0-9@]?;

// Delimiters and special characters
COMMA     : ',';               // parameter separator
COLON     : ':';               // device/name separator in filenames (e.g., E:FILE.ZPL)
SEMICOLON : ';';               // line concatenation in ZPL (occasionally used to join commands)
HASH      : '#';               // for channels (e.g., OPEN #1)
LPAREN    : '(';
RPAREN    : ')';
QUOTE     : '"' ;
AT        : '@' ;
PLUS      : '+' ;
MINUS     : '-' ;
STAR      : '*' ;
DIV       : '/' ;
NE        : '<>' ;
LE        : '<=' ;
GE        : '>=' ;
LT        : '<' ;
GT        : '>' ;
EQ        : '=' ;

// ZBI keywords (case-insensitive match)
AND       : [Aa] [Nn] [Dd] ;
OR        : [Oo] [Rr] ;
NOT       : [Nn] [Oo] [Tt] ;
IF        : [Ii] [Ff] ;
THEN      : [Tt] [Hh] [Ee] [Nn] ;
ELSE      : [Ee] [Ll] [Ss] [Ee] ;
END       : [Ee] [Nn] [Dd] ;
FOR       : [Ff] [Oo] [Rr] ;
TO        : [Tt] [Oo] ;
STEP      : [Ss] [Tt] [Ee] [Pp] ;
NEXT      : [Nn] [Ee] [Xx] [Tt] ;
DO        : [Dd] [Oo] ;
LOOP      : [Ll] [Oo] [Oo] [Pp] ;
WHILE     : [Ww] [Hh] [Ii] [Ll] [Ee] ;
UNTIL     : [Uu] [Nn] [Tt] [Ii] [Ll] ;
GOTO      : [Gg] [Oo] [Tt] [Oo] ;
GOSUB     : [Gg] [Oo] [Ss] [Uu] [Bb] ;
RETURN    : [Rr] [Ee] [Tt] [Uu] [Rr] [Nn] ;
ON        : [Oo] [Nn] ;
ERROR     : [Ee] [Rr] [Rr] [Oo] [Rr] ;
REM       : [Rr] [Ee] [Mm] ;
AUTONUM   : [Aa] [Uu] [Tt] [Oo] [Nn] [Uu] [Mm] ;
PRINT     : [Pp] [Rr] [Ii] [Nn] [Tt] ;
INPUT     : [Ii] [Nn] [Pp] [Uu] [Tt] ;
LET       : [Ll] [Ee] [Tt] ;
DECLARE   : [Dd] [Ee] [Cc] [Ll] [Aa] [Rr] [Ee] ;
STRING    : [Ss] [Tt] [Rr] [Ii] [Nn] [Gg] ;
INTEGER   : [Ii] [Nn] [Tt] [Ee] [Gg] [Ee] [Rr] ;
DOUBLE    : [Dd] [Oo] [Uu] [Bb] [Ll] [Ee] ;
OPEN      : [Oo] [Pp] [Ee] [Nn] ;
CLOSE     : [Cc] [Ll] [Oo] [Ss] [Ee] ;
SLEEP     : [Ss] [Ll] [Ee] [Ee] [Pp] ;
SETERR    : [Ss] [Ee] [Tt] [Ee] [Rr] [Rr] ;
CLRERR    : [Cc] [Ll] [Rr] [Ee] [Rr] [Rr] ;
AMPERSAND : '&' ;
NEWLINE   : '\r'? '\n' ;
MOD       : [Mm] [Oo] [Dd] ;
NAME      : [Nn] [Aa] [Mm] [Ee] ;
RESUME    : [Rr] [Ee] [Ss] [Uu] [Mm] [Ee] ;
ORIENTATION: [NRIB] ;
ID        : [A-Za-z_] [A-Za-z0-9_]* '$'? ;   // variable or label name or hex text
LETTER    : [A-Za-z] ;
SIGNED_INT: ('+'|'-')?[0-9]+ ;
FONT_DIGIT: [0-9] ;
DEVICE_FILE: LETTER ':' (~[,\r\n])* ;
ISERROR   : [Ii] [Ss] [Ee] [Rr] [Rr] [Oo] [Rr] ;
ISWARNING : [Ii] [Ss] [Ww] [Aa] [Rr] [Nn] [Ii] [Nn] [Gg] ;
SUB       : [Ss] [Uu] [Bb] ;
INT       : [0-9]+ ;                      // integer number (non-negative; sign handled in parser)
FLOAT     : [0-9]+ '.' [0-9]+ ([Ee][+-]?[0-9]+)? ;  // floating-point literal
HEXDIGIT  : [0-9A-Fa-f] ;

// String literal for ZBI (contents inside quotes)
ZBI_STRING: '"' (~["\r\n] | '""')* '"' ;   // allows double quote escapement by doubling

// Whitespace and comments
WS : [ \t\r\n]+ -> skip ;
COMMENT_REM: REM ~[\r\n]* -> skip ;        // whole-line comment starting with REM
COMMENT_EXCL: '!' ~[\r\n]* -> skip ;       // inline comment starting with '!'

// Mode for capturing ^FD/^FX data content until ^FS
mode FIELD_DATA;
FIELD_DATA_CHARS: ~[\u005e~]+;               // characters inside ^FD/^FX data
FIELD_DATA_END  : '^FS' -> type(CARET_FS), popMode;  // on seeing ^FS, emit it and exit data mode

parser grammar FingerprintParser;

options { tokenVocab=FingerprintLexer; }

// Entry rule
program
    : (line (NL line)*)? NL* EOF
    ;

// A line may start with an optional line number and/or label, followed by statements or a comment
line
    : lineNumber? labelDef? (statementList | commentStmt)?
    ;

// Line number (integer literal)
lineNumber
    : NUMBER
    ;

// Label definition (identifier or variable name ending in $ or %) followed by colon
labelDef
    : (LABEL | VARNUM | VARSTR) COLON
    ;

// One or more statements separated by colon on the same line (excluding trailing comment)
statementList
    : statement (COLON statement)*
    ;

// Comment as a standalone statement (or after a colon at end of a line)
commentStmt
    : (REM | APOSTROPHE_COMMENT)
    ;

// ** Statements **

// Assignment to a variable or array element
statement
    : assignmentStmt
    | nextStmt
    | endifStmt
    | wendStmt
    | ifStmt
    | forStmt
    | whileStmt
    | gosubStmt
    | gotoStmt
    | onErrorStmt
    | onGotoStmt
    | onGosubStmt
    | onComsetStmt
    | onKeyStmt
    | onBreakStmt
    | onHttpStmt
    | onMibVarStmt
    | portOutStmt
    | onPortInStmt
    | dimStmt
    | inputStmt
    | inputFileStmt
    | lineInputStmt
    | printStmt
    | printFileStmt
    | openStmt
    | closeStmt
    | fieldStmt
    | resumeStmt
    | returnStmt
    | endProgStmt
    | powerStmt
    | keyCtrlStmt
    | optimizeStmt
    | setupStmt
    | miscCmdStmt
    ;

assignmentStmt
    : LET? target '=' expr
    ;

target
    : VARNUM
    | VARSTR
    | arrayElement
    | SYSVAR LPAREN expr RPAREN
    | mibvarCall
    ;

ifStmt
    : IF expr THEN (statementList (ELSE statementList)?)?
    ;

endifStmt
    : ENDIF
    ;

forStmt
    : FOR VARNUM '=' expr TO expr (STEP expr)?
    ;

nextStmt
    : NEXT (VARNUM)?
    ;

whileStmt
    : WHILE expr
    ;

wendStmt
    : WEND
    ;

gotoStmt
    : GOTO lineReference
    ;
gosubStmt
    : GOSUB lineReference
    ;
returnStmt
    : RETURN
    ;
endProgStmt
    : END
    ;

onErrorStmt
    : ON ERROR GOTO lineReference
    ;
onGotoStmt
    : ON expr GOTO lineReference (COMMA lineReference)*
    ;
onGosubStmt
    : ON expr GOSUB lineReference (COMMA lineReference)*
    ;
onComsetStmt
    : ON COMSET expr GOSUB lineReference
    ;
onKeyStmt
    : ON KEY expr GOSUB lineReference
    ;
onBreakStmt
    : ON BREAK GOSUB lineReference
    ;
onHttpStmt
    : ON HTTP GOTO lineReference
    ;
onMibVarStmt
    : ON MIBVAR_AMP GOSUB lineReference
    ;

onPortInStmt
    : ON PORTIN DOT portInSignal GOSUB lineReference
    ;
portOutStmt
    : PORTOUT DOT portOutSignal (ON | OFF)
    ;

dimStmt
    : DIM dimItem (COMMA dimItem)*
    ;
dimItem
    : (VARNUM | VARSTR) LPAREN expr (COMMA expr)* RPAREN
    ;

inputStmt
    : INPUT (STRING COMMA)? varList
    ;
inputFileStmt
    : INPUT HASH expr (COMMA varList)+
    ;
lineInputStmt
    : LINE INPUT (HASH expr (COMMA)? )? VARSTR
    ;
varList
    : variable (COMMA variable)*
    ;
variable
    : VARNUM
    | VARSTR
    | arrayElement
    ;

printStmt
    : PRINT printItems? (SEMICOLON)?
    ;
printFileStmt
    : PRINT HASH expr (COMMA printItems? (SEMICOLON)?)?
    ;
printItems
    : expr ( (COMMA | SEMICOLON) expr )*
    ;

openStmt
    : OPEN expr (FOR (INPUT | OUTPUT))? AS (HASH? expr | HASH? NUMBER) (LEN '=' NUMBER)?
    ;
closeStmt
    : CLOSE (HASH? expr)?
    ;

fieldStmt
    : FIELD (HASH expr COMMA)? fieldMapping (COMMA fieldMapping)*
    ;
fieldMapping
    : expr (AS VARSTR)
    ;

resumeStmt
    : RESUME (NEXT | lineReference)?
    ;

powerStmt
    : POWER (OFF | STANDBY)
    ;

keyCtrlStmt
    : KEY expr (ON | OFF)
    | KEY BEEP (ON | OFF)
    ;

optimizeStmt
    : OPTIMIZE QUOTEDBATCH (ON | OFF)
    ;

setupStmt
    : SETUP (STRING)?
    ;

miscCmdStmt
    : CLEAR
    | CLIP
    | CLL (expr)?
    | BEEP
    | BUSY
    | CHDIR STRING
    | CLEANFEED
    | COPY STRING (COMMA STRING)?
    | CUT (ON | OFF)?
    | DELETE STRING
    | KILL STRING
    | DEVICES
    | DIR (STRING)?
    | FILES (STRING)?
    | FORMFEED (expr)?
    | PRINTFEED (expr | printFeedReprintClause)?
    | INVIMAGE
    | NORIMAGE
    | RENDER (ON | OFF)
    | LED (ON | OFF)
    | MAG expr COMMA expr
    | ALIGN expr
    | AN expr
    | BARFONT STRING (COMMA expr (COMMA expr (COMMA expr (COMMA expr (COMMA expr))?)?)?)?
    | BF
    | BARFONT (ON | OFF) (COMMA expr)?
    | BARMAG expr
    | BARRATIO expr (COMMA expr)?
    | BARSET STRING (COMMA expr (COMMA expr (COMMA expr (COMMA expr (COMMA expr (COMMA expr (COMMA expr (COMMA expr (COMMA expr))))? )? )? )? )? )?
    | BARTYPE STRING
    | PRPOS expr COMMA expr
    | PP expr COMMA expr
    | PRTXT printItems
    | PT printItems
    | PRBAR expr
    | PB expr
    | PRBOX expr COMMA expr COMMA expr (COMMA STRING (COMMA expr (COMMA expr (COMMA STRING (COMMA STRING)?)?)?)?)?
    | PX expr COMMA expr COMMA expr (COMMA STRING (COMMA expr (COMMA expr (COMMA STRING (COMMA STRING)?)?)?)?)?
    | PRLINE expr COMMA expr
    | PL expr COMMA expr
    | PRDIAGONAL expr COMMA expr COMMA expr COMMA expr
    | PD expr COMMA expr COMMA expr COMMA expr
    | PRIMAGE STRING
    | PI STRING
    | FONT STRING (COMMA expr)?
    | FT STRING (COMMA expr)?
    | FONTD
    | SETPFSVAR STRING (COMMA expr)?
    | DELETEPFSVAR STRING
    | LISTPFSVAR
    | getpfsvarCall
    | HEAD
    | EXECUTE STRING
    | IMMEDIATE (ON | OFF)
    | NEW
    | CONT
    | WAIT expr
    | STOP
    | REMAP
    | ZMODEM (STRING)?
    ;

lineReference
    : NUMBER
    | LABEL
    | VARNUM
    | VARSTR
    ;

arrayElement
    : (VARNUM | VARSTR) LPAREN expr (COMMA expr)* RPAREN
    ;

exprList
    : expr (COMMA expr)*
    ;

expr
    : logicalExpr
    ;
logicalExpr
    : relationalExpr ( (AND | OR) relationalExpr )*
    ;
relationalExpr
    : sumExpr ( (EQ | NEQ | LE | GE | LT | GT) sumExpr )?
    ;
sumExpr
    : termExpr ( (PLUS | MINUS) termExpr )*
    ;
termExpr
    : factorExpr ( (MUL | DIV | MOD) factorExpr )*
    ;
factorExpr
    : (PLUS | MINUS | NOT)* primary
    ;

primary
    : NUMBER
    | STRING
    | VARNUM
    | VARSTR
    | arrayElement
    | LPAREN expr RPAREN
    | builtInFunctionCall
    | SYSVAR LPAREN expr RPAREN
    | ERR
    | ERL
    | ERR_S
    | BUSY
    | INKEY_S
    | INPUT_S LPAREN expr RPAREN
    | EOF_FUNC LPAREN HASH? expr RPAREN
    | OPTBool
    ;

builtInFunctionCall
    : ABS LPAREN expr RPAREN
    | ACTLEN
    | ASC LPAREN expr RPAREN
    | CHR_S LPAREN expr RPAREN
    | COUNT_AMP
    | CSUM LPAREN expr (COMMA expr)* RPAREN
    | DATEADD_S LPAREN expr COMMA expr RPAREN
    | DATEDIFF LPAREN expr COMMA expr RPAREN
    | ERR_S
    | FLOATCALC_S LPAREN expr COMMA expr COMMA expr (COMMA expr)? RPAREN
    | FORMAT_S LPAREN expr COMMA expr RPAREN
    | FONTNAME_S LPAREN expr RPAREN
    | FRE LPAREN (expr)? RPAREN
    | getpfsvarCall
    | INSTR LPAREN (expr COMMA)? expr COMMA expr RPAREN
    | LEFT_S LPAREN expr COMMA expr RPAREN
    | LEN LPAREN expr RPAREN
    | LOC LPAREN expr RPAREN
    | LOF LPAREN expr RPAREN
    | MID_S LPAREN expr COMMA expr (COMMA expr)? RPAREN
    | mibvarCall
    | RIGHT_FUNC
    | TIME_S
    | VAL LPAREN expr RPAREN
    | WEEKDAY_S LPAREN expr RPAREN
    | prstatCall
    | combufCall
    ;

prstatCall
    : PRSTAT (LPAREN expr RPAREN)?
    ;
getpfsvarCall
    : GETPFSVAR LPAREN STRING RPAREN
    ;
combufCall
    : COMBUF_S LPAREN expr RPAREN
    ;
mibvarCall
    : MIBVAR_AMP LPAREN STRING (COMMA expr)? RPAREN
    ;

portInSignal
    : FEED
    | PAUSE
    | STARTPRINT
    | REPRINT
    ;

portOutSignal
    : DATAREADY
    ;

printFeedReprintClause
    : '-' NUMBER COMMA expr
    ;



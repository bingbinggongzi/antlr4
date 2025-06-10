parser grammar ZebraParser;

options { tokenVocab=ZebraLexer; }

script
  : (labelFormat)+ EOF
  | program EOF
  ;

labelFormat
  : CARET_XA labelContent CARET_XZ
  ;

labelContent
  : (zplCommand)*
  ;

zplCommand
  : CARET_DF deviceAndFile (zplCommand)*
  | CARET_XF deviceAndFile
  | CARET_FD fieldDataContent
  | CARET_FX fieldDataContent
  | CARET_CMD (params=paramList)?
  | TILDE_CMD (params=paramList)?
  | CARET_FS
  ;

deviceAndFile
  : DEVICE_FILE
  ;


paramList
  : param (COMMA param)*
  ;
param
  : SIGNED_INT
  | FLOAT
  | INT
  | ID
  | ZBI_STRING
  ;

fieldDataContent
  : /* lexer handles content in FIELD_DATA mode */
  ;

program
  : (line)+
  ;
line
  : (INT WS)? statement (NEWLINE)?
  ;
statement
  : letStatement
  | ifStatement
  | forStatement
  | doStatement
  | gosubStatement
  | gotoStatement
  | onErrorStatement
  | subroutineDecl
  | returnStatement
  | printStatement
  | inputStatement
  | openStatement
  | closeStatement
  | sleepStatement
  | setErrStatement
  | clrErrStatement
  | autonumStatement
  ;

letStatement
  : (LET)? ID (LPAREN expr RPAREN)? '=' expr
  ;

ifStatement
  : IF expr THEN
        ( NEWLINE+ block END WS? IF
          | statement (elseClause)?
        )
  ;
elseClause
  : ELSE (NEWLINE+ block | statement)
  ;
block
  : (statement NEWLINE)* statement
  ;

forStatement
  : FOR ID '=' expr TO expr (STEP expr)? NEWLINE+
        block
    NEWLINE? NEXT ID
  ;

doStatement
  : DO (WHILE expr | UNTIL expr)? NEWLINE+
        block
    NEWLINE? LOOP (WHILE expr | UNTIL expr)?
  ;

gotoStatement
  : GOTO (INT | ID)
  ;
gosubStatement
  : GOSUB (INT | ID)
  ;
returnStatement
  : RETURN
  ;

onErrorStatement
  : ON ERROR (GOTO (INT | ID) | RESUME)?
  ;

subroutineDecl
  : SUB ID
  ;

printStatement
  : PRINT ( (HASH INT COLON)? printList )
  ;
printList
  : (expr ( (COMMA | SEMICOLON) expr )* (COMMA | SEMICOLON)? )?
  ;

inputStatement
  : INPUT ( (HASH INT COLON)? ID )
  ;

openStatement
  : OPEN HASH INT COLON NAME WS+ expr
  ;
closeStatement
  : CLOSE (HASH INT)?
  ;

sleepStatement
  : SLEEP expr
  ;
setErrStatement
  : SETERR
  ;
clrErrStatement
  : CLRERR
  ;
autonumStatement
  : AUTONUM INT COMMA INT
  ;

expr
  : stringExpr
  ;
stringExpr
  : boolExpr ( AMPERSAND boolExpr )*
  ;
boolExpr
  : relExpr ( (AND | OR) relExpr )*
  ;
relExpr
  : arithExpr ( ( '=' | '<>' | '<=' | '>=' | '<' | '>' ) arithExpr )?
  ;
arithExpr
  : term ( ( '+' | '-' | MOD ) term )*
  ;
term
  : factor ( ( '*' | '/' ) factor )*
  ;
factor
  : ( '+' | '-' | NOT ) factor
  | LPAREN expr RPAREN
  | functionCall
  | ID (LPAREN expr (COMMA expr)* RPAREN)?
  | INT
  | FLOAT
  | ZBI_STRING
  ;
functionCall
  : ID LPAREN (expr (COMMA expr)*)? RPAREN
  ;

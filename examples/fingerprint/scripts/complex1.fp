10 REM Complex Fingerprint script using loops and subroutines
20 DIM ARR%(5)
30 FOR I% = 1 TO 5
40   ARR%(I%) = I% * 10
50 NEXT I%
60 GOSUB ShowArray
70 OPEN "example.txt" FOR INPUT AS #1
80 LINE INPUT #1 LINE$
90 PRINT "FIRST LINE:", LINE$
100 CLOSE #1
110 END

200 ShowArray:
210 FOR J% = 1 TO 5
220   PRINT "VAL", ARR%(J%)
230 NEXT J%
240 RETURN

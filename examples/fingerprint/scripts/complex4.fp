5 REM Demonstrate FOR...STEP and functions
10 FOR X% = 0 TO 20 STEP 5
20   PRINT "X=" , X%
30 NEXT
40 IF X% >= 20 THEN
50   PRINT "REACHED"; X%
60 ENDIF
70 DIM A$(2)
80 A$(1) = "One": A$(2) = "Two"
90 FOR I% = 1 TO 2
100  PRINT LEFT$(A$(I%), 1)
110 NEXT I%
120 END

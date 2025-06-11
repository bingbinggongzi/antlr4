10 REM Demonstrate port control and branching
20 ON PORTIN.FEED GOSUB FeedHandler
30 PORTOUT.DATAREADY ON
40 PRINT "Waiting for feed signal"
50 WAIT 1000
60 PORTOUT.DATAREADY OFF
70 GOTO EndProg

100 FeedHandler:
110 PRINT "Feed detected"
120 RETURN

200 EndProg:
210 PRINT "Done"
220 END

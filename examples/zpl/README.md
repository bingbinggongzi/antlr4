# ZPL Example

This directory contains grammars for the Zebra Programming Language (ZPL) and a
simple translator that converts ZPL label formats directly into Honeywell
Fingerprint commands.  The conversion uses the
[StringTemplate](https://www.stringtemplate.org/) library to format the output
script.

## Building

1. Download the ANTLR tool jar, e.g.:
   ```sh
   curl -O https://www.antlr.org/download/antlr-4.13.1-complete.jar
   ```
2. Generate lexer and parser sources from the grammar files:
   ```sh
   java -jar antlr-4.13.1-complete.jar -Dlanguage=Java -o generated ZebraLexer.g4
   java -jar antlr-4.13.1-complete.jar -Dlanguage=Java -o generated -lib . ZebraParser.g4
   ```
3. Download the StringTemplate library jar, e.g.:
   ```sh
   curl -O https://repo1.maven.org/maven2/org/antlr/ST4/4.3.4/ST4-4.3.4.jar
   ```
4. Compile the generated sources together with the translator:
   ```sh
   javac -cp antlr-4.13.1-complete.jar:ST4-4.3.4.jar generated/*.java ZplToFingerprint.java
   ```
5. Convert a ZPL script directly to Fingerprint, saving the result:
   ```sh
   java -cp .:generated:antlr-4.13.1-complete.jar:ST4-4.3.4.jar ZplToFingerprint sample.zpl > sample.fp
   ```
   The generated `sample.fp` contains lines like:
   ```
   10 TEXT 250,350,A0N,40,40,"1 S #S"
   20 TEXT 250,450,A0N,40,40,"2 H #H"
   ...
   70 END
   ```

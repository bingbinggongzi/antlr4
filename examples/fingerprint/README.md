# Fingerprint Example

This example demonstrates using ANTLR4 to parse the Fingerprint printer language.

## Building

1. Download the ANTLR tool jar, e.g.:
   ```sh
   curl -O https://www.antlr.org/download/antlr-4.13.1-complete.jar
   ```
2. Generate lexer and parser sources from the grammar files:
   ```sh
   java -jar antlr-4.13.1-complete.jar -Dlanguage=Java -o generated FingerprintLexer.g4
   java -jar antlr-4.13.1-complete.jar -Dlanguage=Java -o generated -lib . FingerprintParser.g4
   ```
3. Compile the generated sources together with `FingerprintTester`:
   ```sh
   javac -cp antlr-4.13.1-complete.jar generated/*.java FingerprintTester.java
   ```
4. Run the tester on one of the sample scripts:
   ```sh
   java -cp .:generated:antlr-4.13.1-complete.jar FingerprintTester scripts/sample.fp
   ```
   Additional example programs are available in the `scripts` folder and showcase
   more of the grammar features:
   - `complex1.fp` loops over arrays and subroutines
   - `complex2.fp` demonstrates port signals
   - `complex3.fp` uses error handling and file input
   - `complex4.fp` shows `FOR...STEP` and string functions

## Checking lexer coverage

The grammar shipped with this example does not yet implement every command
listed in the official Fingerprint manuals. The helper script
`check_lexer_usage.py` compares tokens defined in `FingerprintLexer.g4`
against those referenced in `FingerprintParser.g4` and prints any that are
currently unused. Run it from this directory with Python:

```sh
python3 check_lexer_usage.py
```

Use the Honeywell *Fingerprint Command Reference* and related manuals in the
`examples/` folder to decide how these missing commands should be parsed and
extend `FingerprintParser.g4` accordingly. The parser already handles common
barcode setup commands (like `BARHEIGHT` and `BARADJUST`) and recognizes
several built-in variables such as `BARCODENAME$` and `BATTERY$`.

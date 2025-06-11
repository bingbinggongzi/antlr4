import re
from pathlib import Path

base = Path(__file__).parent
lexer_file = base / 'FingerprintLexer.g4'
parser_file = base / 'FingerprintParser.g4'

lexer_tokens = set()
for line in lexer_file.read_text().splitlines():
    m = re.match(r'^([A-Z0-9_]+)\s*:', line)
    if m:
        lexer_tokens.add(m.group(1))

parser_tokens = set(re.findall(r'\b[A-Z][A-Z0-9_]*\b', parser_file.read_text()))

unused = sorted(lexer_tokens - parser_tokens)

print('Total lexer tokens:', len(lexer_tokens))
print('Tokens referenced in parser:', len(lexer_tokens & parser_tokens))
print('Tokens not used by parser:', len(unused))
for tok in unused:
    print(tok)

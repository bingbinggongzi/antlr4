import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class FingerprintTester {
    public static void main(String[] args) throws Exception {
        if (args.length==0) {
            System.err.println("Usage: FingerprintTester <file>");
            return;
        }
        CharStream input = CharStreams.fromFileName(args[0]);
        FingerprintLexer lexer = new FingerprintLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        FingerprintParser parser = new FingerprintParser(tokens);
        ParseTree tree = parser.program();
        System.out.println(tree.toStringTree(parser));
    }
}

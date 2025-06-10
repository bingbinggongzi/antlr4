import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class ZebraTester {
    public static void main(String[] args) throws Exception {
        if (args.length==0) {
            System.err.println("Usage: ZebraTester <file>");
            return;
        }
        CharStream input = CharStreams.fromFileName(args[0]);
        ZebraLexer lexer = new ZebraLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ZebraParser parser = new ZebraParser(tokens);
        ParseTree tree = parser.script();
        System.out.println(tree.toStringTree(parser));
    }
}

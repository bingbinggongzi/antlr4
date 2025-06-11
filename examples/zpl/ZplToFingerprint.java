import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;
import org.stringtemplate.v4.*;

public class ZplToFingerprint {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            System.err.println("Usage: ZplToFingerprint <file>");
            return;
        }
        CharStream input = CharStreams.fromFileName(args[0]);
        ZebraLexer lexer = new ZebraLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        ZebraParser parser = new ZebraParser(tokens);
        ParseTree tree = parser.script();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(new Converter(), tree);
    }

    static class Converter extends ZebraParserBaseListener {
        private final STGroup templates = new STGroupFile("Fingerprint.stg");
        private int line = 10;
        private Integer x;
        private Integer y;
        private String font;
        private Integer height;
        private Integer width;
        private String text;

        @Override
        public void exitZplCommand(ZebraParser.ZplCommandContext ctx) {
            if (ctx.CARET_FO() != null) {
                java.util.List<TerminalNode> nums = ctx.SIGNED_INT();
                if (nums.size() == 1) {
                    x = 0;
                    y = Integer.parseInt(nums.get(0).getText());
                } else if (nums.size() >= 2) {
                    x = Integer.parseInt(nums.get(0).getText());
                    y = Integer.parseInt(nums.get(1).getText());
                }
            } else if (ctx.CARET_A() != null) {
                String designator = ctx.CARET_A().getText().substring(1);
                String orientation = ctx.ORIENTATION().getText();
                font = designator + orientation;
                java.util.List<TerminalNode> nums = ctx.SIGNED_INT();
                height = Integer.parseInt(nums.get(0).getText());
                width = Integer.parseInt(nums.get(1).getText());
            } else if (ctx.CARET_FD() != null) {
                StringBuilder sb = new StringBuilder();
                if (ctx.fieldDataContent() != null) {
                    for (TerminalNode n : ctx.fieldDataContent().FIELD_DATA_CHARS()) {
                        sb.append(n.getText());
                    }
                }
                text = sb.toString().trim();
            } else if (ctx.CARET_FS() != null) {
                if (text != null && x != null && y != null && font != null && height != null && width != null) {
                    ST stmt = templates.getInstanceOf("text");
                    stmt.add("line", line);
                    stmt.add("x", x);
                    stmt.add("y", y);
                    stmt.add("font", font);
                    stmt.add("h", height);
                    stmt.add("w", width);
                    stmt.add("text", text);
                    System.out.println(stmt.render());
                    line += 10;
                }
                x = y = height = width = null;
                font = text = null;
            }
        }

        @Override
        public void exitLabelFormat(ZebraParser.LabelFormatContext ctx) {
            ST end = templates.getInstanceOf("end");
            end.add("line", line);
            System.out.println(end.render());
        }
    }
}

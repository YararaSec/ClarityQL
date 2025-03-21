private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter

class LetExpression extends Clarity::LetExpression {
    int getLocalBindingsCount() {
        result = count(Clarity::LocalBinding lb | lb = this.getChild(_))
    }

    Clarity::LocalBinding getLocalBinding(int i) {
        result = this.getChild(i)
    }

    int getFunctionCallsCount() {
        result = this.getChildrenCount() - this.getLocalBindingsCount() - 1
    }

    Clarity::AstNode getFunctionCall(int i) {
        i >= 0 and
        i < this.getFunctionCallsCount() and
        result = this.getChild(i + this.getLocalBindingsCount())
    }

    Clarity::AstNode getParameter() {
        result = this.getChild(this.getChildrenCount() - 1)
    }

    Clarity::AstNode getField(string f) {
        exists(int i | 
            (f = "binding" + i and result = this.getLocalBinding(i)) or
            (f = "function" + i and result = this.getFunctionCall(i))
        ) or
        (f = "parameter" and result = this.getParameter())
    }

    private int getChildrenCount() {
        result = count(this.getChild(_))
    }

    override string toString() {
        result = "LetExpression"
    }
}
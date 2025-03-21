private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.functionParameter

class FunctionSignature extends Clarity::FunctionSignature {
    Clarity::Identifier getFunctionName() {
        result = this.getChild(0)
    }

    int getParameterCount() {
        result = count(this.getChild(_)) - 1
    }

    FunctionParameter getParameter(int i) {
        not i+1 = 0 and
        result = this.getChild(i+1)
    }

    Clarity::AstNode getField(string f) {
        (f = "functionName" and result = this.getFunctionName()) or
        exists(int i | f = "parameter" + i and result = this.getParameter(i))
    }

    override string toString() {
        result = "FunctionSignature"
    }
}
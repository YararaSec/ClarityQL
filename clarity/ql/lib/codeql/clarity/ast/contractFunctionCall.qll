private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.parameter

class ContractFunctionCall extends Clarity::ContractFunctionCall {
    Clarity::Identifier getOperator() {
        result = super.getOperator()
    }

    int getParameterCount() {
        result = count(this.getChild(_))
    }

    Parameter getParameter(int i) {
        result = this.getChild(i)
    }

    Clarity::AstNode getField(string f) {
        (f = "operator" and result = this.getOperator()) or
        exists(int i | (f = "parameter" + i and result = this.getParameter(i)))
    }

    override string toString() {
        result = "ContractFunctionCall"
    }
}
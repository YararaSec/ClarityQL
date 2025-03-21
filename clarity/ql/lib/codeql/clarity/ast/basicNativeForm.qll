private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.parameter

class BasicNativeForm extends Clarity::BasicNativeForm {
    Clarity::NativeIdentifier getOperator() {
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
        result = "BasicNativeForm"
    }
}
//TODO: implement each different operator with its own arguments and types
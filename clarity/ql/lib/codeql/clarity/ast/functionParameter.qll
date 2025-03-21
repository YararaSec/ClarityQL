private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter

class FunctionParameter extends Clarity::FunctionParameter {
    Clarity::Identifier getName() {
        result = this.getChild(0)
    }

    Clarity::ParameterType getType() {
        result = this.getChild(1)
    }

    Clarity::AstNode getField(string f) {
        (f = "name" and result = this.getName()) or
        (f = "type" and result = this.getType())
    }

    override string toString() {
        result = "FunctionParameter"
    }
}
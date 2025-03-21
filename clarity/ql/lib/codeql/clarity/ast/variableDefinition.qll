private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.parameter

class VariableDefinition extends Clarity::VariableDefinition {
    Clarity::Identifier getName() {
        result = this.getChild(0)
    }

    Clarity::NativeType getType() {
        result = this.getChild(1)
    }

    Parameter getValue() {
        result = this.getChild(2)
    }

    Clarity::AstNode getField(string f) {
        (f = "name" and result = this.getName()) or
        (f = "type" and result = this.getType()) or
        (f = "value" and result = this.getValue())
    }

    override string toString() {
        result = "VariableDefinition"
    }
}
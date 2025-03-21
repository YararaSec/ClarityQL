private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.literal
private import codeql.clarity.ast.functionCall

class Parameter extends Clarity::AstNode {
    string getType() {
        (this instanceof Literal and result = "Literal") or
        (this instanceof Clarity::Global and result = "Global") or
        (this instanceof FunctionCall and result = "FunctionCall") or
        (this instanceof Clarity::Identifier and result = "Identifier")
    }

    override string toString() {
        result = "Parameter(" + this.getType() + ")"
    }
}
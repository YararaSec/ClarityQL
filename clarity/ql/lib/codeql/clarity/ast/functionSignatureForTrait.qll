private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter

class FunctionSignatureForTrait extends Clarity::FunctionSignatureForTrait {
    Clarity::Identifier getFunctionName() {
        result = this.getChild(0)
    }

    int getParameterCount() {
        result = count(this.getChild(_)) - 2
    }

    Clarity::ParameterType getParameterType(int i) {
        i >= 0 and
        i < this.getParameterCount() and
        result = this.getChild(i+1)
    }

    Clarity::NativeType getReturnType() {
        result = this.getChild(this.getParameterCount() + 1)
    }

    Clarity::AstNode getField(string f) {
        (f = "functionName" and result = this.getFunctionName()) or
        exists(int i | f = "parameter" + i and result = this.getParameterType(i)) or
        (f = "returnType" and result = this.getReturnType())
    }

    override string toString() {
        result = "FunctionSignatureForTrait"
    }
}
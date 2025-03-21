private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.basicNativeForm
private import codeql.clarity.ast.contractFunctionCall
private import codeql.clarity.ast.letExpression

class FunctionCall extends Clarity::AstNode {
    FunctionCall() {
        this instanceof ContractFunctionCall or
        this instanceof LetExpression or
        this instanceof BasicNativeForm 
    }

    string getType() {
        (this instanceof ContractFunctionCall and result = "ContractFunctionCall") or
        (this instanceof LetExpression and result = "LetExpression") or
        (this instanceof BasicNativeForm and result = "BasicNativeForm")
    }

    override string toString() {
        result = "FunctionCall(" + this.getType() + ")"
    }
}
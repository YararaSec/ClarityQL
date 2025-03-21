private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.functionSignature
private import codeql.clarity.ast.functionCall

class GenericFunction extends Clarity::AstNode {
    GenericFunction() {
      this instanceof Clarity::PrivateFunction or
      this instanceof Clarity::PublicFunction or
      this instanceof Clarity::ReadOnlyFunction
    }
    override string toString() { result = super.toString() }
    Clarity::AstNode getChild(int i) {
      result = this.(Clarity::PrivateFunction).getChild(i) or
      result = this.(Clarity::PublicFunction).getChild(i) or
      result = this.(Clarity::ReadOnlyFunction).getChild(i)
    }
    FunctionSignature getSignature() {
        result = this.getChild(0)
    }

    FunctionCall getBody() {
        result = this.getChild(1)
    }
}

class FunctionDefinition extends Clarity::FunctionDefinition {
    string functionType() {
        (this.getChild() instanceof Clarity::PublicFunction and
        result = "PublicFunction") or
        (this.getChild() instanceof Clarity::PrivateFunction and
        result = "PrivateFunction") or
        (this.getChild() instanceof Clarity::ReadOnlyFunction and
        result = "ReadOnlyFunction")
    }

    FunctionSignature getSignature() {
        result = this.getChild().(GenericFunction).getSignature()
    }

    Clarity::AstNode getBody() {
        result = this.getChild().(GenericFunction).getBody()
    }

    Clarity::AstNode getField(string f) {
        (f = "signature" and result = this.getSignature()) or
        (f = "body" and result = this.getBody())
    }
    
    override string toString() {
        result = "FunctionDefinition"
    }
}
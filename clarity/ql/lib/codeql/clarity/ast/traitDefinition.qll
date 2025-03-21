private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter
private import codeql.clarity.ast.functionSignatureForTrait

class TraitDefinition extends Clarity::TraitDefinition {
    Clarity::Identifier getName() {
        result = this.getChild(0)
    }

    int getFunctionsCount() {
        result = count(Clarity::FunctionSignatureForTrait f | f = this.getChild(_))
    }

    FunctionSignatureForTrait getFunction(int i) {
        not i+1 = 0 and
        result = this.getChild(i+1)
    }

    Clarity::AstNode getField(string f) {
        (f = "name" and result = this.getName()) or
        exists(int i | f = "function" + i and result = this.getFunction(i))
    }

    override string toString() {
        result = "TraitDefinition"
    }
}
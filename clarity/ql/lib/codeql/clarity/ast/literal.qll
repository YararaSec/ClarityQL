private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter

class Literal extends Clarity::AstNode {
    Literal() {
        this instanceof Clarity::IntLit or
        this instanceof Clarity::UintLit or
        this instanceof Clarity::BoolLit or
        this instanceof Clarity::StandardPrincipalLit or
        this instanceof Clarity::ContractPrincipalLit or
        this instanceof Clarity::BufferLit or
        this instanceof Clarity::AsciiStringLit or
        this instanceof Clarity::Utf8StringLit or
        this instanceof Clarity::ListLit or
        this instanceof Clarity::TupleLit or
        this instanceof Clarity::NoneLit or
        this instanceof Clarity::SomeLit or
        this instanceof Clarity::ResponseLit
    }

    string getType() {
        (this instanceof Clarity::IntLit and result = "IntLit") or
        (this instanceof Clarity::UintLit and result = "UintLit") or
        (this instanceof Clarity::BoolLit and result = "BoolLit") or
        (this instanceof Clarity::StandardPrincipalLit and result = "StandardPrincipalLit") or
        (this instanceof Clarity::ContractPrincipalLit and result = "ContractPrincipalLit") or
        (this instanceof Clarity::BufferLit and result = "BufferLit") or
        (this instanceof Clarity::AsciiStringLit and result = "AsciiStringLit") or
        (this instanceof Clarity::Utf8StringLit and result = "Utf8StringLit") or
        (this instanceof Clarity::ListLit and result = "ListLit") or
        (this instanceof Clarity::TupleLit and result = "TupleLit") or
        (this instanceof Clarity::NoneLit and result = "NoneLit") or
        (this instanceof Clarity::SomeLit and result = "SomeLit") or
        (this instanceof Clarity::ResponseLit and result = "ResponseLit")
    }

    override string toString() {
        result = "Literal(" + this.getType() + ")"
    }
}
private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

AstNode getFuntionBody(FunctionParameter p)
{
  result = p.getParent().getParent().(GenericFunction).getChild(1)
}

class GenericFunction extends AstNode {
  GenericFunction() {
    this instanceof PrivateFunction or
    this instanceof PublicFunction or
    this instanceof ReadOnlyFunction
  }
  override string toString() { result = super.toString() }
  AstNode getChild(int i) {
    result = this.(PrivateFunction).getChild(i) or
    result = this.(PublicFunction).getChild(i) or
    result = this.(ReadOnlyFunction).getChild(i)
  }
}

query predicate unusedArgument(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(FunctionParameter n|
    not exists (Identifier i|
      i.getParent+() = getFuntionBody(n) and
      i.getValue() = n.getChild(0).(Identifier).getValue()
    ) and
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "'" + n.getChild(0).(Identifier).getValue() + "' argument passed but not used." = message and
    "Consider removing '" + n.getChild(0).(Identifier).getValue() + "' since its not used inside the function." = recommendation
  )
}
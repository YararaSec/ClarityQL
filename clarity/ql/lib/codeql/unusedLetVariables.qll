private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

query predicate unusedLetVariables(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(LetExpression n, LocalBinding b|
    b.getParent+() = n and
    not exists(Identifier id |
      id.getParent+() = n and
      id.getParent+() != b and
      id.getValue() = b.getChild(0).(Identifier).getValue() and
      b.getChild(0).(Identifier).getLocation().strictlyBefore(id.getLocation())
    ) and
    b.getLocation().(FileWithLocation) = file and
    b.getLocation().getStartLine()+":"+b.getLocation().getStartColumn() = start and
    b.getLocation().getEndLine()+":"+b.getLocation().getEndColumn() = end and
    "'" + b.getChild(0) + "' variable created but not used." = message and
    "Consider removing '" + b.getChild(0) + "' from let function." = recommendation
  )
}
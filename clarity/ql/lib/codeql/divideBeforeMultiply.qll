private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

predicate containsDivision(AstNode n) {
  exists (
    BasicNativeForm bh |
    bh.getOperator().getValue() = "/" and
    bh.getParent+() = n
  )
}

query predicate divideBeforeMultiply(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(BasicNativeForm n|
    n.getOperator().getValue() = "*" and containsDivision(n)|
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Use of divide inside a multiplication. This could result in a precision loss." = message and
    "Try multiplication before division." = recommendation
  )
}
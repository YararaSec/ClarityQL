private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

predicate containsBlockHeight(AstNode n) {
  exists (Global bh | bh.getValue() = "block-height" and bh.getParent+() = n)
}

query predicate assertBlockHeight(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(BasicNativeForm n|
    n.getOperator().getValue() = "asserts!" and containsBlockHeight(n)|
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Use of block-height inside a assert." = message and
    "Consider using burn-block-height." = recommendation
  )
}
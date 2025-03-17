private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

query predicate unwrapPanicUsage(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(BasicNativeForm n|
    n.getOperator().getValue() = "unwrap-panic" and
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Use of unwrap-panic." = message and
    "Use unwrap! and handle the error." = recommendation
  )
}
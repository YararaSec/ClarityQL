private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

predicate containsTxSender(AstNode n) {
  exists (Global sender | sender.getValue() = "tx-sender" and sender.getParent+() = n)
}

query predicate txSenderInAssert(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(BasicNativeForm n|
    n.getOperator().getValue() = "asserts!" and containsTxSender(n)|
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Use of tx-sender inside an assert" = message and
    "Consider using contract-caller." = recommendation
  )
}
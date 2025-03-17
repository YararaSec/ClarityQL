private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

predicate containsCallToNonConstantContract(AstNode n) {
  exists (
    BasicNativeForm bh |
    bh.getOperator().getValue() = "contract-call?" and
    bh.getParent+() = n and
    not bh.getChild(0) instanceof ContractPrincipalLit
  )
}

query predicate callInsideAsContract(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(BasicNativeForm n|
  n.getOperator().getValue() = "as-contract" and containsCallToNonConstantContract(n)|
  n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Use of call-contract? inside an as-contract context." = message and
    "" = recommendation
  )
}
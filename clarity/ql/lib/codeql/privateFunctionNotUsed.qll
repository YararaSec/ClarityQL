private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

predicate isNotCalled(PrivateFunction f) {
  not exists (
    ContractFunctionCall call |
    call.getOperator().getValue() = f.getChild(0).(FunctionSignature).getChild(0).(Identifier).getValue()
  )
}

query predicate privateFunctionNotUsed(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(FunctionDefinition n|
    isNotCalled(n.getChild().(PrivateFunction))|
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "This private function is not used." = message and
    "Consider removing it." = recommendation
  )
}
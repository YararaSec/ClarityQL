private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

query predicate updatedFunctions(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(BasicNativeForm n|
    (
      n.getOperator().getValue() = "element-at" or
      n.getOperator().getValue() = "index-of"
    ) and
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Behavior of '" + n.getOperator().getValue() + "' changed from Clarity1 to Clarity2, now outputs optional value." = message and
    "Suggestion: use '" + n.getOperator().getValue() + "?' to make this behavior explicit." = recommendation
  )
}
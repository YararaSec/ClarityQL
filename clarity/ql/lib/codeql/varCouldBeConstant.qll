private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

query predicate varCouldBeConstant(FileWithLocation file, string start, string end, string message, string recommendation) {
  exists(VariableDefinition n|
    not exists(BasicNativeForm b | 
      b.getOperator().getValue() = "var-set" and
      b.getChild(0).(Identifier).getValue() = n.getChild(0).(Identifier).getValue() ) and
    n.getLocation().(FileWithLocation) = file and
    n.getLocation().getStartLine()+":"+n.getLocation().getStartColumn() = start and
    n.getLocation().getEndLine()+":"+n.getLocation().getEndColumn() = end and
    "Variable declared with 'define-data-var' is never reassigned" = message and
    "Replace it for 'define-constant'" = recommendation
  )
}
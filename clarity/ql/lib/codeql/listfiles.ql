private import codeql.Locations
private import codeql.clarity.ast.internal.TreeSitter::Clarity

from Source s
select s.getLocation().getFile() as path
/**
 * @name Print AST
 * @description Produces a representation of a file's Abstract Syntax Tree.
 *              This query is used by the VS Code extension.
 * @id clarity/print-ast
 * @kind graph
 * @tags ide-contextual-queries/print-ast
 */

import codeql.Locations

private import codeql.clarity.ideContextual.IDEContextual
import codeql.clarity.ideContextual.printAst
private import codeql.clarity.ast.internal.TreeSitter::Clarity

/**
 * The source file to generate an AST from.
 */
external string selectedSourceFile();

/**
 * A configuration that only prints nodes in the selected source file.
 */
class Cfg extends PrintAstConfiguration {
    override predicate shouldPrintNode(AstNode n) {
      super.shouldPrintNode(n) and
      n.getLocation().getFile() = getFileBySourceArchiveName(selectedSourceFile())
    }
  }
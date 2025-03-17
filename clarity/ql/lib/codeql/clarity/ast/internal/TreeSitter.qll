/**
 * CodeQL library for Clarity
 * Automatically generated from the tree-sitter grammar; do not edit
 */

import codeql.Locations as L

module Clarity {
  /** The base class for all AST nodes */
  class AstNode extends @clarity_ast_node {
    /** Gets a string representation of this element. */
    string toString() { result = this.getAPrimaryQlClass() }

    /** Gets the location of this element. */
    final L::Location getLocation() { clarity_ast_node_location(this, result) }

    /** Gets the parent of this element. */
    final AstNode getParent() { clarity_ast_node_parent(this, result, _) }

    /** Gets the index of this node among the children of its parent. */
    final int getParentIndex() { clarity_ast_node_parent(this, _, result) }

    /** Gets a field or child node of this node. */
    AstNode getAFieldOrChild() { none() }

    /** Gets the name of the primary QL class for this element. */
    string getAPrimaryQlClass() { result = "???" }

    /** Gets a comma-separated list of the names of the primary CodeQL classes to which this element belongs. */
    string getPrimaryQlClasses() { result = concat(this.getAPrimaryQlClass(), ",") }
  }

  /** A token. */
  class Token extends @clarity_token, AstNode {
    /** Gets the value of this token. */
    final string getValue() { clarity_tokeninfo(this, _, result) }

    /** Gets a string representation of this element. */
    final override string toString() { result = this.getValue() }

    /** Gets the name of the primary QL class for this element. */
    override string getAPrimaryQlClass() { result = "Token" }
  }

  /** A reserved word. */
  class ReservedWord extends @clarity_reserved_word, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReservedWord" }
  }

  /** A class representing `ascii_string_lit` tokens. */
  class AsciiStringLit extends @clarity_token_ascii_string_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AsciiStringLit" }
  }

  /** A class representing `ascii_string_type` tokens. */
  class AsciiStringType extends @clarity_token_ascii_string_type, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "AsciiStringType" }
  }

  /** A class representing `basic_native_form` nodes. */
  class BasicNativeForm extends @clarity_basic_native_form, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BasicNativeForm" }

    /** Gets the node corresponding to the field `operator`. */
    final NativeIdentifier getOperator() { clarity_basic_native_form_def(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_basic_native_form_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_basic_native_form_def(this, result) or
      clarity_basic_native_form_child(this, _, result)
    }
  }

  /** A class representing `bool_lit` tokens. */
  class BoolLit extends @clarity_token_bool_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BoolLit" }
  }

  /** A class representing `buffer_lit` tokens. */
  class BufferLit extends @clarity_token_buffer_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BufferLit" }
  }

  /** A class representing `buffer_type` tokens. */
  class BufferType extends @clarity_token_buffer_type, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "BufferType" }
  }

  /** A class representing `comment` tokens. */
  class Comment extends @clarity_token_comment, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Comment" }
  }

  /** A class representing `constant_definition` nodes. */
  class ConstantDefinition extends @clarity_constant_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ConstantDefinition" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_constant_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_constant_definition_child(this, _, result) }
  }

  /** A class representing `contract_function_call` nodes. */
  class ContractFunctionCall extends @clarity_contract_function_call, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ContractFunctionCall" }

    /** Gets the node corresponding to the field `operator`. */
    final Identifier getOperator() { clarity_contract_function_call_def(this, result) }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_contract_function_call_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_contract_function_call_def(this, result) or
      clarity_contract_function_call_child(this, _, result)
    }
  }

  /** A class representing `contract_principal_lit` nodes. */
  class ContractPrincipalLit extends @clarity_contract_principal_lit, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ContractPrincipalLit" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_contract_principal_lit_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_contract_principal_lit_child(this, _, result)
    }
  }

  /** A class representing `function_definition` nodes. */
  class FunctionDefinition extends @clarity_function_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionDefinition" }

    /** Gets the child of this node. */
    final AstNode getChild() { clarity_function_definition_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_function_definition_def(this, result) }
  }

  /** A class representing `function_parameter` nodes. */
  class FunctionParameter extends @clarity_function_parameter, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionParameter" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_function_parameter_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_function_parameter_child(this, _, result) }
  }

  /** A class representing `function_signature` nodes. */
  class FunctionSignature extends @clarity_function_signature, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionSignature" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_function_signature_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_function_signature_child(this, _, result) }
  }

  /** A class representing `function_signature_for_trait` nodes. */
  class FunctionSignatureForTrait extends @clarity_function_signature_for_trait, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FunctionSignatureForTrait" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_function_signature_for_trait_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_function_signature_for_trait_child(this, _, result)
    }
  }

  /** A class representing `fungible_token_definition` nodes. */
  class FungibleTokenDefinition extends @clarity_fungible_token_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "FungibleTokenDefinition" }

    /** Gets the child of this node. */
    final Identifier getChild() { clarity_fungible_token_definition_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_fungible_token_definition_def(this, result)
    }
  }

  /** A class representing `global` tokens. */
  class Global extends @clarity_token_global, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Global" }
  }

  /** A class representing `identifier` tokens. */
  class Identifier extends @clarity_token_identifier, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Identifier" }
  }

  /** A class representing `int_lit` tokens. */
  class IntLit extends @clarity_token_int_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "IntLit" }
  }

  /** A class representing `let_expression` nodes. */
  class LetExpression extends @clarity_let_expression, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "LetExpression" }

    /** Gets the node corresponding to the field `operator`. */
    final string getOperator() {
      exists(int value | clarity_let_expression_def(this, value) | (result = "let" and value = 0))
    }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_let_expression_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_let_expression_child(this, _, result) }
  }

  /** A class representing `list_lit` nodes. */
  class ListLit extends @clarity_list_lit, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ListLit" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_list_lit_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_list_lit_child(this, _, result) }
  }

  /** A class representing `list_lit_token` tokens. */
  class ListLitToken extends @clarity_token_list_lit_token, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ListLitToken" }
  }

  /** A class representing `list_type` nodes. */
  class ListType extends @clarity_list_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ListType" }

    /** Gets the child of this node. */
    final ParameterType getChild() { clarity_list_type_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_list_type_def(this, result) }
  }

  /** A class representing `local_binding` nodes. */
  class LocalBinding extends @clarity_local_binding, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "LocalBinding" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_local_binding_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_local_binding_child(this, _, result) }
  }

  /** A class representing `mapping_definition` nodes. */
  class MappingDefinition extends @clarity_mapping_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "MappingDefinition" }

    /** Gets the node corresponding to the field `key_type`. */
    final AstNode getKeyType() { clarity_mapping_definition_def(this, result, _, _) }

    /** Gets the node corresponding to the field `value_type`. */
    final AstNode getValueType() { clarity_mapping_definition_def(this, _, result, _) }

    /** Gets the child of this node. */
    final Identifier getChild() { clarity_mapping_definition_def(this, _, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_mapping_definition_def(this, result, _, _) or
      clarity_mapping_definition_def(this, _, result, _) or
      clarity_mapping_definition_def(this, _, _, result)
    }
  }

  /** A class representing `native_identifier` tokens. */
  class NativeIdentifier extends @clarity_token_native_identifier, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NativeIdentifier" }
  }

  /** A class representing `native_type` nodes. */
  class NativeType extends @clarity_native_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NativeType" }

    /** Gets the child of this node. */
    final AstNode getChild() { clarity_native_type_child(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_native_type_child(this, result) }
  }

  /** A class representing `non_fungible_token_definition` nodes. */
  class NonFungibleTokenDefinition extends @clarity_non_fungible_token_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NonFungibleTokenDefinition" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_non_fungible_token_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_non_fungible_token_definition_child(this, _, result)
    }
  }

  /** A class representing `none_lit` tokens. */
  class NoneLit extends @clarity_token_none_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "NoneLit" }
  }

  /** A class representing `optional_type` nodes. */
  class OptionalType extends @clarity_optional_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "OptionalType" }

    /** Gets the child of this node. */
    final NativeType getChild() { clarity_optional_type_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_optional_type_def(this, result) }
  }

  /** A class representing `parameter_type` nodes. */
  class ParameterType extends @clarity_parameter_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ParameterType" }

    /** Gets the child of this node. */
    final AstNode getChild() { clarity_parameter_type_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_parameter_type_def(this, result) }
  }

  /** A class representing `private_function` nodes. */
  class PrivateFunction extends @clarity_private_function, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "PrivateFunction" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_private_function_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_private_function_child(this, _, result) }
  }

  /** A class representing `public_function` nodes. */
  class PublicFunction extends @clarity_public_function, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "PublicFunction" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_public_function_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_public_function_child(this, _, result) }
  }

  /** A class representing `read_only_function` nodes. */
  class ReadOnlyFunction extends @clarity_read_only_function, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ReadOnlyFunction" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_read_only_function_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_read_only_function_child(this, _, result) }
  }

  /** A class representing `response_lit` nodes. */
  class ResponseLit extends @clarity_response_lit, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ResponseLit" }

    /** Gets the child of this node. */
    final AstNode getChild() { clarity_response_lit_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_response_lit_def(this, result) }
  }

  /** A class representing `response_type` nodes. */
  class ResponseType extends @clarity_response_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "ResponseType" }

    /** Gets the child of this node. */
    final NativeType getChild() { clarity_response_type_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_response_type_def(this, result) }
  }

  /** A class representing `some_lit` nodes. */
  class SomeLit extends @clarity_some_lit, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "SomeLit" }

    /** Gets the child of this node. */
    final AstNode getChild() { clarity_some_lit_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_some_lit_def(this, result) }
  }

  /** A class representing `source` nodes. */
  class Source extends @clarity_source, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Source" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_source_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_source_child(this, _, result) }
  }

  /** A class representing `standard_principal_lit` tokens. */
  class StandardPrincipalLit extends @clarity_token_standard_principal_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "StandardPrincipalLit" }
  }

  /** A class representing `token_definition` nodes. */
  class TokenDefinition extends @clarity_token_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TokenDefinition" }

    /** Gets the child of this node. */
    final AstNode getChild() { clarity_token_definition_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_token_definition_def(this, result) }
  }

  /** A class representing `trait_definition` nodes. */
  class TraitDefinition extends @clarity_trait_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TraitDefinition" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_trait_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_trait_definition_child(this, _, result) }
  }

  /** A class representing `trait_implementation` nodes. */
  class TraitImplementation extends @clarity_trait_implementation, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TraitImplementation" }

    /** Gets the node corresponding to the field `trait_name`. */
    final Identifier getTraitName() { clarity_trait_implementation_def(this, result, _) }

    /** Gets the child of this node. */
    final ContractPrincipalLit getChild() { clarity_trait_implementation_def(this, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_trait_implementation_def(this, result, _) or
      clarity_trait_implementation_def(this, _, result)
    }
  }

  /** A class representing `trait_type` nodes. */
  class TraitType extends @clarity_trait_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TraitType" }

    /** Gets the child of this node. */
    final Identifier getChild() { clarity_trait_type_def(this, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_trait_type_def(this, result) }
  }

  /** A class representing `trait_usage` nodes. */
  class TraitUsage extends @clarity_trait_usage, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TraitUsage" }

    /** Gets the node corresponding to the field `trait_alias`. */
    final Identifier getTraitAlias() { clarity_trait_usage_def(this, result, _, _) }

    /** Gets the node corresponding to the field `trait_name`. */
    final Identifier getTraitName() { clarity_trait_usage_def(this, _, result, _) }

    /** Gets the child of this node. */
    final ContractPrincipalLit getChild() { clarity_trait_usage_def(this, _, _, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_trait_usage_def(this, result, _, _) or
      clarity_trait_usage_def(this, _, result, _) or
      clarity_trait_usage_def(this, _, _, result)
    }
  }

  /** A class representing `tuple_lit` nodes. */
  class TupleLit extends @clarity_tuple_lit, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TupleLit" }

    /** Gets the node corresponding to the field `key`. */
    final Identifier getKey(int i) { clarity_tuple_lit_key(this, i, result) }

    /** Gets the node corresponding to the field `value`. */
    final AstNode getValue(int i) { clarity_tuple_lit_value(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_tuple_lit_key(this, _, result) or clarity_tuple_lit_value(this, _, result)
    }
  }

  /** A class representing `tuple_type` nodes. */
  class TupleType extends @clarity_tuple_type, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TupleType" }

    /** Gets the node corresponding to the field `key`. */
    final Identifier getKey(int i) { clarity_tuple_type_key(this, i, result) }

    /** Gets the node corresponding to the field `value_type`. */
    final NativeType getValueType(int i) { clarity_tuple_type_value_type(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_tuple_type_key(this, _, result) or clarity_tuple_type_value_type(this, _, result)
    }
  }

  /** A class representing `tuple_type_for_trait` nodes. */
  class TupleTypeForTrait extends @clarity_tuple_type_for_trait, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "TupleTypeForTrait" }

    /** Gets the node corresponding to the field `key`. */
    final Identifier getKey(int i) { clarity_tuple_type_for_trait_key(this, i, result) }

    /** Gets the node corresponding to the field `value_type`. */
    final NativeType getValueType(int i) {
      clarity_tuple_type_for_trait_value_type(this, i, result)
    }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() {
      clarity_tuple_type_for_trait_key(this, _, result) or
      clarity_tuple_type_for_trait_value_type(this, _, result)
    }
  }

  /** A class representing `uint_lit` tokens. */
  class UintLit extends @clarity_token_uint_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "UintLit" }
  }

  /** A class representing `utf8_string_lit` tokens. */
  class Utf8StringLit extends @clarity_token_utf8_string_lit, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Utf8StringLit" }
  }

  /** A class representing `utf8_string_type` tokens. */
  class Utf8StringType extends @clarity_token_utf8_string_type, Token {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "Utf8StringType" }
  }

  /** A class representing `variable_definition` nodes. */
  class VariableDefinition extends @clarity_variable_definition, AstNode {
    /** Gets the name of the primary QL class for this element. */
    final override string getAPrimaryQlClass() { result = "VariableDefinition" }

    /** Gets the `i`th child of this node. */
    final AstNode getChild(int i) { clarity_variable_definition_child(this, i, result) }

    /** Gets a field or child node of this node. */
    final override AstNode getAFieldOrChild() { clarity_variable_definition_child(this, _, result) }
  }
}

(method_definition
  name: (property_identifier) @punctuation.special (#eq? @punctuation.special "constructor")
)

(type_identifier) @variable

(extends_clause
  value: (identifier) @variable
)

(nested_type_identifier
  module: (identifier) @variable
  name: (type_identifier) @variable
)

(property_signature
  "?" @punctuation.special
)

(enum_declaration
  "enum" @keyword
)

(enum_assignment
  name: (property_identifier) @enum_field
)

(required_parameter
  pattern: (identifier) @parameter
)

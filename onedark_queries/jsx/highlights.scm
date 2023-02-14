(import_clause
  (identifier) @property 
)

(import_clause
  (named_imports  (import_specifier) @property)
)

(import_clause
  (namespace_import
    (identifier) @property
  )
)

(import_specifier
  name: (identifier) @property
)

(method_definition
  name: (property_identifier) @keyword (#eq? @keyword "constructor")
)

(jsx_opening_element
  name: (identifier) @tag
)

(jsx_closing_element
  name: (identifier) @tag
)

(jsx_attribute
  (property_identifier) @tag.attribute
)

(object_pattern
  (object_assignment_pattern
    left: (shorthand_property_identifier_pattern ) @variable
    right: (object) @tag.attribute
  )
)

(object_pattern
  (shorthand_property_identifier_pattern ) @variable
)

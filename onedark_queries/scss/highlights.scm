
(property_name) @tag.delimiter
(plain_value) @tag.attribute
(important) @punctuation.special

[
(unit)
(nesting_selector)
] @property

(pseudo_class_selector
 (class_name) @pseudo_class_selector
)

(pseudo_class_selector
 (arguments
   (class_selector
     (class_name) @property
   )
 )
)

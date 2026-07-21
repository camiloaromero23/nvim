; extends

; 1. Match inline comments like = /*gql*/ `...`
((comment) @_graphql_marker
  .
  (template_string) @injection.content
  (#match? @_graphql_marker "^/\\*\\s*(gql|graphql|GraphQL)\\s*\\*/$")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "graphql"))

; 2. Match template strings starting with #graphql
((template_string) @injection.content
  (#lua-match? @injection.content "^`#graphql")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
  (#set! injection.language "graphql"))

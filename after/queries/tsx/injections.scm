;extends

(jsx_element
    (jsx_opening_element
        (identifier) @tag (#eq? @tag "script")
    )
    (jsx_expression
        (call_expression
          (identifier) @raw (#eq? @raw "raw")
          arguments:
            (
             (template_string
               (string_fragment) @injection.content
              (#set! injection.include-children)
              (#set! injection.language "javascript")
               )
            )
        )
    )
)

(jsx_attribute
  (property_identifier) @name (#match? @name "^hx-on--")
  ([
      (string
        (string_fragment) @injection.content)
    (jsx_expression
      (template_string
        (string_fragment) @injection.content))
  ])
  (#set! injection.language "javascript")
)

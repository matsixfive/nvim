;; Type like feat/fix/etc.
(type) @keyword

;; Scope inside (scope)
(scope) @variable.parameter

;; Commit summary
(description) @string

;; Comments (lines starting with #)
(comment) @comment

;; Trailers (footers like "Closes", "Co-authored-by")
(token) @constant.builtin
(value) @string.special

;; Match issue numbers like #42 within (value)
((value) @number
 (#match? @number "#\\d+"))

;; Optional: bullet points like "- thing"
((message_line) @punctuation.special
 (#match? @punctuation.special "^\\s*[-*] "))


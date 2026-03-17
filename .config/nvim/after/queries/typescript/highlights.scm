;; extends

; Add specific color for await
(await_expression
  "await" @keyword.coroutine.await)

; Now add this for 'new'
(new_expression
  "new" @keyword.operator.new)

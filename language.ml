(* source_language.ml *)
type source_expr = Add of source_expr * source_expr | Num of int

(* target_language.ml *)
type target_expr = Sum of target_expr list | Value of int

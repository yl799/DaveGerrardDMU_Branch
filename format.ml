type t = {
  declarations: C.t;
  comment: Comment.t;
}

let format formatter data =
  Format.fprintf formatter
    "{\n  declarations: %a ;\n  comment : %a ;\n}"
    C.format data.declarations
    Comment.format data.comment
;;

(* Example usage *)
let () =
  let sample_data = {
    declarations = (* ... define your C.t value ... *);
    comment = (* ... define your Comment.t value ... *);
  } in
  let formatter = Format.std_formatter in
  format formatter sample_data;
  Format.pp_print_flush formatter ()

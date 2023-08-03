(* main.ml *)

(* Import the modules *)
open Ecl_parser
open Timed_automata

(* Main function *)
let main () =
  (* Example ECL formula *)
  let ecl_formula = Ecl_parser.parse_ecl_formula "ECL_formula_1" in

  (* Translate and print the result *)
  let timed_automata = Timed_automata.translate_to_timed_automata ecl_formula in
  Printf.printf "ECL Formula: %s\n" ecl_formula;
  Printf.printf "Translated Timed Automata:\n%s\n" timed_automata

(* Run the main function *)
let () = main ()

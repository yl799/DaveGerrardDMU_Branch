open Ecl_parser
open Timed_automata

let main () =
  let ecl_formula = Ecl_parser.parse_ecl_formula "ECL_formula_1" in

  let timed_automata = Timed_automata.translate_to_timed_automata ecl_formula in
  Printf.printf "ECL Formula: %s\n" ecl_formula;
  Printf.printf "Translated Timed Automata:\n%s\n" timed_automata

let () = main ()

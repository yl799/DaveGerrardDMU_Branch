type ecl_formula = string

let parse_ecl_formula (input: string) : 
  ecl_formula = input
  
  let parsed_tokens = String.split_on_char ' ' input in
  String.concat "_" parsed_tokens  


let () =
  let input_formula = "F(G(p -> q))" in
  let parsed_formula = parse_ecl_formula input_formula in
  Printf.printf "Input Formula: %s\n" input_formula;
  Printf.printf "Parsed Formula: %s\n" parsed_formula

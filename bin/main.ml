let read_file filename =
  let ic = open_in filename in
  let n = in_channel_length ic in
  let s = really_input_string ic n in
  close_in ic;
  s

let () =
  let input_file = ref "" in
  let pattern_file = ref "" in
  let speclist = [
    ("-i", Arg.String (fun s -> input_file := s), "Input file");
    ("-p"), Arg.String (fun s -> pattern_file := s), "Pattern file"
  ] in

  let usage_msg = "Usage: fragments -i <input_file> -p <pattern_file>" in
  Arg.parse speclist print_endline usage_msg;

  if !input_file = "" || !pattern_file = "" then
    Printf.eprintf "Error: Both -i and -p options must be set.\n"
  else
    let input_content = read_file !input_file in
    let pattern_content = read_file !pattern_file in

    Printf.printf "Input file:\n%s\n" input_content;
    Printf.printf "Pattern file:\n%s\n" pattern_content;
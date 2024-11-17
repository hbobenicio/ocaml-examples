let process_line (line: string) =
    print_endline line

let () =
  let eof = ref false in
  while not !eof do
    try
      let line = read_line () in
      process_line line;
    with
      End_of_file -> eof := true;
  done


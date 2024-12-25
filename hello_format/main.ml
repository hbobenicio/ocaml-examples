let pp_pair_int formatter (x, y) =
  Format.fprintf formatter "(%d, %d)" x y

let pp_list_int =
    let pp_sep formatter () = Format.fprintf formatter "; " in
    Format.pp_print_list ~pp_sep Format.pp_print_int

let () =
    Format.printf "My string: %a\n" Format.pp_print_string "ok";
    Format.printf "My pair of ints: %a\n" pp_pair_int (10, 20);
    Format.printf "My list of ints: [%a]\n" pp_list_int [10; 20; 30]

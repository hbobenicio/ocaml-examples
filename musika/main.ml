open Printf

let string_of_note (n: Note.t) : string = 
    let open Note in
    match n with
    | C -> "C"
    | Db -> "Db"
    | D -> "D"
    | Eb -> "Eb"
    | E -> "E"
    | F -> "F"
    | Gb -> "Gb"
    | G -> "G"
    | Ab -> "Ab"
    | A -> "A"
    | Bb -> "Bb"
    | B -> "B"

let value_of_note (n: Note.t) : int =
    let open Note in
    match n with
    | C  -> 0
    | Db -> 1
    | D  -> 2
    | Eb -> 3
    | E  -> 4
    | F  -> 5
    | Gb -> 6
    | G  -> 7
    | Ab -> 8
    | A  -> 9
    | Bb -> 10
    | B  -> 11

let note_of_value (x: int) : Note.t =
    let open Note in
    match x with
    | 0  -> C
    | 1  -> Db
    | 2  -> D
    | 3  -> Eb
    | 4  -> E
    | 5  -> F
    | 6  -> Gb
    | 7  -> G
    | 8  -> Ab
    | 9  -> A
    | 10 -> Bb
    | 11 -> B
    | _ -> failwith "bad note value"

let notes_count = 7 + 5

type intervalIncr =
    | Half
    | Whole

let intervalIncVal = function
    | Half -> 1
    | Whole -> 2

(*
let minor_scale =
    List.map intervalIncVal [Whole; Half; Whole; Whole; Half; Whole; Whole] in
*)

let () =
    let minorScaleIntervalIncrements = [Whole; Half; Whole; Whole; Half; Whole; Whole]
        |> List.to_seq
        |> Seq.take 3
        |> Seq.map intervalIncVal
    in
    let current_note = ref Note.D in
    let current_val = ref (value_of_note !current_note) in
    printf "%s " (string_of_note !current_note);
    minorScaleIntervalIncrements |> Seq.iter (fun offset ->
        current_note := note_of_value @@ !current_val + offset; (* handle rem *)
        current_val := value_of_note !current_note;
        printf "%s " (string_of_note !current_note)
    );
    print_string "\n"


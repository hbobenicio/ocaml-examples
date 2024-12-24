open Printf

(** returns a string representing the current timestamp *)
let timestamp_str () : string =
    let now: Unix.tm = Unix.gmtime (Unix.gettimeofday ()) in
    sprintf "%04d-%02d-%02d %02d:%02d:%02d"
        (1900 + now.tm_year)
        (now.tm_mon + 1)
        now.tm_mday
        now.tm_hour now.tm_min now.tm_sec

let timestamped_reporter () : Logs.reporter =
    let pp_header (ppf: Format.formatter) ((level, header): Logs.level * string option) =
        let header: string = Option.value header ~default:"" in
        let timestamp = timestamp_str () in
        Fmt.pf ppf "%s [%a] %s" timestamp Logs.pp_level level header
    in
    Logs_fmt.reporter ~pp_header ()

let () =
    Logs.set_level (Some Logs.Info);
    Logs.set_reporter (timestamped_reporter ());
    Logs.info (fun log -> log "Hello");
    Logs.err (fun log -> log "Woops!");
    if Logs.err_count () > 0 then
        exit 1;

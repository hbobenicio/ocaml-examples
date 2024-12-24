open Printf

type t = {
    server_host: string;
    server_port: int;
}

let envPrefix = "SERVER_"
let serverHostDefault = "localhost"
let serverPortDefault = 8080

let envKey key = envPrefix ^ key

let load () : t = {
    server_host = begin
        match Sys.getenv_opt (envKey "HOST") with
        | None      -> serverHostDefault
        | Some host -> host
    end;
    server_port = begin
        match Sys.getenv_opt (envKey "PORT") with
        | None          -> serverPortDefault
        | Some port_str -> int_of_string port_str
    end;
}

let print (config: t) =
    print_endline "Config:";
    printf "  Host: %s\n" config.server_host;
    printf "  Port: %d\n" config.server_port;
    flush stdout

open Hello_dream

let router (config: Config.t) : Dream.handler =
    Dream.router [
        Dream.scope "/api" [] [
            Dream.get "/status" (Status.handler config);
        ];
    ]

let () =
    let config_log = Dream.sub_log "config" in
    config_log.info @@ fun log -> log "loading...";
    let config = Config.load () in
    config_log.info @@ fun log -> log "successfully loaded.";
    Config.print config;
    
    let handler = Dream.pipeline [Dream.logger] (router config) in
    Dream.run
        ~interface:config.server_host
        ~port:config.server_port
        ~tls:false
        handler

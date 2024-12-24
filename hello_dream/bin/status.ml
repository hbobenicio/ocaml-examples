open Hello_dream

let handler (_config: Config.t) (_req: Dream.request) : Dream.response Lwt.t =
    Dream.html "It Works"

let print_time js_time =
    Firebug.console##log (js_time##toTimeString ())

open React;;

let seconds, run =
    let e, send = E.create () in
    let run () = begin
        ignore Dom_html.window##setInterval (Js.wrap_callback (fun () -> send (
            jsnew Js.date_now ()
        )), 1000.0)
    end in
    e, run

let printer = E.map print_time seconds

let () = run ()

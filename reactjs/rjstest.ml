let log message =
    Firebug.console##log (Js.string message)

let () =
    let target = Dom_html.getElementById "content" in
    let () = Firebug.console##log (ReactJS.create_element "h1") in
    ignore (ReactDOM.render (ReactJS.create_element "h1" None) target)

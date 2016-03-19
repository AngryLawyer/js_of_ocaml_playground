let log message =
    Firebug.console##log (Js.string message)

let () =
    let target = Dom_html.getElementById "content" in
    let element = ReactJS.create_element "h1" (Some "Helloup") in
    let () = Firebug.console##log element in
    ignore (ReactDOM.render element target)

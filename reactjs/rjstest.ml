let log message =
    Firebug.console##log (Js.string message)

let comment_box = ReactJS.create_class (object%js
   method render =
       ReactJS.create_element (ReactJS.Dom_class "div") (Some "Hello world! I am a comment_box.")
end)

let () =
    let element = ReactJS.create_element (ReactJS.React_class comment_box) None in
    let target = Dom_html.getElementById "content" in
    let () = Firebug.console##log element in
    ignore (ReactDOM.render element target)

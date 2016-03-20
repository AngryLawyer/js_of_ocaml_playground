let log message =
    Firebug.console##log (Js.string message)

let comment_list = ReactJS.create_class (object%js
    method render =
        ReactJS.create_element (ReactJS.Tag_name "div") ~props:(object%js
            val className = "commentList"
        end) [ReactJS.Dom_string "Hello world! I am a comment_list."]
end)

let comment_form = ReactJS.create_class (object%js
    method render =
        ReactJS.create_element (ReactJS.Tag_name "div") ~props:(object%js
            val className = "commentForm"
        end) [ReactJS.Dom_string "Hello world! I am a comment_form."]
end)

let comment_box = ReactJS.create_class (object%js
    method render =
        ReactJS.create_element (ReactJS.Tag_name "div") ~props:(object%js
            val className = "commentBox"
        end) [
            ReactJS.React_element (ReactJS.create_element (ReactJS.Tag_name "h1") [ReactJS.Dom_string "Comments"]);
            ReactJS.React_element (ReactJS.create_element (ReactJS.React_class comment_list) []);
            ReactJS.React_element (ReactJS.create_element (ReactJS.React_class comment_form) [])
        ]
end)

let () =
    let element = ReactJS.create_element (ReactJS.React_class comment_box) [] in
    let target = Dom_html.getElementById "content" in
    let () = Firebug.console##log element in
    ignore (ReactDOM.render element target)

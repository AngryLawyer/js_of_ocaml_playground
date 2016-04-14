open ReactJS

let log i =
    Firebug.console##log i

let comment = create_class (object%js (self)
    method render =
        let props = get_props self in
        let author = match get_prop props "author" with
            | Some s -> s
            | None -> "NO AUTHOR PROVIDED" in
        let children = match get_prop props "children" with
            | Some c -> React_element c
            | None -> No_content in
        create_element (Tag_name "div") ~props:(object%js
            val className = "comment"
        end) [
            React_element (create_element (Tag_name "h1") [Dom_string author]);
            children
        ]
end)

let comment_list = create_class (object%js
    method render =
        create_element (Tag_name "div") ~props:(object%js
            val className = "commentList"
        end) [
            React_element (create_element (React_class comment) ~props:(object%js val author = "Pete Hunt" end) [
                Dom_string "This is one comment"
            ]);
            React_element (create_element (React_class comment) ~props:(object%js val author = "Jordan Walke" end) [
                Dom_string "This is *another* comment"
            ]);
        ]
end)

let comment_form = create_class (object%js
    method render =
        create_element (Tag_name "div") ~props:(object%js
            val className = "commentForm"
        end) [Dom_string "Hello world! I am a comment_form."]
end)

let comment_box = create_class (object%js
    method render =
        create_element (Tag_name "div") ~props:(object%js
            val className = "commentBox"
        end) [
            React_element (create_element (Tag_name "h1") [Dom_string "Comments"]);
            React_element (create_element (React_class comment_list) []);
            React_element (create_element (React_class comment_form) [])
        ]
end)

let () =
    let element = create_element (React_class comment_box) [] in
    let target = Dom_html.getElementById "content" in
    let () = Firebug.console##log element in
    ignore (ReactDOM.render element target)

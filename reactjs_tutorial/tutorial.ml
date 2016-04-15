let default opt default =
    match opt with
    | Some x -> x
    | None -> default

let comment = ReactJS.create_class (object%js (self)
    method render =
        let props = ReactJS.get_props self in
        [%jsx [div; className "comment"; [
            [h2; className "commentAuthor"; [
                [%code ReactJS.Dom_string (default (ReactJS.get_prop props "author") "NO AUTHOR")];
            ]];
            (* THIS LINE BREAKS THINGS *)
            [%code ReactJS.Element_list (default (ReactJS.get_prop props "children") [])]
        ]]]
end)

let comment_list = ReactJS.create_class (object%js
    method render =
        [%jsx [div; className "commentList"; [
            [Comment; author "Pete Hunt"; ["This is one comment"]];
            [Comment; author "Jordan Walke"; ["This is *another* comment"]];
        ]]]
end)

let comment_form = ReactJS.create_class (object%js
    method render =
        [%jsx [div; className "commentForm"; [
            "Hello world! I am a CommentForm!"
        ]]]
end)

let comment_box = ReactJS.create_class (object%js
   method render =
       [%jsx [div; className "commentBox"; [
           [h1; ["Comments"]];
           [Comment_list];
           [Comment_form]
       ]]]
end)


let () =
    let element = [%jsx [Comment_box]] in
    let target = Dom_html.getElementById "content" in
    ignore (ReactDOM.render element target)

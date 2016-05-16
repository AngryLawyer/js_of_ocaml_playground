let default opt default =
    match opt with
    | Some x -> x
    | None -> default

let to_string x =
    Js.to_string (Js.Unsafe.meth_call x "toString" [||])

let raw_markup x =
    let markdown = Omd.to_html (Omd.of_string x) in
    object%js
        val __html = markdown
    end

let log i =
    Firebug.console##log i

let data = begin
    let data = Json.unsafe_input (Js.string "[
  {\"id\": 1, \"author\": \"Pete Hunt\", \"text\": \"This is one comment\"},
  {\"id\": 2, \"author\": \"Jordan Walke\", \"text\": \"This is *another* comment\"}
]") in
    log data
end

module Comment = ReactJS.Make_ReactClass(struct
    type props_spec = < author: string Js.readonly_prop; children:  > Js.t
    type state_spec = < > Js.t
end)
let comment = Comment.create_class (object%js (self)
    method render =
        let props = Comment.get_props self in
        [%jsx [div; className "comment"; [
            [h2; className "commentAuthor"; [
                [%code ReactJS.Dom_string (props##.author)];
            ]](*;
            [%code match ReactJS.get_prop props "children" with
                | Some element -> let stringy_element = to_string element in
                    let markup = raw_markup stringy_element in
                    ReactJS.React_element [%jsx [span; dangerouslySetInnerHTML markup]]
                | None -> ReactJS.No_content
            ]*)
        ]]]
end)

module Comment_list = ReactJS.Make_ReactClass(struct
    type props_spec = < > Js.t
    type state_spec = < > Js.t
end)
let comment_list = Comment_list.create_class (object%js
    method render =
        [%jsx [div; className "commentList"; [
            [Comment; author "Pete Hunt"; ["This is one comment"]];
            [Comment; author "Jordan Walke"; ["This is *another* comment"]];
        ]]]
end)

module Comment_form = ReactJS.Make_ReactClass(struct
    type props_spec = < > Js.t
    type state_spec = < > Js.t
end)
let comment_form = Comment_form.create_class (object%js
    method render =
        [%jsx [div; className "commentForm"; [
            "Hello world! I am a CommentForm!"
        ]]]
end)


module Comment_box = ReactJS.Make_ReactClass(struct
    type props_spec = < > Js.t
    type state_spec = < > Js.t
end)
let comment_box = Comment_box.create_class (object%js
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

let comment_list = ReactJS.create_class (object%js
    method render =
        [%jsx [div; className "commentList"; [
            "Hello world! I am a CommentList!"
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

let comment_box = ReactJS.create_class (object%js
   method render =
       [%jsx [div; className "commentBox"; [
           "Hello world! I am a CommentBox."
       ]]]
end)

let () = ()

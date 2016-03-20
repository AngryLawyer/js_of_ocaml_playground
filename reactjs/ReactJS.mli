class type react_element = object end
class type react_class = object end

type tag_type =
    | Tag_name of string
    | React_class of react_class

type content_type =
    | Dom_string of string
    | React_element of react_element Js.t

val create_class : < render : react_element Js.t Js.meth; .. > Js.t -> react_class
val create_element : tag_type -> ?props : < .. > Js.t -> content_type list -> react_element Js.t

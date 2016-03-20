class type react_element = object end
class type react_class = object end

type tag_type =
    | Dom_class of string
    | React_class of react_class

val create_class : < render : react_element Js.t Js.meth; .. > Js.t -> react_class
val create_element : tag_type -> string option -> react_element Js.t

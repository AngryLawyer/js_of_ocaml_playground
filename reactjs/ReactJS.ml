let reactJs = (Js.Unsafe.variable "React")
class type react_element = object end
class type react_class = object end


type tag_type =
    | Dom_class of string
    | React_class of react_class

let create_element dom_class maybe_content =
    let item_class = match dom_class with
    | Dom_class s -> Js.Unsafe.inject (Js.string s)
    | React_class r -> Js.Unsafe.inject r in

    let content = match maybe_content with
    | Some content -> Js.Unsafe.inject (Js.string content)
    | None -> Js.Unsafe.inject Js.null in
    Js.Unsafe.meth_call reactJs "createElement" [| item_class; Js.Unsafe.inject Js.null; content|]

let create_class spec =
    Js.Unsafe.meth_call reactJs "createClass" [| Js.Unsafe.inject spec |]

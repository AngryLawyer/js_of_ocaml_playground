let reactJs = (Js.Unsafe.variable "React")
class type react_element = object end
class type react_class = object end

let log i =
    Firebug.console##log i

type tag_type =
    | Tag_name of string
    | React_class of react_class

type content_type =
    | Dom_string of string
    | React_element of react_element Js.t

let create_element dom_class ?props content_list =
    let item_class = match dom_class with
    | Tag_name s -> Js.Unsafe.inject (Js.string s)
    | React_class r -> Js.Unsafe.inject r in

    let props = match props with
    | Some props -> Js.Unsafe.inject props
    | None -> Js.Unsafe.inject Js.null in

    (* build up our children *)
    let content = Js.array (Array.of_list (List.map (function
        | Dom_string s -> Js.Unsafe.inject (Js.string s)
        | React_element e -> Js.Unsafe.inject e
    ) content_list)) in

    Js.Unsafe.meth_call reactJs "createElement" [| item_class; props; Js.Unsafe.inject content|]

let create_class spec =
    Js.Unsafe.meth_call reactJs "createClass" [| Js.Unsafe.inject spec |]

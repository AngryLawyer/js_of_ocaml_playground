let reactJs = (Js.Unsafe.variable "React")

class type react_element = object
end

let create_element dom_element maybe_content =
    let content = match maybe_content with
    | Some content -> Js.Unsafe.inject (Js.string content)
    | None -> Js.Unsafe.inject Js.null in
    Js.Unsafe.meth_call reactJs "createElement" [| Js.Unsafe.inject (Js.string dom_element); Js.Unsafe.inject Js.null; content|]

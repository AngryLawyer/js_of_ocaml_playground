module ReactJS = struct
    let reactJs = (Js.Unsafe.variable "React")
    let reactDom = (Js.Unsafe.variable "ReactDOM")

    let createElement string ~content =
        Js.Unsafe.meth_call reactJs "createElement" [| Js.Unsafe.inject (Js.string string); Js.Unsafe.inject Js.null |]

    let render item target =
        Js.Unsafe.meth_call reactDom "render" [| Js.Unsafe.inject item; Js.Unsafe.inject target |]
end

let () =
    let target = Dom_html.getElementById "content" in
    ReactJS.render (ReactJS.createElement "h1") target

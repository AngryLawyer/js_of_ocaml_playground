module Guff = struct
    let adder = (Js.Unsafe.variable "adder")
    let addTextToDom = (Js.Unsafe.variable "addTextToDom")
end

let adder a b : int =
    Js.Unsafe.fun_call Guff.adder [|Js.Unsafe.inject a; Js.Unsafe.inject b|]

let add_text_to_dom text =
    Js.Unsafe.fun_call Guff.addTextToDom [|Js.Unsafe.inject (Js.string text)|]

let _ =
    add_text_to_dom (Printf.sprintf "%i" (adder 6 7))

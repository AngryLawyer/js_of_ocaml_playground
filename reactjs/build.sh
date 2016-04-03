ocamlbuild -use-ocamlfind \
    -package react,js_of_ocaml,js_of_ocaml.ppx \
    -package reactjs,reactjs_ppx \
    rjstest.byte rjstest.ml

js_of_ocaml +weak.js rjstest.byte
rm rjstest.byte

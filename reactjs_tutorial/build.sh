ocamlbuild -use-ocamlfind \
    -package reactjs,reactjs_ppx \
    -package react,js_of_ocaml,js_of_ocaml.ppx \
    tutorial.byte tutorial.ml

js_of_ocaml +weak.js tutorial.byte
rm tutorial.byte

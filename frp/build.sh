ocamlbuild -use-ocamlfind \
    -package react,js_of_ocaml,js_of_ocaml.ppx \
    test.byte test.ml

js_of_ocaml +weak.js test.byte

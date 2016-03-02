ocamlbuild -use-ocamlfind -syntax camlp4o \
    -package react,js_of_ocaml,js_of_ocaml.syntax \
    test.byte test.ml

js_of_ocaml +weak.js test.byte

ocamlbuild -use-ocamlfind \
    -package reactjs,reactjs_ppx,js_of_ocaml,js_of_ocaml.ppx,omd,commonjs_ppx \
    tutorial.byte tutorial.ml

js_of_ocaml +weak.js tutorial.byte
./node_modules/.bin/browserify tutorial.js > main.js
rm tutorial.byte
rm tutorial.js

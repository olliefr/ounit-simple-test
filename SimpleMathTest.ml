(* 
   How to unit test OCaml programs.

   From the video at OUnit webpage plus some knowledge from
   http://ounit.forge.ocamlcore.org/api-ounit/index.html 
*)

open OUnit

(* Test Fixture *)
let test_fixture = "SimpleMath" >:::
[
  "add" >:: ( fun () -> 
    assert_equal 4 (SimpleMath.add 2 2);
    assert_equal 0 (SimpleMath.add 0 0);
  );

  "subtract" >:: ( fun () ->
    assert_equal 4 (SimpleMath.subtract 9 3);
    assert_equal 3 (SimpleMath.subtract 5 2);
  );
]

(* Test Runner; ~verbose:true gives info on succ tests *)
let _ = run_test_tt test_fixture

(* Compile with
ocamlfind ocamlc -o SimpleMathTest -package ounit -linkpkg -g SimpleMath.ml SimpleMathTest.ml
*)

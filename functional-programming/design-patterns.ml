(* Strategy & Decorator patterns *)

(* Function isEven take an int and returns a bool *)
let isEven (x: int): bool =
  x mod 2 == 0

(* 
  Now we want to add logging at the beggining & at the end of the isEven function
  but we do NOT want to modify the already existing function!

  So we create a new function and its strategies.
*)
let logAndReturnValueWith (strategy: 'a -> string) (x: 'a): 'a =
  print_endline (strategy x);
  x

(* strategy #1 *)
let intToStringStrategy (x: int): string =
  string_of_int x

(* strategy #2 *)
let boolToStringStrategy (x: bool): string =
  string_of_bool x
  
(* Decorator for isEven - logging before and after *)
let isEvenWithLogging (x: int): bool =
  x
  |> logAndReturnValueWith intToStringStrategy
  |> isEven
  |> logAndReturnValueWith boolToStringStrategy

(* Note: 
    isEven - : int -> bool = <fun> 
    isEvenWithLogging - : int -> bool = <fun>
   same (int to bool) type for both functions
*)

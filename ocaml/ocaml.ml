(* Pattern matching *)
let fx = function
    [] -> 0
  | h :: _ -> h (* if we dont use tail it will match for [x] *)

let fx = function
    [] -> []
  | _ :: rs -> rs (* here we will get [] for [x] *)

let fx = function
    [] -> 0
  | _ :: rs -> List.hd rs (* here we will get 'Exception: (Failure hd)' for [x] *)

let fx = function
    [] | [_] -> 0
  | _ :: rs -> List.hd rs (* here we will get 0 for [x] *)

(* Izpiši odgovor *)


let preberi_datoteko ime_datoteke =
  let chan = open_in ime_datoteke in
  let vsebina = really_input_string chan (in_channel_length chan) in
  close_in chan;
  vsebina

let uredi_str vsebina = 
  (* Rad bi da vrne seznam -> int, int, letter, str *)
  let seznam vsebina' = String.split_on_char '\n' vsebina'
  in
  let razbij vrstica = match (String.split_on_char '-') vrstica with
  (* razbij ("1-3 b: abwa") -> ["1"; "3"; "b:"; "abwa"]*)
    | [] -> []
    | prvi_int :: ostalo -> match ostalo with
        | [] -> []
        | x :: xs -> prvi_int :: (String.split_on_char ' ' x)
  in
  let seznam_vrstic = seznam vsebina in
  List.map razbij seznam_vrstic


let ali_je_vredu sez =
  let prestej geslo crka = List.length(String.split_on_char crka geslo) - 1 
  in
  let preveri sez' = match sez' with
    | prvi :: drugi :: char :: geslo :: ostalo -> (
        let prvi_int = int_of_string prvi in
        let drugi_int = int_of_string drugi in
        let znak = String.get char 0 in
        if prestej geslo znak >= prvi_int && prestej geslo znak <= drugi_int then true else false  
    )
    | _ -> false
  in
  let rec aux acc = function
  |x :: xs -> if preveri x then aux (acc + 1) xs else aux acc xs 
  |[] -> acc
  in
  aux 0 sez

  let odgovor1 = ali_je_vredu(uredi_str(preberi_datoteko "day_2.in"))


  let izpis odgovor1 =
    
  (* --------------------drugi_del----------------------- *)

  
let ali_je_vredu2 sez =
    let poglej_indeks mesto2 str =
      if (String.length str) - 1 < mesto2 then (String.length str) - 1 else mesto2
    in
    let preveri mesto1 mesto2 crka str =
    if (String.get str mesto1) = crka && (String.get str mesto2) = crka then false else (* obe se ujemata *)
    if ((String.get str mesto1) = crka) || ((String.get str mesto2) = crka)  then true  (* ena se ujema *)
    else false
  in
  let rec aux acc = function
  | x :: xs -> (match x with 
      |mesto1 :: mesto2 :: char :: str :: ostalo ->
              let mesto1 = int_of_string mesto1 in
              let mesto2 = int_of_string mesto2 in
              let znak = String.get char 0 in
              let mesto2 = poglej_indeks mesto2 str in
              let mesto1 = poglej_indeks mesto1 str in
              if (preveri mesto1 mesto2 znak str) then aux (acc + 1) xs else aux acc xs
      |_ -> failwith("Error1")
              )
  | [] -> acc
  in
  aux 0 sez

  let odgovor2 = ali_je_vredu2(uredi_str(preberi_datoteko "day_2.in"))
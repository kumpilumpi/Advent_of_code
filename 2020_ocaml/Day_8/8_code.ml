
let podatki sez = (*uredi podatke v sez tuple (str * int)   *)
  let preberi_datoteko ime_datoteke =
    let chan = open_in ime_datoteke in
    let vsebina = really_input_string chan (in_channel_length chan) in
    close_in chan;
    vsebina
  in
  let vsebina_datoteke = preberi_datoteko "Day_8/8.in"
  in
  let seznam_v vsebina_datoteke = String.split_on_char '\n' vsebina_datoteke
  in
  let pod_seznam sez = 
    let rec aux acc = function
    |[] -> acc
    |str :: ostalo ->(
      match (String.split_on_char ' ' str) with
      |x :: y :: rep -> aux (acc @ [(x, int_of_string y)]) ostalo
      |_ -> failwith "Napaka1"
      )
    in 
    aux [] sez
  in
  pod_seznam (seznam_v vsebina_datoteke)

let naloga1 sez_tup =
  let rec je_v y = function
    | [] -> false
    | x :: xs -> if x = y then true else je_v y xs
  in
  let rec aux indeksi n acc sez_tup =
    let (koda, int) = List.nth sez_tup n
    in
    if je_v n indeksi then acc else(
      if koda = "nop" then aux (indeksi @ [n]) (n + 1) acc sez_tup else(
        if koda = "acc" then aux(indeksi @ [n]) (n + 1) (acc + int) sez_tup else(
          if koda = "jmp" then aux (indeksi @ [n]) (n + int) acc sez_tup else failwith "Napaka2"
        )
      )
    )
  in
  aux [] 0 0 sez_tup







let _ =
  let izpisi_datoteko ime_datoteke vsebina =
      let chan = open_out ime_datoteke in
      output_string chan vsebina;
      close_out chan
  in
  let odgovor1 = naloga1 (podatki ())
  (* and odgovor2 = naloga2 vsebina_datoteke *)
  in
  izpisi_datoteko "Day_8/8_1.out" (string_of_int odgovor1) ;

  (* izpisi_datoteko "day_0_2.out" odgovor2 *)

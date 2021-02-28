
let test1 = ["BFFFBBFRRR";"FFFBBBFRRR";"BBFFBBFRLL"]
(*
row 70, column 7, seat ID 567.
FFFBBBFRRR: row 14, column 7, seat ID 119.
BBFFBBFRLL: row 102, column 4, seat ID 820.
*)

let naloga1 sez =
  let gor_dol_fun str_sez = 
    let n = 2. ** (float_of_int (List.length str_sez)) -. 1.
    in
    let gor_dol char = if char = 'F' then true else false
    in
    let nova_meja (s, z) = (s + z +1) / 2
    in
    let rec aux (s, z) str_sez =
      match str_sez with 
        | [] ->  s
        | char :: ostalo -> if gor_dol char then aux ( s, (nova_meja (s, z)) - 1 ) ostalo else aux (nova_meja (s,z) , z ) ostalo
    in
    aux (0, int_of_float n) str_sez
  in
  let zamenjaj_z_f str_sez =
    let rec aux acc = function
      | [] -> acc
      | 'L' :: ostalo -> aux (acc @ ['F']) ostalo
      | x :: ostalo -> aux (acc @ [x]) ostalo
    in
    aux [] str_sez
  in
  let str_v_seznama str = 
    let razbij str =
      let rec aux1 acc str n =
      if n >= 0 then aux1 (acc @ [String.get str n]) str (n -1) else acc
      in
      List.rev (aux1 [] str (String.length str - 1 ))
    in
    let razdeli str_sez =
      let rec aux2 acc str_sez n =
        match str_sez with
          | [] -> ([], acc)
          | glava :: rep -> if n = 0 then (acc , glava :: rep) else aux2 (acc @ [glava]) rep (n -1)
      in
      aux2 [] str_sez 7
    in
    razdeli (razbij str)
  in
  let uporabi_id str =
    let (prvi, drugi) = str_v_seznama str
    in
    let id (prvi', drugi') = (gor_dol_fun prvi') * 8 + (gor_dol_fun (zamenjaj_z_f drugi'))
    in
    id (prvi, drugi)
  in
  let maksimalni sez =
    let rec aux_m acc sez =
      match sez with 
        | [] -> acc
        | glava :: rep -> (
          let id = uporabi_id glava
          in
          if acc < id then aux_m id rep else aux_m acc rep
        )
    in
    aux_m 0 sez
    in
  maksimalni sez
  








let _ =
  let preberi_datoteko ime_datoteke =
      let chan = open_in ime_datoteke in
      let vsebina = really_input_string chan (in_channel_length chan) in
      close_in chan;
      vsebina
  and izpisi_datoteko ime_datoteke vsebina =
      let chan = open_out ime_datoteke in
      output_string chan vsebina;
      close_out chan
  in
  let seznam vsebina_datoteke = String.split_on_char '\n' vsebina_datoteke
  in
  let vsebina_datoteke = preberi_datoteko "Day_5/5.in" in
  let odgovor1 = naloga1 (seznam vsebina_datoteke)
  (* and odgovor2 = naloga2 vsebina_datoteke *)
  in
  izpisi_datoteko "Day_5/5_1.out" (string_of_int odgovor1);
  (* izpisi_datoteko "day_0_2.out" odgovor2 *)
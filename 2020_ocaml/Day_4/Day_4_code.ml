

let podatki = ["byr"; "iyr"; "eyr"; "hgt"; "hcl"; "ecl"; "pid"; "cid"]

let ime = "Day_4/Day_4.in"

let seznam ime_datoteke =
  let preberi_datoteko ime_datoteke =
    let chan = open_in ime_datoteke in
    let vsebina = really_input_string chan (in_channel_length chan) in
    close_in chan;
    vsebina
  in
  let seznam vsebina_datoteke = String.split_on_char '\n' vsebina_datoteke
  in
  let pod_seznam sez = 
    let rec aux acc = function
    |[] -> acc
    |str :: ostalo -> aux (acc @ [String.split_on_char ' ' str]) ostalo
    in 
    aux [] sez
  in
  let uredi sez2 =
    let uredi_str str = List.hd (String.split_on_char ':' str)
    in
    let rec aux acc sez2 =
      match sez2 with
      | [] -> acc 
      | sez :: rep ->(
          let rec aux2 acc = function
            | [] -> acc
            | str :: xs -> aux2 (acc @ [uredi_str str]) xs
          in
          aux (acc @ [aux2 [] sez]) rep
      )
    in
    aux [] sez2
  in
  let skoraj_urejen_seznam = uredi (pod_seznam (seznam (preberi_datoteko ime_datoteke)))
  in
  let poberi_skupaj sez2 =
    let rec aux acc1 acc2 = function
      |[] -> acc1 @ [acc2]
      |sez :: rep -> if List.hd sez = "" then aux (acc1 @ [acc2]) [] rep else aux acc1 (acc2 @ sez) rep
    in
    aux [] [] sez2
  in
  poberi_skupaj (skoraj_urejen_seznam)

let test1 = [["iyr"; "cid"; "ecl"; "byr"; "hcl"; "eyr"; "hgt"; "pid"];
            ["pid"; "iyr"; "hgt"; "cid"; "ecl"; "byr"; "hcl"; "eyr"];
            ["ecl"; "hcl"; "cid"; "pid"; "iyr"; "eyr"; "byr"; "hgt"];
            ["pid"; "hgt"; "hcl"; "byr"; "iyr"; "cid"; "ecl"; "eyr"];
            ["cid"; "pid"; "iyr"; "ecl"; "byr"; "hgt"; "hcl"; "eyr"];]

let naloga1 sez2 =
  let rec je_v_seznamu str = function
    | [] -> false
    | x :: xs -> if x = str then true else je_v_seznamu str xs
  in
  let vredu sez = 
    if List.length sez = 8 then true else
    if List.length sez = 7 && not (je_v_seznamu "cid" sez) then true 
    else false
  in
  let rec aux acc sez2 =
    match sez2 with
    | [] -> acc
    | x :: rep -> if vredu x then aux (acc + 1) rep else aux acc rep
  in
  aux 0 sez2

(*----------------Naloga2-------------*)



  let _ =
    let izpisi_datoteko ime_datoteke vsebina =
        let chan = open_out ime_datoteke in
        output_string chan vsebina;
        close_out chan
    in
    let input1 = seznam "Day_4/Day_4.in"
    in
    let odgovor1 = naloga1 input1
    (* and odgovor2 = naloga2 vsebina_datoteke indeksi *)
    in
    izpisi_datoteko "Day_4/Day_4_4.out" (string_of_int odgovor1);
    (*izpisi_datoteko "Day_3/Day_3_2.out" (string_of_int odgovor2) *)
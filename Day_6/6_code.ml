
let test = [["c"; "jc"; "ck"; "cue"; "c"]; ["ysjircxtgfzpb"; "ynsxpgtcifz"; "riydpzsfxutcg"; "gsyitzdvpfcrox"; "yclxfzietsmghwp"]]



let test2 = [["abc"];["b";"c";"a"];["ab";"ac"];["a";"a";"a";"a"];["b"]]

let uredi_podatke str_vsebina = (*str -> sez_ sez posamezne enote*)
  let sez_vsebina = String.split_on_char '\n' str_vsebina
  in
  let rec aux_loci acc2 acc1 sez =
    match sez with
     | [] -> acc2 @ [acc1]
     | x :: rep -> (
       if x = "" then aux_loci (acc2 @ [acc1]) [] rep else aux_loci acc2 (acc1 @ [x]) rep
     )
  in  
  aux_loci [] [] sez_vsebina



let naloga1 sez_sez = 
  let sez_char_u sez = (* sez str -> sez unikat char*)
    let str_v_char str =
      let meja = String.length str 
      in
      let rec aux acc str n =
        if n < meja then aux (acc @ [String.get str n]) str (n + 1) else acc
      in
      aux [] str 0 
    in
    let sez_str_v_char sez =
      let rec aux acc = function
        | [] -> acc
        | x :: rep -> aux (acc @ (str_v_char x)) rep
      in
      aux [] sez
    in
    let rec unikat sez1 sez2 =
      let rec je_v sez' char =
        match sez' with
          | [] -> false
          | x :: rep -> if x = char then true else je_v rep char
      in
      match sez2 with
      | [] -> sez1
      | x :: rep -> if je_v sez1 x then unikat sez1 rep else unikat (sez1 @ [x]) rep
    in
    unikat [] (sez_str_v_char sez)
  in
  let rec aux1 acc1 = function
      | [] -> acc1
      | sez_str :: rep -> aux1 (acc1 @ [sez_char_u sez_str]) rep
  in
  let prestej sez_sez =
    let rec aux2 acc2 = function
      | [] -> acc2
      |x :: rep -> aux2 (acc2 + List.length x) rep
    in
    aux2 0 sez_sez
  in
  prestej (aux1 [] sez_sez)

(* ----------------Naloag2------------------- *)









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
  let podatki = uredi_podatke (preberi_datoteko "Day_6/6.in")
  in
  let odgovor1 = naloga1 podatki
  (* and odgovor2 = naloga2 vsebina_datoteke *)
  in
  izpisi_datoteko "Day_6/6_1.out" (string_of_int odgovor1);
  (* izpisi_datoteko "day_0_2.out" odgovor2 *)
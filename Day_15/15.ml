let podatki1 = [6;3;15;13;1;0]

let test1 = [0;3;5]

let naloga1 sez n = 
  let je_v_indeks sez element = 
    let rec aux sez element indeks = (* Če je vrne indeks drugače -1*)
      match sez with  
        |[] -> -1
        |glava :: rep -> if glava = element then indeks else aux rep element (indeks +1)
      in
    aux sez element 0
    in
  let naslednji sez element =
    let indeks = (je_v_indeks (List.rev sez) element) in
    if indeks = -1 then 0 else indeks + 1
    in
  let rec skupaj sez n =
    let element = List.hd (List.rev sez) 
    and sez' = List.rev (List.tl (List.rev sez)) in
    if n = 0 then element else (
      skupaj (sez @ [naslednji sez' element]) (n - 1)
    )
    in
  skupaj sez (n - List.length sez)




  let odgovor x = naloga1 [0;3;6] x


  let _ =
    let izpisi_datoteko ime_datoteke vsebina =
        let chan = open_out ime_datoteke in
        output_string chan vsebina;
        close_out chan
    in
    let odgovor1 = naloga1 podatki1 2020
    (* and odgovor2 = naloga2 podatki *)
    in
    izpisi_datoteko "Day_15/15_1.out" (string_of_int odgovor1);
    (* izpisi_datoteko "Day_12/12_2.out" (string_of_int odgovor2) *)

let uredi_podatke ime_datoteke =
  let preberi_datoteko ime_datoteke =
    let chan = open_in ime_datoteke in
    let vsebina = really_input_string chan (in_channel_length chan) in
    close_in chan;
    vsebina
    in
  let loci1 vsebina =  String.split_on_char '\n' vsebina
  in
  let loci_mali str = (* str -> char(prvi znak) * int (ostalo) *)
    (String.get str 0, int_of_string (String.sub str 1 ((String.length str) - 1)))
    in
  List.map loci_mali (loci1 (preberi_datoteko "Day_12/12.in"))


let naloga1 sez =
  let rec ukaz input koordinate = (* Koordinate = (smer * EW * NS) *)
    let obrat tuple = 
      let premik_sez sez zacetek koliko =
        let rec indeks n sez element = if List.hd sez = element then n else indeks (n+1) (List.tl sez) element in
        let n = (indeks 0 sez zacetek) + koliko in
        let rec v_mejah sez x = if x < List.length sez then List.nth sez x else v_mejah sez (x - (List.length sez)) in
        v_mejah sez n
        in
      let (smer, crka, stopinje) = tuple in
      let koliko = stopinje / 90 in
      let sez_smeri = ['N';'E';'S';'W'] in
      if crka = 'R' then premik_sez sez_smeri smer koliko else premik_sez (List.rev sez_smeri) smer koliko
    in
    let (crka, stevilka) = input in
    let (smer, ew, ns) = koordinate in
    if crka = 'F' then ukaz (smer, stevilka) koordinate else
    if crka = 'R' || crka = 'L' then (
        (obrat (smer, crka, stevilka), ew, ns)
    )else
    if crka = 'W' then (smer, ew - stevilka, ns) else 
    if crka = 'E' then (smer, ew + stevilka, ns) else
    if crka = 'N' then (smer, ew, ns + stevilka) else
    if crka = 'S' then (smer, ew, ns - stevilka) else
    failwith "If_napaka"
    in
  let rec na_sez koordinate = function
    | [] -> koordinate
    | glava :: rep -> na_sez (ukaz glava koordinate) rep
    in
  let (smer, x, y) = na_sez ('E', 0, 0) sez in
  let abs x = if x >= 0 then x else -1 * x in
  (abs x) + (abs y)



(*-------------izpis---------------*)

let _ =
  let izpisi_datoteko ime_datoteke vsebina =
      let chan = open_out ime_datoteke in
      output_string chan vsebina;
      close_out chan
  in
  let podatki = uredi_podatke ("Day_12/12.in")
  in
  let odgovor1 = naloga1 podatki
  (* and odgovor2 = naloga2 podatki *)
  in
  izpisi_datoteko "Day_12/12_1.out" (string_of_int odgovor1);
  (* izpisi_datoteko "Day_6/6_2.out" (string_of_int odgovor2) *)

let test = ["..##......."; (* ->  *)
            "#...#...#..";
            ".#....#..#.";
            "..#.#...#.#";
            ".#...##..#.";
            "..#.##.....";
            ".#.#.#....#";
            ".#........#";
            "#.##...#...";
            "#...##....#";
            ".#..#...#.#"]



let naloga1 sez premik =
  let dolzina = String.length (List.hd sez) 
  in
  let mod_dolzina mesto = if mesto >= dolzina then (mesto - dolzina) else mesto 
  in
  let rec aux acc mesto sez = 
    match sez with 
    | [] -> acc
    | x :: xs -> if (String.get x mesto) = (String.get "#" 0) then aux (acc + 1) (mod_dolzina( mesto + premik)) xs else aux acc (mod_dolzina ( mesto + premik )) xs
  in
  aux 0 0 sez ;;

(* Naloga2 *)

let naloga2 sez indeksi = 
  let 



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
  let vsebina_datoteke = preberi_datoteko "Day_3/Day_3.in" in
  let odgovor1 = naloga1 (seznam (vsebina_datoteke)) 3
  (*and odgovor2 = naloga2 vsebina_datoteke *)
  in
  izpisi_datoteko "Day_3/Day_3_1.out" (string_of_int odgovor1);
  (* izpisi_datoteko "day_0_2.out" odgovor2 *)
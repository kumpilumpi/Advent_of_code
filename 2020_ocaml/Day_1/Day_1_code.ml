(* Popravi, da vrača normalno *)


let int_list vsebina_datoteke = 
  let string_sez = String.split_on_char '\n' vsebina_datoteke in
  List.map int_of_string string_sez


let naloga1 sez =
  let preveri x y = (x + y) = 2020
  in
  let rec loop sez =
    let rec aux_loop element sez' =
      match sez' with
        | [] -> (0,0)
        | x :: xs -> if preveri x element then (x, element) else aux_loop element xs
    in
    match sez with 
      | [] ->  (1,1)
      | x :: xs -> ( 
        let tup = aux_loop x xs
        in
        if tup = (0,0) then loop xs else tup
      )
  in
  loop sez

  let zmnozi_v_str (x, y) = string_of_int (x * y)

(*   
let naloga2 vsebina_datoteke = () *)
  

let _ =
  let preberi_datoteko ime_datoteke =
      let chan = open_in ime_datoteke in
      let vsebina = really_input_string chan (in_channel_length chan) in
      close_in chan;
      vsebina
  (* (* and izpisi_datoteko ime_datoteke vsebina = *)
      let chan = open_out ime_datoteke in
      output_string chan vsebina;
      close_out chan *)
  in
  let vsebina_datoteke = preberi_datoteko "Day_1/Day_1.in" 
  in
  let odgovor1 = naloga1 (int_list (vsebina_datoteke))
  in
  odgovor1
  izpisi_datoteko "Day_1/Day_1_1.out" (zmnozi_v_str odgovor1)

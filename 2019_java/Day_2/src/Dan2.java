
import java.io.*;

public class Dan2 {
	
	public static void main(String[] args) throws IOException{
	
		input("input_1.txt");
	

	
	}

	public static void input(String imeVhod) throws IOException {
	
		BufferedReader vhod = new BufferedReader(new FileReader(imeVhod));
		
		String podatki = "";
		
		while(vhod.ready()) {
			String vrstica = vhod.readLine().trim();
			if (vrstica.equals("")) {continue;}
			podatki = vrstica;
		}
		vhod.close();
		
		int[] sez = strList(podatki);
		problem1(sez);
		System.out.println(sez[0]);	
	}
	
	
	public static int prestejVejice(String tekst) {
		int stevilo = 0;
		for (int i = 0; i < tekst.length(); i++ ) {
			if (tekst.substring(i,i+1).equals(",")) {
				++stevilo;				
			}
		}
		return stevilo + 1;
	}
	
	public static int[] strList(String tekst) {
		int[] sez = new int[prestejVejice(tekst)];
		String dodaj = "";
		int indeks = 0;
		for (int i = 0; i < tekst.length(); i++ ) {
			if (tekst.substring(i, i+1).equals(",")) {
				sez[indeks] = Integer.parseInt(dodaj);
				dodaj = "";
				++indeks;
			} else {
				dodaj = dodaj + tekst.substring(i, i+1);				
			}
		}
		return sez;
			
	}	
	
	public static void problem1(int[] sez) {
		for (int i = 0; i < sez.length ; i = i + 4) {
			if (sez[i] == 99) {
				break;				
			}if (sez[i] == 1) {
				sez[sez[i+3]] = sez[sez[i+1]] + sez[sez[i+2]];
			}if (sez[i] == 2) {
				sez[sez[i+3]] = sez[sez[i+1]] * sez[sez[i+2]];
			}
		}
	}
		
}

	
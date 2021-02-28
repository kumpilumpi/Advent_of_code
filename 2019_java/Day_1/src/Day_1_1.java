import java.io.*;

public class Day_1_1 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		System.out.print(ena("input_1.txt", "odgovor_2.txt"));

	}
	
	public static int ena(String imeVhod, String imeIzhod) throws IOException {
		BufferedReader vhod = new BufferedReader(new FileReader(imeVhod));
		PrintWriter izhod = new PrintWriter(new FileWriter(imeIzhod));
		int odgovor = 0;
		
		while(vhod.ready()) {
			String vrstica = vhod.readLine().trim(); // .throw -> spusti zadnji znak za novo vrstico
			if (vrstica.equals("")) continue;
			odgovor += naloga1(Integer.parseInt(vrstica));			
		}
		
		vhod.close();
		izhod.close();
		return odgovor;
		
	}
	public static int naloga1(int input) {
		return (input / 3) - 2 ;		
	}

}
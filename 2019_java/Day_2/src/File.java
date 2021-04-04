
import java.io.*;
import java.util.*;

public class File {
	
// Class za branje in pisnaje po datotekah
	
	public String vhod;
	public String izhod;
	public File fileV;
	public File fileI;
	public String vsebina;
	
	
	
	
	public File(String v, String i) {
		this.vhod = v;
		this.izhod = i;
		this.fileV = new File(vhod);
		this.fileI = new File(izhod);
		
		if ( fileI.exists() ) {  
		
	}
	
	public void ustvariFile(File datoteka){
		try {
		      if (datoteka.createNewFile()) {break; } else {
		        System.out.println("File already exists.");
		      }
		    } catch (IOException e) {
		      System.out.println("An error occurred.");
		      e.printStackTrace();
		    }
		
	}
		
	public void preberiStr() {
		
	}
	
	public void preberiList() {
		
	}
	

}
package org.VenomStudios.main;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class DataSystem {

	private static File file = new File("plugins/UniquePlayerCount" + File.separator + "joins.yml");
	
	public static void saveJoins(){
		try{
			BufferedWriter bw = new BufferedWriter(new FileWriter(file));
			for(String data:Data.uniqueUUIDStorage.keySet()){
				bw.write(data + "," + Data.uniqueUUIDStorage.get(data));
				bw.newLine();
			}
			bw.flush();
			bw.close();
		}catch(IOException e){
			System.out.println("VENOM >> FAILED TO SAVE!");
			if(UniquePlayerCount.debug == true){
				System.out.println("+++ VENOM ERROR PRINTING +++ ");
				System.out.println(e);
				System.out.println("+++ VENOM ERROR PRINTING FINISHED +++ \n");
			}
		}
	}

	public static void loadJoins(){
		try{
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
			String readData;
			while((readData = br.readLine()) != null){
				String[] args = readData.split("[,]", 2);
				if(args.length != 2){
					continue;
				}
				String uuidData = args[0].replaceAll(" ", "");
				String booleanData = args[1].replaceAll(" ", "");
				if(booleanData.equalsIgnoreCase("true")){
					Data.uniqueUUIDStorage.put(uuidData, true);
				}else{
					Data.uniqueUUIDStorage.put(uuidData, false);
				}
			}
			br.close();
		}catch(IOException e){
			if(!file.exists()){
				System.out.println("VENOM >> FAILED TO LOAD, FILE DOESN'T EXIST. EITHER THIS IS YOUR FIRST TIME LOADING, OR YOU HAVE DELETED IT.");
			}else{
				System.out.println("VENOM >> FAILED TO SAVE!");
			}
			if(UniquePlayerCount.debug == true){
				System.out.println("+++ VENOM ERROR PRINTING +++ ");
				System.out.println(e);
				System.out.println("+++ VENOM ERROR PRINTING FINISHED +++ \n");
			}
		}
	}
	
}
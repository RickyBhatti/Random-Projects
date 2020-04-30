package org.VenomStudios.main;

import java.io.File;
import java.util.logging.Logger;

import org.bukkit.Bukkit;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.plugin.PluginDescriptionFile;
import org.bukkit.plugin.java.JavaPlugin;

public class UniquePlayerCount extends JavaPlugin {
	
	public static UniquePlayerCount plugin;
	public static File file;
	public final Logger logger = Logger.getLogger("Minecraft");
	PluginDescriptionFile pdffile = getDescription();
	public static boolean debug = false;
	
	public void onEnable(){
		plugin = this;
		this.logger.info(pdffile.getName() + " >> has been enabled!");
	
		Bukkit.getPluginManager().registerEvents(new PlayerJoin(), this);
		Bukkit.getPluginManager().registerEvents(new PlayerQuit(), this);
		saveDefaultConfig();
		
		if(getConfig().getBoolean("debug") == true){
			debug = true;
		}
		if(getConfig().getBoolean("no-save") == false){
			DataSystem.loadJoins();
		}else{
			Data.noSave = true;
		}
		
		this.logger.info(pdffile.getName() + " >> Finished Loading, " + Data.uniqueUUIDStorage.size() + " entries in the Database.");
	}
	
	public void onDisable(){
		if(getConfig().getBoolean("no-save") == false){
			DataSystem.saveJoins();
		}
		this.logger.info(pdffile.getName() + " >> has been disabled!");
	}
	
	public boolean onCommand(CommandSender sender, Command cmd, String commandLabel, String[] args){
		Player player = (Player)sender;
		
		if(cmd.getName().equalsIgnoreCase("UniquePlayers")){
			player.sendMessage(Data.uniquePlayers);
		}
		
		return true;
	}

}
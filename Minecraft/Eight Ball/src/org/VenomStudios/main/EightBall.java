package org.VenomStudios.main;

import java.util.Arrays;
import java.util.Random;
import java.util.logging.Logger;

import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.meta.ItemMeta;
import org.bukkit.plugin.PluginDescriptionFile;
import org.bukkit.plugin.java.JavaPlugin;

public class EightBall extends JavaPlugin {
	
	public static EightBall plugin;
	public final Logger logger = Logger.getLogger("Minecraft");
	PluginDescriptionFile pdffile = getDescription();
	
	public static Random random = new Random();
	
	static ItemStack eightBall;

	public void onEnable(){
		plugin = this;
		this.logger.info(pdffile.getName() + " >> has been enabled!");
		
		eightBall = new ItemStack(Material.EYE_OF_ENDER);
		ItemMeta meta = eightBall.getItemMeta();
		
		meta.setDisplayName(Data.metaTitle);
		meta.setLore(Arrays.asList(ChatColor.GREEN + "Ask your question, and you shall recieve your answer!", ChatColor.RED + "Right click me, and then ask me the question!"));
		eightBall.setItemMeta(meta);
		
		this.getCommand("8BallInfo").setExecutor(new EightBallCommand());
		this.getCommand("EightBallInfo").setExecutor(new EightBallCommand());
		this.getCommand("8Ball").setExecutor(new EightBallCommand());
		this.getCommand("EightBall").setExecutor(new EightBallCommand());
		
		Bukkit.getPluginManager().registerEvents(new PlayerInteract(), this);
		Bukkit.getPluginManager().registerEvents(new PlayerJoin(), this);
	}
	
	public void onDisable(){
		this.logger.info(pdffile.getName() + " >> has been disabled!");
	}
	
	public static ItemStack getMagicBall(){
		return eightBall;
	}
	
	public static String getReponse(){
		return Data.responses[random.nextInt(Data.responses.length)];	
	}
	
}

package org.VenomStudios.main;

import java.util.HashMap;

import org.bukkit.ChatColor;

public class Data {
	
	public static String pluginName = "Magic 8 Ball";
	public static String pluginAuthor = "RickyBGamez";
	public static String pluginVersion = "1.0.0";
	
	public static HashMap<String, Boolean> storageBoolean = new HashMap<String, Boolean>();
	
	public static String title = ChatColor.RED + "" +ChatColor.BOLD + "Magic 8 Ball" + ChatColor.RESET + ChatColor.WHITE + " >> " +  ChatColor.RESET;
	public static String metaTitle = ChatColor.AQUA + "" + ChatColor.BOLD + "Magic 8 Ball";
	
	public static String welcomeMessage = title + ChatColor.AQUA + "This server is currently running v" + pluginVersion + " of " + pluginName +"! Do /eightball to get the Magic 8 Ball, then right click it to ask a question!";
	public static String informationMessage = title + ChatColor.AQUA + pluginName + " was developed by " + pluginAuthor +"!";
	public static String errorMessage = title + ChatColor.RED + "Oops, something went wrong!";
	public static String hasEightBall = title + ChatColor.RED + "You can only have one Magic 8 Ball in your inventory at a time!";
	
	public static String[] responses = {
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "It is certain.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "It is decidedly so.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "Without a doubt.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "Yes, definitely.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "You may rely on it.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "As I see it, yes.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "Most likely.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "Outlook good.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "Yes.", 
		title + ChatColor.GREEN + "" + ChatColor.BOLD + "Signs point to, yes.", 
		title + ChatColor.YELLOW + "" + ChatColor.BOLD + "Reply hazy try again.", 
		title + ChatColor.YELLOW + "" + ChatColor.BOLD + "Ask again later.", 
		title + ChatColor.YELLOW + "" + ChatColor.BOLD + "Better not tell you now.", 
		title + ChatColor.YELLOW + "" + ChatColor.BOLD + "Cannot predict now.", 
		title + ChatColor.YELLOW + "" + ChatColor.BOLD + "Concentrate and ask again.", 
		title + ChatColor.RED + "" + ChatColor.BOLD + "Don't count on it.", 
		title + ChatColor.RED + "" + ChatColor.BOLD + "My reply is no.", 
		title + ChatColor.RED + "" + ChatColor.BOLD + "My sources say, no.", 
		title + ChatColor.RED + "" + ChatColor.BOLD + "Outlook not so good.", 
		title + ChatColor.RED + "" + ChatColor.BOLD + "Very doubtful."	
	};
	
}

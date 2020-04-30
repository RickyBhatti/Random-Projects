package org.VenomStudios.main;

import java.util.HashMap;

import org.bukkit.ChatColor;

public class Data {
	
	public static String pluginName = "Unique Player Count";
	public static String pluginAuthor = "RickyBGamez";
	public static String pluginVersion = "0.0";
	
	public static HashMap<String, Boolean> uniqueUUIDStorage = new HashMap<String, Boolean>();
	
	public static String playerJoin = ChatColor.GRAY + "[" + ChatColor.GREEN + "" + ChatColor.BOLD + "+" + ChatColor.GRAY + "] ";
	public static String playerLeave = ChatColor.GRAY + "[" + ChatColor.RED + "" + ChatColor.BOLD + "-" + ChatColor.GRAY + "] ";
	public static String uniquePlayers = playerJoin + ChatColor.GREEN + uniqueUUIDStorage.size() + ChatColor.GRAY + " unique players have connected to this server!";
	
	public static boolean noSave = false;
	
}
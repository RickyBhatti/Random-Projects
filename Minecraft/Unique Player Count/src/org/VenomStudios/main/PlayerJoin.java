package org.VenomStudios.main;

import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerJoinEvent;

public class PlayerJoin implements Listener {

	@EventHandler
	public void onPlayerJoin(PlayerJoinEvent event){
		Player player = event.getPlayer();
		String playerID = player.getUniqueId().toString();
		event.setJoinMessage(null);
		if(!Data.uniqueUUIDStorage.containsKey(playerID)){
			Data.uniqueUUIDStorage.put(playerID, true);
			Bukkit.broadcastMessage(Data.playerJoin + ChatColor.GREEN + player.getName() + ChatColor.GRAY + " is the " + ChatColor.GREEN + "#" + Data.uniqueUUIDStorage.size() + ChatColor.GRAY + " unique player to connect to this server!");
			//player.getWorld().strikeLightning(player.getLocation());
			//player.getWorld().createExplosion(player.getLocation(), 0);
			if(Data.noSave == false){
				DataSystem.saveJoins();
			}
		}else{
			Bukkit.broadcastMessage(Data.playerJoin + ChatColor.GREEN + player.getName());
		}
	}
	
}
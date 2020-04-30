package org.VenomStudios.main;

import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.PlayerQuitEvent;

public class PlayerQuit implements Listener {

	@EventHandler
	public void onPlayerQuit(PlayerQuitEvent event){
		event.setQuitMessage(null);
		Player player = event.getPlayer();
		Bukkit.broadcastMessage(Data.playerLeave + ChatColor.RED + player.getName());
	}
	
}
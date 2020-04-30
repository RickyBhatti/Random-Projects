package org.VenomStudios.main;

import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.player.AsyncPlayerChatEvent;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.inventory.ItemStack;

public class PlayerInteract implements Listener {
	
	@EventHandler
	public void onInteract(PlayerInteractEvent event){
		Player player = event.getPlayer();
		ItemStack item = event.getItem();
		
		if((item != null) && (item.getType() == Material.EYE_OF_ENDER) && (item.getItemMeta().getDisplayName().equals(Data.metaTitle))){
			player.sendMessage(Data.title + "Ask me a question, and I shall respond!");
		}
		Data.storageBoolean.put(player.getName(), true);
		event.setCancelled(true);
	}
	
	@SuppressWarnings("deprecation")
	@EventHandler
	public void onChat(AsyncPlayerChatEvent event){
		Player player = event.getPlayer();
		if((player.getItemInHand().getType() == Material.EYE_OF_ENDER && player.getItemInHand().getItemMeta().getDisplayName().equals(Data.metaTitle)) && (Data.storageBoolean.get(player.getName()) == true)){
			player.sendMessage(EightBall.getReponse());
		}
		Data.storageBoolean.remove(player.getName());
		event.setCancelled(true);
	}
	
}
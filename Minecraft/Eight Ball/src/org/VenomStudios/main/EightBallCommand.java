package org.VenomStudios.main;

import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

public class EightBallCommand implements CommandExecutor {

	@Override
	public boolean onCommand(CommandSender sender, Command cmd, String commandLabel, String[] args){
		Player player = (Player)sender;
		
		if(cmd.getName().equalsIgnoreCase("8BallInfo") || cmd.getName().equalsIgnoreCase("EightBallInfo")){
			player.sendMessage(Data.informationMessage);
		}else if(cmd.getName().equalsIgnoreCase("8Ball") || cmd.getName().equalsIgnoreCase("EightBall")){
			if(player.getInventory().contains(EightBall.eightBall) == true){
				player.sendMessage(Data.hasEightBall);
			}else{
				player.getInventory().addItem(new ItemStack[] {EightBall.getMagicBall()});
			}
		}else{
			player.sendMessage(Data.errorMessage);
		}
		
		return true;
	}
	
}

/*------------------------------------------------------------
		Copyright © 2018 - 2019, VENOM Development
------------------------------------------------------------*/

local MessageBoardsSpawns = {
	/* TABLE STRUCTURE, FOLLOW IT EXACTLY SO NOTHING BREAKS
		map_name = { -- MAP NAME HAS TO BE SPELT EXACTLY LIKE IT IS ON YOUR SERVER.
			{
				pos = Vector( 0, 0, 0 ), -- POSISTION THE BOARD SHOULD SPAWN IN
				ang = Angle( 0, 0, 0 ), -- ANGLE THE BOARD SHOULD FACE
				line1 = "LINE 1",
				line2 = "LINE 2",
				line3 = "LINE 3",
				line4 = "LINE 4",
				line5 = "LINE 5", -- SECOND SCREEN, WILL ONLY BE DISPLAYED IF SECOND_SCREEN_ACTIVE IS SET TO TRUE.
				line6 = "LINE 6", -- SECOND SCREEN, WILL ONLY BE DISPLAYED IF SECOND_SCREEN_ACTIVE IS SET TO TRUE.
				line7 = "LINE 7", -- SECOND SCREEN, WILL ONLY BE DISPLAYED IF SECOND_SCREEN_ACTIVE IS SET TO TRUE.
				line8 = "LINE 8", -- SECOND SCREEN, WILL ONLY BE DISPLAYED IF SECOND_SCREEN_ACTIVE IS SET TO TRUE.
				second_screen_active = false, -- FALSE WILL DISPLAY THE SECOND SCREEN, AND ONLY SHOW LINES 1 TO 4. TRUE WILL ENABLE IT AND SHOW ALL LINES, WITH 4 SECOND INTERVALS BETWEEN.
				enable_motion = false, -- IF PEOPLE SHOULD BE ABLE TO MOVE IT. SETTING TO FALSE, WOULD MAKE IT FROZEN IN PLACE, TRUE WOULD ALLOW PLAYERS TO PUSH IT AROUND.
			}, -- MAKE SURE TO ADD A COMMA AFTER EACH CLOSING BRACKET
			{
				{REPEAT THE SAME INFORMATION AS ABOVE FOR AS MANY BOARDS AS YOU WANT PER MAP}
			},
		}, -- MAKE SURE TO ADD A COMMA AFTER EACH CLOSING BRACKET
	*/

	/*rp_rockford_v2b = { -- Example Spawn
		{ -- Location: Middle of the street, in front of City Hall.
			pos = Vector( -3710, -6740, 0 ),
			ang = Angle( 0, 0, 0 ),
			line1 = "LINE 1",
			line2 = "LINE 2",
			line3 = "LINE 3",
			line4 = "LINE 4",
			line5 = "LINE 5",
			line6 = "LINE 6",
			line7 = "LINE 7",
			line8 = "LINE 8",
			second_screen_active = false,
			enable_motion = false,
		},
	},*/
}

local function SpawnMessageBoards()
	local MessageBoardsSpawns_CurrentMap = MessageBoardsSpawns[ game.GetMap() ]
	
	for k, v in pairs( MessageBoardsSpawns_CurrentMap ) do
		local ent = ents.Create( "venom_messageboard" )
		ent:SetPos( v.pos )
		ent:SetAngles( v.ang or Angle( 0, 0, 0 ) )
		ent:Spawn()
		
		ent.Owner = nil
		ent:SetMessageBoard_Active( true )
		timer.Simple( 4, function()
			if !ent:IsValid() then return end
			ent:SetMessageBoard_Line1_2( v.line1 .. "!~" .. v.line2 )
			ent:SetMessageBoard_Line3_4( v.line3 .. "!~" .. v.line4 )
			ent:SetMessageBoard_Line5_6( v.line5 .. "!~" .. v.line6 )
			ent:SetMessageBoard_Line7_8( v.line7 .. "!~" .. v.line8 )
			ent:SetMessageBoard_SecondScreen( v.second_screen_active )
		end )
		
		ent:GetPhysicsObject():EnableMotion( v.enable_motion )
		ent:DropToFloor()
	end
end
hook.Add( "InitPostEntity", "SpawnMessageBoards_Hook", SpawnMessageBoards )
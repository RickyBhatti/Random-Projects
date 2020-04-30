/*------------------------------------------------------------
		Copyright © 2018 - 2019, VENOM Development
------------------------------------------------------------*/

ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.Category = "VENOM Development"
ENT.PrintName = "Message Board"
ENT.Purpose = "Message Board to use for announcements and notices."
ENT.Instructions = "Place it down, and press E on the board after it boots up to edit the message. (Can only be edited by the Owner of the board)"

ENT.Author = "RickyBGamez"
ENT.Contact = "www.steamcommunity.com/id/RickyBGamez"

ENT.Spawnable = true
ENT.Editable = false
ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "MessageBoard_Active" )

	self:NetworkVar( "String", 0, "MessageBoard_Line1_2" )
	self:NetworkVar( "String", 1, "MessageBoard_Line3_4" )
	self:NetworkVar( "String", 2, "MessageBoard_Line5_6" )
	self:NetworkVar( "String", 3, "MessageBoard_Line7_8" )

	self:NetworkVar( "Bool", 1, "MessageBoard_SecondScreen" )
	self:NetworkVar( "Int", 0, "MessageBoard_CurrentScreen" )

	self:NetworkVar( "Int", 1, "MessageBoard_ID" )

	self:NetworkVar( "Entity", 0, "owning_ent" )
end
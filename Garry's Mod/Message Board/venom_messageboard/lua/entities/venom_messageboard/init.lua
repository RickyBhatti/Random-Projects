/*------------------------------------------------------------
		Copyright © 2018 - 2019, VENOM Development
------------------------------------------------------------*/

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

util.AddNetworkString( "VENOM_MessageBoard_EditTrigger" )

local booted
function ENT:Initialize()
	self:SetModel( "models/props_fairgrounds/trailermessageboard.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )
    self:DrawShadow( true )
	
	booted = false

	if self.Owner:IsValid() then
		self.Owner = self.Owner
	elseif self:GetCreator():IsValid() then
		self.Owner = self:GetCreator()
	elseif self:Getowning_ent():IsValid() then
		self.Owner = self:Getowning_ent()
	else
		self.Owner = nil
	end

	self:SetMessageBoard_Active( true )

	self:SetMessageBoard_CurrentScreen( 1 )
	self:SetMessageBoard_Line1_2( "8888888888888!~8888888888888" )
	self:SetMessageBoard_Line3_4( "8888888888888!~8888888888888" )
	self:SetMessageBoard_Line5_6( "8888888888888!~8888888888888" )
	self:SetMessageBoard_Line7_8( "8888888888888!~8888888888888" )
	self:SetMessageBoard_SecondScreen( true )
	
	local phys = self:GetPhysicsObject()

	if phys:IsValid() then
		phys:Wake()
    end
    
	timer.Simple( 1, function()
		if !self:IsValid() then return end

		if self.Owner:IsValid() then
			self.Owner = self.Owner
		elseif self:GetCreator():IsValid() then
			self.Owner = self:GetCreator()
		elseif self:Getowning_ent():IsValid() then
			self.Owner = self:Getowning_ent()
		else
			self.Owner = nil
		end

	    self:SetMessageBoard_Line1_2( "!~PANEL IS" )
		self:SetMessageBoard_Line3_4( "BOOTING...!~" )
		self:SetMessageBoard_Line5_6( "!~" )
		self:SetMessageBoard_Line7_8( "!~" )
    end )

    timer.Simple( 4, function()
        if !self:IsValid() then return end
        booted = true
		self:SetMessageBoard_Line1_2( "POLICE CHECK!~-POINT" )
		self:SetMessageBoard_Line3_4( "PREPARE TO!~STOP" )
		self:SetMessageBoard_Line5_6( "/\\!~/ | \\" )
		self:SetMessageBoard_Line7_8( "/  |  \\!~/__ . __\\" )

		local OwnerSteamID
		if self.Owner:IsValid() then
			OwnerSteamID = self.Owner:SteamID()
		else
			OwnerSteamID = "0"
		end

		local RandomBoardID = math.random( 1, 10000 ) 
		self:SetMessageBoard_ID( RandomBoardID )
		self.BoardTimerName = "VENOM_MessageBoard-" .. tostring( OwnerSteamID ) .. tostring( RandomBoardID )

		timer.Create( self.BoardTimerName, 4, 0, function()
			if !self:IsValid() then return end
			if !self:GetMessageBoard_SecondScreen() then return end
			if self:GetMessageBoard_CurrentScreen() == 1 then
				self:SetMessageBoard_CurrentScreen( 2 )
			else
				self:SetMessageBoard_CurrentScreen( 1 )
			end
		end )
	end )
end

function ENT:SpawnFunction( ply, tr, ClassName )
	if !tr.Hit then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 10
	local SpawnAng = ply:EyeAngles()
	SpawnAng.p = 0
	SpawnAng.y = SpawnAng.y + 180

	local ent = ents.Create( ClassName )
	ent:SetPos( SpawnPos )
	ent:SetAngles( SpawnAng )
	ent:Spawn()
	ent:Activate()

	self.Owner = ply

	return ent
end

function ENT:Use( caller )
    if !caller:IsValid() then return end
    if !booted then return end
	if caller ~= self.Owner then return end

    net.Start( "VENOM_MessageBoard_EditTrigger" )
        net.WriteEntity( self )
    net.Send( caller )
end

util.AddNetworkString( "VENOM_MessageBoard_EditData" )
local function VENOM_UpdateMessageBoardData( ent, line, new_line )
	if tonumber( line ) == 0 then
		ent:SetMessageBoard_Line1_2( new_line )
	elseif tonumber( line ) == 1 then
		ent:SetMessageBoard_Line3_4( new_line )
	elseif tonumber( line ) == 2 then
		ent:SetMessageBoard_Line5_6( new_line )
	elseif tonumber( line ) == 3 then
		ent:SetMessageBoard_Line7_8( new_line )
	elseif tonumber( line ) == 4 then
		if new_line == "false" then
			ent:SetMessageBoard_Active( false )
		elseif new_line == "true" then
			ent:SetMessageBoard_Active( true )
		end
	elseif tonumber( line ) == 5 then
		if new_line == "false" then
			ent:SetMessageBoard_CurrentScreen( 1 )
			ent:SetMessageBoard_SecondScreen( false )
		elseif new_line == "true" then
			ent:SetMessageBoard_SecondScreen( true )
		end
	end
end
net.Receive( "VENOM_MessageBoard_EditData", function()
	VENOM_UpdateMessageBoardData( net.ReadEntity(), net.ReadInt( 4 ), net.ReadString() )
end )

function ENT:OnRemove()
	if timer.Exists( self.BoardTimerName ) then
		timer.Remove( self.BoardTimerName )
	end
end
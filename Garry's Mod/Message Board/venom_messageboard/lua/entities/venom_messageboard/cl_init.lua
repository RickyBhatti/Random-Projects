/*------------------------------------------------------------
		Copyright © 2018 - 2019, VENOM Development
------------------------------------------------------------*/

include( "shared.lua" )

surface.CreateFont( "MessageBoard_BackgroundFont", {
    font = "Arial",
	size = 31,
})

surface.CreateFont( "MessageBoard_Font", {
    font = "digital-7",
	size = 35,
})

local string = string

local function MessageBoard_DataEditor( data )
    local Frame = vgui.Create( "DFrame" )
	Frame:SetTitle( "Message Board | Editor | 13 Character Max Per Line" )
    Frame:SetSize( 700, 200 )
    Frame:SetBackgroundBlur( true )
	Frame:SetDraggable( true )
	Frame:ShowCloseButton( false )
	Frame:Center()
    Frame:MakePopup()
    Frame.Paint = function( s, w, h )
        draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
    end

    local CloseButton = vgui.Create( "DButton", Frame )
	CloseButton:SetSize( 20, 20 )
	CloseButton:SetPos( Frame:GetWide() * 0.967, Frame:GetTall() * 0.02 )
	CloseButton:SetText( "X" )
	CloseButton:SetTextColor( Color( 255, 255, 255, 255 ) )
	CloseButton.Paint = function( s, w, h )
		draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 20, 20, 200 ) )
	end
	CloseButton.DoClick = function()
		Frame:Close()
	end
    
    local TextBoxTextColor = Color( 0, 0, 0, 255 )

	local Label1 = vgui.Create( "DLabel", Frame )
	Label1:SetPos( 15, 40 )
	Label1:SetText( "Line 1:" )
	local Line1 = vgui.Create( "DTextEntry", Frame )
	Line1:SetPos( 50, 40 )
	Line1:SetSize( 280, 20 )
	Line1:SetTextColor( TextBoxTextColor ) 
	Line1:SetText( string.Explode( "!~", data:GetMessageBoard_Line1_2() )[ 1 ] )
	Line1.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line2_data = string.Explode( "!~", data:GetMessageBoard_Line1_2() )[ 2 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 0, 4 )
			net.WriteString( self:GetValue() .. "!~" .. line2_data )
		net.SendToServer()
	end
	
	local Label2 = vgui.Create( "DLabel", Frame )
	Label2:SetPos( 15, 80 )
	Label2:SetText( "Line 2:" )
	local Line2 = vgui.Create( "DTextEntry", Frame )
	Line2:SetPos( 50, 80 )
	Line2:SetSize( 280, 20 )
	Line2:SetTextColor( TextBoxTextColor ) 
	Line2:SetText( string.Explode( "!~", data:GetMessageBoard_Line1_2() )[ 2 ] )
	Line2.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line1_data = string.Explode( "!~", data:GetMessageBoard_Line1_2() )[ 1 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 0, 4 )
			net.WriteString( line1_data .. "!~" .. self:GetValue() )
		net.SendToServer()
	end
	
	local Label3 = vgui.Create( "DLabel", Frame )
	Label3:SetPos( 15, 120 )
	Label3:SetText( "Line 3:" )
	local Line3 = vgui.Create( "DTextEntry", Frame )
	Line3:SetPos( 50, 120 )
	Line3:SetSize( 280, 20 )
	Line3:SetTextColor( TextBoxTextColor ) 
	Line3:SetText( string.Explode( "!~", data:GetMessageBoard_Line3_4() )[ 1 ] )
	Line3.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line4_data = string.Explode( "!~", data:GetMessageBoard_Line3_4() )[ 2 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 1, 4 )
			net.WriteString( self:GetValue() .. "!~" .. line4_data )
		net.SendToServer()
	end
	
	local Label4 = vgui.Create( "DLabel", Frame )
	Label4:SetPos( 15, 160 )
	Label4:SetText( "Line 4:" )
	local Line4 = vgui.Create( "DTextEntry", Frame )
	Line4:SetPos( 50, 160 )
	Line4:SetSize( 280, 20 )
	Line4:SetTextColor( TextBoxTextColor ) 
	Line4:SetText( string.Explode( "!~", data:GetMessageBoard_Line3_4() )[ 2 ] )
	Line4.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line3_data = string.Explode( "!~", data:GetMessageBoard_Line3_4() )[ 1 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 1, 4 )
			net.WriteString( line3_data .. "!~" .. self:GetValue() )
		net.SendToServer()
	end

	local Label5 = vgui.Create( "DLabel", Frame )
	Label5:SetPos( 360, 40 )
	Label5:SetText( "Line 5:" )
	local Line5 = vgui.Create( "DTextEntry", Frame )
	Line5:SetPos( 395, 40 )
	Line5:SetSize( 280, 20 )
	Line5:SetTextColor( TextBoxTextColor ) 
	Line5:SetText( string.Explode( "!~", data:GetMessageBoard_Line5_6() )[ 1 ] )
	Line5.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line6_data = string.Explode( "!~", data:GetMessageBoard_Line5_6() )[ 2 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 2, 4 )
			net.WriteString( self:GetValue() .. "!~" .. line6_data )
		net.SendToServer()
	end

	local Label6 = vgui.Create( "DLabel", Frame )
	Label6:SetPos( 360, 80 )
	Label6:SetText( "Line 6:" )
	local Line6 = vgui.Create( "DTextEntry", Frame )
	Line6:SetPos( 395, 80 )
	Line6:SetSize( 280, 20 )
	Line6:SetTextColor( TextBoxTextColor ) 
	Line6:SetText( string.Explode( "!~", data:GetMessageBoard_Line5_6() )[ 2 ] )
	Line6.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line5_data = string.Explode( "!~", data:GetMessageBoard_Line5_6() )[ 1 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 2, 4 )
			net.WriteString( line5_data .. "!~" .. self:GetValue() )
		net.SendToServer()
	end
	
	local Label7 = vgui.Create( "DLabel", Frame )
	Label7:SetPos( 360, 120 )
	Label7:SetText( "Line 7:" )
	local Line7 = vgui.Create( "DTextEntry", Frame )
	Line7:SetPos( 395, 120 )
	Line7:SetSize( 280, 20 )
	Line7:SetTextColor( TextBoxTextColor ) 
	Line7:SetText( string.Explode( "!~", data:GetMessageBoard_Line7_8() )[ 1 ] )
	Line7.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line8_data = string.Explode( "!~", data:GetMessageBoard_Line7_8() )[ 2 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 3, 4 )
			net.WriteString( self:GetValue() .. "!~" .. line8_data )
		net.SendToServer()
	end
	
	local Label8 = vgui.Create( "DLabel", Frame )
	Label8:SetPos( 360, 160 )
	Label8:SetText( "Line 8:" )
	local Line8 = vgui.Create( "DTextEntry", Frame )
	Line8:SetPos( 395, 160 )
	Line8:SetSize( 280, 20 )
	Line8:SetTextColor( TextBoxTextColor ) 
	Line8:SetText( string.Explode( "!~", data:GetMessageBoard_Line7_8() )[ 2 ] )
	Line8.OnEnter = function( self )
		if string.len( self:GetValue() ) > 13 then return notification.AddLegacy( "Max Character Limit is 13", NOTIFY_ERROR, 8 ) end
		local line7_data = string.Explode( "!~", data:GetMessageBoard_Line7_8() )[ 1 ]
		net.Start( "VENOM_MessageBoard_EditData" )
			net.WriteEntity( data )
			net.WriteInt( 3, 4 )
			net.WriteString( line7_data .. "!~" .. self:GetValue() )
		net.SendToServer()
	end

	local ActiveScreenText = vgui.Create( "DLabel", Frame )
	ActiveScreenText:SetPos( 360, 12 )
	ActiveScreenText:SetSize( 120, 20 )
	ActiveScreenText:SetText( "Power:" )

	local ActiveScreenCheckbox = vgui.Create( "DCheckBox", Frame )
	ActiveScreenCheckbox:SetPos( 395, 14 )
	if data:GetMessageBoard_Active() then ActiveScreenCheckbox:SetValue( 1 ) else ActiveScreenCheckbox:SetValue( 0 ) end
	function ActiveScreenCheckbox:OnChange()
		if data:GetMessageBoard_Active() then 
			net.Start( "VENOM_MessageBoard_EditData" )
				net.WriteEntity( data )
				net.WriteInt( 4, 4 )
				net.WriteString( "false" )
			net.SendToServer()
		else 
			net.Start( "VENOM_MessageBoard_EditData" )
				net.WriteEntity( data )
				net.WriteInt( 4, 4 )
				net.WriteString( "true" )
			net.SendToServer()
		end
		ActiveScreenCheckbox:InvalidateLayout( true )
		return
	end

	local SecondScreenText = vgui.Create( "DLabel", Frame )
	SecondScreenText:SetPos( 430, 12 )
	SecondScreenText:SetSize( 120, 20 )
	SecondScreenText:SetText( "Activate Second Screen:" )

	local SecondScreenActivateCheckbox = vgui.Create( "DCheckBox", Frame )
	SecondScreenActivateCheckbox:SetPos( 550, 14 )
	if data:GetMessageBoard_SecondScreen() then SecondScreenActivateCheckbox:SetValue( 1 ) else SecondScreenActivateCheckbox:SetValue( 0 ) end
	function SecondScreenActivateCheckbox:OnChange()
		if data:GetMessageBoard_SecondScreen() then 
			net.Start( "VENOM_MessageBoard_EditData" )
				net.WriteEntity( data )
				net.WriteInt( 5, 4 )
				net.WriteString( "false" )
			net.SendToServer()
		else 
			net.Start( "VENOM_MessageBoard_EditData" )
				net.WriteEntity( data )
				net.WriteInt( 5, 4 )
				net.WriteString( "true" )
			net.SendToServer()
		end
		SecondScreenActivateCheckbox:InvalidateLayout( true )
		return
	end
end
net.Receive( "VENOM_MessageBoard_EditTrigger", function()
    MessageBoard_DataEditor( net.ReadEntity() )
end )

local draw = draw
local surface = surface

local BackgroundText = "▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦"
local BackgroundTextColor = Color( 220, 220, 220, 6 )
local ForegroundTextColor = Color( 250, 255, 0, 255 )

function ENT:Draw()
	self:DrawModel()

    local DrawPosition = self:LocalToWorld( Vector( -11, 0, 0 ) )

    local DrawAngles = self:GetAngles()
    DrawAngles:RotateAroundAxis( self:GetAngles():Forward(), 90 )
    DrawAngles:RotateAroundAxis( self:GetAngles():Up(), 90 )

    local CurrentScreen = self:GetMessageBoard_CurrentScreen()

    cam.Start3D2D( DrawPosition, DrawAngles, 0.4 )
		surface.SetDrawColor( 0, 0, 0, 255 )
		surface.DrawRect( -114, -294, 228, 148 )

        for i = 1, 13 do
            draw.DrawText( BackgroundText, "MessageBoard_BackgroundFont", 0, -171 - ( 11 * ( i - 1 ) ), BackgroundTextColor, TEXT_ALIGN_CENTER )
		end

		if self:GetMessageBoard_Active() then
			if tonumber( CurrentScreen ) == 1 then
				draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line1_2() )[ 1 ], "MessageBoard_Font", 0, -295.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
    			draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line1_2() )[ 2 ], "MessageBoard_Font", 0, -259.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
    			draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line3_4() )[ 1 ], "MessageBoard_Font", 0, -223.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
				draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line3_4() )[ 2 ], "MessageBoard_Font", 0, -187.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
			else
				draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line5_6() )[ 1 ], "MessageBoard_Font", 0, -295.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
    			draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line5_6() )[ 2 ], "MessageBoard_Font", 0, -259.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
    			draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line7_8() )[ 1 ], "MessageBoard_Font", 0, -223.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
				draw.DrawText( string.Explode( "!~", self:GetMessageBoard_Line7_8() )[ 2 ], "MessageBoard_Font", 0, -187.99, ForegroundTextColor, TEXT_ALIGN_CENTER )
			end
		end
	cam.End3D2D()
end
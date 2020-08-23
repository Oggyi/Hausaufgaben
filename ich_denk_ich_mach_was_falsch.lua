hook.Add("PlayerSpawn", "Spawn", function(ply)
    timer.Simple(0.1, function()
        PrintMessage(HUD_PRINTCENTER, "[+] " .. ply:Nick() .. " Ist gerade neu gespawnt")

        ply:StripWeapons()
        ply:ChangeTeam( "TEAM_NEUTRAL", true )
        ply:SetModel models/player/corpse1.mdl
        ply:Freeze(true)
        ply:PrintMessage( HUD_PRINTTALK, "Welchen Team möchtest du beitreten den Blauen oder den Roten? Du wirst dich nicht bewegen können bis du dich entschieden hast. Team Blau = !blue Team Rot = !red"
         return ""
    end)
end)


local lila = {
	[TEAM_BLUE] = true,
	[TEAM_RED] = true
}

local Waffen = {
	weapon_357, weapon_ar2, weapon_crossbow, weapon_shotgun = true,
}

	if lila[ply:Team()] then
		if not Waffen[wep:GetClass()] then
			return false
		end
	end
end )

local function CreateSomeTimers( )
timer.Create( "timerfürhelp", 150, 0, function() PrintMessage( HUD_PRINTTALK, "Wenn du dein Team ändern möchtest mach !Blue oder !Red") end )

--Networking
--Model hinzufügen
--Spawnpoint hinzufügen
--Blue und Red erstellen

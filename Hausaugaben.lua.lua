local polizei = { "models/player/clannypolice/male_02.mdl", "models/player/clannypolice/male_04.mdl", "models/player/clannypolice/male_05.mdl", "models/player/clannypolice/male_06.mdl", "models/player/clannypolice/male_07.mdl", "models/player/clannypolice/male_08.mdl", "models/player/clannypolice/male_09.mdl" }
local zivi = { "models/player/group03/female_04.mdl", "models/player/group03/female_01.mdl", "models/player/group03/male_04.mdl", "models/player/group03m/male_02.mdl" }
local dieb = {"qcmodels/player/phoenix.mdl", "models/player/t_arctic.mdl", "models/player/t_guerilla.mdl", "models/player/t_leet.mdl"}

hook.Add("PlayerSpawn", "Spawn", function(ply)
    timer.Simple(0.1, function()
        PrintMessage(HUD_PRINTCENTER, "[+] " .. ply:Nick() .. " Ist gerade neu gespawnt")

        ply:StripWeapons()
        ply:Say("/job Bürger")
        ply:SetModel( table.Random( zivi ) )
        ply:Give("weapon_fists")
        ply:Give("weapon_physcannon")
        ply:Give("keys")
        ply:Give("pocket")
        ply:Give("gmod_camera")
         return ""
    end)
end)

hook.Add("PlayerSay", "Polizist", function(ply, text, team)
        if string.StartWith(text, "!Polizist") then
            ply:ChatPrint(ply:Nick() .. " Wurde zum Polizisten!")
            ply:Say("/job Polizist")
            ply:StripWeapons()
            ply:SetModel( table.Random( polizei ) )
            ply:Give("arccw_bw_mp5")
            ply:GiveAmmo(300, "item_ammo_ar2_large", true)
            ply:Give("arccw_bw_glock")
            ply:GiveAmmo(100, "item_ammo_pistol", true)
            ply:Give("guigui_handcuffs")
            ply:Give("weapon_fists")
            ply:Give("weapon_physcannon")
            ply:Give("keys")
            ply:Give("pocket")
            ply:Give("gmod_camera")
            return ""
    end
        end)


hook.Add("PlayerSay", "Dieb", function(ply, text, team)
        if string.StartWith(text, "!Dieb") then
            ply:ChatPrint(ply:Nick() .. " Wurde zum Dieb!")
            ply:Say("/job Dieb")
            ply:StripWeapons()
            ply:SetModel( table.Random( dieb ) )
            ply:Give("arccw_mac11")
            ply:GiveAmmo(300, "item_ammo_ar2", true)
            ply:Give("arccw_fml_fas_g20")
            ply:GiveAmmo(100, "item_ammo_pistol", true)
            ply:Give("lockpick")
            ply:Give("guigui_handcuffs_lockpick")
            ply:Give("arccw_melee_knife")
            ply:Give("weapon_physcannon")
            ply:Give("keys")
            ply:Give("pocket")
            ply:Give("gmod_camera")
            return ""
                end
            end)

hook.Add( "PlayerDeath", "GlobalDeathMessage", function( victim, inflictor, attacker )
    if ( victim == attacker ) then

        PrintMessage( HUD_PRINTTALK, victim:Name() .. " was killed by " .. attacker:Name() .. ".")
end
    end)

hook.Add("PlayerSay", "help", function(ply, text, team)
        if string.StartWith(text, "!help") then
       ply:PrintMessage( HUD_PRINTTALK, "!Polizist !Dieb")
        return ""
      end
    end)


local function PrintSomething( text )
print( text )
end

local function CreateSomeTimers( )
timer.Create( "timerfürhelp", 300, 0, function() PrintMessage( HUD_PRINTTALK, "Wenn du nicht weißt, wie du in einen Job kommst, probiere einfach mal !help aus!") end )

end
hook.Add( "Initialize", "Timer Example", CreateSomeTimers )

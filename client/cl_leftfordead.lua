
net.Receive("SpielerChangeTeam", function()
    local spielerteam = net.ReadInt(8)
    local teamname = team.GetName(spielerteam)
    chat.AddText("Du bist nun im Team " .. teamname)
end)
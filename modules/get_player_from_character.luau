-- Made by stinkyghost587

local Players = game:GetService("Players")

local part = script.Parent

local function GetPlayerFromCharacter(Character)
    local Player
    
    for i, v in Players:GetPlayers() do
        if v.Name == Character.Name then
            Player = v
            break
        end
    end
    
    return Player
end

return GetPlayerFromCharacter

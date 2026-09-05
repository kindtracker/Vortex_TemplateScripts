-- Add this script in any part you wanna be a killbrick
-- Made by kindtracker

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local part = script.Parent

part.Touched:Connect(function(hit)
    local character = hit.Parent
    if character ~= player.Character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:TakeDamage(100)
    end
end)

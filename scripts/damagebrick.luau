-- Add this localscript in any part you wanna be a damagebrick
-- You can change debounce_timer and damage variables
-- Made by kindtracker

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local part = script.Parent

local debounce = false
local debounce_timer = 0.2
local damage = 5

part.Touched:Connect(function(hit)
    if debounce then return end
    local character = hit.Parent
    if character ~= player.Character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        debounce = true
        humanoid:TakeDamage(damage)
        task.wait(debounce_timer)
        debounce = false
    end
end)

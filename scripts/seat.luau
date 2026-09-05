-- Add this script in any part you wanna be a seat
-- Made by kindtracker

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local part = script.Parent
local sitting = false
local cooldown = false
local character

part.Touched:Connect(function(hit)
    if cooldown then return end
    if hit.Parent ~= player.Character then return end

    character = player.Character
    sitting = true
end)

while task.wait(0.01) do
    if sitting and character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Jumping then
            sitting = false
            cooldown = true
            task.wait(1)
            cooldown = false
        elseif hrp then
            hrp.CFrame = part.CFrame
        end
    end
end

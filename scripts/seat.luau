-- Add this script in any part you wanna be a seat
-- Made by kindtracker

local Players = game:GetService("Players")
local UserInput = game:GetService("UserInputService")

local player = Players.LocalPlayer
local parent = script.Parent
local sitting = false
local cooldown = false
local character

parent.Touched:Connect(function(hit)
    if cooldown then return end
    if hit.Parent ~= player.Character then return end

    character = player.Character
    sitting = true
end)

UserInput.InputBegan:Connect(function(inputObject)
    if not sitting then return end
    if inputObject.KeyCode ~= Enum.KeyCode.Space then return end

    sitting = false
    cooldown = true
    task.wait(1)
    cooldown = false
end)

while task.wait(0.01) do
    if sitting and character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = parent.CFrame
        end
    end
end

-- Add this localscript in any part you wanna be a seat
-- Made by kindtracker

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local part = script.Parent
local sitting = false
local cooldown = false
local character

part.Touched:Connect(function(hit)
    print("part.Touched function")
    print(cooldown)
    if cooldown then return end
    print(hit.Parent.Name)
    print(player.Character)
    if hit.Parent ~= player.Character then return end

    character = player.Character
    sitting = true
    print(sitting)
end)

while task.wait(0.01) do
    print("while function")
    print(sitting)
    print(character)
    if sitting and character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        print("sitting and character function")
        print(hrp)
        print(humanoid)

        print(humanoid:GetState())
        print(Enum.HumanoidStateType.Jumping)
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

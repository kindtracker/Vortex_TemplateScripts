-- Add this localscript in StarterPlayerScripts
--[[
How do I make a checkpoint:
Create a part in Workspace or any folder that's in Workspace,
then rename the part to "Checkpoint".
]]
-- Made by kindtracker

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local checkpoint = nil

local function tree(folder)
    for _, part in pairs(folder:GetChildren()) do
        if part.Name == "Checkpoint" and part:IsA("BasePart") then
            part.Touched:Connect(function(hit)
                local character = hit.Parent
                if character ~= player.Character then
                    return
                end

                checkpoint = part
            end)
        end
        tree(part)
    end
end

tree(Workspace)

player.CharacterAdded:Connect(function(character)
    if checkpoint then
        local hrp = character:WaitForChild("HumanoidRootPart")
        hrp.CFrame = checkpoint.CFrame + Vector3.new(0, 3, 0)
    end
end)

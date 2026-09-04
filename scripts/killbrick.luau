-- Add this script in StarterPlayerScripts
--[[
How do I make killbricks:
Create a part in Workspace or any folder that's in Workspace,
then rename the part to "KillBrick".
]]
-- Made by kindtracker

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local function tree(folder)
    for _, part in pairs(folder:GetChildren()) do
        if part.Name == "KillBrick" and part:IsA("BasePart") then
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
        end
        tree(part)
    end
end

tree(Workspace)

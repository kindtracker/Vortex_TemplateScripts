-- Add this script in StarterPlayerScripts
--[[
How do I make DamageBricks:
Create a part in Workspace or any folder that's in Workspace,
then rename the part to "DamageBrick:{REPLACE THIS WITH DAMAGE}".

You can change debounce_timer variable
]]
-- Made by kindtracker

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local debounce = false
local debounce_timer = 0.5

local function tree(folder)
    for _, part in pairs(folder:GetChildren()) do
        if part:IsA("BasePart") then
            local name = part.Name
            if string.sub(name, 1, 11) == "DamageBrick" then
                local damage = tonumber(string.sub(name, 13))
                if damage then
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
                end
            end
        end
        tree(part)
    end
end

tree(Workspace)

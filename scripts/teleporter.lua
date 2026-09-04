-- Add this script in StarterPlayerScripts (You can rename the script)
--[[
How do I make Teleporter:
Create teleporters in Workspace. You need to change
"teleporter_part1", "teleporter_part2", and "direction" variables.

You can change debounce_timer variable
]]
-- Made by kindtracker

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local teleporter_part1 = "@Workspace/Teleporter1"
local teleporter_part2 = "@Workspace/Teleporter2"
local direction = "+"
local debounce_timer = 0.5

--[[
Direction:
> Only allows players to teleport from teleporter 1 to teleporter 2
< Only allows players to teleport from teleporter 2 to teleporter 1
+ Allows players to teleport from any teleporter to the other teleporter
--]]

local function get_part(path)
    local current = game

    for name in string.gmatch(path, "[^/@]+") do
        current = current:FindFirstChild(name)

        if not current then
            error("Could not find: " .. path)
        end
    end

    return current
end

local part1 = get_part(teleporter_part1)
local part2 = get_part(teleporter_part2)
local debounce = {}

local function teleport(hit, destination)
    local character = hit.Parent
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not root or debounce[character] then
        return
    end

    debounce[character] = true
    root.CFrame = destination.CFrame + Vector3.new(0, 3, 0)
    task.wait(debounce_timer)
    debounce[character] = nil
end

if direction == ">" or direction == "+" then
    part1.Touched:Connect(function(hit)
        teleport(hit, part2)
    end)
end

if direction == "<" or direction == "+" then
    part2.Touched:Connect(function(hit)
        teleport(hit, part1)
    end)
end

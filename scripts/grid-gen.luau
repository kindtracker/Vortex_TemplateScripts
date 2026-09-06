--[[
HOW TO USE THIS SCRIPT:
put this code in a script in Workspace
]]
-- made by alrasid

local terrain = workspace
local rows = 10
local columns = 10
local tileSize = 3 --side of each part 
local grid = {}
for x = 0, rows do
    grid[x] = {} --you can change the for loop x and z levels to determine their x and z coordinates, respectively
    for z = 0, columns do      
        local part = Instance.new("Part")
        grid[x][z] = part
        local height = 3
        part.Size = Vector3.new(tileSize, height, tileSize)
        part.Position = Vector3.new(x * tileSize, height/2, z * tileSize) -- add anything you want to height/2 ex: height/2 + 5 if you want to raise y level
        part.Anchored = true
        part.Parent = workspace
        part.Color = Color3.fromRGB(math.random(1, 255), math.random(1, 255), math.random(1, 255)) -- random colors (you can change this)
    end
end


for x = 1, rows do
    for z = 1, columns do
        print(grid[x][z].Position.Z) -- heres how you can get parts of the grid, in this example i printed every parts Z value
    end
end

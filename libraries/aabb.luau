-- Put this anywhere
--[[
AABB is exposed on attributions. (name is "AABB")
]]
-- Made by mtcluna05

---@class AABB
---@field MinX number
---@field MinY number
---@field MinZ number
---@field MaxX number
---@field MaxY number
---@field MaxZ number
local AABB = {}
AABB.__index = AABB

---@return AABB
function AABB.new(minX, minY, minZ, maxX, maxY, maxZ)
    return setmetatable({
        MinX = minX,
        MinY = minY,
        MinZ = minZ,
        MaxX = maxX,
        MaxY = maxY,
        MaxZ = maxZ,
    }, AABB)
end

---@param part Part
---@return AABB
function AABB.fromPart(part)
    local center = part.Position
    local size = part.Size

    return AABB.new(
        center.X - size.X / 2,
        center.Y - size.Y / 2,
        center.Z - size.Z / 2,
        center.X + size.X / 2,
        center.Y + size.Y / 2,
        center.Z + size.Z / 2
    )
end

---@param aabb AABB
---@return boolean
function AABB:Intersects(aabb)
    return (self.MinX <= aabb.MaxX and self.MaxX >= aabb.MinX) and
        (self.MinY <= aabb.MaxY and self.MaxY >= aabb.MinY) and
        (self.MinZ <= aabb.MaxZ and self.MaxZ >= aabb.MinZ)
end

---@param part Part
---@return boolean
function AABB:OverlapsHorizontally(part)
    local halfWidth = part.Size.X / 2
    local halfDepth = part.Size.Z / 2

    return self.MinX <= part.Position.X + halfWidth
        and self.MaxX >= part.Position.X - halfWidth
        and self.MinZ <= part.Position.Z + halfDepth
        and self.MaxZ >= part.Position.Z - halfDepth
end

script:SetAttribute("AABB", AABB)

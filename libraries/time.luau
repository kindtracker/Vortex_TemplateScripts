-- Put this anywhere
--[[
How to get time:
You need to initialize the time library.
Get the "time" attribute from the script. Time is in seconds.
]]
-- Made by kindtracker

task.spawn(function()
    local time = 0
    while task.wait(0.01) do
        script:SetAttribute("time", time)
        time = time + 0.01
    end
end)

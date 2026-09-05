local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character
--replace with the name of your button part

local button = workspace.YOUR_BUTTON_NAME
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--replace with the name of your RemoteEvent in your ServerScriptService
local ButtonActivated = ReplicatedStorage:FindFirstChild("YOUR_REMOTEVENT_NAME")


local maxDistance = 10

UserInputService.InputBegan:Connect(function(input, gameProcessed)

--you can change the button from "E"

    if input.KeyCode == Enum.KeyCode.E then
      

        local difference = character.Position - button.Position
        local distance = difference.Magnitude

      

        if distance <= maxDistance then
            print("it worked.")
            ButtonActivated:FireServer()
        else
            print("you are far.")
        end
    end
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sirius",
   LoadingTitle = "Sirius Menu",
   LoadingSubtitle = "Загрузка...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Sirius",
      FileName = "Config"
   },
   KeySystem = false
})

-- ────────────────────────────────────────────────────────────────
-- Вкладка ESP (основная, как ты просил первой)
-- ────────────────────────────────────────────────────────────────
local ESPTab = Window:CreateTab("ESP")

ESPTab:CreateSection("Основные настройки ESP")

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
         
while wait(0.5) do
    for i, box in ipairs(workspace:GetDescendants()) do
        if box:FindFirstChild("Humanoid") then
            if not box:FindFirstChild("EspBox") then
                if box ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",box)
                    esp.Adornee = box
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(5, 6, 2)
                    esp.Transparency = 0.5 --Changes Transparency 
                    esp.Color3 = Color3.fromRGB(0,255,0) --Color change
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
while wait(0.5) do
    for i, box in ipairs(workspace:GetDescendants()) do
        if box:FindFirstChild("Humanoid") then
            if not box:FindFirstChild("EspBox") then
                if box ~= game.Players.LocalPlayer.Character then
                    local esp = Instance.new("BoxHandleAdornment",box)
                    esp.Adornee = box
                    esp.ZIndex = 0
                    esp.Size = Vector3.new(5, 6, 2)
                    esp.Transparency = 0.5 --Changes Transparency 
                    esp.Color3 = Color3.fromRGB(0,255,0) --Color change
                    esp.AlwaysOnTop = true
                    esp.Name = "EspBox"
                end
            end
        end
    end
end
            
   end,
})

ESPTab:CreateToggle({
   Name = "Box esp",
   CurrentValue = true,
   Flag = "BoxESP"
})

ESPTab:CreateToggle({
   Name = "name esp",
   CurrentValue = true,
   Flag = "NameESP"
})

ESPTab:CreateToggle({
   Name = "Tracer esp",
   CurrentValue = false,
   Flag = "TracerESP"
})

ESPTab:CreateToggle({
   Name = "heal esp",
   CurrentValue = false,
   Flag = "HealthESP"
})

-- ────────────────────────────────────────────────────────────────
-- Вкладка Игрок
-- ────────────────────────────────────────────────────────────────
local PlayerTab = Window:CreateTab("Игрок")

PlayerTab:CreateSection("speed")

PlayerTab:CreateSlider({
   Name = "speed",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed"
})

PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Flag = "JumpPower"
})

PlayerTab:CreateToggle({
   Name = "InfiniteJump",
   CurrentValue = false,
   Flag = "InfiniteJump"
})

PlayerTab:CreateToggle({
   Name = "NoClip",
   CurrentValue = false,
   Flag = "NoClip"
})

PlayerTab:CreateSection("Дополнительно")

PlayerTab:CreateButton({
   Name = "Сбросить скорость/прыжок",
   Callback = function() end
})

-- ────────────────────────────────────────────────────────────────
-- Уведомление о загрузке
-- ────────────────────────────────────────────────────────────────
Rayfield:Notify({
   Title = "Sirius загружен",
   Content = "Меню открыто — начинай с вкладки ESP",
   Duration = 5,
   Image = 4483362458
})

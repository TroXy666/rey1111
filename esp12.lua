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

ESPTab:CreateToggle({
   Name = "turn ESP",
   CurrentValue = false,
   Flag = "ESP_Enabled"
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

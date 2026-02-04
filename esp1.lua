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
   Name = "Включить ESP",
   CurrentValue = false,
   Flag = "ESP_Enabled"
})

ESPTab:CreateToggle({
   Name = "Проверка команды (только враги)",
   CurrentValue = true,
   Flag = "TeamCheck"
})

ESPTab:CreateToggle({
   Name = "Коробка (Box)",
   CurrentValue = true,
   Flag = "BoxESP"
})

ESPTab:CreateToggle({
   Name = "Имя + дистанция",
   CurrentValue = true,
   Flag = "NameESP"
})

ESPTab:CreateToggle({
   Name = "Трейсер (Tracer)",
   CurrentValue = false,
   Flag = "TracerESP"
})

ESPTab:CreateToggle({
   Name = "Здоровье",
   CurrentValue = false,
   Flag = "HealthESP"
})

ESPTab:CreateSection("Визуальные настройки")

ESPTab:CreateColorPicker({
   Name = "Цвет коробки",
   Color = Color3.fromRGB(255, 0, 85),
   Flag = "BoxColor"
})

ESPTab:CreateColorPicker({
   Name = "Цвет имени",
   Color = Color3.fromRGB(255, 255, 255),
   Flag = "NameColor"
})

ESPTab:CreateColorPicker({
   Name = "Цвет трейсера",
   Color = Color3.fromRGB(255, 100, 100),
   Flag = "TracerColor"
})

ESPTab:CreateSlider({
   Name = "Толщина линий",
   Range = {1, 5},
   Increment = 0.5,
   CurrentValue = 1.5,
   Flag = "LineThickness"
})

ESPTab:CreateSlider({
   Name = "Прозрачность",
   Range = {0.1, 1},
   Increment = 0.05,
   CurrentValue = 0.9,
   Flag = "ESPTransparency"
})

-- ────────────────────────────────────────────────────────────────
-- Вкладка Игрок
-- ────────────────────────────────────────────────────────────────
local PlayerTab = Window:CreateTab("Игрок")

PlayerTab:CreateSection("Движение")

PlayerTab:CreateSlider({
   Name = "Скорость ходьбы",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed"
})

PlayerTab:CreateSlider({
   Name = "Сила прыжка",
   Range = {50, 300},
   Increment = 1,
   CurrentValue = 50,
   Flag = "JumpPower"
})

PlayerTab:CreateToggle({
   Name = "Бесконечный прыжок",
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
-- Вкладка Прочее / Утилиты
-- ────────────────────────────────────────────────────────────────
local MiscTab = Window:CreateTab("Прочее")

MiscTab:CreateSection("Оптимизация")

MiscTab:CreateToggle({
   Name = "Максимальный FPS Boost",
   CurrentValue = false,
   Flag = "FPSBoost"
})

MiscTab:CreateToggle({
   Name = "Убрать туман",
   CurrentValue = false,
   Flag = "NoFog"
})

MiscTab:CreateSection("Телепорт / Сервер")

MiscTab:CreateButton({
   Name = "Переподключиться к серверу",
   Callback = function() end
})

MiscTab:CreateButton({
   Name = "Выйти в лобби",
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

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sirius",
   LoadingTitle = "Подождите...",
   LoadingSubtitle = "Загрузка меню",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Sirius",
      FileName = "DefaultConfig"
   },
   KeySystem = false
})

-- ESP Variables
local ESP = {}
local BoxEnabled = false
local NameEnabled = false
local TracerEnabled = false
local TeamCheckEnabled = false
local BoxColor = Color3.fromRGB(255, 0, 0)
local NameColor = Color3.fromRGB(255, 255, 255)
local TracerColor = Color3.fromRGB(255, 0, 0)
local Transparency = 1
local Thickness = 2

-- Player Mods Variables
local Speed = 16
local JumpPower = 50
local InfiniteJumpEnabled = false

-- Misc
local FPSBoostEnabled = false

-- Player Mods Functions
local function ApplyWalkSpeed()
   local char = LocalPlayer.Character
   if char and char:FindFirstChild("Humanoid") then
      char.Humanoid.WalkSpeed = Speed
   end
end

local function ApplyJumpPower()
   local char = LocalPlayer.Character
   if char and char:FindFirstChild("Humanoid") then
      char.Humanoid.JumpPower = JumpPower
   end
end

-- UI Creation
local ESPTab = Window:CreateTab("ESP")
ESPTab:CreateSection("ESP для игроков")

local PlayerTab = Window:CreateTab("Игрок")
PlayerTab:CreateSection("Характеристики движения")

local SpeedSlider = PlayerTab:CreateSlider({
   Name = "Скорость ходьбы",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Flag = "WalkSpeed",
   Callback = function(Value)
      Speed = Value
      ApplyWalkSpeed()
   end
})

local JumpSlider = PlayerTab:CreateSlider({
   Name = "Сила прыжка",
   Range = {50, 200},
   Increment = 1,
   CurrentValue = 50,
   Flag = "JumpPower",
   Callback = function(Value)
      JumpPower = Value
      ApplyJumpPower()
   end
})

local InfJumpToggle = PlayerTab:CreateToggle({
   Name = "Бесконечный прыжок",
   CurrentValue = false,
   Flag = "InfiniteJump",
   Callback = function(Value)
      InfiniteJumpEnabled = Value
   end
})

local MiscTab = Window:CreateTab("Прочее")
MiscTab:CreateSection("Разное")

local FPSBoostToggle = MiscTab:CreateToggle({
   Name = "Бустер FPS",
   CurrentValue = false,
   Flag = "FPSBoost",
   Callback = function(Value)
      FPSBoostEnabled = Value
      if Value then
         settings().Rendering.QualityLevel = "Level01"
         for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("SunRaysEffect") then
               v.Enabled = false
            end
         end
         Lighting.GlobalShadows = false
         Lighting.FogEnd = math.huge
         Lighting.Brightness = 2
      end
   end
})

MiscTab:CreateButton({
   Name = "Переподключиться к серверу",
   Callback = function()
      TeleportService:Teleport(game.PlaceId, LocalPlayer)
   end
})

-- Load Flags and Init
BoxEnabled = Rayfield.Flags.BoxESP or false
NameEnabled = Rayfield.Flags.NameESP or false
TracerEnabled = Rayfield.Flags.TracerESP or false
TeamCheckEnabled = Rayfield.Flags.TeamCheck or false
BoxColor = Rayfield.Flags.BoxColor or Color3.fromRGB(255, 0, 0)
NameColor = Rayfield.Flags.NameColor or Color3.fromRGB(255, 255, 255)
TracerColor = Rayfield.Flags.TracerColor or Color3.fromRGB(255, 0, 0)
Transparency = Rayfield.Flags.Transparency or 1
Thickness = Rayfield.Flags.Thickness or 2
Speed = Rayfield.Flags.WalkSpeed or 16
JumpPower = Rayfield.Flags.JumpPower or 50
InfiniteJumpEnabled = Rayfield.Flags.InfiniteJump or false
FPSBoostEnabled = Rayfield.Flags.FPSBoost or false

-- Apply initial
ApplyWalkSpeed()
ApplyJumpPower()
if FPSBoostEnabled then
   settings().Rendering.QualityLevel = "Level01"
   for _, v in pairs(Lighting:GetChildren()) do
      if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("SunRaysEffect") then
         v.Enabled = false
      end
   end
   Lighting.GlobalShadows = false
   Lighting.FogEnd = math.huge
   Lighting.Brightness = 2
end

-- ESP Init
for _, player in ipairs(Players:GetPlayers()) do
   if player ~= LocalPlayer then
      CreateESP(player)
   end
end
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)
RunService.Heartbeat:Connect(UpdateESP)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
   if InfiniteJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
      LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
   end
end)

-- Auto apply on respawn
LocalPlayer.CharacterAdded:Connect(function()
   task.wait(0.1)
   ApplyWalkSpeed()
   ApplyJumpPower()
end)

Rayfield:Notify({
   Title = "Sirius Menu",
   Content = "Меню загружено! Первый таб — ESP.",
   Duration = 4,
   Image = 4483362458
})

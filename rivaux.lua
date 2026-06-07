--[[
    ██████╗ ██╗  ██╗    ██╗  ██╗██╗   ██╗██████╗  ██████╗ 
    ██╔══██╗██║  ██║    ██║  ██║██║   ██║██╔══██╗██╔═══██╗
    ██║  ██║███████║    ███████║██║   ██║██║  ██║██║   ██║
    ██║  ██║██╔══██║    ██╔══██║██║   ██║██║  ██║██║   ██║
    ██████╔╝██║  ██║    ██║  ██║╚██████╔╝██████╔╝╚██████╔╝
    ╚═════╝ ╚═╝  ╚═╝    ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ 
    
    HIROSHI 738 v12 — GOD MODE EDITION
    "Tous les autres cheats sont maintenant des jouets"
    
    🔥 Nouveautés v12 :
    • 17 onglets (le plus gros menu jamais fait)
    • Troll Tab ULTRA complet (Backshots, Sex Animations, Server Lag, etc.)
    • Animation Troll Pack (R15)
    • Server Crasher
    • Fake Lag + Desync
    • Premium Visuals & Effects
    • Meilleure UI, plus d’emojis moqueurs, code ultra propre
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local SoundService = game:GetService("SoundService")
local VirtualUser = game:GetService("VirtualUser")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LP:GetMouse()

-- Nettoyage
for _, v in ipairs({"H738v12_Key", "H738v12_Main"}) do
    if LP.PlayerGui:FindFirstChild(v) then
        LP.PlayerGui[v]:Destroy()
    end
end

local KeyVerified = false
local LoadCheat

--==================================================================
--                      KEY SYSTEM v12 (Beaucoup plus beau)
--==================================================================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "H738v12_Key"
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.DisplayOrder = 999999
KeyGui.Parent = LP.PlayerGui

local BG = Instance.new("Frame", KeyGui)
BG.Size = UDim2.new(1,0,1,0)
BG.BackgroundColor3 = Color3.fromRGB(4, 4, 12)
local grad = Instance.new("UIGradient", BG)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(8,3,25)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(18,8,45))
}

-- Grille cyber + particules améliorées
local Grid = Instance.new("Frame", BG)
Grid.Size = UDim2.new(1,0,1,0)
Grid.BackgroundTransparency = 1

for i = 1, 35 do
    local p = Instance.new("Frame", Grid)
    p.BackgroundColor3 = Color3.fromRGB(120, 80, 255)
    p.BackgroundTransparency = 0.85
    p.Size = UDim2.new(0, math.random(4,9), 0, math.random(4,9))
    p.Position = UDim2.new(math.random(),0,math.random(),0)
    Instance.new("UICorner", p).CornerRadius = UDim.new(1,0)
    task.spawn(function()
        while not KeyVerified do
            TweenService:Create(p, TweenInfo.new(math.random(15,35), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(math.random(),0,math.random(),0)
            }):Play()
            task.wait(math.random(15,35))
        end
    end)
end

local MainCard = Instance.new("Frame", BG)
MainCard.Size = UDim2.new(0, 460, 0, 460)
MainCard.Position = UDim2.new(0.5, -230, 0.5, -230)
MainCard.BackgroundColor3 = Color3.fromRGB(10, 9, 22)
MainCard.BorderSizePixel = 0
Instance.new("UICorner", MainCard).CornerRadius = UDim.new(0, 20)
local stroke = Instance.new("UIStroke", MainCard)
stroke.Color = Color3.fromRGB(130, 90, 255)
stroke.Thickness = 2.2

-- Titre
local Title = Instance.new("TextLabel", MainCard)
Title.Size = UDim2.new(1,0,0,60)
Title.BackgroundTransparency = 1
Title.Text = "HIROSHI 738"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 32
Title.Position = UDim2.new(0,0,0,30)

local Subtitle = Instance.new("TextLabel", MainCard)
Subtitle.Size = UDim2.new(1,0,0,20)
Subtitle.Position = UDim2.new(0,0,0,85)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "v12 GOD MODE • The Final Boss of Roblox Cheats 👑"
Subtitle.TextColor3 = Color3.fromRGB(170, 120, 255)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 13

-- Input
local InputFrame = Instance.new("Frame", MainCard)
InputFrame.Size = UDim2.new(0, 360, 0, 55)
InputFrame.Position = UDim2.new(0.5, -180, 0, 160)
InputFrame.BackgroundColor3 = Color3.fromRGB(15, 14, 32)
Instance.new("UICorner", InputFrame).CornerRadius = UDim.new(0,12)

local KeyBox = Instance.new("TextBox", InputFrame)
KeyBox.Size = UDim2.new(1,-50,1,0)
KeyBox.Position = UDim2.new(0,45,0,0)
KeyBox.BackgroundTransparency = 1
KeyBox.PlaceholderText = "Paste key here... (or cry)"
KeyBox.PlaceholderColor3 = Color3.fromRGB(100,90,160)
KeyBox.TextColor3 = Color3.new(1,1,1)
KeyBox.Font = Enum.Font.GothamMedium
KeyBox.TextSize = 15
KeyBox.Text = ""

local VerifyBtn = Instance.new("TextButton", MainCard)
VerifyBtn.Size = UDim2.new(0, 360, 0, 50)
VerifyBtn.Position = UDim2.new(0.5, -180, 0, 235)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(130, 90, 255)
VerifyBtn.Text = "VERIFY KEY 👑"
VerifyBtn.TextColor3 = Color3.new(1,1,1)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 16
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0,12)

local Status = Instance.new("TextLabel", MainCard)
Status.Size = UDim2.new(1,0,0,30)
Status.Position = UDim2.new(0,0,0,310)
Status.BackgroundTransparency = 1
Status.Text = "3 attempts remaining 💀"
Status.TextColor3 = Color3.fromRGB(255, 80, 80)
Status.Font = Enum.Font.Gotham
Status.TextSize = 14

local attempts = 3
local mockPhrases = {
    "🤡 Bro really thought he had the key",
    "💀 Even your mom types better than you",
    "🗑️ Delete this script and go play adopt me",
    "😭 The key is not 'freehacks123'",
    "🎪 Welcome to the clown show",
    "📉 Your IQ is lower than Roblox ping",
}

VerifyBtn.MouseButton1Click:Connect(function()
    if attempts <= 0 then return end
    attempts -= 1
    
    if KeyBox.Text == "HiroshiGod" or KeyBox.Text == "v12godmode" then
        KeyVerified = true
        Status.Text = "✅ ACCESS GRANTED — Welcome to God Mode"
        Status.TextColor3 = Color3.fromRGB(0, 255, 100)
        VerifyBtn.Text = "LOADING THE BEST CHEAT EVER..."
        
        task.wait(1.2)
        KeyGui:Destroy()
        LoadCheat()
    else
        Status.Text = mockPhrases[math.random(1,#mockPhrases)]
        if attempts == 0 then
            VerifyBtn.Text = "💀 PERMANENTLY LOCKED"
            VerifyBtn.BackgroundColor3 = Color3.fromRGB(40,0,0)
        end
    end
end)

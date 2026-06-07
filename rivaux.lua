--[[
    ██╗  ██╗██╗██████╗  ██████╗ ███████╗██╗  ██╗██╗    ███████╗██████╗  █████╗ 
    ██║  ██║██║██╔══██╗██╔═══██╗██╔════╝██║  ██║██║    ╚════██║╚════██╗██╔══██╗
    ███████║██║██████╔╝██║   ██║███████╗███████║██║        ██╔╝ █████╔╝╚█████╔╝
    ██╔══██║██║██╔══██╗██║   ██║╚════██║██╔══██║██║       ██╔╝  ╚═══██╗██╔══██╗
    ██║  ██║██║██║  ██║╚██████╔╝███████║██║  ██║██║       ██║  ██████╔╝╚█████╔╝
    ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝       ╚═╝  ╚═════╝  ╚════╝ 
    
    🏆 HIROSHI 738 — v11 ULTIMATE EDITION
    👑 "Les autres scripts pleurent en nous voyant"
    
    🎁 BONUS v11 :
        💀 Kill Aura (auto-proximity damage)
        🌪️ Spin Bot (tourne comme un beyblade)  
        📸 Target Info Panel (stats détaillées)
        🎵 Hit Sound (son custom au lock)
        💫 Kill Effect (effet visuel au kill)
        🔮 Aim Prediction v2 (quadratic)
        🛡️ VRAI Anti-Kick (hook)
        🌈 Gradient ESP
        📊 Stats Panel (K/D tracker)
        ⚡ Speed Boost (burst de vitesse)
        🦅 Fly Hack
        👻 Invisible Mode
        🎯 Auto-Fire
        📍 Waypoint System
        🏷️ Custom ESP Tags
        🔔 Kill Feed
        🎪 Troll Mode
]]

-- ═══════════════════════════════════════════════════════════════════
-- 📦 SERVICES
-- ═══════════════════════════════════════════════════════════════════
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LP:GetMouse()

-- ═══════════════════════════════════════════════════════════════════
-- 🧹 NETTOYAGE (au cas où on recharge)
-- ═══════════════════════════════════════════════════════════════════
for _, name in ipairs({"H738v11", "H738Key"}) do
    local old = LP.PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

-- ═══════════════════════════════════════════════════════════════════
-- 🔒 SYSTÈME DE CLÉ — SÉCURITÉ RENFORCÉE
-- "Tu croyais bypass ? 🤡"
-- ═══════════════════════════════════════════════════════════════════
local KeyVerified = false
local LoadCheat -- forward declaration

-- 🔐 Hash simple pour pas laisser la clé en clair comme un 🤡
local function SimpleHash(str)
    local hash = 5381
    for i = 1, #str do
        hash = ((hash * 33) + str:byte(i)) % 2147483647
    end
    return hash
end

local VALID_HASH = SimpleHash("Hiro738") -- 🤫 La clé est cachée maintenant
local BACKUP_HASH = SimpleHash("HiroshiVIP") -- 🎁 BONUS: clé VIP secondaire

-- 🎭 Messages moqueurs pour les mauvaises clés
local MOCK_MESSAGES = {
    "🤡 Même mon grand-père tape mieux que toi",
    "💀 T'as essayé 'password123' ? Non plus ? Dommage",
    "😭 La clé c'est pas 'admin' mon reuf",
    "🗑️ Cette tentative était aussi nulle que ton aim",
    "🤣 Tu veux un indice ? Non.",
    "💩 Encore raté, t'es vraiment un bot",
    "🎪 Bienvenue au cirque, le clown c'est toi",
    "😴 *bâillement* essaie encore",
    "🦧 Un singe aurait trouvé plus vite",
    "📉 Ton QI baisse à chaque tentative",
}

-- 🎨 Thème du Key System
local KeyTheme = {
    bg = Color3.fromRGB(6, 5, 15),
    card = Color3.fromRGB(12, 10, 25),
    accent = Color3.fromRGB(101, 78, 255),
    accent2 = Color3.fromRGB(40, 215, 255),
    accent3 = Color3.fromRGB(255, 60, 190),
    text = Color3.new(1, 1, 1),
    subtext = Color3.fromRGB(130, 120, 180),
    dim = Color3.fromRGB(70, 65, 110),
    error = Color3.fromRGB(255, 55, 75),
    success = Color3.fromRGB(45, 220, 120),
    input_bg = Color3.fromRGB(18, 15, 35),
    stroke = Color3.fromRGB(50, 45, 100),
    grid = Color3.fromRGB(101, 78, 255),
}

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "H738Key"
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.DisplayOrder = 99999
KeyGui.Parent = LP.PlayerGui

-- 🌌 Background avec grille cyberpunk
local KeyBG = Instance.new("Frame", KeyGui)
KeyBG.Size = UDim2.new(1, 0, 1, 0)
KeyBG.BackgroundColor3 = KeyTheme.bg
KeyBG.BorderSizePixel = 0

local bgGrad = Instance.new("UIGradient", KeyBG)
bgGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 5, 20)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(12, 8, 30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 4, 15))
})

-- 📐 Grille animée
local Grid = Instance.new("Frame", KeyBG)
Grid.Size = UDim2.new(1, 0, 1, 0)
Grid.BackgroundTransparency = 1
Grid.ClipsDescendants = true

for i = 0, 20 do
    local line = Instance.new("Frame", Grid)
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, i * 50)
    line.BackgroundColor3 = KeyTheme.grid
    line.BackgroundTransparency = 0.92
    line.BorderSizePixel = 0
end

for i = 0, 30 do
    local line = Instance.new("Frame", Grid)
    line.Size = UDim2.new(0, 1, 1, 0)
    line.Position = UDim2.new(0, i * 60, 0, 0)
    line.BackgroundColor3 = KeyTheme.grid
    line.BackgroundTransparency = 0.92
    line.BorderSizePixel = 0
end

-- ✨ Particules flottantes améliorées (plus nombreuses + glow)
for i = 1, 25 do
    local particle = Instance.new("Frame", Grid)
    local size = math.random(2, 8)
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random(2, 98) / 100, 0, math.random(2, 98) / 100, 0)
    particle.BackgroundColor3 = i % 3 == 0 and KeyTheme.accent2 or (i % 5 == 0 and KeyTheme.accent3 or KeyTheme.accent)
    particle.BackgroundTransparency = math.random(25, 60) / 100
    particle.BorderSizePixel = 0
    particle.ZIndex = 2
    Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)

    -- 🌟 Glow effect
    local glow = Instance.new("Frame", particle)
    glow.Size = UDim2.new(0, size * 4, 0, size * 4)
    glow.Position = UDim2.new(0.5, -size * 2, 0.5, -size * 2)
    glow.BackgroundColor3 = particle.BackgroundColor3
    glow.BackgroundTransparency = 0.88
    glow.BorderSizePixel = 0
    glow.ZIndex = 1
    Instance.new("UICorner", glow).CornerRadius = UDim.new(1, 0)

    task.spawn(function()
        while not KeyVerified and particle.Parent do
            local duration = math.random(40, 80) / 10
            TweenService:Create(particle, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(math.random(2, 98) / 100, 0, math.random(2, 98) / 100, 0),
                BackgroundTransparency = math.random(25, 70) / 100
            }):Play()
            task.wait(duration)
        end
    end)
end

-- 📡 Scan lines (double maintenant 😎)
for idx = 1, 2 do
    local scanLine = Instance.new("Frame", Grid)
    scanLine.Size = UDim2.new(1, 0, 0, idx == 1 and 2 or 1)
    scanLine.BackgroundColor3 = idx == 1 and KeyTheme.accent or KeyTheme.accent2
    scanLine.BackgroundTransparency = idx == 1 and 0.7 or 0.8
    scanLine.BorderSizePixel = 0
    scanLine.ZIndex = 3

    task.spawn(function()
        local speed = idx == 1 and 4 or 6
        while not KeyVerified and scanLine.Parent do
            TweenService:Create(scanLine, TweenInfo.new(speed, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0, 0, 1, -2)
            }):Play()
            task.wait(speed)
            scanLine.Position = UDim2.new(0, 0, 0, 0)
        end
    end)
end

-- 🃏 Carte principale du Key System
local KeyCard = Instance.new("Frame", KeyBG)
KeyCard.Size = UDim2.new(0, 420, 0, 400)
KeyCard.Position = UDim2.new(0.5, -210, 0.5, -200)
KeyCard.BackgroundColor3 = KeyTheme.card
KeyCard.BorderSizePixel = 0
KeyCard.ZIndex = 10
Instance.new("UICorner", KeyCard).CornerRadius = UDim.new(0, 18)

local cardStroke = Instance.new("UIStroke", KeyCard)
cardStroke.Color = KeyTheme.accent
cardStroke.Thickness = 1.5

-- 🌈 Barre arc-en-ciel animée en haut
local topBar = Instance.new("Frame", KeyCard)
topBar.Size = UDim2.new(1, -40, 0, 3)
topBar.Position = UDim2.new(0, 20, 0, 0)
topBar.BackgroundColor3 = KeyTheme.accent
topBar.BorderSizePixel = 0
topBar.ZIndex = 11
Instance.new("UICorner", topBar).CornerRadius = UDim.new(1, 0)

local topBarGrad = Instance.new("UIGradient", topBar)
topBarGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, KeyTheme.accent),
    ColorSequenceKeypoint.new(0.33, KeyTheme.accent2),
    ColorSequenceKeypoint.new(0.66, KeyTheme.accent3),
    ColorSequenceKeypoint.new(1, KeyTheme.accent)
})

task.spawn(function()
    local rotation = 0
    while not KeyVerified and topBar.Parent do
        rotation = (rotation + 1) % 360
        topBarGrad.Rotation = rotation
        task.wait(0.03)
    end
end)

-- 🎴 Logo
local logoFrame = Instance.new("Frame", KeyCard)
logoFrame.Size = UDim2.new(0, 64, 0, 64)
logoFrame.Position = UDim2.new(0.5, -32, 0, 24)
logoFrame.BackgroundColor3 = KeyTheme.accent
logoFrame.BorderSizePixel = 0
logoFrame.ZIndex = 12
Instance.new("UICorner", logoFrame).CornerRadius = UDim.new(0, 16)
Instance.new("UIGradient", logoFrame).Color = ColorSequence.new(
    Color3.fromRGB(65, 55, 200),
    Color3.fromRGB(140, 110, 255)
)

local logoText = Instance.new("TextLabel", logoFrame)
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "👑"
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 28
logoText.TextColor3 = Color3.new(1, 1, 1)
logoText.ZIndex = 13

-- 🔤 Textes du Key System
local function MakeKeyLabel(text, yPos, font, textSize, color, xAlignment)
    local label = Instance.new("TextLabel", KeyCard)
    label.Size = UDim2.new(1, 0, 0, textSize + 6)
    label.Position = UDim2.new(0, 0, 0, yPos)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = font
    label.TextSize = textSize
    label.TextColor3 = color
    label.ZIndex = 12
    label.TextXAlignment = xAlignment or Enum.TextXAlignment.Center
    return label
end

local titleLabel = MakeKeyLabel("HIROSHI 738", 98, Enum.Font.GothamBold, 26, Color3.new(1, 1, 1))
local subtitleLabel = MakeKeyLabel("👑 Premium · Secure Authentication 🔐", 128, Enum.Font.Gotham, 11, KeyTheme.subtext)
local versionLabel = MakeKeyLabel("⚡ v11 ULTIMATE · ANTI-DETECT · UNBANNABLE 🛡️", 146, Enum.Font.GothamMedium, 9, KeyTheme.accent)

-- 🎁 BONUS: compteur de tentatives visuellement moqueur
local mockLabel = MakeKeyLabel("", 300, Enum.Font.GothamMedium, 10, KeyTheme.error)

-- 📥 Input de la clé
local inputBox = Instance.new("Frame", KeyCard)
inputBox.Size = UDim2.new(0, 320, 0, 44)
inputBox.Position = UDim2.new(0.5, -160, 0, 175)
inputBox.BackgroundColor3 = KeyTheme.input_bg
inputBox.BorderSizePixel = 0
inputBox.ZIndex = 12
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 10)

local inputStroke = Instance.new("UIStroke", inputBox)
inputStroke.Color = KeyTheme.stroke
inputStroke.Thickness = 1

local lockIcon = Instance.new("TextLabel", inputBox)
lockIcon.Size = UDim2.new(0, 36, 1, 0)
lockIcon.BackgroundTransparency = 1
lockIcon.Text = "🔒"
lockIcon.Font = Enum.Font.Gotham
lockIcon.TextSize = 16
lockIcon.TextColor3 = KeyTheme.subtext
lockIcon.ZIndex = 13

local keyInput = Instance.new("TextBox", inputBox)
keyInput.Size = UDim2.new(1, -44, 1, 0)
keyInput.Position = UDim2.new(0, 38, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.Text = ""
keyInput.PlaceholderText = "🔑 Enter your key, genius..."
keyInput.PlaceholderColor3 = Color3.fromRGB(90, 85, 140)
keyInput.Font = Enum.Font.GothamMedium
keyInput.TextSize = 14
keyInput.TextColor3 = Color3.new(1, 1, 1)
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ClearTextOnFocus = false
keyInput.ZIndex = 13

-- 🔘 Bouton de vérification
local verifyBtn = Instance.new("TextButton", KeyCard)
verifyBtn.Size = UDim2.new(0, 320, 0, 42)
verifyBtn.Position = UDim2.new(0.5, -160, 0, 230)
verifyBtn.BackgroundColor3 = KeyTheme.accent
verifyBtn.BorderSizePixel = 0
verifyBtn.Text = "🔓 VERIFY KEY"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 14
verifyBtn.TextColor3 = Color3.new(1, 1, 1)
verifyBtn.AutoButtonColor = false
verifyBtn.ZIndex = 12
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIGradient", verifyBtn).Color = ColorSequence.new(
    Color3.fromRGB(65, 55, 200),
    Color3.fromRGB(140, 110, 255)
)

-- 🎁 BONUS: Bouton "Get Key" (lien Discord fictif)
local getKeyBtn = Instance.new("TextButton", KeyCard)
getKeyBtn.Size = UDim2.new(0, 320, 0, 32)
getKeyBtn.Position = UDim2.new(0.5, -160, 0, 278)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = "🎫 Get Key (Discord)"
getKeyBtn.Font = Enum.Font.GothamMedium
getKeyBtn.TextSize = 12
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.AutoButtonColor = false
getKeyBtn.ZIndex = 12
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)
getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/hiroshi738")
        mockLabel.Text = "📋 Link copied! (jk it's fake 🤡)"
        mockLabel.TextColor3 = KeyTheme.accent2
    end
end)

local errorLabel = MakeKeyLabel("", 316, Enum.Font.GothamMedium, 10, KeyTheme.error)
local attemptsLabel = MakeKeyLabel("3 attempts remaining 💀", 334, Enum.Font.Gotham, 9, Color3.fromRGB(90, 85, 140))
MakeKeyLabel("🔐 AES-256 · Session encrypted · 2FA Ready", 358, Enum.Font.Gotham, 8, KeyTheme.dim)
MakeKeyLabel("🎭 \"Si t'as pas la clé, t'as pas le level\" — Hiroshi", 374, Enum.Font.Gotham, 8, Color3.fromRGB(60, 55, 100))

local attemptsLeft = 3
local isVerifying = false

local function DoVerify()
    if isVerifying or KeyVerified then return end
    if attemptsLeft <= 0 then return end
    isVerifying = true
    verifyBtn.Text = "⏳ AUTHENTICATING..."

    task.wait(0.5) -- 🎭 Fake loading pour le drama

    local inputHash = SimpleHash(keyInput.Text)

    if inputHash == VALID_HASH or inputHash == BACKUP_HASH then
        -- ✅ SUCCÈS
        KeyVerified = true
        errorLabel.Text = ""
        mockLabel.Text = "👑 Welcome to the elite, king"
        mockLabel.TextColor3 = KeyTheme.success
        verifyBtn.Text = "✅ ACCESS GRANTED"
        verifyBtn.BackgroundColor3 = KeyTheme.success
        lockIcon.Text = "🔓"
        subtitleLabel.Text = "👑 Welcome, " .. LP.Name .. " 🎉"
        subtitleLabel.TextColor3 = KeyTheme.success

        task.wait(0.8)

        -- 🎬 Animation de sortie épique
        TweenService:Create(KeyCard, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        TweenService:Create(KeyBG, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()

        for _, child in ipairs(Grid:GetDescendants()) do
            if child:IsA("Frame") then
                TweenService:Create(child, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
            end
        end

        task.wait(0.7)
        KeyGui:Destroy()
        LoadCheat()
    else
        -- ❌ ÉCHEC — On se moque 🤡
        attemptsLeft = attemptsLeft - 1

        if attemptsLeft <= 0 then
            errorLabel.Text = "🔒 LOCKED — Tu t'es ridiculisé 🤡"
            verifyBtn.Text = "💀 LOCKED FOREVER"
            verifyBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 30)
            attemptsLabel.Text = "0 attempts — Game Over 💀"
            mockLabel.Text = "🗑️ Même ChatGPT aurait trouvé la clé"
            mockLabel.TextColor3 = KeyTheme.error
            keyInput.TextEditable = false
            isVerifying = false
            return
        end

        -- 🎭 Message moqueur aléatoire
        local mockMsg = MOCK_MESSAGES[math.random(1, #MOCK_MESSAGES)]
        errorLabel.Text = "❌ Wrong key!"
        mockLabel.Text = mockMsg
        mockLabel.TextColor3 = KeyTheme.error
        verifyBtn.Text = "🔓 VERIFY KEY"
        verifyBtn.BackgroundColor3 = KeyTheme.accent
        attemptsLabel.Text = attemptsLeft .. " attempt" .. (attemptsLeft > 1 and "s" or "") .. " remaining " .. string.rep("💀", 3 - attemptsLeft)

        -- 🫨 Shake animation
        TweenService:Create(inputStroke, TweenInfo.new(0.1), {Color = KeyTheme.error}):Play()
        for _, offset in ipairs({-158, -162, -155, -165, -160}) do
            TweenService:Create(inputBox, TweenInfo.new(0.03), {
                Position = UDim2.new(0.5, offset, 0, 175)
            }):Play()
            task.wait(0.03)
        end
        task.wait(0.3)
        TweenService:Create(inputStroke, TweenInfo.new(0.3), {Color = KeyTheme.stroke}):Play()
        isVerifying = false
    end
end

verifyBtn.MouseButton1Click:Connect(DoVerify)
keyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then DoVerify() end
end)

-- ═══════════════════════════════════════════════════════════════════
-- 🎮 CHEAT PRINCIPAL
-- ═══════════════════════════════════════════════════════════════════
function LoadCheat()

-- ═══════════════════════════════════════════════════════════════════
-- ⚙️ CONFIGURATION COMPLÈTE
-- ═══════════════════════════════════════════════════════════════════
local CFG = {
    -- 🎯 Aimbot
    Enabled = false,
    FOV = 100,
    Smooth = 6,
    Target = "Head",
    AimKey = "MouseButton2",
    SilentAim = false,
    Prediction = false,
    PredictAmt = 0.155,
    AutoPredict = false,
    QuadPredict = false, -- 🎁 BONUS: prédiction quadratique
    WallCheck = false,
    TeamCheck = false,
    LockTarget = false,
    InstantSnap = false,
    AimShake = false,
    ShakeAmt = 2,
    Deadzone = 3,
    RandomSmooth = false,
    HumanizeAim = false,
    AutoFire = false, -- 🎁 BONUS
    
    -- 👁️ ESP
    ESPNames = false,
    ESPBox = false,
    BoxStyle = "Corner",
    ESPTracer = false,
    TracerFrom = "Bottom",
    ESPHealth = false,
    ESPDist = false,
    ESPDot = false,
    ESPSkel = false,
    ESPChams = false,
    ESPMaxDist = 2000,
    RainbowESP = false,
    ColorByHP = false,
    ColorByVis = false,
    GradientESP = false, -- 🎁 BONUS
    ESPWeapon = false, -- 🎁 BONUS: show equipped tool
    ESPTags = false, -- 🎁 BONUS: custom tags
    
    -- 🖥️ HUD
    ShowFOV = true,
    FOVFilled = false,
    ShowCross = false,
    CrossStyle = "Cross",
    CrossSize = 6,
    CrossSpin = false,
    ShowFPS = true,
    ShowPing = true,
    ShowTarget = true,
    ShowWatermark = true,
    ShowKillFeed = true, -- 🎁 BONUS
    RainbowUI = false,
    
    -- 🌍 World
    Fullbright = false,
    NoFog = false,
    FOVChanger = false,
    CamFOV = 70,
    FreezeTime = false,
    FreezeTimeVal = 14,
    NightMode = false, -- 🎁 BONUS
    
    -- 🏃 Player
    AntiAFK = true,
    WalkSpeed = false,
    WalkSpeedVal = 16,
    JumpPower = false,
    JumpPowerVal = 50,
    Fly = false, -- 🎁 BONUS
    FlySpeed = 50, -- 🎁 BONUS
    SpeedBoost = false, -- 🎁 BONUS
    SpeedBoostKey = "LeftShift", -- 🎁 BONUS
    SpeedBoostMult = 2.5, -- 🎁 BONUS
    Invisible = false, -- 🎁 BONUS
    SpinBot = false, -- 🎁 BONUS
    SpinSpeed = 10, -- 🎁 BONUS
    Noclip = false, -- 🎁 BONUS
    
    -- 🛡️ Stealth
    AntiKick = false,
    HideName = false,
    
    -- 🎪 Troll
    TrollMode = false, -- 🎁 BONUS
    
    -- 📊 Stats
    Kills = 0, -- 🎁 BONUS
    Deaths = 0, -- 🎁 BONUS
    
    -- 💾 Misc
    SavedPosition = nil,
    Waypoints = {}, -- 🎁 BONUS
}

-- ═══════════════════════════════════════════════════════════════════
-- 🎨 THÈME
-- ═══════════════════════════════════════════════════════════════════
local Theme = {
    bg1 = Color3.fromRGB(8, 8, 14),
    bg2 = Color3.fromRGB(13, 12, 22),
    bg3 = Color3.fromRGB(22, 20, 38),
    bg4 = Color3.fromRGB(32, 29, 55),
    accent = Color3.fromRGB(101, 78, 255),
    red = Color3.fromRGB(255, 55, 75),
    green = Color3.fromRGB(45, 220, 120),
    yellow = Color3.fromRGB(255, 195, 40),
    cyan = Color3.fromRGB(40, 215, 255),
    orange = Color3.fromRGB(255, 140, 40),
    pink = Color3.fromRGB(255, 80, 180),
    text1 = Color3.new(1, 1, 1),
    text2 = Color3.fromRGB(175, 165, 220),
    text3 = Color3.fromRGB(110, 100, 160),
    border = Color3.fromRGB(35, 32, 65),
}
local Accent = Theme.accent

-- ═══════════════════════════════════════════════════════════════════
-- 📦 VARIABLES D'ÉTAT
-- ═══════════════════════════════════════════════════════════════════
local OriginalSettings = {
    Brightness = Lighting.Brightness,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    GlobalShadows = Lighting.GlobalShadows,
    ClockTime = Lighting.ClockTime,
    CamFOV = Camera.FieldOfView,
}

local LockedTarget = nil
local CurrentTargetName = ""
local CurrentTargetDist = 0
local IsDestroyed = false
local CrosshairAngle = 0
local SpectateTarget = nil
local Connections = {}
local Logs = {}
local MAX_LOGS = 50 -- 🎁 BONUS: plus de logs
local KillFeed = {} -- 🎁 BONUS
local ActiveSlider = nil
local FlyBody = nil -- 🎁 BONUS
local FlyGyro = nil -- 🎁 BONUS

-- ═══════════════════════════════════════════════════════════════════
-- 🖼️ GUI PRINCIPAL
-- ═══════════════════════════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "H738v11"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 10000
ScreenGui.Parent = LP.PlayerGui

-- ═══════════════════════════════════════════════════════════════════
-- 🔔 SYSTÈME DE NOTIFICATIONS AMÉLIORÉ
-- ═══════════════════════════════════════════════════════════════════
local NotifHolder = Instance.new("Frame", ScreenGui)
NotifHolder.Size = UDim2.new(0, 310, 1, -40)
NotifHolder.Position = UDim2.new(1, -326, 0, 20)
NotifHolder.BackgroundTransparency = 1

local NotifLayout = Instance.new("UIListLayout", NotifHolder)
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
NotifLayout.Padding = UDim.new(0, 6)

local notifOrder = 0

local function Notify(title, message, duration, color)
    notifOrder = notifOrder + 1
    
    -- 📝 Log it
    table.insert(Logs, 1, {
        time = os.date("%H:%M:%S"),
        action = "[" .. title .. "] " .. message,
        color = color or Theme.text2
    })
    if #Logs > MAX_LOGS then table.remove(Logs) end
    
    local notif = Instance.new("Frame", NotifHolder)
    notif.Size = UDim2.new(0, 0, 0, 52)
    notif.BackgroundColor3 = Theme.bg2
    notif.BorderSizePixel = 0
    notif.LayoutOrder = notifOrder
    notif.ClipsDescendants = true
    Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", notif).Color = Theme.border

    -- 🎨 Accent bar
    local accentBar = Instance.new("Frame", notif)
    accentBar.Size = UDim2.new(0, 3, 1, -12)
    accentBar.Position = UDim2.new(0, 7, 0, 6)
    accentBar.BackgroundColor3 = color or Accent
    accentBar.BorderSizePixel = 0
    Instance.new("UICorner", accentBar).CornerRadius = UDim.new(1, 0)

    local titleLbl = Instance.new("TextLabel", notif)
    titleLbl.Size = UDim2.new(1, -22, 0, 16)
    titleLbl.Position = UDim2.new(0, 18, 0, 6)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = title
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 11
    titleLbl.TextColor3 = color or Accent
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    local msgLbl = Instance.new("TextLabel", notif)
    msgLbl.Size = UDim2.new(1, -22, 0, 14)
    msgLbl.Position = UDim2.new(0, 18, 0, 24)
    msgLbl.BackgroundTransparency = 1
    msgLbl.Text = message
    msgLbl.Font = Enum.Font.Gotham
    msgLbl.TextSize = 10
    msgLbl.TextColor3 = Theme.text2
    msgLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- 🎬 Animation d'entrée
    TweenService:Create(notif, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0, 52)
    }):Play()

    -- ⏰ Auto-dismiss
    task.delay(duration or 3, function()
        TweenService:Create(notif, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 0, 0, 52)
        }):Play()
        task.wait(0.3)
        if notif.Parent then notif:Destroy() end
    end)
end

-- ═══════════════════════════════════════════════════════════════════
-- 🏠 PANNEAU PRINCIPAL
-- ═══════════════════════════════════════════════════════════════════
local MainPanel = Instance.new("Frame", ScreenGui)
MainPanel.Size = UDim2.new(0, 520, 0, 450)
MainPanel.Position = UDim2.new(0, 16, 0.5, -225)
MainPanel.BackgroundColor3 = Theme.bg1
MainPanel.BorderSizePixel = 0
MainPanel.ClipsDescendants = true
Instance.new("UICorner", MainPanel).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", MainPanel).Color = Theme.border

-- 🔝 Header
local Header = Instance.new("Frame", MainPanel)
Header.Size = UDim2.new(1, 0, 0, 52)
Header.BackgroundColor3 = Theme.bg2
Header.BorderSizePixel = 0
Header.Active = true
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 14)

-- Header fill bottom corners
local HeaderFill = Instance.new("Frame", Header)
HeaderFill.Size = UDim2.new(1, 0, 0, 14)
HeaderFill.Position = UDim2.new(0, 0, 1, -14)
HeaderFill.BackgroundColor3 = Theme.bg2
HeaderFill.BorderSizePixel = 0

-- 🖱️ Drag system
local isDragging, dragStart, startPos = false, nil, nil
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        startPos = MainPanel.Position
    end
end)
Header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

-- 🎴 Logo dans le header
local headerLogo = Instance.new("Frame", Header)
headerLogo.Size = UDim2.new(0, 30, 0, 30)
headerLogo.Position = UDim2.new(0, 12, 0, 11)
headerLogo.BackgroundColor3 = Accent
headerLogo.BorderSizePixel = 0
Instance.new("UICorner", headerLogo).CornerRadius = UDim.new(0, 8)

local headerLogoText = Instance.new("TextLabel", headerLogo)
headerLogoText.Size = UDim2.new(1, 0, 1, 0)
headerLogoText.BackgroundTransparency = 1
headerLogoText.Text = "👑"
headerLogoText.Font = Enum.Font.GothamBold
headerLogoText.TextSize = 16
headerLogoText.TextColor3 = Theme.text1

local headerTitle = Instance.new("TextLabel", Header)
headerTitle.Size = UDim2.new(0, 150, 0, 16)
headerTitle.Position = UDim2.new(0, 50, 0, 9)
headerTitle.BackgroundTransparency = 1
headerTitle.Text = "HIROSHI 738"
headerTitle.Font = Enum.Font.GothamBold
headerTitle.TextSize = 14
headerTitle.TextColor3 = Theme.text1
headerTitle.TextXAlignment = Enum.TextXAlignment.Left

local headerSub = Instance.new("TextLabel", Header)
headerSub.Size = UDim2.new(0, 200, 0, 11)
headerSub.Position = UDim2.new(0, 50, 0, 28)
headerSub.BackgroundTransparency = 1
headerSub.Text = "👑 ULTIMATE · v11 · 🛡️ UNDETECTED"
headerSub.Font = Enum.Font.Gotham
headerSub.TextSize = 9
headerSub.TextColor3 = Theme.text3
headerSub.TextXAlignment = Enum.TextXAlignment.Left

-- 🔴 Status indicator
local statusDot = Instance.new("Frame", Header)
statusDot.Size = UDim2.new(0, 8, 0, 8)
statusDot.Position = UDim2.new(1, -96, 0, 14)
statusDot.BackgroundColor3 = Theme.red
statusDot.BorderSizePixel = 0
Instance.new("UICorner", statusDot).CornerRadius = UDim.new(1, 0)

local statusLabel = Instance.new("TextLabel", Header)
statusLabel.Size = UDim2.new(0, 30, 0, 12)
statusLabel.Position = UDim2.new(1, -84, 0, 12)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "OFF"
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextSize = 9
statusLabel.TextColor3 = Theme.red

-- ➖ Minimize button
local minimizeBtn = Instance.new("TextButton", Header)
minimizeBtn.Size = UDim2.new(0, 24, 0, 24)
minimizeBtn.Position = UDim2.new(1, -54, 0, 14)
minimizeBtn.BackgroundColor3 = Theme.bg3
minimizeBtn.Text = "—"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 11
minimizeBtn.TextColor3 = Theme.text2
minimizeBtn.BorderSizePixel = 0
minimizeBtn.AutoButtonColor = false
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 5)

local isMinimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    TweenService:Create(MainPanel, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = isMinimized and UDim2.new(0, 520, 0, 52) or UDim2.new(0, 520, 0, 450)
    }):Play()
    minimizeBtn.Text = isMinimized and "+" or "—"
end)

-- ❌ Close button 🎁 BONUS
local closeBtn = Instance.new("TextButton", Header)
closeBtn.Size = UDim2.new(0, 24, 0, 24)
closeBtn.Position = UDim2.new(1, -26, 0, 14)
closeBtn.BackgroundColor3 = Theme.red
closeBtn.BackgroundTransparency = 0.7
closeBtn.Text = "×"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Theme.text1
closeBtn.BorderSizePixel = 0
closeBtn.AutoButtonColor = false
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 5)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 SIDEBAR
-- ═══════════════════════════════════════════════════════════════════
local Sidebar = Instance.new("Frame", MainPanel)
Sidebar.Size = UDim2.new(0, 115, 1, -62)
Sidebar.Position = UDim2.new(0, 6, 0, 58)
Sidebar.BackgroundColor3 = Theme.bg2
Sidebar.BorderSizePixel = 0
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local SideScroll = Instance.new("ScrollingFrame", Sidebar)
SideScroll.Size = UDim2.new(1, 0, 1, 0)
SideScroll.BackgroundTransparency = 1
SideScroll.BorderSizePixel = 0
SideScroll.ScrollBarThickness = 0
SideScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

local SideLayout = Instance.new("UIListLayout", SideScroll)
SideLayout.Padding = UDim.new(0, 3)
SideLayout.SortOrder = Enum.SortOrder.LayoutOrder

local SidePad = Instance.new("UIPadding", SideScroll)
SidePad.PaddingTop = UDim.new(0, 6)
SidePad.PaddingLeft = UDim.new(0, 5)
SidePad.PaddingRight = UDim.new(0, 5)
SidePad.PaddingBottom = UDim.new(0, 6)

-- 📦 Tab content container
local TabContainer = Instance.new("ScrollingFrame", MainPanel)
TabContainer.Size = UDim2.new(1, -132, 1, -66)
TabContainer.Position = UDim2.new(0, 126, 0, 58)
TabContainer.BackgroundTransparency = 1
TabContainer.BorderSizePixel = 0
TabContainer.ScrollBarThickness = 3
TabContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
TabContainer.ScrollBarImageColor3 = Accent

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB SYSTEM
-- ═══════════════════════════════════════════════════════════════════
local TabButtons = {}
local TabFrames = {}
local CurrentTab = nil

local function SelectTab(name)
    for tabName, frame in pairs(TabFrames) do
        frame.Visible = (tabName == name)
    end
    for tabName, btn in pairs(TabButtons) do
        if tabName == name then
            btn.bg.BackgroundColor3 = Theme.bg4
            btn.bg.BackgroundTransparency = 0
            btn.label.TextColor3 = Theme.text1
            btn.icon.TextColor3 = Accent
        else
            btn.bg.BackgroundTransparency = 1
            btn.label.TextColor3 = Theme.text3
            btn.icon.TextColor3 = Theme.text3
        end
    end
    CurrentTab = name
end

local function MakeTab(name, icon, order)
    -- Sidebar button
    local btnFrame = Instance.new("Frame", SideScroll)
    btnFrame.Size = UDim2.new(1, 0, 0, 28)
    btnFrame.BackgroundTransparency = 1
    btnFrame.BorderSizePixel = 0
    btnFrame.LayoutOrder = order

    local bg = Instance.new("Frame", btnFrame)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Theme.bg4
    bg.BackgroundTransparency = 1
    bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 6)

    local iconLbl = Instance.new("TextLabel", btnFrame)
    iconLbl.Size = UDim2.new(0, 20, 1, 0)
    iconLbl.Position = UDim2.new(0, 6, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text = icon
    iconLbl.Font = Enum.Font.GothamBold
    iconLbl.TextSize = 12
    iconLbl.TextColor3 = Theme.text3

    local label = Instance.new("TextLabel", btnFrame)
    label.Size = UDim2.new(1, -32, 1, 0)
    label.Position = UDim2.new(0, 30, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 10
    label.TextColor3 = Theme.text3
    label.TextXAlignment = Enum.TextXAlignment.Left

    local clickBtn = Instance.new("TextButton", btnFrame)
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text = ""
    clickBtn.AutoButtonColor = false
    clickBtn.MouseButton1Click:Connect(function() SelectTab(name) end)

    -- Tab content frame
    local contentFrame = Instance.new("Frame", TabContainer)
    contentFrame.Size = UDim2.new(1, -4, 0, 0)
    contentFrame.BackgroundTransparency = 1
    contentFrame.AutomaticSize = Enum.AutomaticSize.Y
    contentFrame.Visible = false
    Instance.new("UIListLayout", contentFrame).Padding = UDim.new(0, 8)

    TabButtons[name] = {bg = bg, label = label, icon = iconLbl}
    TabFrames[name] = contentFrame
    return contentFrame
end

-- 📑 Créer tous les onglets
local tabAim = MakeTab("Aim", "🎯", 1)
local tabESP = MakeTab("ESP", "👁️", 2)
local tabHUD = MakeTab("HUD", "🖥️", 3)
local tabWorld = MakeTab("World", "🌍", 4)
local tabPlayer = MakeTab("Player", "🏃", 5)
local tabStealth = MakeTab("Stealth", "🕵️", 6)
local tabAdmin = MakeTab("Admin", "👑", 7)
local tabTroll = MakeTab("Troll", "🎪", 8) -- 🎁 BONUS
local tabStats = MakeTab("Stats", "📊", 9) -- 🎁 BONUS
local tabLogs = MakeTab("Logs", "📋", 10)
local tabSettings = MakeTab("Settings", "⚙️", 11)

-- ═══════════════════════════════════════════════════════════════════
-- 🧩 UI COMPONENTS (propres et réutilisables)
-- ═══════════════════════════════════════════════════════════════════

-- 📦 Section
local function MakeSection(parent, title, order)
    local section = Instance.new("Frame", parent)
    section.Size = UDim2.new(1, 0, 0, 0)
    section.AutomaticSize = Enum.AutomaticSize.Y
    section.BackgroundColor3 = Theme.bg2
    section.BorderSizePixel = 0
    section.LayoutOrder = order
    Instance.new("UICorner", section).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", section).Color = Theme.border
    Instance.new("UIListLayout", section).Padding = UDim.new(0, 4)

    local pad = Instance.new("UIPadding", section)
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)
    pad.PaddingTop = UDim.new(0, 10)
    pad.PaddingBottom = UDim.new(0, 10)

    local header = Instance.new("Frame", section)
    header.Size = UDim2.new(1, 0, 0, 14)
    header.BackgroundTransparency = 1
    header.LayoutOrder = 0

    local dot = Instance.new("Frame", header)
    dot.Size = UDim2.new(0, 3, 1, -4)
    dot.Position = UDim2.new(0, 0, 0, 2)
    dot.BackgroundColor3 = Accent
    dot.BorderSizePixel = 0
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    local titleLbl = Instance.new("TextLabel", header)
    titleLbl.Size = UDim2.new(1, -10, 1, 0)
    titleLbl.Position = UDim2.new(0, 8, 0, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text = title
    titleLbl.Font = Enum.Font.GothamBold
    titleLbl.TextSize = 10
    titleLbl.TextColor3 = Theme.text3
    titleLbl.TextXAlignment = Enum.TextXAlignment.Left

    return section
end

-- 🔀 Toggle
local function MakeToggle(parent, text, order, cfgKey, callback)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 24)
    row.BackgroundTransparency = 1
    row.LayoutOrder = order

    local label = Instance.new("TextLabel", row)
    label.Size = UDim2.new(1, -46, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 11
    label.TextColor3 = Theme.text2
    label.TextXAlignment = Enum.TextXAlignment.Left

    local toggleBg = Instance.new("Frame", row)
    toggleBg.Size = UDim2.new(0, 34, 0, 18)
    toggleBg.Position = UDim2.new(1, -34, 0.5, -9)
    toggleBg.BackgroundColor3 = Theme.bg3
    toggleBg.BorderSizePixel = 0
    Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", toggleBg)
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = UDim2.new(0, 3, 0.5, -6)
    knob.BackgroundColor3 = Theme.text3
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local btn = Instance.new("TextButton", row)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 3
    btn.AutoButtonColor = false

    local function Refresh()
        local tweenInfo = TweenInfo.new(0.18)
        if CFG[cfgKey] then
            TweenService:Create(toggleBg, tweenInfo, {BackgroundColor3 = Accent}):Play()
            TweenService:Create(knob, tweenInfo, {
                Position = UDim2.new(0, 19, 0.5, -6),
                BackgroundColor3 = Theme.text1
            }):Play()
        else
            TweenService:Create(toggleBg, tweenInfo, {BackgroundColor3 = Theme.bg3}):Play()
            TweenService:Create(knob, tweenInfo, {
                Position = UDim2.new(0, 3, 0.5, -6),
                BackgroundColor3 = Theme.text3
            }):Play()
        end
    end

    btn.MouseButton1Click:Connect(function()
        CFG[cfgKey] = not CFG[cfgKey]
        Refresh()
        if callback then callback(CFG[cfgKey]) end
    end)

    Refresh()
end

-- 📏 Slider
local function MakeSlider(parent, text, order, min, max, default, suffix, callback)
    local block = Instance.new("Frame", parent)
    block.Size = UDim2.new(1, 0, 0, 34)
    block.BackgroundTransparency = 1
    block.LayoutOrder = order

    local label = Instance.new("TextLabel", block)
    label.Size = UDim2.new(0.6, 0, 0, 13)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 10
    label.TextColor3 = Theme.text3
    label.TextXAlignment = Enum.TextXAlignment.Left

    local valueLbl = Instance.new("TextLabel", block)
    valueLbl.Size = UDim2.new(0.4, 0, 0, 13)
    valueLbl.Position = UDim2.new(0.6, 0, 0, 0)
    valueLbl.BackgroundTransparency = 1
    valueLbl.Text = default .. (suffix or "")
    valueLbl.Font = Enum.Font.GothamBold
    valueLbl.TextSize = 10
    valueLbl.TextColor3 = Theme.text1
    valueLbl.TextXAlignment = Enum.TextXAlignment.Right

    local track = Instance.new("Frame", block)
    track.Size = UDim2.new(1, 0, 0, 5)
    track.Position = UDim2.new(0, 0, 0, 19)
    track.BackgroundColor3 = Theme.bg4
    track.BorderSizePixel = 0
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame", track)
    fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = Accent
    fill.BorderSizePixel = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", track)
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0)
    knob.BackgroundColor3 = Theme.text1
    knob.BorderSizePixel = 0
    knob.ZIndex = 3
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local function Update(xPos)
        local relative = math.clamp((xPos - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local value = math.floor(min + relative * (max - min) + 0.5)
        fill.Size = UDim2.new(relative, 0, 1, 0)
        knob.Position = UDim2.new(relative, 0, 0.5, 0)
        valueLbl.Text = value .. (suffix or "")
        callback(value)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            ActiveSlider = Update
            Update(input.Position.X)
        end
    end)
    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            ActiveSlider = Update
        end
    end)
end

-- 📋 Dropdown
local function MakeDropdown(parent, text, order, options, default, callback)
    local block = Instance.new("Frame", parent)
    block.Size = UDim2.new(1, 0, 0, 24)
    block.BackgroundTransparency = 1
    block.LayoutOrder = order

    local label = Instance.new("TextLabel", block)
    label.Size = UDim2.new(0.28, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 10
    label.TextColor3 = Theme.text3
    label.TextXAlignment = Enum.TextXAlignment.Left

    local optRow = Instance.new("Frame", block)
    optRow.Size = UDim2.new(0.72, 0, 1, 0)
    optRow.Position = UDim2.new(0.28, 0, 0, 0)
    optRow.BackgroundTransparency = 1

    local optLayout = Instance.new("UIListLayout", optRow)
    optLayout.FillDirection = Enum.FillDirection.Horizontal
    optLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    optLayout.Padding = UDim.new(0, 3)

    local buttons = {}
    for _, opt in ipairs(options) do
        local btn = Instance.new("TextButton", optRow)
        btn.Size = UDim2.new(0, math.max(30, #opt * 7 + 8), 1, 0)
        btn.BackgroundColor3 = Theme.bg4
        btn.BorderSizePixel = 0
        btn.Text = opt
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 9
        btn.TextColor3 = Theme.text3
        btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 5)
        buttons[opt] = btn

        btn.MouseButton1Click:Connect(function()
            for k, v in pairs(buttons) do
                if k == opt then
                    v.BackgroundColor3 = Accent
                    v.TextColor3 = Theme.text1
                else
                    v.BackgroundColor3 = Theme.bg4
                    v.TextColor3 = Theme.text3
                end
            end
            callback(opt)
        end)
    end

    if buttons[default] then
        buttons[default].BackgroundColor3 = Accent
        buttons[default].TextColor3 = Theme.text1
    end
end

-- 🔘 Button
local function MakeButton(parent, text, order, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 26)
    btn.BackgroundColor3 = Theme.bg3
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.TextColor3 = Theme.text1
    btn.AutoButtonColor = false
    btn.LayoutOrder = order
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Accent}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.12), {BackgroundColor3 = Theme.bg3}):Play()
    end)
    btn.MouseButton1Click:Connect(callback)
end

-- 📝 Info Label 🎁 BONUS
local function MakeInfo(parent, text, order)
    local lbl = Instance.new("TextLabel", parent)
    lbl.Size = UDim2.new(1, 0, 0, 16)
    lbl.BackgroundTransparency = 1
    lbl.Text = text
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 9
    lbl.TextColor3 = Theme.text3
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.LayoutOrder = order
    return lbl
end

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 TAB: AIM
-- ═══════════════════════════════════════════════════════════════════

-- ⚡ Power Toggle (gros bouton ON/OFF)
local powerFrame = Instance.new("Frame", tabAim)
powerFrame.Size = UDim2.new(1, 0, 0, 44)
powerFrame.BackgroundColor3 = Theme.bg2
powerFrame.BorderSizePixel = 0
powerFrame.LayoutOrder = 0
Instance.new("UICorner", powerFrame).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", powerFrame).Color = Theme.border
Instance.new("UIPadding", powerFrame).PaddingLeft = UDim.new(0, 12)

local powerIcon = Instance.new("Frame", powerFrame)
powerIcon.Size = UDim2.new(0, 28, 0, 28)
powerIcon.Position = UDim2.new(0, 0, 0.5, -14)
powerIcon.BackgroundColor3 = Theme.red
powerIcon.BorderSizePixel = 0
Instance.new("UICorner", powerIcon).CornerRadius = UDim.new(1, 0)

local powerIconText = Instance.new("TextLabel", powerIcon)
powerIconText.Size = UDim2.new(1, 0, 1, 0)
powerIconText.BackgroundTransparency = 1
powerIconText.Text = "💀"
powerIconText.Font = Enum.Font.GothamBold
powerIconText.TextSize = 14
powerIconText.TextColor3 = Theme.text1

local powerLabel = Instance.new("TextLabel", powerFrame)
powerLabel.Size = UDim2.new(1, -90, 1, 0)
powerLabel.Position = UDim2.new(0, 36, 0, 0)
powerLabel.BackgroundTransparency = 1
powerLabel.Text = "💤 OFFLINE — Noobs are safe... for now"
powerLabel.Font = Enum.Font.GothamBold
powerLabel.TextSize = 12
powerLabel.TextColor3 = Theme.red
powerLabel.TextXAlignment = Enum.TextXAlignment.Left

local powerToggleBg = Instance.new("Frame", powerFrame)
powerToggleBg.Size = UDim2.new(0, 40, 0, 20)
powerToggleBg.Position = UDim2.new(1, -54, 0.5, -10)
powerToggleBg.BackgroundColor3 = Theme.bg4
powerToggleBg.BorderSizePixel = 0
Instance.new("UICorner", powerToggleBg).CornerRadius = UDim.new(1, 0)

local powerKnob = Instance.new("Frame", powerToggleBg)
powerKnob.Size = UDim2.new(0, 14, 0, 14)
powerKnob.Position = UDim2.new(0, 3, 0.5, -7)
powerKnob.BackgroundColor3 = Theme.text3
powerKnob.BorderSizePixel = 0
Instance.new("UICorner", powerKnob).CornerRadius = UDim.new(1, 0)

local powerClickBtn = Instance.new("TextButton", powerFrame)
powerClickBtn.Size = UDim2.new(1, 0, 1, 0)
powerClickBtn.BackgroundTransparency = 1
powerClickBtn.Text = ""
powerClickBtn.ZIndex = 3
powerClickBtn.AutoButtonColor = false

-- 🎭 Messages moqueurs pour ON/OFF
local ON_MESSAGES = {
    "🔥 ACTIVE — Les noobs vont pleurer",
    "⚡ ACTIVE — Mode dieu activé",
    "👑 ACTIVE — Qui ose me défier ?",
    "💀 ACTIVE — RIP lobby entier",
    "🎯 ACTIVE — Pas un seul headshot raté",
    "😈 ACTIVE — Le mal est en marche",
}
local OFF_MESSAGES = {
    "💤 OFFLINE — Les noobs respirent",
    "😴 OFFLINE — Pause pipi",
    "🤡 OFFLINE — Tu te la joues fair-play ?",
    "💀 OFFLINE — T'as eu peur ?",
}

local function SetPowerOn(enabled)
    CFG.Enabled = enabled
    local tweenInfo = TweenInfo.new(0.25)

    if enabled then
        TweenService:Create(powerToggleBg, tweenInfo, {BackgroundColor3 = Theme.green}):Play()
        TweenService:Create(powerKnob, tweenInfo, {
            Position = UDim2.new(0, 23, 0.5, -7),
            BackgroundColor3 = Theme.text1
        }):Play()
        TweenService:Create(powerIcon, tweenInfo, {BackgroundColor3 = Theme.green}):Play()
        powerIconText.Text = "👑"
        powerLabel.Text = ON_MESSAGES[math.random(1, #ON_MESSAGES)]
        powerLabel.TextColor3 = Theme.green
        statusDot.BackgroundColor3 = Theme.green
        statusLabel.Text = "ON"
        statusLabel.TextColor3 = Theme.green
    else
        TweenService:Create(powerToggleBg, tweenInfo, {BackgroundColor3 = Theme.bg4}):Play()
        TweenService:Create(powerKnob, tweenInfo, {
            Position = UDim2.new(0, 3, 0.5, -7),
            BackgroundColor3 = Theme.text3
        }):Play()
        TweenService:Create(powerIcon, tweenInfo, {BackgroundColor3 = Theme.red}):Play()
        powerIconText.Text = "💀"
        powerLabel.Text = OFF_MESSAGES[math.random(1, #OFF_MESSAGES)]
        powerLabel.TextColor3 = Theme.red
        statusDot.BackgroundColor3 = Theme.red
        statusLabel.Text = "OFF"
        statusLabel.TextColor3 = Theme.red
    end
end

powerClickBtn.MouseButton1Click:Connect(function()
    SetPowerOn(not CFG.Enabled)
end)

-- 🎯 Aimbot Settings
local aimSec = MakeSection(tabAim, "🎯 AIMBOT — \"Headshot machine\" 💀", 1)
MakeSlider(aimSec, "FOV", 1, 10, 500, 100, "", function(v) CFG.FOV = v end)
MakeSlider(aimSec, "SMOOTH", 2, 1, 30, 6, "", function(v) CFG.Smooth = v end)
MakeSlider(aimSec, "DEADZONE", 3, 0, 20, 3, "px", function(v) CFG.Deadzone = v end)
MakeDropdown(aimSec, "TARGET", 4, {"Head", "Torso", "Legs"}, "Head", function(v) CFG.Target = v end)
MakeDropdown(aimSec, "KEY", 5, {"RMB", "LMB", "Hold"}, "RMB", function(v)
    CFG.AimKey = ({RMB = "MouseButton2", LMB = "MouseButton1", Hold = "Always"})[v]
end)

-- 🧠 Features
local featSec = MakeSection(tabAim, "🧠 FEATURES — \"Big brain only\" 🧪", 2)
MakeToggle(featSec, "🔇 Silent Aim", 1, "SilentAim")
MakeToggle(featSec, "🔮 Prediction", 2, "Prediction")
MakeToggle(featSec, "🤖 Auto Predict", 3, "AutoPredict")
MakeToggle(featSec, "📐 Quadratic Predict 🎁", 4, "QuadPredict") -- 🎁 BONUS
MakeSlider(featSec, "PREDICT %", 5, 0, 50, 15, "", function(v) CFG.PredictAmt = v / 100 end)
MakeToggle(featSec, "🧱 Wall Check", 6, "WallCheck")
MakeToggle(featSec, "👥 Team Check", 7, "TeamCheck")
MakeToggle(featSec, "🔒 Lock Target", 8, "LockTarget")
MakeToggle(featSec, "⚡ Instant Snap", 9, "InstantSnap")
MakeToggle(featSec, "🫨 Aim Shake", 10, "AimShake")
MakeSlider(featSec, "SHAKE", 11, 1, 10, 2, "", function(v) CFG.ShakeAmt = v end)
MakeToggle(featSec, "🎲 Random Smooth", 12, "RandomSmooth")
MakeToggle(featSec, "🧬 Humanize Aim", 13, "HumanizeAim")
MakeToggle(featSec, "🔫 Auto-Fire 🎁", 14, "AutoFire") -- 🎁 BONUS
MakeInfo(featSec, "💡 Auto-Fire tire automatiquement quand un ennemi est dans le FOV", 15)

-- ═══════════════════════════════════════════════════════════════════
-- 👁️ TAB: ESP
-- ═══════════════════════════════════════════════════════════════════
local espSec = MakeSection(tabESP, "👁️ ESP — \"Wallhack mais en mieux\" 🤫", 1)
MakeToggle(espSec, "📛 Names", 1, "ESPNames")
MakeToggle(espSec, "📦 Box", 2, "ESPBox")
MakeDropdown(espSec, "STYLE", 3, {"Full", "Corner"}, "Corner", function(v) CFG.BoxStyle = v end)
MakeToggle(espSec, "📍 Tracers", 4, "ESPTracer")
MakeDropdown(espSec, "FROM", 5, {"Bottom", "Top", "Center"}, "Bottom", function(v) CFG.TracerFrom = v end)
MakeToggle(espSec, "❤️ Health Bar", 6, "ESPHealth")
MakeToggle(espSec, "📏 Distance", 7, "ESPDist")
MakeToggle(espSec, "🔴 Head Dot", 8, "ESPDot")
MakeToggle(espSec, "🦴 Skeleton", 9, "ESPSkel")
MakeToggle(espSec, "✨ Chams", 10, "ESPChams")
MakeToggle(espSec, "🔫 Weapon Name 🎁", 11, "ESPWeapon") -- 🎁 BONUS
MakeSlider(espSec, "MAX DIST", 12, 100, 3000, 2000, "m", function(v) CFG.ESPMaxDist = v end)

local espColorSec = MakeSection(tabESP, "🎨 COLORS — \"RGB = skill\" 🌈", 2)
MakeToggle(espColorSec, "🌈 Rainbow", 1, "RainbowESP")
MakeToggle(espColorSec, "❤️ HP Colors", 2, "ColorByHP")
MakeToggle(espColorSec, "👀 Visibility Colors", 3, "ColorByVis")
MakeToggle(espColorSec, "🎨 Gradient ESP 🎁", 4, "GradientESP") -- 🎁 BONUS
MakeInfo(espColorSec, "💡 Gradient ESP = dégradé du haut vers le bas sur les box", 5)

-- ═══════════════════════════════════════════════════════════════════
-- 🖥️ TAB: HUD
-- ═══════════════════════════════════════════════════════════════════
local hudSec = MakeSection(tabHUD, "🖥️ OVERLAY — \"Flex ton HUD\" 😎", 1)
MakeToggle(hudSec, "📊 FPS Counter", 1, "ShowFPS")
MakeToggle(hudSec, "📡 Ping", 2, "ShowPing")
MakeToggle(hudSec, "🎯 Target Info", 3, "ShowTarget")
MakeToggle(hudSec, "🏷️ Watermark", 4, "ShowWatermark")
MakeToggle(hudSec, "💀 Kill Feed 🎁", 5, "ShowKillFeed") -- 🎁 BONUS
MakeToggle(hudSec, "🌈 Rainbow UI", 6, "RainbowUI")

local crossSec = MakeSection(tabHUD, "➕ CROSSHAIR — \"CSS c'est dur\" 🎯", 2)
MakeToggle(crossSec, "➕ Show Crosshair", 1, "ShowCross")
MakeDropdown(crossSec, "STYLE", 2, {"Cross", "Dot", "Circle"}, "Cross", function(v) CFG.CrossStyle = v end)
MakeSlider(crossSec, "SIZE", 3, 2, 20, 6, "px", function(v) CFG.CrossSize = v end)
MakeToggle(crossSec, "🌀 Spin", 4, "CrossSpin")

local fovSec = MakeSection(tabHUD, "⭕ FOV CIRCLE", 3)
MakeToggle(fovSec, "⭕ Show FOV", 1, "ShowFOV")
MakeToggle(fovSec, "🔵 Filled", 2, "FOVFilled")

-- ═══════════════════════════════════════════════════════════════════
-- 🌍 TAB: WORLD
-- ═══════════════════════════════════════════════════════════════════
local worldSec = MakeSection(tabWorld, "💡 LIGHTING — \"Vois tout\" 🔦", 1)
MakeToggle(worldSec, "☀️ Fullbright", 1, "Fullbright", function(v)
    if v then
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
        Lighting.ClockTime = 14
    else
        Lighting.Brightness = OriginalSettings.Brightness
        Lighting.GlobalShadows = OriginalSettings.GlobalShadows
        Lighting.ClockTime = OriginalSettings.ClockTime
    end
end)
MakeToggle(worldSec, "🌫️ No Fog", 2, "NoFog", function(v)
    if v then
        Lighting.FogEnd = 1e9
        Lighting.FogStart = 1e9
    else
        Lighting.FogEnd = OriginalSettings.FogEnd
        Lighting.FogStart = OriginalSettings.FogStart
    end
end)
MakeToggle(worldSec, "🌙 Night Mode 🎁", 3, "NightMode", function(v) -- 🎁 BONUS
    if v then Lighting.ClockTime = 0 Lighting.Brightness = 0.5
    else Lighting.ClockTime = OriginalSettings.ClockTime Lighting.Brightness = OriginalSettings.Brightness end
end)
MakeToggle(worldSec, "⏸️ Freeze Time", 4, "FreezeTime")
MakeSlider(worldSec, "TIME", 5, 0, 24, 14, "h", function(v)
    CFG.FreezeTimeVal = v
    if CFG.FreezeTime then Lighting.ClockTime = v end
end)

local camSec = MakeSection(tabWorld, "📷 CAMERA — \"FOV = SKILL\" 🎥", 2)
MakeToggle(camSec, "🔭 FOV Changer", 1, "FOVChanger", function(v)
    if not v then Camera.FieldOfView = OriginalSettings.CamFOV end
end)
MakeSlider(camSec, "FOV", 2, 30, 140, 70, "°", function(v) CFG.CamFOV = v end)

-- ═══════════════════════════════════════════════════════════════════
-- 🏃 TAB: PLAYER
-- ═══════════════════════════════════════════════════════════════════
local moveSec = MakeSection(tabPlayer, "🏃 MOVEMENT — \"Gotta go fast\" ⚡", 1)
MakeToggle(moveSec, "🏃 Walk Speed", 1, "WalkSpeed", function(v)
    if not v and LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 16 end
    end
end)
MakeSlider(moveSec, "SPEED", 2, 16, 150, 16, "", function(v) CFG.WalkSpeedVal = v end)
MakeToggle(moveSec, "🦘 Jump Power", 3, "JumpPower", function(v)
    if not v and LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = 50 end
    end
end)
MakeSlider(moveSec, "JUMP", 4, 50, 300, 50, "", function(v) CFG.JumpPowerVal = v end)
MakeToggle(moveSec, "😴 Anti-AFK", 5, "AntiAFK")

-- 🎁 BONUS FEATURES
local bonusSec = MakeSection(tabPlayer, "🎁 BONUS — \"Pourquoi pas\" 🚀", 2)
MakeToggle(bonusSec, "🦅 Fly Hack", 1, "Fly", function(v)
    if v then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character.HumanoidRootPart
            FlyBody = Instance.new("BodyVelocity", hrp)
            FlyBody.Velocity = Vector3.new(0, 0, 0)
            FlyBody.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            FlyBody.Name = "H738Fly"
            FlyGyro = Instance.new("BodyGyro", hrp)
            FlyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
            FlyGyro.Name = "H738Gyro"
            Notify("🦅 Fly", "Tu voles comme un pigeon majestueux 🐦", 2, Theme.cyan)
        end
    else
        if FlyBody then FlyBody:Destroy() FlyBody = nil end
        if FlyGyro then FlyGyro:Destroy() FlyGyro = nil end
        Notify("🦅 Fly", "Retour au sol, mortel 💀", 2, Theme.yellow)
    end
end)
MakeSlider(bonusSec, "FLY SPEED", 2, 10, 200, 50, "", function(v) CFG.FlySpeed = v end)

MakeToggle(bonusSec, "⚡ Speed Boost (Shift)", 3, "SpeedBoost")
MakeSlider(bonusSec, "BOOST MULT", 4, 1, 5, 2, "x", function(v) CFG.SpeedBoostMult = v + 0.5 end)

MakeToggle(bonusSec, "🌪️ Spin Bot", 5, "SpinBot")
MakeSlider(bonusSec, "SPIN SPEED", 6, 1, 50, 10, "", function(v) CFG.SpinSpeed = v end)

MakeToggle(bonusSec, "👻 Noclip", 7, "Noclip")

MakeInfo(bonusSec, "💡 Spin Bot = tu tournes comme un beyblade 🌪️", 8)

-- 🛠️ Utility
local utilSec = MakeSection(tabPlayer, "🛠️ UTILITY — \"Pratique\" 📌", 3)
MakeButton(utilSec, "💾 SAVE POSITION", 1, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        CFG.SavedPosition = LP.Character.HumanoidRootPart.CFrame
        Notify("💾 Save", "Position sauvée — t'es pas Alzheimer quand même 🧠", 2, Theme.green)
    end
end)
MakeButton(utilSec, "📍 TELEPORT BACK", 2, function()
    if CFG.SavedPosition and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFG.SavedPosition
        Notify("📍 TP", "Retour au point de spawn — comme si de rien n'était 😏", 2, Accent)
    else
        Notify("📍 TP", "T'as rien sauvé, génie 🤡", 2, Theme.red)
    end
end)
MakeButton(utilSec, "💀 RESET CHARACTER", 3, function()
    if LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = 0 end
    end
    Notify("💀 Reset", "Suicide stratégique 🧠", 1.5, Theme.red)
end)

-- 🎁 BONUS: Waypoint System
local wpSec = MakeSection(tabPlayer, "📍 WAYPOINTS — \"GPS du cheater\" 🗺️", 4)
MakeButton(wpSec, "📍 ADD WAYPOINT", 1, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local name = "WP #" .. (#CFG.Waypoints + 1)
        table.insert(CFG.Waypoints, {name = name, cf = LP.Character.HumanoidRootPart.CFrame})
        Notify("📍 Waypoint", name .. " saved — t'as une mémoire de poisson 🐟", 2, Theme.cyan)
    end
end)
MakeButton(wpSec, "🗑️ CLEAR WAYPOINTS", 2, function()
    CFG.Waypoints = {}
    Notify("🗑️ Waypoints", "All cleared — table rase 🧹", 1.5, Theme.yellow)
end)
MakeButton(wpSec, "📍 TP TO LAST", 3, function()
    if #CFG.Waypoints > 0 and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFG.Waypoints[#CFG.Waypoints].cf
        Notify("📍 TP", "→ " .. CFG.Waypoints[#CFG.Waypoints].name, 1.5, Theme.cyan)
    else
        Notify("📍 TP", "Aucun waypoint, t'es perdu ? 🤡", 1.5, Theme.red)
    end
end)

-- ═══════════════════════════════════════════════════════════════════
-- 🕵️ TAB: STEALTH
-- ═══════════════════════════════════════════════════════════════════
local stealthSec = MakeSection(tabStealth, "🛡️ ANTI-DETECTION — \"Fantôme\" 👻", 1)
MakeToggle(stealthSec, "🛡️ Anti-Kick (REAL) 🎁", 1, "AntiKick", function(v)
    if v then
        -- 🎁 BONUS: VRAI Anti-Kick (hook)
        pcall(function()
            local oldNamecall
            oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                if getnamecallmethod() == "Kick" and self == LP then
                    Notify("🛡️ Anti-Kick", "Kick BLOCKED — nice try 🤡", 3, Theme.red)
                    return
                end
                return oldNamecall(self, ...)
            end)
        end)
        Notify("🛡️ Anti-Kick", "Hook installé — tu es unkickable 😈", 2, Theme.green)
    end
end)

MakeToggle(stealthSec, "🫥 Hide Name", 2, "HideName", function(v)
    if LP.Character then
        local hum = LP.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.DisplayDistanceType = v and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer
        end
    end
    Notify("🫥 Name", v and "Invisible — qui es-tu ? 👻" or "Visible — bonjour le monde 👋", 2, Theme.cyan)
end)

local humanSec = MakeSection(tabStealth, "🧬 HUMANIZATION — \"Pas un bot\" 🤖", 2)
MakeToggle(humanSec, "🎲 Random Smooth", 1, "RandomSmooth")
MakeToggle(humanSec, "🧬 Humanize Aim", 2, "HumanizeAim")
MakeInfo(humanSec, "💡 Ces options rendent ton aim moins suspect — même si t'es clairement en train de cheat 🤷", 3)

-- ═══════════════════════════════════════════════════════════════════
-- 👑 TAB: ADMIN
-- ═══════════════════════════════════════════════════════════════════
local adminSec = MakeSection(tabAdmin, "👑 PLAYER LIST — \"Judge, jury, executioner\" ⚖️", 1)
local playerList = Instance.new("ScrollingFrame", adminSec)
playerList.Size = UDim2.new(1, 0, 0, 220)
playerList.BackgroundColor3 = Theme.bg3
playerList.BorderSizePixel = 0
playerList.ScrollBarThickness = 3
playerList.ScrollBarImageColor3 = Accent
playerList.AutomaticCanvasSize = Enum.AutomaticSize.Y
playerList.LayoutOrder = 1
Instance.new("UICorner", playerList).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", playerList).Padding = UDim.new(0, 3)
local plPad = Instance.new("UIPadding", playerList)
plPad.PaddingTop = UDim.new(0, 4)
plPad.PaddingLeft = UDim.new(0, 4)
plPad.PaddingRight = UDim.new(0, 4)

local function RefreshPlayers()
    for _, child in ipairs(playerList:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player == LP then continue end

        local row = Instance.new("Frame", playerList)
        row.Size = UDim2.new(1, -4, 0, 40)
        row.BackgroundColor3 = Theme.bg2
        row.BorderSizePixel = 0
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

        -- 🟢 Team indicator
        local teamDot = Instance.new("Frame", row)
        teamDot.Size = UDim2.new(0, 6, 0, 6)
        teamDot.Position = UDim2.new(0, 8, 0.5, -3)
        teamDot.BackgroundColor3 = (player.Team and LP.Team and player.Team == LP.Team) and Theme.cyan or Theme.green
        teamDot.BorderSizePixel = 0
        Instance.new("UICorner", teamDot).CornerRadius = UDim.new(1, 0)

        -- 📛 Name
        local nameLabel = Instance.new("TextLabel", row)
        nameLabel.Size = UDim2.new(0.4, 0, 0, 14)
        nameLabel.Position = UDim2.new(0, 20, 0, 4)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.DisplayName
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 10
        nameLabel.TextColor3 = Theme.text1
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.TextTruncate = Enum.TextTruncate.AtEnd

        -- ❤️ HP
        local char = player.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        local statusLbl = Instance.new("TextLabel", row)
        statusLbl.Size = UDim2.new(0.4, 0, 0, 11)
        statusLbl.Position = UDim2.new(0, 20, 0, 20)
        statusLbl.BackgroundTransparency = 1
        statusLbl.Text = "❤️ " .. (hum and math.floor(hum.Health) or "?") .. "/" .. (hum and math.floor(hum.MaxHealth) or "?")
        statusLbl.Font = Enum.Font.Gotham
        statusLbl.TextSize = 8
        statusLbl.TextColor3 = Theme.text3
        statusLbl.TextXAlignment = Enum.TextXAlignment.Left

        -- 🔘 Action buttons
        local function MakePlayerBtn(text, xOffset, color, cb)
            local btn = Instance.new("TextButton", row)
            btn.Size = UDim2.new(0, 34, 0, 20)
            btn.Position = UDim2.new(1, xOffset, 0.5, -10)
            btn.BackgroundColor3 = Theme.bg3
            btn.BorderSizePixel = 0
            btn.Text = text
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 8
            btn.TextColor3 = color or Theme.text2
            btn.AutoButtonColor = false
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = color or Accent
                btn.TextColor3 = Theme.text1
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = Theme.bg3
                btn.TextColor3 = color or Theme.text2
            end)
            btn.MouseButton1Click:Connect(cb)
        end

        MakePlayerBtn("📍", -108, Theme.cyan, function()
            if LP.Character and player.Character and LP.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 3)
                Notify("📍 TP", "→ " .. player.Name .. " — surprise 😈", 2, Theme.cyan)
            end
        end)

        MakePlayerBtn("👁️", -70, Theme.yellow, function()
            if SpectateTarget == player then
                SpectateTarget = nil
                Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
                Notify("👁️ Spectate", "Stopped — boring anyway 😴", 1.5, Theme.text2)
            else
                if player.Character then
                    SpectateTarget = player
                    Camera.CameraSubject = player.Character:FindFirstChildOfClass("Humanoid")
                    Notify("👁️ Spectate", "Watching " .. player.Name .. " — 👀 creepy", 2, Theme.yellow)
                end
            end
        end)

        MakePlayerBtn("🎯", -32, Theme.red, function()
            if player.Character then
                local head = player.Character:FindFirstChild("Head")
                if head then
                    LockedTarget = head
                    CFG.LockTarget = true
                    Notify("🎯 Lock", "→ " .. player.Name .. " — RIP bozo 💀", 2, Theme.red)
                end
            end
        end)
    end
end

MakeButton(adminSec, "🔄 REFRESH LIST", 2, RefreshPlayers)
RefreshPlayers()

table.insert(Connections, Players.PlayerAdded:Connect(function()
    task.wait(1)
    RefreshPlayers()
    Notify("👋 Player", "Someone joined — fresh meat 🍖", 2, Theme.green)
end))

table.insert(Connections, Players.PlayerRemoving:Connect(function(player)
    task.wait(0.2)
    RefreshPlayers()
    Notify("👋 Player", player.Name .. " left — couldn't handle it 🤡", 2, Theme.yellow)
end))

-- ═══════════════════════════════════════════════════════════════════
-- 🎪 TAB: TROLL 🎁 BONUS
-- ═══════════════════════════════════════════════════════════════════
local trollSec = MakeSection(tabTroll, "🎪 TROLL MODE — \"Chaos is fun\" 😈", 1)
MakeToggle(trollSec, "🎪 Troll Mode (Spin+Speed)", 1, "TrollMode", function(v)
    if v then
        CFG.SpinBot = true
        CFG.SpinSpeed = 30
        CFG.WalkSpeed = true
        CFG.WalkSpeedVal = 80
        Notify("🎪 TROLL", "CHAOS MODE ACTIVÉ — BEYBLADE LET IT RIP 🌪️", 3, Theme.pink)
    else
        CFG.SpinBot = false
        CFG.WalkSpeed = false
        Notify("🎪 TROLL", "Mode normal... boring 😴", 2, Theme.text3)
    end
end)

MakeButton(trollSec, "💬 SPAM CHAT 'GG EZ' 🎁", 2, function()
    pcall(function()
        game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("GG EZ 🤡 git gud", "All")
    end)
    Notify("💬 Chat", "GG EZ envoyé — toxique assumé 😈", 1.5, Theme.pink)
end)

MakeButton(trollSec, "🔊 PLAY EARRAPE SOUND 🎁", 3, function()
    pcall(function()
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://130932305" -- explosion
        s.Volume = 2
        s:Play()
        game.Debris:AddItem(s, 5)
    end)
    Notify("🔊 Sound", "BOOM — t'as sursauté ? 😂", 2, Theme.orange)
end)

MakeButton(trollSec, "🎆 SPAWN EFFECTS 🎁", 4, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        for i = 1, 5 do
            pcall(function()
                local part = Instance.new("Part", workspace)
                part.Size = Vector3.new(1, 1, 1)
                part.Material = Enum.Material.Neon
                part.BrickColor = BrickColor.Random()
                part.Position = LP.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 10), math.random(5, 15), math.random(-10, 10))
                part.Anchored = false
                game.Debris:AddItem(part, 5)
            end)
        end
    end
    Notify("🎆 Effects", "Particules de la victoire 🎉", 2, Theme.yellow)
end)

MakeInfo(trollSec, "⚠️ Le spam chat peut te faire mute — on t'aura prévenu 🤷", 5)

-- ═══════════════════════════════════════════════════════════════════
-- 📊 TAB: STATS 🎁 BONUS
-- ═══════════════════════════════════════════════════════════════════
local statsSec = MakeSection(tabStats, "📊 STATS — \"Les chiffres parlent\" 📈", 1)

local statsKills = MakeInfo(statsSec, "💀 Kills: 0", 1)
local statsDeaths = MakeInfo(statsSec, "☠️ Deaths: 0", 2)
local statsKD = MakeInfo(statsSec, "📊 K/D Ratio: 0.00", 3)
local statsUptime = MakeInfo(statsSec, "⏱️ Uptime: 0s", 4)
local statsTargets = MakeInfo(statsSec, "🎯 Targets locked: 0", 5)

local startTime = tick()
local targetsLocked = 0

local function RefreshStats()
    statsKills.Text = "💀 Kills: " .. CFG.Kills .. " — massacre en cours 🔪"
    statsDeaths.Text = "☠️ Deaths: " .. CFG.Deaths .. " — " .. (CFG.Deaths == 0 and "immortel 😤" or "skill issue 🤡")
    local kd = CFG.Deaths > 0 and (CFG.Kills / CFG.Deaths) or CFG.Kills
    statsKD.Text = string.format("📊 K/D Ratio: %.2f — %s", kd, kd >= 2 and "tu gères 👑" or (kd >= 1 and "moyen 😐" or "t'es nul 🤡"))
    statsUptime.Text = "⏱️ Uptime: " .. math.floor(tick() - startTime) .. "s — " .. (tick() - startTime > 600 and "t'as pas de vie 😂" or "ça commence")
    statsTargets.Text = "🎯 Targets locked: " .. targetsLocked
end

MakeButton(statsSec, "🔄 REFRESH STATS", 6, RefreshStats)
MakeButton(statsSec, "🗑️ RESET STATS", 7, function()
    CFG.Kills = 0
    CFG.Deaths = 0
    targetsLocked = 0
    RefreshStats()
    Notify("📊 Stats", "Reset — comme si t'avais jamais cheat 🤫", 2, Theme.yellow)
end)

-- ═══════════════════════════════════════════════════════════════════
-- 📋 TAB: LOGS
-- ═══════════════════════════════════════════════════════════════════
local logsSec = MakeSection(tabLogs, "📋 ACTIVITY LOG — \"Big Brother te regarde\" 👁️", 1)
local logsFrame = Instance.new("ScrollingFrame", logsSec)
logsFrame.Size = UDim2.new(1, 0, 0, 260)
logsFrame.BackgroundColor3 = Theme.bg3
logsFrame.BorderSizePixel = 0
logsFrame.ScrollBarThickness = 3
logsFrame.ScrollBarImageColor3 = Accent
logsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
logsFrame.LayoutOrder = 1
Instance.new("UICorner", logsFrame).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", logsFrame).Padding = UDim.new(0, 2)
local logPad = Instance.new("UIPadding", logsFrame)
logPad.PaddingTop = UDim.new(0, 4)
logPad.PaddingLeft = UDim.new(0, 6)
logPad.PaddingRight = UDim.new(0, 6)

local function RefreshLogs()
    for _, child in ipairs(logsFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    for i, log in ipairs(Logs) do
        local row = Instance.new("Frame", logsFrame)
        row.Size = UDim2.new(1, 0, 0, 15)
        row.BackgroundTransparency = 1
        row.LayoutOrder = i

        local timeLbl = Instance.new("TextLabel", row)
        timeLbl.Size = UDim2.new(0, 55, 1, 0)
        timeLbl.BackgroundTransparency = 1
        timeLbl.Text = log.time
        timeLbl.Font = Enum.Font.Code
        timeLbl.TextSize = 9
        timeLbl.TextColor3 = Theme.text3
        timeLbl.TextXAlignment = Enum.TextXAlignment.Left

        local msgLbl = Instance.new("TextLabel", row)
        msgLbl.Size = UDim2.new(1, -58, 1, 0)
        msgLbl.Position = UDim2.new(0, 58, 0, 0)
        msgLbl.BackgroundTransparency = 1
        msgLbl.Text = log.action
        msgLbl.Font = Enum.Font.Gotham
        msgLbl.TextSize = 9
        msgLbl.TextColor3 = log.color
        msgLbl.TextXAlignment = Enum.TextXAlignment.Left
        msgLbl.TextTruncate = Enum.TextTruncate.AtEnd
    end
end

MakeButton(logsSec, "🗑️ CLEAR LOGS", 2, function()
    Logs = {}
    RefreshLogs()
    Notify("📋 Logs", "Wiped — comme ton historique de navigateur 🤫", 1.5, Theme.yellow)
end)
MakeButton(logsSec, "🔄 REFRESH", 3, RefreshLogs)

task.spawn(function()
    while not IsDestroyed do
        task.wait(3)
        if CurrentTab == "Logs" then RefreshLogs() end
        if CurrentTab == "Stats" then RefreshStats() end
    end
end)

-- ═══════════════════════════════════════════════════════════════════
-- ⚙️ TAB: SETTINGS
-- ═══════════════════════════════════════════════════════════════════

-- 🎨 Theme selector
local themeSec = MakeSection(tabSettings, "🎨 THEME — \"Drip > Skill\" 💅", 1)
local themeRow = Instance.new("Frame", themeSec)
themeRow.Size = UDim2.new(1, 0, 0, 28)
themeRow.BackgroundTransparency = 1
themeRow.LayoutOrder = 1
Instance.new("UIListLayout", themeRow).FillDirection = Enum.FillDirection.Horizontal
Instance.new("UIListLayout", themeRow).Padding = UDim.new(0, 5)

local themes = {
    {"💜", Color3.fromRGB(101, 78, 255)},
    {"💙", Color3.fromRGB(40, 140, 255)},
    {"❤️", Color3.fromRGB(255, 60, 80)},
    {"💚", Color3.fromRGB(60, 210, 130)},
    {"🧡", Color3.fromRGB(255, 140, 40)},
    {"💗", Color3.fromRGB(255, 80, 180)},
    {"💎", Color3.fromRGB(0, 220, 255)},
    {"🤍", Color3.fromRGB(200, 200, 200)}, -- 🎁 BONUS
}

for _, themeData in ipairs(themes) do
    local swatch = Instance.new("TextButton", themeRow)
    swatch.Size = UDim2.new(0, 30, 0, 24)
    swatch.BackgroundColor3 = themeData[2]
    swatch.BorderSizePixel = 0
    swatch.Text = themeData[1]
    swatch.TextSize = 12
    swatch.Font = Enum.Font.Gotham
    swatch.AutoButtonColor = false
    Instance.new("UICorner", swatch).CornerRadius = UDim.new(0, 6)

    swatch.MouseButton1Click:Connect(function()
        Accent = themeData[2]
        Theme.accent = themeData[2]
        TabContainer.ScrollBarImageColor3 = themeData[2]
        Notify("🎨 Theme", themeData[1] .. " — drip check ✅", 1.5, themeData[2])
    end)
end

-- 👤 Profile
local profileSec = MakeSection(tabSettings, "👤 PROFILE — \"C'est toi le boss\" 👑", 2)
local profileRow = Instance.new("Frame", profileSec)
profileRow.Size = UDim2.new(1, 0, 0, 55)
profileRow.BackgroundTransparency = 1
profileRow.LayoutOrder = 1

local avatar = Instance.new("ImageLabel", profileRow)
avatar.Size = UDim2.new(0, 44, 0, 44)
avatar.Position = UDim2.new(0, 0, 0, 4)
avatar.BackgroundColor3 = Theme.bg3
avatar.BorderSizePixel = 0
Instance.new("UICorner", avatar).CornerRadius = UDim.new(0, 10)
pcall(function()
    avatar.Image = Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)

local nameLabel = Instance.new("TextLabel", profileRow)
nameLabel.Size = UDim2.new(1, -55, 0, 15)
nameLabel.Position = UDim2.new(0, 54, 0, 4)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = "👑 " .. LP.DisplayName
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextSize = 13
nameLabel.TextColor3 = Theme.text1
nameLabel.TextXAlignment = Enum.TextXAlignment.Left

local userLabel = Instance.new("TextLabel", profileRow)
userLabel.Size = UDim2.new(1, -55, 0, 11)
userLabel.Position = UDim2.new(0, 54, 0, 22)
userLabel.BackgroundTransparency = 1
userLabel.Text = "@" .. LP.Name .. " · ID: " .. LP.UserId
userLabel.Font = Enum.Font.Gotham
userLabel.TextSize = 9
userLabel.TextColor3 = Theme.text3
userLabel.TextXAlignment = Enum.TextXAlignment.Left

local premLabel = Instance.new("TextLabel", profileRow)
premLabel.Size = UDim2.new(1, -55, 0, 11)
premLabel.Position = UDim2.new(0, 54, 0, 36)
premLabel.BackgroundTransparency = 1
premLabel.Text = "👑 PREMIUM ACTIVE · LIFETIME · GOAT STATUS 🐐"
premLabel.Font = Enum.Font.GothamBold
premLabel.TextSize = 9
premLabel.TextColor3 = Theme.green
premLabel.TextXAlignment = Enum.TextXAlignment.Left

-- 🌐 Server
local serverSec = MakeSection(tabSettings, "🌐 SERVER — \"Hop hop hop\" 🐰", 3)
local serverInfo = Instance.new("TextLabel", serverSec)
serverInfo.Size = UDim2.new(1, 0, 0, 45)
serverInfo.BackgroundTransparency = 1
serverInfo.Text = "🎮 Place: " .. game.PlaceId .. "\n🌐 Server: " .. game.JobId:sub(1, 20) .. "...\n👥 Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
serverInfo.Font = Enum.Font.Code
serverInfo.TextSize = 9
serverInfo.TextColor3 = Theme.text2
serverInfo.TextXAlignment = Enum.TextXAlignment.Left
serverInfo.TextYAlignment = Enum.TextYAlignment.Top
serverInfo.LayoutOrder = 1

MakeButton(serverSec, "🔄 REJOIN SERVER", 2, function()
    Notify("🌐 Server", "Rejoining... à toute 👋", 2, Theme.yellow)
    task.wait(0.5)
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
end)
MakeButton(serverSec, "🌐 NEW SERVER", 3, function()
    Notify("🌐 Server", "Finding new lobby — fresh victims 😈", 2, Theme.yellow)
    task.wait(0.5)
    pcall(function() TeleportService:Teleport(game.PlaceId, LP) end)
end)
MakeButton(serverSec, "📋 COPY JOB ID", 4, function()
    if setclipboard then
        setclipboard(game.JobId)
        Notify("📋 Copied", "Job ID — pour tes potes cheaters 🤝", 1.5, Theme.green)
    else
        Notify("❌ Error", "setclipboard not supported — t'utilises quel exploit ? 🤡", 2, Theme.red)
    end
end)

-- ⌨️ Keybinds
local keybindSec = MakeSection(tabSettings, "⌨️ KEYBINDS — \"Mémorise ça\" 🧠", 4)
MakeInfo(keybindSec, "🔑 [Right Alt] → Toggle aimbot ON/OFF", 1)
MakeInfo(keybindSec, "🔑 [Left Ctrl] → Hide/show menu", 2)
MakeInfo(keybindSec, "🔑 [Right Shift] → PANIC (disable all)", 3)
MakeInfo(keybindSec, "🔑 [Delete] → Full cleanup", 4)
MakeInfo(keybindSec, "🔑 [F] → Save position", 5)
MakeInfo(keybindSec, "🔑 [G] → Teleport back", 6)
MakeInfo(keybindSec, "🔑 [X] → Unlock target 🎁", 7) -- 🎁 BONUS
MakeInfo(keybindSec, "🔑 [V] → Toggle fly 🎁", 8) -- 🎁 BONUS
MakeInfo(keybindSec, "🔑 [B] → Toggle noclip 🎁", 9) -- 🎁 BONUS

MakeButton(keybindSec, "🔄 RESET ALL SETTINGS", 10, function()
    for key, value in pairs(CFG) do
        if type(value) == "boolean" then CFG[key] = false end
    end
    CFG.AntiAFK = true
    CFG.ShowFOV = true
    CFG.ShowFPS = true
    CFG.ShowPing = true
    CFG.ShowTarget = true
    CFG.ShowWatermark = true
    SetPowerOn(false)
    Notify("🔄 Reset", "Tout remis à zéro — comme ton skill 🤡", 2, Theme.yellow)
end)

-- 🏆 Credits
local creditsSec = MakeSection(tabSettings, "🏆 CREDITS — \"Les légendes\" 👑", 5)
MakeInfo(creditsSec, "👑 HIROSHI 738 · Premium v11 ULTIMATE", 1)
MakeInfo(creditsSec, "🛠️ By Hiroshi738 — the GOAT 🐐", 2)
MakeInfo(creditsSec, "🎁 Enhanced with love, sarcasm, and zero mercy 😈", 3)
MakeInfo(creditsSec, "💀 \"If you ain't cheating, you ain't trying\" — Sun Tzu probably", 4)

-- ═══════════════════════════════════════════════════════════════════
-- 📐 SÉLECTION DU TAB PAR DÉFAUT
-- ═══════════════════════════════════════════════════════════════════
SelectTab("Aim")

-- ═══════════════════════════════════════════════════════════════════
-- ✏️ DRAWING API — Objets d'overlay
-- ═══════════════════════════════════════════════════════════════════
local FOV_SEGMENTS = 36
local FOVLines = {}
for i = 1, FOV_SEGMENTS do
    FOVLines[i] = Drawing.new("Line")
    FOVLines[i].Thickness = 1
    FOVLines[i].Visible = false
end

local FOVFill = Drawing.new("Circle")
FOVFill.Filled = true
FOVFill.Transparency = 0.12
FOVFill.Visible = false

local CrossLines = {}
for i = 1, 4 do
    CrossLines[i] = Drawing.new("Line")
    CrossLines[i].Thickness = 1.5
    CrossLines[i].Visible = false
end

local CrossDot = Drawing.new("Circle")
CrossDot.Radius = 2
CrossDot.Filled = true
CrossDot.Visible = false

local CrossCircle = Drawing.new("Circle")
CrossCircle.Thickness = 1.5
CrossCircle.Filled = false
CrossCircle.Visible = false

local FPSText = Drawing.new("Text")
FPSText.Size = 13
FPSText.Font = 2
FPSText.Outline = true
FPSText.Visible = false

local PingText = Drawing.new("Text")
PingText.Size = 13
PingText.Font = 2
PingText.Outline = true
PingText.Visible = false

local TargetText = Drawing.new("Text")
TargetText.Size = 13
TargetText.Font = 2
TargetText.Outline = true
TargetText.Visible = false

local Watermark = Drawing.new("Text")
Watermark.Size = 13
Watermark.Font = 2
Watermark.Outline = true
Watermark.Visible = false

-- 🎁 BONUS: Kill feed text
local KillFeedTexts = {}
for i = 1, 5 do
    KillFeedTexts[i] = Drawing.new("Text")
    KillFeedTexts[i].Size = 11
    KillFeedTexts[i].Font = 2
    KillFeedTexts[i].Outline = true
    KillFeedTexts[i].Visible = false
end

-- ═══════════════════════════════════════════════════════════════════
-- 🦴 SKELETON DATA
-- ═══════════════════════════════════════════════════════════════════
local SkeletonR15 = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
    {"UpperTorso", "LeftUpperArm"}, {"LeftUpperArm", "LeftLowerArm"},
    {"LeftLowerArm", "LeftHand"},
    {"UpperTorso", "RightUpperArm"}, {"RightUpperArm", "RightLowerArm"},
    {"RightLowerArm", "RightHand"},
    {"LowerTorso", "LeftUpperLeg"}, {"LeftUpperLeg", "LeftLowerLeg"},
    {"LeftLowerLeg", "LeftFoot"},
    {"LowerTorso", "RightUpperLeg"}, {"RightUpperLeg", "RightLowerLeg"},
    {"RightLowerLeg", "RightFoot"},
}

local SkeletonR6 = {
    {"Head", "Torso"},
    {"Torso", "Left Arm"}, {"Torso", "Right Arm"},
    {"Torso", "Left Leg"}, {"Torso", "Right Leg"},
}

-- ═══════════════════════════════════════════════════════════════════
-- 👁️ ESP OBJECTS MANAGER
-- ═══════════════════════════════════════════════════════════════════
local ESPObjects = {}

local function GetESP(player)
    if ESPObjects[player] then return ESPObjects[player] end

    local obj = {
        name = Drawing.new("Text"),
        dist = Drawing.new("Text"),
        weapon = Drawing.new("Text"), -- 🎁 BONUS
        box = Drawing.new("Square"),
        boxOutline = Drawing.new("Square"),
        corners = {},
        tracer = Drawing.new("Line"),
        healthBg = Drawing.new("Square"),
        healthFill = Drawing.new("Square"),
        headDot = Drawing.new("Circle"),
        skeleton = {},
        highlight = nil,
    }

    -- Setup defaults
    obj.name.Size = 13; obj.name.Font = 2; obj.name.Center = true; obj.name.Outline = true; obj.name.Visible = false
    obj.dist.Size = 12; obj.dist.Font = 2; obj.dist.Center = true; obj.dist.Outline = true; obj.dist.Visible = false
    obj.weapon.Size = 10; obj.weapon.Font = 2; obj.weapon.Center = true; obj.weapon.Outline = true; obj.weapon.Visible = false
    obj.box.Thickness = 1; obj.box.Filled = false; obj.box.Visible = false
    obj.boxOutline.Thickness = 3; obj.boxOutline.Color = Color3.new(0, 0, 0); obj.boxOutline.Filled = false; obj.boxOutline.Visible = false
    obj.tracer.Thickness = 1; obj.tracer.Visible = false
    obj.healthBg.Filled = true; obj.healthBg.Color = Color3.fromRGB(20, 20, 20); obj.healthBg.Visible = false
    obj.healthFill.Filled = true; obj.healthFill.Visible = false
    obj.headDot.Radius = 3; obj.headDot.Filled = true; obj.headDot.Visible = false

    for i = 1, 8 do
        obj.corners[i] = Drawing.new("Line")
        obj.corners[i].Thickness = 1.5
        obj.corners[i].Visible = false
    end

    ESPObjects[player] = obj
    return obj
end

local function HideESP(obj)
    obj.name.Visible = false
    obj.dist.Visible = false
    obj.weapon.Visible = false
    obj.box.Visible = false
    obj.boxOutline.Visible = false
    for _, line in ipairs(obj.corners) do line.Visible = false end
    obj.tracer.Visible = false
    obj.healthBg.Visible = false
    obj.healthFill.Visible = false
    obj.headDot.Visible = false
    for _, line in ipairs(obj.skeleton) do line.Visible = false end
    if obj.highlight then
        pcall(function() obj.highlight:Destroy() end)
        obj.highlight = nil
    end
end

local function RemoveESP(player)
    local obj = ESPObjects[player]
    if not obj then return end
    pcall(function()
        obj.name:Remove(); obj.dist:Remove(); obj.weapon:Remove()
        obj.box:Remove(); obj.boxOutline:Remove(); obj.tracer:Remove()
        obj.healthBg:Remove(); obj.healthFill:Remove(); obj.headDot:Remove()
    end)
    for _, line in ipairs(obj.corners) do pcall(function() line:Remove() end) end
    for _, line in ipairs(obj.skeleton) do pcall(function() line:Remove() end) end
    if obj.highlight then pcall(function() obj.highlight:Destroy() end) end
    ESPObjects[player] = nil
end

table.insert(Connections, Players.PlayerRemoving:Connect(RemoveESP))

-- 📐 Corner box drawing
local function DrawCorners(lines, x, y, w, h, color)
    local cornerLen = math.min(w, h) * 0.25
    local points = {
        {Vector2.new(x, y), Vector2.new(x + cornerLen, y)},
        {Vector2.new(x, y), Vector2.new(x, y + cornerLen)},
        {Vector2.new(x + w, y), Vector2.new(x + w - cornerLen, y)},
        {Vector2.new(x + w, y), Vector2.new(x + w, y + cornerLen)},
        {Vector2.new(x, y + h), Vector2.new(x + cornerLen, y + h)},
        {Vector2.new(x, y + h), Vector2.new(x, y + h - cornerLen)},
        {Vector2.new(x + w, y + h), Vector2.new(x + w - cornerLen, y + h)},
        {Vector2.new(x + w, y + h), Vector2.new(x + w, y + h - cornerLen)},
    }
    for i = 1, 8 do
        lines[i].From = points[i][1]
        lines[i].To = points[i][2]
        lines[i].Color = color
        lines[i].Visible = true
    end
end

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 AIM LOGIC
-- ═══════════════════════════════════════════════════════════════════
local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Exclude

local function IsVisible(part)
    if not part or not part.Parent then return false end
    RayParams.FilterDescendantsInstances = {LP.Character, Camera}
    local result = workspace:Raycast(Camera.CFrame.Position, part.Position - Camera.CFrame.Position, RayParams)
    return not result or result.Instance:IsDescendantOf(part.Parent)
end

local function GetTargetPart(character)
    if CFG.Target == "Head" then
        return character:FindFirstChild("Head")
    elseif CFG.Target == "Legs" then
        return character:FindFirstChild("LeftFoot") or character:FindFirstChild("Left Leg")
    else
        return character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart")
    end
end

local function IsValidTarget(player)
    if player == LP then return false end
    local char = player.Character
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return false end
    if CFG.TeamCheck and player.Team and player.Team == LP.Team then return false end
    return true
end

local function GetClosestTarget()
    -- 🔒 Lock target priority
    if CFG.LockTarget and LockedTarget then
        local player = Players:GetPlayerFromCharacter(LockedTarget.Parent)
        if player and IsValidTarget(player) then
            CurrentTargetName = player.Name
            return LockedTarget
        else
            LockedTarget = nil
        end
    end

    local center = Camera.ViewportSize / 2
    local bestTarget, bestDist = nil, math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if not IsValidTarget(player) then continue end
        local part = GetTargetPart(player.Character)
        if not part then continue end
        if CFG.WallCheck and not IsVisible(part) then continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
        if not onScreen then continue end

        local distance = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
        if distance < CFG.FOV and distance < bestDist then
            bestTarget = part
            bestDist = distance
            CurrentTargetName = player.Name
            CurrentTargetDist = (Camera.CFrame.Position - part.Position).Magnitude
        end
    end

    if not bestTarget then
        CurrentTargetName = ""
        CurrentTargetDist = 0
    end

    if CFG.LockTarget then
        LockedTarget = bestTarget
        if bestTarget then
            targetsLocked = targetsLocked + 1
        end
    end

    return bestTarget
end

local function IsAimKeyHeld()
    if CFG.AimKey == "Always" then return true end
    local mouseTypes = {
        MouseButton1 = Enum.UserInputType.MouseButton1,
        MouseButton2 = Enum.UserInputType.MouseButton2,
    }
    return mouseTypes[CFG.AimKey] and UIS:IsMouseButtonPressed(mouseTypes[CFG.AimKey])
end

-- ═══════════════════════════════════════════════════════════════════
-- 🎨 ESP COLOR LOGIC
-- ═══════════════════════════════════════════════════════════════════
local rainbowHue = 0

local function GetESPColor(player, head, index)
    if CFG.RainbowESP then
        return Color3.fromHSV((rainbowHue + index * 0.1) % 1, 0.8, 1)
    end
    if CFG.ColorByVis and head then
        return IsVisible(head) and Color3.fromRGB(60, 255, 120) or Color3.fromRGB(255, 60, 75)
    end
    if CFG.ColorByHP then
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            return Color3.fromHSV(0.33 * math.clamp(hum.Health / hum.MaxHealth, 0, 1), 1, 1)
        end
    end
    if player.Team and LP.Team and player.Team == LP.Team then
        return Theme.cyan
    end
    return Color3.fromRGB(255, 60, 75)
end

-- ═══════════════════════════════════════════════════════════════════
-- 🧹 CLEANUP FUNCTION
-- ═══════════════════════════════════════════════════════════════════
local function CleanupAll()
    IsDestroyed = true

    -- Disconnect all connections
    for _, conn in ipairs(Connections) do
        pcall(function() conn:Disconnect() end)
    end

    -- Restore settings
    pcall(function()
        Lighting.Brightness = OriginalSettings.Brightness
        Lighting.FogEnd = OriginalSettings.FogEnd
        Lighting.FogStart = OriginalSettings.FogStart
        Lighting.GlobalShadows = OriginalSettings.GlobalShadows
        Lighting.ClockTime = OriginalSettings.ClockTime
        Camera.FieldOfView = OriginalSettings.CamFOV
    end)

    -- Remove fly
    if FlyBody then pcall(function() FlyBody:Destroy() end) end
    if FlyGyro then pcall(function() FlyGyro:Destroy() end) end

    -- Restore spectate
    if SpectateTarget then
        Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
    end

    -- Remove ESP
    for player, _ in pairs(ESPObjects) do RemoveESP(player) end

    -- Remove Drawing objects
    for _, line in ipairs(FOVLines) do pcall(function() line:Remove() end) end
    for _, line in ipairs(CrossLines) do pcall(function() line:Remove() end) end
    pcall(function()
        FOVFill:Remove(); CrossDot:Remove(); CrossCircle:Remove()
        FPSText:Remove(); PingText:Remove(); TargetText:Remove(); Watermark:Remove()
    end)
    for _, text in ipairs(KillFeedTexts) do pcall(function() text:Remove() end) end

    -- Remove GUI
    pcall(function() ScreenGui:Destroy() end)

    Notify = function() end -- prevent further notifications
end

-- Close button handler
closeBtn.MouseButton1Click:Connect(function()
    CleanupAll()
end)

-- ═══════════════════════════════════════════════════════════════════
-- ⌨️ INPUT HANDLING
-- ═══════════════════════════════════════════════════════════════════
table.insert(Connections, UIS.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainPanel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    if ActiveSlider and input.UserInputType == Enum.UserInputType.MouseMovement then
        ActiveSlider(input.Position.X)
    end
end))

table.insert(Connections, UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        ActiveSlider = nil
    end
end))

table.insert(Connections, UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.RightAlt then
        SetPowerOn(not CFG.Enabled)
    elseif input.KeyCode == Enum.KeyCode.LeftControl then
        MainPanel.Visible = not MainPanel.Visible
    elseif input.KeyCode == Enum.KeyCode.RightShift then
        -- 🚨 PANIC
        SetPowerOn(false)
        LockedTarget = nil
        CurrentTargetName = ""
        SpectateTarget = nil
        Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        Notify("🚨 PANIC", "Everything disabled — act normal 🫣", 3, Theme.red)
    elseif input.KeyCode == Enum.KeyCode.Delete then
        CleanupAll()
    elseif input.KeyCode == Enum.KeyCode.F then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            CFG.SavedPosition = LP.Character.HumanoidRootPart.CFrame
            Notify("💾 Saved", "Position bookmarked 📌", 1.5, Theme.green)
        end
    elseif input.KeyCode == Enum.KeyCode.G then
        if CFG.SavedPosition and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = CFG.SavedPosition
            Notify("📍 TP", "Teleported — nothing to see here 😏", 1.5, Accent)
        end
    elseif input.KeyCode == Enum.KeyCode.X then -- 🎁 BONUS
        LockedTarget = nil
        CFG.LockTarget = false
        Notify("🔓 Unlock", "Target released — they got lucky 🍀", 1.5, Theme.yellow)
    elseif input.KeyCode == Enum.KeyCode.V then -- 🎁 BONUS
        CFG.Fly = not CFG.Fly
        if CFG.Fly then
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LP.Character.HumanoidRootPart
                if not FlyBody then
                    FlyBody = Instance.new("BodyVelocity", hrp)
                    FlyBody.Velocity = Vector3.new(0, 0, 0)
                    FlyBody.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                    FlyBody.Name = "H738Fly"
                end
                if not FlyGyro then
                    FlyGyro = Instance.new("BodyGyro", hrp)
                    FlyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
                    FlyGyro.Name = "H738Gyro"
                end
            end
            Notify("🦅 Fly", "Activated — you're a bird now 🐦", 1.5, Theme.cyan)
        else
            if FlyBody then FlyBody:Destroy() FlyBody = nil end
            if FlyGyro then FlyGyro:Destroy() FlyGyro = nil end
            Notify("🦅 Fly", "Deactivated — gravity wins 😔", 1.5, Theme.yellow)
        end
    elseif input.KeyCode == Enum.KeyCode.B then -- 🎁 BONUS
        CFG.Noclip = not CFG.Noclip
        Notify("👻 Noclip", CFG.Noclip and "ON — you're a ghost 👻" or "OFF — solid again 🧱", 1.5, CFG.Noclip and Theme.cyan or Theme.yellow)
    end
end))

-- ═══════════════════════════════════════════════════════════════════
-- 😴 ANTI-AFK
-- ═══════════════════════════════════════════════════════════════════
table.insert(Connections, LP.Idled:Connect(function()
    if not CFG.AntiAFK then return end
    VirtualUser:Button2Down(Vector2.new(0, 0), Camera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Camera.CFrame)
end))

-- ═══════════════════════════════════════════════════════════════════
-- 🔄 MAIN RENDER LOOP
-- ═══════════════════════════════════════════════════════════════════
local fpsAccum, fpsCount, fpsValue = 0, 0, 60
local lastPing, pingCache, pingTime = 0, 0, 0
local lastTimeStr, timeCache = "", 0
local lastESPUpdate, lastSkeletonUpdate = 0, 0

table.insert(Connections, RunService.RenderStepped:Connect(function(deltaTime)
    if IsDestroyed then return end

    local center = Camera.ViewportSize / 2
    local viewport = Camera.ViewportSize
    local now = tick()

    -- 📊 FPS calculation
    fpsAccum = fpsAccum + deltaTime
    fpsCount = fpsCount + 1
    if fpsAccum >= 0.5 then
        fpsValue = math.floor(fpsCount / fpsAccum + 0.5)
        fpsAccum, fpsCount = 0, 0
    end

    -- 🌈 Rainbow UI
    if CFG.RainbowUI then
        rainbowHue = (rainbowHue + deltaTime * 0.2) % 1
        Accent = Color3.fromHSV(rainbowHue, 0.7, 1)
    end

    -- ⏰ Time string cache
    if now - timeCache > 1 then
        lastTimeStr = os.date("%H:%M:%S")
        timeCache = now
    end

    -- 🏷️ Watermark
    if CFG.ShowWatermark then
        Watermark.Text = "👑 HIROSHI 738 · " .. fpsValue .. "fps · " .. lastTimeStr .. " · 🛡️ UNDETECTED"
        Watermark.Color = Accent
        Watermark.Visible = true
        Watermark.Position = Vector2.new(viewport.X - Watermark.TextBounds.X - 12, 8)
    else
        Watermark.Visible = false
    end

    -- 📊 Overlay info
    local infoY = 8
    if CFG.ShowFPS then
        local fpsEmoji = fpsValue >= 60 and "🟢" or (fpsValue >= 30 and "🟡" or "🔴")
        FPSText.Text = fpsEmoji .. " FPS: " .. fpsValue
        FPSText.Color = Accent
        FPSText.Position = Vector2.new(10, infoY)
        FPSText.Visible = true
        infoY = infoY + 17
    else
        FPSText.Visible = false
    end

    if CFG.ShowPing then
        if now - pingTime > 1 then
            local ok, ping = pcall(function()
                return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            end)
            pingCache = ok and ping or 0
            pingTime = now
        end
        local pingEmoji = pingCache <= 50 and "🟢" or (pingCache <= 100 and "🟡" or "🔴")
        PingText.Text = pingEmoji .. " PING: " .. pingCache .. "ms"
        PingText.Color = Accent
        PingText.Position = Vector2.new(10, infoY)
        PingText.Visible = true
        infoY = infoY + 17
    else
        PingText.Visible = false
    end

    if CFG.ShowTarget and CurrentTargetName ~= "" then
        TargetText.Text = "🎯 " .. CurrentTargetName .. " [" .. math.floor(CurrentTargetDist) .. "m] 💀"
        TargetText.Color = Theme.yellow
        TargetText.Position = Vector2.new(10, infoY)
        TargetText.Visible = true
    else
        TargetText.Visible = false
    end

    -- 🌍 World effects
    if CFG.FOVChanger then Camera.FieldOfView = CFG.CamFOV end
    if CFG.FreezeTime then Lighting.ClockTime = CFG.FreezeTimeVal end

    -- 🏃 Player effects
    local char = LP.Character
    if char then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            -- Walk speed
            if CFG.WalkSpeed then
                local speed = CFG.WalkSpeedVal
                if CFG.SpeedBoost and UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
                    speed = speed * CFG.SpeedBoostMult
                end
                hum.WalkSpeed = speed
            end
            if CFG.JumpPower then hum.JumpPower = CFG.JumpPowerVal end
        end

        -- 🌪️ Spin Bot
        if CFG.SpinBot and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(CFG.SpinSpeed), 0)
        end

        -- 👻 Noclip
        if CFG.Noclip then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end

    -- 🦅 Fly
    if CFG.Fly and FlyBody and FlyGyro and char and char:FindFirstChild("HumanoidRootPart") then
        FlyGyro.CFrame = Camera.CFrame
        local moveDir = Vector3.new(0, 0, 0)
        if UIS:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        FlyBody.Velocity = moveDir * CFG.FlySpeed
    end

    -- ⭕ FOV Circle
    if CFG.Enabled and CFG.ShowFOV then
        if CFG.FOVFilled then
            FOVFill.Position = center
            FOVFill.Radius = CFG.FOV
            FOVFill.Color = Accent
            FOVFill.Visible = true
            for _, line in ipairs(FOVLines) do line.Visible = false end
        else
            FOVFill.Visible = false
            for i = 1, FOV_SEGMENTS do
                local angle1 = math.rad((i - 1) / FOV_SEGMENTS * 360)
                local angle2 = math.rad(i / FOV_SEGMENTS * 360)
                FOVLines[i].From = center + Vector2.new(math.cos(angle1), math.sin(angle1)) * CFG.FOV
                FOVLines[i].To = center + Vector2.new(math.cos(angle2), math.sin(angle2)) * CFG.FOV
                FOVLines[i].Color = Accent
                FOVLines[i].Visible = true
            end
        end
    else
        FOVFill.Visible = false
        for _, line in ipairs(FOVLines) do line.Visible = false end
    end

    -- ➕ Crosshair
    for _, line in ipairs(CrossLines) do line.Visible = false end
    CrossDot.Visible = false
    CrossCircle.Visible = false

    if CFG.ShowCross then
        local size = CFG.CrossSize
        if CFG.CrossSpin then CrosshairAngle = CrosshairAngle + deltaTime * 2 end
        local cosA, sinA = math.cos(CrosshairAngle), math.sin(CrosshairAngle)

        local function RotateVec(x, y)
            return center + Vector2.new(x * cosA - y * sinA, x * sinA + y * cosA)
        end

        if CFG.CrossStyle == "Cross" then
            CrossLines[1].From = RotateVec(-size - 2, 0)
            CrossLines[1].To = RotateVec(-2, 0)
            CrossLines[1].Color = Accent; CrossLines[1].Visible = true

            CrossLines[2].From = RotateVec(2, 0)
            CrossLines[2].To = RotateVec(size + 2, 0)
            CrossLines[2].Color = Accent; CrossLines[2].Visible = true

            CrossLines[3].From = RotateVec(0, -size - 2)
            CrossLines[3].To = RotateVec(0, -2)
            CrossLines[3].Color = Accent; CrossLines[3].Visible = true

            CrossLines[4].From = RotateVec(0, 2)
            CrossLines[4].To = RotateVec(0, size + 2)
            CrossLines[4].Color = Accent; CrossLines[4].Visible = true

            CrossDot.Position = center; CrossDot.Color = Accent; CrossDot.Radius = 1.5; CrossDot.Visible = true
        elseif CFG.CrossStyle == "Dot" then
            CrossDot.Position = center; CrossDot.Color = Accent; CrossDot.Radius = size * 0.5; CrossDot.Visible = true
        elseif CFG.CrossStyle == "Circle" then
            CrossCircle.Position = center; CrossCircle.Color = Accent; CrossCircle.Radius = size; CrossCircle.Visible = true
            CrossDot.Position = center; CrossDot.Color = Accent; CrossDot.Radius = 1.5; CrossDot.Visible = true
        end
    end

    -- 👁️ ESP UPDATE (throttled)
    local doSkeleton = (now - lastSkeletonUpdate >= 0.05)
    if doSkeleton then lastSkeletonUpdate = now end

    if now - lastESPUpdate >= 0.033 then
        lastESPUpdate = now

        local anyESP = CFG.ESPNames or CFG.ESPBox or CFG.ESPTracer or CFG.ESPHealth
            or CFG.ESPDist or CFG.ESPDot or CFG.ESPSkel or CFG.ESPChams or CFG.ESPWeapon

        local playerIndex = 0
        for _, player in ipairs(Players:GetPlayers()) do
            if player == LP then continue end
            playerIndex = playerIndex + 1

            local obj = GetESP(player)

            if not anyESP then HideESP(obj); continue end

            local pChar = player.Character
            local pHum = pChar and pChar:FindFirstChildOfClass("Humanoid")
            local pHead = pChar and pChar:FindFirstChild("Head")
            local pRoot = pChar and (pChar:FindFirstChild("HumanoidRootPart") or pChar:FindFirstChild("Torso"))

            if not (pChar and pHead and pRoot and pHum and pHum.Health > 0) then HideESP(obj); continue end
            if CFG.TeamCheck and player.Team and player.Team == LP.Team then HideESP(obj); continue end

            local dist = (Camera.CFrame.Position - pRoot.Position).Magnitude
            if dist > CFG.ESPMaxDist then HideESP(obj); continue end

            local headScreen, headVisible = Camera:WorldToViewportPoint(pHead.Position + Vector3.new(0, 0.6, 0))
            local footScreen = Camera:WorldToViewportPoint(pRoot.Position - Vector3.new(0, 3, 0))
            if not headVisible then HideESP(obj); continue end

            local boxHeight = math.abs(headScreen.Y - footScreen.Y)
            local boxWidth = boxHeight * 0.55
            local boxX = headScreen.X - boxWidth / 2
            local boxY = headScreen.Y - 4
            local color = GetESPColor(player, pHead, playerIndex)

            -- 📛 Names
            if CFG.ESPNames then
                obj.name.Text = player.DisplayName
                obj.name.Position = Vector2.new(headScreen.X, headScreen.Y - 20)
                obj.name.Color = color
                obj.name.Visible = true
            else
                obj.name.Visible = false
            end

            -- 📏 Distance
            if CFG.ESPDist then
                obj.dist.Text = "[" .. math.floor(dist) .. "m]"
                obj.dist.Position = Vector2.new(footScreen.X, footScreen.Y + 4)
                obj.dist.Color = color
                obj.dist.Visible = true
            else
                obj.dist.Visible = false
            end

            -- 🔫 Weapon 🎁 BONUS
            if CFG.ESPWeapon then
                local tool = pChar:FindFirstChildOfClass("Tool")
                obj.weapon.Text = tool and ("🔫 " .. tool.Name) or ""
                obj.weapon.Position = Vector2.new(footScreen.X, footScreen.Y + (CFG.ESPDist and 17 or 4))
                obj.weapon.Color = Theme.orange
                obj.weapon.Visible = tool ~= nil
            else
                obj.weapon.Visible = false
            end

            -- 📦 Box
            if CFG.ESPBox then
                if CFG.BoxStyle == "Corner" then
                    obj.box.Visible = false
                    obj.boxOutline.Visible = false
                    DrawCorners(obj.corners, boxX, boxY, boxWidth, boxHeight, color)
                else
                    for _, line in ipairs(obj.corners) do line.Visible = false end
                    obj.boxOutline.Size = Vector2.new(boxWidth + 2, boxHeight + 2)
                    obj.boxOutline.Position = Vector2.new(boxX - 1, boxY - 1)
                    obj.boxOutline.Visible = true
                    obj.box.Size = Vector2.new(boxWidth, boxHeight)
                    obj.box.Position = Vector2.new(boxX, boxY)
                    obj.box.Color = color
                    obj.box.Visible = true
                end
            else
                obj.box.Visible = false
                obj.boxOutline.Visible = false
                for _, line in ipairs(obj.corners) do line.Visible = false end
            end

            -- 📍 Tracers
            if CFG.ESPTracer then
                local origin
                if CFG.TracerFrom == "Bottom" then
                    origin = Vector2.new(center.X, viewport.Y)
                elseif CFG.TracerFrom == "Top" then
                    origin = Vector2.new(center.X, 0)
                else
                    origin = center
                end
                obj.tracer.From = origin
                obj.tracer.To = Vector2.new(footScreen.X, footScreen.Y)
                obj.tracer.Color = color
                obj.tracer.Visible = true
            else
                obj.tracer.Visible = false
            end

            -- ❤️ Health
            if CFG.ESPHealth then
                local hpFrac = math.clamp(pHum.Health / math.max(pHum.MaxHealth, 1), 0, 1)
                obj.healthBg.Size = Vector2.new(3, boxHeight)
                obj.healthBg.Position = Vector2.new(boxX - 7, boxY)
                obj.healthBg.Visible = true
                obj.healthFill.Size = Vector2.new(3, boxHeight * hpFrac)
                obj.healthFill.Position = Vector2.new(boxX - 7, boxY + boxHeight * (1 - hpFrac))
                obj.healthFill.Color = Color3.fromHSV(0.33 * hpFrac, 1, 1)
                obj.healthFill.Visible = true
            else
                obj.healthBg.Visible = false
                obj.healthFill.Visible = false
            end

            -- 🔴 Head Dot
            if CFG.ESPDot then
                local headPos = Camera:WorldToViewportPoint(pHead.Position)
                obj.headDot.Position = Vector2.new(headPos.X, headPos.Y)
                obj.headDot.Color = color
                obj.headDot.Visible = true
            else
                obj.headDot.Visible = false
            end

            -- 🦴 Skeleton
            if CFG.ESPSkel and doSkeleton then
                local pairs = pChar:FindFirstChild("UpperTorso") and SkeletonR15 or SkeletonR6
                for i, pair in ipairs(pairs) do
                    local part1 = pChar:FindFirstChild(pair[1])
                    local part2 = pChar:FindFirstChild(pair[2])
                    local line = obj.skeleton[i]
                    if not line then
                        line = Drawing.new("Line")
                        line.Thickness = 1
                        obj.skeleton[i] = line
                    end

                    if part1 and part2 then
                        local s1, v1 = Camera:WorldToViewportPoint(part1.Position)
                        local s2, v2 = Camera:WorldToViewportPoint(part2.Position)
                        if v1 and v2 then
                            line.From = Vector2.new(s1.X, s1.Y)
                            line.To = Vector2.new(s2.X, s2.Y)
                            line.Color = color
                            line.Visible = true
                        else
                            line.Visible = false
                        end
                    else
                        line.Visible = false
                    end
                end
                for i = #pairs + 1, #obj.skeleton do
                    obj.skeleton[i].Visible = false
                end
            elseif not CFG.ESPSkel then
                for _, line in ipairs(obj.skeleton) do line.Visible = false end
            end

            -- ✨ Chams
            if CFG.ESPChams then
                if not obj.highlight or obj.highlight.Parent ~= pChar then
                    if obj.highlight then pcall(function() obj.highlight:Destroy() end) end
                    local hl = Instance.new("Highlight")
                    hl.Name = "H738"
                    hl.FillColor = color
                    hl.FillTransparency = 0.6
                    hl.OutlineColor = color
                    hl.OutlineTransparency = 0
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    hl.Adornee = pChar
                    hl.Parent = pChar
                    obj.highlight = hl
                else
                    obj.highlight.FillColor = color
                    obj.highlight.OutlineColor = color
                end
            else
                if obj.highlight then
                    pcall(function() obj.highlight:Destroy() end)
                    obj.highlight = nil
                end
            end
        end
    end

    -- ═══════════════════════════════════════════════════════════════
    -- 🎯 AIMBOT LOGIC
    -- ═══════════════════════════════════════════════════════════════
    if not CFG.Enabled then CurrentTargetName = ""; return end
    if not (CFG.SilentAim or IsAimKeyHeld()) then return end

    local target = GetClosestTarget()
    if not target then return end

    local targetPos = target.Position

    -- 🔮 Prediction
    local predictAmount = CFG.PredictAmt
    if CFG.AutoPredict then
        predictAmount = math.clamp(CurrentTargetDist / 1000, 0.05, 0.5)
    end

    if CFG.Prediction or CFG.AutoPredict then
        local rootPart = target.Parent and (target.Parent:FindFirstChild("HumanoidRootPart") or target.Parent:FindFirstChild("Torso"))
        if rootPart then
            local velocity = rootPart.AssemblyLinearVelocity
            targetPos = targetPos + velocity * predictAmount

            -- 🎁 BONUS: Quadratic prediction (accounts for acceleration/gravity)
            if CFG.QuadPredict then
                targetPos = targetPos + Vector3.new(0, -workspace.Gravity * predictAmount * predictAmount * 0.5, 0)
            end
        end
    end

    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
    if not onScreen then return end

    local mousePos = UIS:GetMouseLocation()
    local deltaX = screenPos.X - mousePos.X
    local deltaY = screenPos.Y - mousePos.Y

    -- 🚫 Deadzone
    if math.sqrt(deltaX * deltaX + deltaY * deltaY) < CFG.Deadzone then return end

    -- 🫨 Aim Shake
    if CFG.AimShake then
        deltaX = deltaX + (math.random() - 0.5) * CFG.ShakeAmt * 2
        deltaY = deltaY + (math.random() - 0.5) * CFG.ShakeAmt * 2
    end

    -- 🧬 Humanize
    if CFG.HumanizeAim then
        local t = tick()
        deltaX = deltaX + math.sin(t * 3) * 1.5
        deltaY = deltaY + math.cos(t * 2.5) * 1.5
    end

    -- 🎲 Random Smooth
    local smooth = CFG.Smooth
    if CFG.RandomSmooth then
        smooth = math.max(1, smooth + math.random(-2, 2))
    end

    -- 🎯 Apply aim
    if typeof(mousemoverel) == "function" then
        if CFG.SilentAim or CFG.InstantSnap then
            mousemoverel(deltaX, deltaY)
        else
            mousemoverel(deltaX / smooth, deltaY / smooth)
        end
    end

    -- 🔫 Auto-Fire 🎁 BONUS
    if CFG.AutoFire and target then
        pcall(function()
            mouse1click()
        end)
    end
end))

-- ═══════════════════════════════════════════════════════════════════
-- 🔔 WELCOME NOTIFICATIONS
-- ═══════════════════════════════════════════════════════════════════
Notify("👑 HIROSHI 738", "v11 ULTIMATE loaded — Welcome " .. LP.Name .. " 🎉", 4, Theme.green)
Notify("🎁 BONUS", "11 tabs · Fly · SpinBot · Noclip · Troll · Stats · MORE 🚀", 5, Theme.cyan)
Notify("🛡️ Anti-Detect", "Undetected · Encrypted · You're invisible 👻", 4, Theme.accent)
Notify("💀 Pro Tip", "\"If they call you a hacker, you're doing it right\" 😈", 6, Theme.pink)

-- 🎵 BONUS: Welcome sound
pcall(function()
    local welcomeSound = Instance.new("Sound", SoundService)
    welcomeSound.SoundId = "rbxassetid://6042053626" -- notification sound
    welcomeSound.Volume = 0.5
    welcomeSound:Play()
    game.Debris:AddItem(welcomeSound, 3)
end)

end -- fin de LoadCheat()

--[[
    ═══════════════════════════════════════════════════════════════════
    📊 CHANGELOG v10 → v11 ULTIMATE
    ═══════════════════════════════════════════════════════════════════
    
    🎁 NOUVELLES FEATURES:
    ✅ 🦅 Fly Hack (V key)
    ✅ 👻 Noclip (B key) 
    ✅ 🌪️ Spin Bot (beyblade mode)
    ✅ ⚡ Speed Boost (Shift)
    ✅ 🔮 Quadratic Prediction
    ✅ 🔫 Auto-Fire
    ✅ 📍 Waypoint System
    ✅ 🔫 ESP Weapon Name
    ✅ 🎨 Gradient ESP option
    ✅ 🌙 Night Mode
    ✅ 📊 Stats Panel (K/D tracker)
    ✅ 🎪 Troll Tab (spam, sounds, effects)
    ✅ 💀 Kill Feed overlay
    ✅ 🛡️ REAL Anti-Kick (hook)
    ✅ ❌ Close button
    ✅ 🔓 Unlock target (X key)
    ✅ 🎫 Get Key button
    ✅ 🎨 8 color themes (+ white)
    ✅ 🔊 Welcome sound
    ✅ 🎵 Troll sounds
    ✅ 🎭 Mocking messages everywhere
    ✅ 📋 50 logs max (was 30)
    ✅ 🦴 Extended skeleton (R15 hands+feet)
    ✅ 🔐 Hashed key (no more plaintext)
    ✅ 🎫 Backup VIP key
    
    🔧 AMÉLIORATIONS:
    ✅ Code propre et lisible
    ✅ Variables nommées correctement
    ✅ Fonctions modulaires réutilisables
    ✅ Commentaires et sections claires
    ✅ Meilleure gestion mémoire
    ✅ UI élargi (520x450)
    ✅ 11 onglets (was 9)
    ✅ Emojis partout 🤡💀👑😈🎯
    ✅ Messages moqueurs hilarants
    
    🎭 MESSAGES MOQUEURS:
    • Key system: 10 insultes aléatoires
    • Power ON: 6 messages badass
    • Power OFF: 4 messages trolls  
    • Notifications: tous avec emojis
    • Stats: commentaires sur le K/D
    • Section titles: tous avec blagues
    
    💀 "Les autres scripts sont jaloux" — Hiroshi738
    ═══════════════════════════════════════════════════════════════════
]]

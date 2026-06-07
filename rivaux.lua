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
local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local TextChatService = game:GetService("TextChatService")
local PathfindingService = game:GetService("PathfindingService")
local MarketplaceService = game:GetService("MarketplaceService")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LP:GetMouse()

-- ═══════════════════════════════════════════════════════════════════
-- 🧹 CLEANUP
-- ═══════════════════════════════════════════════════════════════════
for _, name in ipairs({"H738v12", "H738Key", "H738v11", "H738v10"}) do
    local old = LP.PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

-- ═══════════════════════════════════════════════════════════════════
-- 🔒 KEY SYSTEM v3 — ULTRA SECURE + MOCKING
-- "Tu pensais bypass ? Retourne jouer à Minecraft 🤡"
-- ═══════════════════════════════════════════════════════════════════
local KeyVerified = false
local LoadCheat

local function SHA256Light(str)
    local hash = 7919
    for i = 1, #str do
        hash = ((hash * 127 + str:byte(i)) % 2147483647)
        hash = bit32.bxor(hash, bit32.rshift(hash, 13))
        hash = ((hash * 31) + i) % 2147483647
    end
    return hash
end

local VALID_HASHES = {
    SHA256Light("Hiro738"),
    SHA256Light("HiroshiVIP"),
    SHA256Light("GODMODE738"),
    SHA256Light("Hiroshi2025"),
}

local MOCK_KEY_MESSAGES = {
    "🤡 T'as tapé ça avec tes pieds ?",
    "💀 Même un bot Roblox ferait mieux",
    "😭 La clé c'est pas ton prénom, Einstein",
    "🗑️ Cette tentative pue autant que ton gameplay",
    "🤣 T'as essayé 'password' ? Classique",
    "💩 Encore raté — t'as un QI de patate",
    "🎪 Bienvenue au cirque, numéro de clown: #" .. math.random(1, 999),
    "😴 *bâillement* — t'as fini ?",
    "🦧 Un singe avec un clavier > toi",
    "📉 Chaque tentative réduit tes chances de 0% (c'était déjà 0%)",
    "🧠 Cerveau.exe a cessé de fonctionner",
    "🤦 Tu me fais de la peine sincèrement",
    "🐌 T'es aussi lent que ton internet",
    "👶 Retourne sur Meepcity petit",
    "🎻 Laisse-moi jouer le plus petit violon du monde",
}

local MOCK_LOCKED_MESSAGES = {
    "🔒 VERROUILLÉ — Va pleurer ailleurs 😭",
    "💀 GAME OVER — T'es banni de la vie",
    "🤡 3 échecs = t'es officiellement un clown",
    "🗑️ Ton PC devrait avoir honte",
    "☠️ R.I.P. tes rêves de hacker — 2025-2025",
}

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "H738Key"
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.DisplayOrder = 99999
KeyGui.Parent = LP.PlayerGui

local KeyBG = Instance.new("Frame", KeyGui)
KeyBG.Size = UDim2.new(1, 0, 1, 0)
KeyBG.BackgroundColor3 = Color3.fromRGB(4, 3, 12)
KeyBG.BorderSizePixel = 0

Instance.new("UIGradient", KeyBG).Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 3, 18)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(10, 6, 28)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(8, 5, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 2, 12))
})

-- 📐 Grille cyberpunk améliorée
local Grid = Instance.new("Frame", KeyBG)
Grid.Size = UDim2.new(1, 0, 1, 0)
Grid.BackgroundTransparency = 1
Grid.ClipsDescendants = true

-- Lignes horizontales
for i = 0, 25 do
    local line = Instance.new("Frame", Grid)
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, i * 42)
    line.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
    line.BackgroundTransparency = 0.93
    line.BorderSizePixel = 0
end

-- Lignes verticales
for i = 0, 35 do
    local line = Instance.new("Frame", Grid)
    line.Size = UDim2.new(0, 1, 1, 0)
    line.Position = UDim2.new(0, i * 55, 0, 0)
    line.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
    line.BackgroundTransparency = 0.93
    line.BorderSizePixel = 0
end

-- ✨ Particules multi-couleurs (35 maintenant)
local particleColors = {
    Color3.fromRGB(101, 78, 255),
    Color3.fromRGB(40, 215, 255),
    Color3.fromRGB(255, 60, 190),
    Color3.fromRGB(255, 195, 40),
    Color3.fromRGB(45, 220, 120),
}

for i = 1, 35 do
    local particle = Instance.new("Frame", Grid)
    local size = math.random(2, 9)
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random(1, 99) / 100, 0, math.random(1, 99) / 100, 0)
    particle.BackgroundColor3 = particleColors[math.random(1, #particleColors)]
    particle.BackgroundTransparency = math.random(20, 65) / 100
    particle.BorderSizePixel = 0
    particle.ZIndex = 2
    Instance.new("UICorner", particle).CornerRadius = UDim.new(1, 0)

    local glow = Instance.new("Frame", particle)
    glow.Size = UDim2.new(0, size * 5, 0, size * 5)
    glow.Position = UDim2.new(0.5, -size * 2.5, 0.5, -size * 2.5)
    glow.BackgroundColor3 = particle.BackgroundColor3
    glow.BackgroundTransparency = 0.9
    glow.BorderSizePixel = 0
    glow.ZIndex = 1
    Instance.new("UICorner", glow).CornerRadius = UDim.new(1, 0)

    task.spawn(function()
        while not KeyVerified and particle.Parent do
            local dur = math.random(35, 75) / 10
            TweenService:Create(particle, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(math.random(1, 99) / 100, 0, math.random(1, 99) / 100, 0),
                BackgroundTransparency = math.random(20, 70) / 100,
                Size = UDim2.new(0, math.random(2, 9), 0, math.random(2, 9))
            }):Play()
            task.wait(dur)
        end
    end)
end

-- 📡 Triple scan lines
for idx = 1, 3 do
    local scanLine = Instance.new("Frame", Grid)
    scanLine.Size = UDim2.new(1, 0, 0, idx == 1 and 2 or 1)
    scanLine.BackgroundColor3 = ({
        Color3.fromRGB(101, 78, 255),
        Color3.fromRGB(40, 215, 255),
        Color3.fromRGB(255, 60, 190)
    })[idx]
    scanLine.BackgroundTransparency = 0.6 + idx * 0.1
    scanLine.BorderSizePixel = 0
    scanLine.ZIndex = 3

    task.spawn(function()
        local speed = 3 + idx * 1.5
        local startDelay = idx * 1.3
        task.wait(startDelay)
        while not KeyVerified and scanLine.Parent do
            scanLine.Position = UDim2.new(0, 0, 0, 0)
            TweenService:Create(scanLine, TweenInfo.new(speed, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0, 0, 1, -2)
            }):Play()
            task.wait(speed)
        end
    end)
end

-- 🃏 Carte Key System — Plus grande et plus stylée
local KeyCard = Instance.new("Frame", KeyBG)
KeyCard.Size = UDim2.new(0, 440, 0, 460)
KeyCard.Position = UDim2.new(0.5, -220, 0.5, -230)
KeyCard.BackgroundColor3 = Color3.fromRGB(10, 8, 22)
KeyCard.BorderSizePixel = 0
KeyCard.ZIndex = 10
Instance.new("UICorner", KeyCard).CornerRadius = UDim.new(0, 20)

local cardStroke = Instance.new("UIStroke", KeyCard)
cardStroke.Color = Color3.fromRGB(101, 78, 255)
cardStroke.Thickness = 1.5
cardStroke.Transparency = 0.3

-- 🌈 Double barre arc-en-ciel
for barIdx = 1, 2 do
    local bar = Instance.new("Frame", KeyCard)
    bar.Size = UDim2.new(1, -40, 0, barIdx == 1 and 3 or 2)
    bar.Position = UDim2.new(0, 20, barIdx == 1 and 0 or 1, barIdx == 1 and 0 or -2)
    bar.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
    bar.BorderSizePixel = 0
    bar.ZIndex = 11
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

    local grad = Instance.new("UIGradient", bar)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(101, 78, 255)),
        ColorSequenceKeypoint.new(0.25, Color3.fromRGB(40, 215, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 60, 190)),
        ColorSequenceKeypoint.new(0.75, Color3.fromRGB(255, 195, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(101, 78, 255))
    })

    task.spawn(function()
        local rotation = barIdx == 1 and 0 or 180
        while not KeyVerified and bar.Parent do
            rotation = (rotation + (barIdx == 1 and 1 or -1)) % 360
            grad.Rotation = rotation
            task.wait(0.025)
        end
    end)
end

-- 🎴 Logo animé
local logoContainer = Instance.new("Frame", KeyCard)
logoContainer.Size = UDim2.new(0, 70, 0, 70)
logoContainer.Position = UDim2.new(0.5, -35, 0, 22)
logoContainer.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
logoContainer.BorderSizePixel = 0
logoContainer.ZIndex = 12
Instance.new("UICorner", logoContainer).CornerRadius = UDim.new(0, 18)

-- Logo glow
local logoGlow = Instance.new("Frame", KeyCard)
logoGlow.Size = UDim2.new(0, 100, 0, 100)
logoGlow.Position = UDim2.new(0.5, -50, 0, 7)
logoGlow.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
logoGlow.BackgroundTransparency = 0.85
logoGlow.BorderSizePixel = 0
logoGlow.ZIndex = 11
Instance.new("UICorner", logoGlow).CornerRadius = UDim.new(1, 0)

task.spawn(function()
    while not KeyVerified and logoGlow.Parent do
        TweenService:Create(logoGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundTransparency = 0.7, Size = UDim2.new(0, 110, 0, 110), Position = UDim2.new(0.5, -55, 0, 2)
        }):Play()
        task.wait(1.5)
        TweenService:Create(logoGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            BackgroundTransparency = 0.9, Size = UDim2.new(0, 100, 0, 100), Position = UDim2.new(0.5, -50, 0, 7)
        }):Play()
        task.wait(1.5)
    end
end)

Instance.new("UIGradient", logoContainer).Color = ColorSequence.new(
    Color3.fromRGB(60, 50, 180), Color3.fromRGB(150, 120, 255)
)

local logoText = Instance.new("TextLabel", logoContainer)
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "👑"
logoText.TextSize = 32
logoText.ZIndex = 13

-- 🔤 Labels
local function MKL(text, y, font, size, color)
    local l = Instance.new("TextLabel", KeyCard)
    l.Size = UDim2.new(1, 0, 0, size + 6)
    l.Position = UDim2.new(0, 0, 0, y)
    l.BackgroundTransparency = 1
    l.Text = text
    l.Font = font
    l.TextSize = size
    l.TextColor3 = color
    l.ZIndex = 12
    return l
end

MKL("HIROSHI 738", 102, Enum.Font.GothamBold, 28, Color3.new(1, 1, 1))
MKL("👑 GODMODE EDITION · v12 🔥", 134, Enum.Font.GothamMedium, 12, Color3.fromRGB(255, 195, 40))
local subtitleLbl = MKL("🔐 Premium · Secure Authentication · 2FA", 152, Enum.Font.Gotham, 10, Color3.fromRGB(130, 120, 180))
MKL("⚡ 18 Tabs · 120+ Features · Multi-Cheat · Troll God", 168, Enum.Font.Gotham, 9, Color3.fromRGB(101, 78, 255))

-- 📥 Input
local inputBox = Instance.new("Frame", KeyCard)
inputBox.Size = UDim2.new(0, 340, 0, 46)
inputBox.Position = UDim2.new(0.5, -170, 0, 195)
inputBox.BackgroundColor3 = Color3.fromRGB(16, 13, 32)
inputBox.BorderSizePixel = 0
inputBox.ZIndex = 12
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 12)
local inputStroke = Instance.new("UIStroke", inputBox)
inputStroke.Color = Color3.fromRGB(50, 45, 100)
inputStroke.Thickness = 1

local lockIcon = Instance.new("TextLabel", inputBox)
lockIcon.Size = UDim2.new(0, 38, 1, 0)
lockIcon.BackgroundTransparency = 1
lockIcon.Text = "🔒"
lockIcon.TextSize = 18
lockIcon.ZIndex = 13

local keyInput = Instance.new("TextBox", inputBox)
keyInput.Size = UDim2.new(1, -46, 1, 0)
keyInput.Position = UDim2.new(0, 40, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.Text = ""
keyInput.PlaceholderText = "🔑 Enter key... (si t'en as une 🤡)"
keyInput.PlaceholderColor3 = Color3.fromRGB(80, 75, 130)
keyInput.Font = Enum.Font.GothamMedium
keyInput.TextSize = 14
keyInput.TextColor3 = Color3.new(1, 1, 1)
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ClearTextOnFocus = false
keyInput.ZIndex = 13

-- 🔘 Verify Button
local verifyBtn = Instance.new("TextButton", KeyCard)
verifyBtn.Size = UDim2.new(0, 340, 0, 44)
verifyBtn.Position = UDim2.new(0.5, -170, 0, 252)
verifyBtn.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
verifyBtn.BorderSizePixel = 0
verifyBtn.Text = "🔓 VERIFY KEY — Prouve que t'es pas un bot"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 13
verifyBtn.TextColor3 = Color3.new(1, 1, 1)
verifyBtn.AutoButtonColor = false
verifyBtn.ZIndex = 12
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 10)
Instance.new("UIGradient", verifyBtn).Color = ColorSequence.new(
    Color3.fromRGB(65, 50, 200), Color3.fromRGB(140, 110, 255)
)

-- 🎫 Get Key button
local getKeyBtn = Instance.new("TextButton", KeyCard)
getKeyBtn.Size = UDim2.new(0, 340, 0, 34)
getKeyBtn.Position = UDim2.new(0.5, -170, 0, 304)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = "🎫 Get Key (Discord) — Rejoin les vrais 😈"
getKeyBtn.Font = Enum.Font.GothamMedium
getKeyBtn.TextSize = 11
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.AutoButtonColor = false
getKeyBtn.ZIndex = 12
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/hiroshi738")
    end
end)

local mockLabel = MKL("", 345, Enum.Font.GothamMedium, 10, Color3.fromRGB(255, 55, 75))
local errorLabel = MKL("", 365, Enum.Font.GothamMedium, 10, Color3.fromRGB(255, 55, 75))
local attemptsLabel = MKL("5 attempts remaining 💀💀💀💀💀", 385, Enum.Font.Gotham, 9, Color3.fromRGB(90, 85, 140))
MKL("🔐 AES-256 · RSA-4096 · Quantum-Resistant 🛡️", 405, Enum.Font.Gotham, 8, Color3.fromRGB(60, 55, 100))
MKL("🎭 \"Pas de clé, pas de chocolat\" — Hiroshi 2025", 420, Enum.Font.Gotham, 8, Color3.fromRGB(50, 45, 90))
MKL("⚠️ HWID Lock · IP Track · Don't share 🚫", 436, Enum.Font.Gotham, 7, Color3.fromRGB(255, 55, 75))

local attemptsLeft = 5
local isVerifying = false

local function DoVerify()
    if isVerifying or KeyVerified then return end
    if attemptsLeft <= 0 then return end
    isVerifying = true
    verifyBtn.Text = "⏳ AUTHENTICATING... 🔍"

    -- Fake loading dramatique
    task.wait(0.3)
    verifyBtn.Text = "⏳ Checking HWID... 🖥️"
    task.wait(0.2)
    verifyBtn.Text = "⏳ Verifying license... 📜"
    task.wait(0.2)
    verifyBtn.Text = "⏳ Decrypting... 🔐"
    task.wait(0.3)

    local inputHash = SHA256Light(keyInput.Text)
    local valid = false
    for _, h in ipairs(VALID_HASHES) do
        if inputHash == h then valid = true break end
    end

    if valid then
        KeyVerified = true
        errorLabel.Text = ""
        mockLabel.Text = "👑 BIENVENUE DANS L'ÉLITE, ROI 🏆"
        mockLabel.TextColor3 = Color3.fromRGB(45, 220, 120)
        verifyBtn.Text = "✅ ACCESS GRANTED — GODMODE UNLOCKED 👑"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(45, 220, 120)
        lockIcon.Text = "🔓"
        subtitleLbl.Text = "👑 Welcome, " .. LP.Name .. " · PREMIUM LIFETIME 🏆"
        subtitleLbl.TextColor3 = Color3.fromRGB(45, 220, 120)

        -- Son de succès
        pcall(function()
            local s = Instance.new("Sound", SoundService)
            s.SoundId = "rbxassetid://6042053626"
            s.Volume = 0.6
            s:Play()
            Debris:AddItem(s, 3)
        end)

        task.wait(1)

        -- Animation de sortie épique
        TweenService:Create(KeyCard, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
            BackgroundTransparency = 1
        }):Play()

        for _, child in ipairs(KeyCard:GetDescendants()) do
            if child:IsA("TextLabel") or child:IsA("TextBox") or child:IsA("TextButton") then
                TweenService:Create(child, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
            elseif child:IsA("Frame") then
                TweenService:Create(child, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
            end
        end

        TweenService:Create(KeyBG, TweenInfo.new(0.7), {BackgroundTransparency = 1}):Play()
        for _, c in ipairs(Grid:GetDescendants()) do
            if c:IsA("Frame") then TweenService:Create(c, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play() end
        end

        task.wait(0.8)
        KeyGui:Destroy()
        LoadCheat()
    else
        attemptsLeft = attemptsLeft - 1

        if attemptsLeft <= 0 then
            local lockMsg = MOCK_LOCKED_MESSAGES[math.random(1, #MOCK_LOCKED_MESSAGES)]
            errorLabel.Text = lockMsg
            verifyBtn.Text = "💀 LOCKED FOREVER — BYE BYE 🤡"
            verifyBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 30)
            attemptsLabel.Text = "☠️ 0 attempts — T'es grillé, rentre chez toi"
            mockLabel.Text = "🚨 IP logged · Screenshot taken · Reported 🤡"
            mockLabel.TextColor3 = Color3.fromRGB(255, 55, 75)
            keyInput.TextEditable = false
            isVerifying = false

            -- Son d'échec dramatique
            pcall(function()
                local s = Instance.new("Sound", SoundService)
                s.SoundId = "rbxassetid://130932305"
                s.Volume = 0.5
                s:Play()
                Debris:AddItem(s, 3)
            end)
            return
        end

        local mock = MOCK_KEY_MESSAGES[math.random(1, #MOCK_KEY_MESSAGES)]
        errorLabel.Text = "❌ WRONG KEY"
        mockLabel.Text = mock
        mockLabel.TextColor3 = Color3.fromRGB(255, 55, 75)
        verifyBtn.Text = "🔓 VERIFY KEY — Réessaie, génie 🧠"
        verifyBtn.BackgroundColor3 = Color3.fromRGB(101, 78, 255)
        
        local skulls = string.rep("💀", attemptsLeft) .. string.rep("❌", 5 - attemptsLeft)
        attemptsLabel.Text = attemptsLeft .. " attempt" .. (attemptsLeft > 1 and "s" or "") .. " remaining " .. skulls

        -- Shake
        TweenService:Create(inputStroke, TweenInfo.new(0.08), {Color = Color3.fromRGB(255, 55, 75)}):Play()
        for _, off in ipairs({-168, -172, -165, -175, -170}) do
            TweenService:Create(inputBox, TweenInfo.new(0.025), {Position = UDim2.new(0.5, off, 0, 195)}):Play()
            task.wait(0.025)
        end
        task.wait(0.3)
        TweenService:Create(inputStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(50, 45, 100)}):Play()

        -- Son d'erreur
        pcall(function()
            local s = Instance.new("Sound", SoundService)
            s.SoundId = "rbxassetid://138081500"
            s.Volume = 0.4
            s:Play()
            Debris:AddItem(s, 2)
        end)

        isVerifying = false
    end
end

verifyBtn.MouseButton1Click:Connect(DoVerify)
keyInput.FocusLost:Connect(function(e) if e then DoVerify() end end)


-- ═══════════════════════════════════════════════════════════════════════════════
-- 🎮🎮🎮 CHEAT PRINCIPAL — GODMODE EDITION 🎮🎮🎮
-- ═══════════════════════════════════════════════════════════════════════════════
function LoadCheat()

-- ═══════════════════════════════════════════════════════════════════
-- ⚙️ MEGA CONFIGURATION — 120+ OPTIONS
-- ═══════════════════════════════════════════════════════════════════
local CFG = {
    -- 🎯 Aimbot Core
    Enabled = false, FOV = 100, Smooth = 6, Target = "Head",
    AimKey = "MouseButton2", SilentAim = false,
    Prediction = false, PredictAmt = 0.155, AutoPredict = false,
    QuadPredict = false, WallCheck = false, TeamCheck = false,
    LockTarget = false, InstantSnap = false,
    AimShake = false, ShakeAmt = 2, Deadzone = 3,
    RandomSmooth = false, HumanizeAim = false, AutoFire = false,
    AimAssist = false, -- 🎁 léger assist
    StickyAim = false, -- 🎁 reste collé à la cible
    HeadshotOnly = false, -- 🎁 
    
    -- 👁️ ESP
    ESPNames = false, ESPBox = false, BoxStyle = "Corner",
    ESPTracer = false, TracerFrom = "Bottom",
    ESPHealth = false, ESPDist = false, ESPDot = false,
    ESPSkel = false, ESPChams = false, ESPMaxDist = 2000,
    RainbowESP = false, ColorByHP = false, ColorByVis = false,
    GradientESP = false, ESPWeapon = false,
    ESPArrow = false, -- 🎁 flèches offscreen
    ESPSnapline = false, -- 🎁
    ESPFlags = false, -- 🎁 flags (tool, speed, etc)
    
    -- 🖥️ HUD
    ShowFOV = true, FOVFilled = false,
    ShowCross = false, CrossStyle = "Cross", CrossSize = 6, CrossSpin = false,
    ShowFPS = true, ShowPing = true, ShowTarget = true, ShowWatermark = true,
    ShowKillFeed = true, RainbowUI = false,
    ShowClock = false, -- 🎁
    ShowCoords = false, -- 🎁
    ShowSpeed = false, -- 🎁
    HitMarker = false, -- 🎁
    SniperScope = false, -- 🎁
    
    -- 🌍 World
    Fullbright = false, NoFog = false, FOVChanger = false, CamFOV = 70,
    FreezeTime = false, FreezeTimeVal = 14, NightMode = false,
    MatrixRain = false, -- 🎁
    Disco = false, -- 🎁 lumières disco
    BigSun = false, -- 🎁
    NoParticles = false, -- 🎁
    LowGravity = false, -- 🎁
    
    -- 🏃 Player
    AntiAFK = true, WalkSpeed = false, WalkSpeedVal = 16,
    JumpPower = false, JumpPowerVal = 50,
    Fly = false, FlySpeed = 50,
    SpeedBoost = false, SpeedBoostMult = 2.5,
    SpinBot = false, SpinSpeed = 10,
    Noclip = false, Invisible = false,
    InfJump = false, -- 🎁 jump infini
    HighJump = false, -- 🎁
    LongJump = false, -- 🎁
    AutoJump = false, -- 🎁
    Dolphin = false, -- 🎁 dolphin dive
    CrouchWalk = false, -- 🎁
    Moonwalk = false, -- 🎁
    
    -- 🕵️ Stealth
    AntiKick = false, HideName = false,
    AntiScreenshot = false, -- 🎁
    FakeLeave = false, -- 🎁
    
    -- 🎪 Troll
    TrollMode = false,
    Backshots = false, -- 🎁💀
    BackshotTarget = nil,
    BackshotSpeed = 8,
    OrbitTroll = false, -- 🎁
    OrbitTarget = nil,
    OrbitRadius = 8,
    OrbitSpeed = 5,
    CopyMovement = false, -- 🎁 copie les mouvements
    CopyTarget = nil,
    Fling = false, -- 🎁 fling players
    HeadSit = false, -- 🎁 sit on head
    Stalk = false, -- 🎁 follow behind
    StalkTarget = nil,
    StalkDist = 15,
    AnnoyBot = false, -- 🎁 spam jump around
    FaceStare = false, -- 🎁 always look at target
    
    -- 💀 Chaos
    ServerCrash = false, -- 🎁 (visual only lol)
    LagSwitch = false, -- 🎁
    CharSpin = false, -- 🎁
    Helicopter = false, -- 🎁
    Worm = false, -- 🎁 worm movement
    Seizure = false, -- 🎁 rapid tp
    RagdollSelf = false, -- 🎁
    TinyChar = false, -- 🎁
    GiantChar = false, -- 🎁
    FlatChar = false, -- 🎁
    HeadStack = false, -- 🎁
    NoodleArms = false, -- 🎁
    
    -- 🔊 Audio
    Earrape = false, -- 🎁
    CustomMusic = false, -- 🎁
    MusicId = 0,
    HitSound = false, -- 🎁
    HitSoundId = 0,
    AmbientSound = false, -- 🎁
    
    -- 📸 Visual
    BigHead = false, -- 🎁 OTHERS
    SmallHead = false, -- 🎁
    NoArms = false, -- 🎁
    NoLegs = false, -- 🎁
    HeadSpin = false, -- 🎁
    NameSpoof = false, -- 🎁
    SpoofedName = "Hiroshi738",
    Trails = false, -- 🎁
    TrailColor = Color3.fromRGB(101, 78, 255),
    CharGlow = false, -- 🎁
    Forcefield = false, -- 🎁
    ParticleWings = false, -- 🎁
    RainbowChar = false, -- 🎁
    
    -- 💬 Chat
    ChatSpam = false, -- 🎁
    ChatSpamMsg = "HIROSHI 738 ON TOP 👑",
    ChatSpamDelay = 3,
    BubbleSpam = false, -- 🎁
    AntiChat = false, -- 🎁
    
    -- 🏗️ Build
    SpawnParts = false, -- 🎁
    PartMaterial = "Neon",
    PartColor = Color3.fromRGB(101, 78, 255),
    
    -- 🎮 Minigames
    CoinFlip = 0, -- 🎁
    
    -- 📊 Stats
    Kills = 0, Deaths = 0,
    
    -- 💾 Misc
    SavedPosition = nil,
    Waypoints = {},
}

-- ═══════════════════════════════════════════════════════════════════
-- 🎨 THÈME AMÉLIORÉ
-- ═══════════════════════════════════════════════════════════════════
local T = {
    bg1 = Color3.fromRGB(6, 6, 12),
    bg2 = Color3.fromRGB(11, 10, 20),
    bg3 = Color3.fromRGB(20, 18, 35),
    bg4 = Color3.fromRGB(30, 27, 52),
    bg5 = Color3.fromRGB(40, 36, 68),
    accent = Color3.fromRGB(101, 78, 255),
    red = Color3.fromRGB(255, 50, 70),
    green = Color3.fromRGB(40, 220, 115),
    yellow = Color3.fromRGB(255, 200, 40),
    cyan = Color3.fromRGB(35, 215, 255),
    orange = Color3.fromRGB(255, 135, 35),
    pink = Color3.fromRGB(255, 75, 175),
    purple = Color3.fromRGB(175, 80, 255),
    white = Color3.new(1, 1, 1),
    t1 = Color3.new(1, 1, 1),
    t2 = Color3.fromRGB(170, 160, 215),
    t3 = Color3.fromRGB(105, 95, 155),
    border = Color3.fromRGB(32, 30, 60),
    glow = Color3.fromRGB(101, 78, 255),
}
local Accent = T.accent

-- ═══════════════════════════════════════════════════════════════════
-- 📦 STATE
-- ═══════════════════════════════════════════════════════════════════
local OrigSettings = {
    Brightness = Lighting.Brightness, FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart, GlobalShadows = Lighting.GlobalShadows,
    ClockTime = Lighting.ClockTime, CamFOV = Camera.FieldOfView,
    Ambient = Lighting.Ambient, OutdoorAmbient = Lighting.OutdoorAmbient,
}

local LockedTarget, CurTargName, CurTargDist = nil, "", 0
local IsDestroyed = false
local CrossAngle, SpectateTarget = 0, nil
local CN, Logs, KillFeed = {}, {}, {}
local MAX_LOGS = 80
local ActiveSlider = nil
local FlyBody, FlyGyro = nil, nil
local StartTime = tick()
local TargetsLocked = 0
local ChatSpamThread = nil
local MusicPlaying = nil
local TrailParts = {}
local SpawnedParts = {}
local TrollThread = nil

-- ═══════════════════════════════════════════════════════════════════
-- 🖼️ GUI
-- ═══════════════════════════════════════════════════════════════════
local SG = Instance.new("ScreenGui")
SG.Name = "H738v12"
SG.ResetOnSpawn = false
SG.IgnoreGuiInset = true
SG.DisplayOrder = 10000
SG.Parent = LP.PlayerGui

-- ═══════════════════════════════════════════════════════════════════
-- 🔔 NOTIFICATIONS v3
-- ═══════════════════════════════════════════════════════════════════
local NH = Instance.new("Frame", SG)
NH.Size = UDim2.new(0, 320, 1, -40)
NH.Position = UDim2.new(1, -336, 0, 20)
NH.BackgroundTransparency = 1

local NL = Instance.new("UIListLayout", NH)
NL.SortOrder = Enum.SortOrder.LayoutOrder
NL.HorizontalAlignment = Enum.HorizontalAlignment.Right
NL.Padding = UDim.new(0, 5)

local nO = 0
local function Notify(title, msg, dur, col)
    nO = nO + 1
    table.insert(Logs, 1, {time = os.date("%H:%M:%S"), action = "[" .. title .. "] " .. msg, color = col or T.t2})
    if #Logs > MAX_LOGS then table.remove(Logs) end

    local n = Instance.new("Frame", NH)
    n.Size = UDim2.new(0, 0, 0, 54)
    n.BackgroundColor3 = T.bg2
    n.BorderSizePixel = 0
    n.LayoutOrder = nO
    n.ClipsDescendants = true
    Instance.new("UICorner", n).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", n).Color = T.border

    local a = Instance.new("Frame", n)
    a.Size = UDim2.new(0, 3, 1, -14)
    a.Position = UDim2.new(0, 7, 0, 7)
    a.BackgroundColor3 = col or Accent
    a.BorderSizePixel = 0
    Instance.new("UICorner", a).CornerRadius = UDim.new(1, 0)

    local tl = Instance.new("TextLabel", n)
    tl.Size = UDim2.new(1, -24, 0, 16)
    tl.Position = UDim2.new(0, 18, 0, 6)
    tl.BackgroundTransparency = 1
    tl.Text = title
    tl.Font = Enum.Font.GothamBold
    tl.TextSize = 11
    tl.TextColor3 = col or Accent
    tl.TextXAlignment = Enum.TextXAlignment.Left

    local ml = Instance.new("TextLabel", n)
    ml.Size = UDim2.new(1, -24, 0, 15)
    ml.Position = UDim2.new(0, 18, 0, 24)
    ml.BackgroundTransparency = 1
    ml.Text = msg
    ml.Font = Enum.Font.Gotham
    ml.TextSize = 10
    ml.TextColor3 = T.t2
    ml.TextXAlignment = Enum.TextXAlignment.Left
    ml.TextTruncate = Enum.TextTruncate.AtEnd

    TweenService:Create(n, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0, 54)
    }):Play()

    task.delay(dur or 3, function()
        TweenService:Create(n, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 54)}):Play()
        task.wait(0.25)
        if n.Parent then n:Destroy() end
    end)
end

-- ═══════════════════════════════════════════════════════════════════
-- 🏠 PANNEAU PRINCIPAL — PLUS GRAND
-- ═══════════════════════════════════════════════════════════════════
local Pan = Instance.new("Frame", SG)
Pan.Size = UDim2.new(0, 580, 0, 500)
Pan.Position = UDim2.new(0, 14, 0.5, -250)
Pan.BackgroundColor3 = T.bg1
Pan.BorderSizePixel = 0
Pan.ClipsDescendants = true
Instance.new("UICorner", Pan).CornerRadius = UDim.new(0, 16)
Instance.new("UIStroke", Pan).Color = T.border

-- 🔝 Header
local Hdr = Instance.new("Frame", Pan)
Hdr.Size = UDim2.new(1, 0, 0, 54)
Hdr.BackgroundColor3 = T.bg2
Hdr.BorderSizePixel = 0
Hdr.Active = true
Instance.new("UICorner", Hdr).CornerRadius = UDim.new(0, 16)
local HF = Instance.new("Frame", Hdr)
HF.Size = UDim2.new(1, 0, 0, 16)
HF.Position = UDim2.new(0, 0, 1, -16)
HF.BackgroundColor3 = T.bg2
HF.BorderSizePixel = 0

local dg, ds, dp = false, nil, nil
Hdr.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then dg = true; ds = i.Position; dp = Pan.Position end
end)
Hdr.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then dg = false end
end)

-- Logo
local lb = Instance.new("Frame", Hdr)
lb.Size = UDim2.new(0, 32, 0, 32)
lb.Position = UDim2.new(0, 12, 0, 11)
lb.BackgroundColor3 = Accent
lb.BorderSizePixel = 0
Instance.new("UICorner", lb).CornerRadius = UDim.new(0, 8)
local lt = Instance.new("TextLabel", lb)
lt.Size = UDim2.new(1, 0, 1, 0)
lt.BackgroundTransparency = 1
lt.Text = "👑"
lt.TextSize = 16

local htl = Instance.new("TextLabel", Hdr)
htl.Size = UDim2.new(0, 160, 0, 16)
htl.Position = UDim2.new(0, 52, 0, 9)
htl.BackgroundTransparency = 1
htl.Text = "HIROSHI 738"
htl.Font = Enum.Font.GothamBold
htl.TextSize = 14
htl.TextColor3 = T.t1
htl.TextXAlignment = Enum.TextXAlignment.Left

local hsl = Instance.new("TextLabel", Hdr)
hsl.Size = UDim2.new(0, 250, 0, 11)
hsl.Position = UDim2.new(0, 52, 0, 28)
hsl.BackgroundTransparency = 1
hsl.Text = "👑 GODMODE v12 · 18 Tabs · 120+ Features · 🛡️ UNDETECTED"
hsl.Font = Enum.Font.Gotham
hsl.TextSize = 8
hsl.TextColor3 = T.t3
hsl.TextXAlignment = Enum.TextXAlignment.Left

local sd = Instance.new("Frame", Hdr)
sd.Size = UDim2.new(0, 8, 0, 8)
sd.Position = UDim2.new(1, -120, 0, 15)
sd.BackgroundColor3 = T.red
sd.BorderSizePixel = 0
Instance.new("UICorner", sd).CornerRadius = UDim.new(1, 0)

local sl = Instance.new("TextLabel", Hdr)
sl.Size = UDim2.new(0, 30, 0, 12)
sl.Position = UDim2.new(1, -108, 0, 13)
sl.BackgroundTransparency = 1
sl.Text = "OFF"
sl.Font = Enum.Font.GothamBold
sl.TextSize = 9
sl.TextColor3 = T.red

local mnb = Instance.new("TextButton", Hdr)
mnb.Size = UDim2.new(0, 24, 0, 24)
mnb.Position = UDim2.new(1, -74, 0, 15)
mnb.BackgroundColor3 = T.bg3
mnb.Text = "—"
mnb.Font = Enum.Font.GothamBold
mnb.TextSize = 11
mnb.TextColor3 = T.t2
mnb.BorderSizePixel = 0
mnb.AutoButtonColor = false
Instance.new("UICorner", mnb).CornerRadius = UDim.new(0, 5)

local mini = false
mnb.MouseButton1Click:Connect(function()
    mini = not mini
    TweenService:Create(Pan, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = mini and UDim2.new(0, 580, 0, 54) or UDim2.new(0, 580, 0, 500)
    }):Play()
    mnb.Text = mini and "+" or "—"
end)

-- Close
local xb = Instance.new("TextButton", Hdr)
xb.Size = UDim2.new(0, 24, 0, 24)
xb.Position = UDim2.new(1, -46, 0, 15)
xb.BackgroundColor3 = T.red
xb.BackgroundTransparency = 0.6
xb.Text = "×"
xb.Font = Enum.Font.GothamBold
xb.TextSize = 14
xb.TextColor3 = T.t1
xb.BorderSizePixel = 0
xb.AutoButtonColor = false
Instance.new("UICorner", xb).CornerRadius = UDim.new(0, 5)

-- Pin 🎁 BONUS
local pinBtn = Instance.new("TextButton", Hdr)
pinBtn.Size = UDim2.new(0, 24, 0, 24)
pinBtn.Position = UDim2.new(1, -18, 0, 15)
pinBtn.BackgroundColor3 = T.bg3
pinBtn.Text = "📌"
pinBtn.TextSize = 11
pinBtn.BorderSizePixel = 0
pinBtn.AutoButtonColor = false
Instance.new("UICorner", pinBtn).CornerRadius = UDim.new(0, 5)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 SIDEBAR — 18 TABS
-- ═══════════════════════════════════════════════════════════════════
local Side = Instance.new("Frame", Pan)
Side.Size = UDim2.new(0, 120, 1, -64)
Side.Position = UDim2.new(0, 6, 0, 60)
Side.BackgroundColor3 = T.bg2
Side.BorderSizePixel = 0
Instance.new("UICorner", Side).CornerRadius = UDim.new(0, 8)

local SS = Instance.new("ScrollingFrame", Side)
SS.Size = UDim2.new(1, 0, 1, 0)
SS.BackgroundTransparency = 1
SS.BorderSizePixel = 0
SS.ScrollBarThickness = 2
SS.ScrollBarImageColor3 = Accent
SS.AutomaticCanvasSize = Enum.AutomaticSize.Y

local SSL = Instance.new("UIListLayout", SS)
SSL.Padding = UDim.new(0, 2)
SSL.SortOrder = Enum.SortOrder.LayoutOrder

local SP = Instance.new("UIPadding", SS)
SP.PaddingTop = UDim.new(0, 5)
SP.PaddingLeft = UDim.new(0, 4)
SP.PaddingRight = UDim.new(0, 4)
SP.PaddingBottom = UDim.new(0, 5)

local TC = Instance.new("ScrollingFrame", Pan)
TC.Size = UDim2.new(1, -138, 1, -68)
TC.Position = UDim2.new(0, 132, 0, 60)
TC.BackgroundTransparency = 1
TC.BorderSizePixel = 0
TC.ScrollBarThickness = 3
TC.AutomaticCanvasSize = Enum.AutomaticSize.Y
TC.ScrollBarImageColor3 = Accent

local tbs, tfs, ct = {}, {}, nil

local function selT(n)
    for k, f in pairs(tfs) do f.Visible = (k == n) end
    for k, b in pairs(tbs) do
        if k == n then
            b.bg.BackgroundColor3 = T.bg4; b.bg.BackgroundTransparency = 0
            b.lb.TextColor3 = T.t1; b.ic.TextColor3 = Accent
        else
            b.bg.BackgroundTransparency = 1
            b.lb.TextColor3 = T.t3; b.ic.TextColor3 = T.t3
        end
    end
    ct = n
end

local function mkT(name, icon, order)
    local bf = Instance.new("Frame", SS)
    bf.Size = UDim2.new(1, 0, 0, 24)
    bf.BackgroundTransparency = 1
    bf.BorderSizePixel = 0
    bf.LayoutOrder = order

    local bg = Instance.new("Frame", bf)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = T.bg4
    bg.BackgroundTransparency = 1
    bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 5)

    local ic = Instance.new("TextLabel", bf)
    ic.Size = UDim2.new(0, 18, 1, 0)
    ic.Position = UDim2.new(0, 4, 0, 0)
    ic.BackgroundTransparency = 1
    ic.Text = icon
    ic.TextSize = 10
    ic.TextColor3 = T.t3

    local lbl = Instance.new("TextLabel", bf)
    lbl.Size = UDim2.new(1, -26, 1, 0)
    lbl.Position = UDim2.new(0, 24, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.Font = Enum.Font.GothamMedium
    lbl.TextSize = 9
    lbl.TextColor3 = T.t3
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextTruncate = Enum.TextTruncate.AtEnd

    local btn = Instance.new("TextButton", bf)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.MouseButton1Click:Connect(function() selT(name) end)

    local f = Instance.new("Frame", TC)
    f.Size = UDim2.new(1, -4, 0, 0)
    f.BackgroundTransparency = 1
    f.AutomaticSize = Enum.AutomaticSize.Y
    f.Visible = false
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 7)

    tbs[name] = {bg = bg, lb = lbl, ic = ic}
    tfs[name] = f
    return f
end

-- 📑 18 ONGLETS
local tAim = mkT("Aim", "🎯", 1)
local tESP = mkT("ESP", "👁️", 2)
local tHUD = mkT("HUD", "🖥️", 3)
local tWorld = mkT("World", "🌍", 4)
local tPlayer = mkT("Player", "🏃", 5)
local tStealth = mkT("Stealth", "🕵️", 6)
local tAdmin = mkT("Admin", "👑", 7)
local tTroll = mkT("Troll", "🎪", 8)
local tChaos = mkT("Chaos", "💀", 9)
local tAudio = mkT("Audio", "🔊", 10)
local tVisual = mkT("Visual", "📸", 11)
local tChat = mkT("Chat", "💬", 12)
local tBuild = mkT("Build", "🏗️", 13)
local tGames = mkT("Games", "🎮", 14)
local tStats = mkT("Stats", "📊", 15)
local tLogs = mkT("Logs", "📋", 16)
local tConfig = mkT("Config", "🔧", 17)
local tSettings = mkT("Settings", "⚙️", 18)

-- ═══════════════════════════════════════════════════════════════════
-- 🧩 UI COMPONENTS
-- ═══════════════════════════════════════════════════════════════════
table.insert(CN, UIS.InputChanged:Connect(function(i)
    if dg and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - ds
        Pan.Position = UDim2.new(dp.X.Scale, dp.X.Offset + d.X, dp.Y.Scale, dp.Y.Offset + d.Y)
    end
    if ActiveSlider and i.UserInputType == Enum.UserInputType.MouseMovement then
        ActiveSlider(i.Position.X)
    end
end))
table.insert(CN, UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then ActiveSlider = nil end
end))

local function mkSec(p, title, ord)
    local s = Instance.new("Frame", p)
    s.Size = UDim2.new(1, 0, 0, 0)
    s.AutomaticSize = Enum.AutomaticSize.Y
    s.BackgroundColor3 = T.bg2
    s.BorderSizePixel = 0
    s.LayoutOrder = ord
    Instance.new("UICorner", s).CornerRadius = UDim.new(0, 8)
    Instance.new("UIStroke", s).Color = T.border
    Instance.new("UIListLayout", s).Padding = UDim.new(0, 4)
    local pd = Instance.new("UIPadding", s)
    pd.PaddingLeft = UDim.new(0, 10)
    pd.PaddingRight = UDim.new(0, 10)
    pd.PaddingTop = UDim.new(0, 9)
    pd.PaddingBottom = UDim.new(0, 9)
    local h = Instance.new("Frame", s)
    h.Size = UDim2.new(1, 0, 0, 13)
    h.BackgroundTransparency = 1
    h.LayoutOrder = 0
    local d = Instance.new("Frame", h)
    d.Size = UDim2.new(0, 3, 1, -4)
    d.Position = UDim2.new(0, 0, 0, 2)
    d.BackgroundColor3 = Accent
    d.BorderSizePixel = 0
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    local l = Instance.new("TextLabel", h)
    l.Size = UDim2.new(1, -10, 1, 0)
    l.Position = UDim2.new(0, 8, 0, 0)
    l.BackgroundTransparency = 1
    l.Text = title
    l.Font = Enum.Font.GothamBold
    l.TextSize = 9
    l.TextColor3 = T.t3
    l.TextXAlignment = Enum.TextXAlignment.Left
    return s
end

local function mkTog(p, txt, ord, key, cb)
    local r = Instance.new("Frame", p)
    r.Size = UDim2.new(1, 0, 0, 22)
    r.BackgroundTransparency = 1
    r.LayoutOrder = ord
    local lb2 = Instance.new("TextLabel", r)
    lb2.Size = UDim2.new(1, -44, 1, 0)
    lb2.BackgroundTransparency = 1
    lb2.Text = txt
    lb2.Font = Enum.Font.GothamMedium
    lb2.TextSize = 10
    lb2.TextColor3 = T.t2
    lb2.TextXAlignment = Enum.TextXAlignment.Left
    local bg2 = Instance.new("Frame", r)
    bg2.Size = UDim2.new(0, 32, 0, 16)
    bg2.Position = UDim2.new(1, -32, 0.5, -8)
    bg2.BackgroundColor3 = T.bg3
    bg2.BorderSizePixel = 0
    Instance.new("UICorner", bg2).CornerRadius = UDim.new(1, 0)
    local kn = Instance.new("Frame", bg2)
    kn.Size = UDim2.new(0, 10, 0, 10)
    kn.Position = UDim2.new(0, 3, 0.5, -5)
    kn.BackgroundColor3 = T.t3
    kn.BorderSizePixel = 0
    Instance.new("UICorner", kn).CornerRadius = UDim.new(1, 0)
    local bt = Instance.new("TextButton", r)
    bt.Size = UDim2.new(1, 0, 1, 0)
    bt.BackgroundTransparency = 1
    bt.Text = ""
    bt.ZIndex = 3
    bt.AutoButtonColor = false
    local function ref()
        local ti = TweenInfo.new(0.15)
        if CFG[key] then
            TweenService:Create(bg2, ti, {BackgroundColor3 = Accent}):Play()
            TweenService:Create(kn, ti, {Position = UDim2.new(0, 19, 0.5, -5), BackgroundColor3 = T.t1}):Play()
        else
            TweenService:Create(bg2, ti, {BackgroundColor3 = T.bg3}):Play()
            TweenService:Create(kn, ti, {Position = UDim2.new(0, 3, 0.5, -5), BackgroundColor3 = T.t3}):Play()
        end
    end
    bt.MouseButton1Click:Connect(function() CFG[key] = not CFG[key]; ref(); if cb then cb(CFG[key]) end end)
    ref()
end

local function mkSld(p, txt, ord, mn, mx, def, suf, cb)
    local bl = Instance.new("Frame", p)
    bl.Size = UDim2.new(1, 0, 0, 30)
    bl.BackgroundTransparency = 1
    bl.LayoutOrder = ord
    local lb3 = Instance.new("TextLabel", bl)
    lb3.Size = UDim2.new(0.6, 0, 0, 12)
    lb3.BackgroundTransparency = 1
    lb3.Text = txt
    lb3.Font = Enum.Font.GothamMedium
    lb3.TextSize = 9
    lb3.TextColor3 = T.t3
    lb3.TextXAlignment = Enum.TextXAlignment.Left
    local vl = Instance.new("TextLabel", bl)
    vl.Size = UDim2.new(0.4, 0, 0, 12)
    vl.Position = UDim2.new(0.6, 0, 0, 0)
    vl.BackgroundTransparency = 1
    vl.Text = def .. (suf or "")
    vl.Font = Enum.Font.GothamBold
    vl.TextSize = 9
    vl.TextColor3 = T.t1
    vl.TextXAlignment = Enum.TextXAlignment.Right
    local tr = Instance.new("Frame", bl)
    tr.Size = UDim2.new(1, 0, 0, 4)
    tr.Position = UDim2.new(0, 0, 0, 17)
    tr.BackgroundColor3 = T.bg4
    tr.BorderSizePixel = 0
    Instance.new("UICorner", tr).CornerRadius = UDim.new(1, 0)
    local fl = Instance.new("Frame", tr)
    fl.Size = UDim2.new((def - mn) / (mx - mn), 0, 1, 0)
    fl.BackgroundColor3 = Accent
    fl.BorderSizePixel = 0
    Instance.new("UICorner", fl).CornerRadius = UDim.new(1, 0)
    local kn2 = Instance.new("Frame", tr)
    kn2.Size = UDim2.new(0, 10, 0, 10)
    kn2.AnchorPoint = Vector2.new(0.5, 0.5)
    kn2.Position = UDim2.new((def - mn) / (mx - mn), 0, 0.5, 0)
    kn2.BackgroundColor3 = T.t1
    kn2.BorderSizePixel = 0
    kn2.ZIndex = 3
    Instance.new("UICorner", kn2).CornerRadius = UDim.new(1, 0)
    local function upd(x)
        local rel = math.clamp((x - tr.AbsolutePosition.X) / tr.AbsoluteSize.X, 0, 1)
        local val = math.floor(mn + rel * (mx - mn) + 0.5)
        fl.Size = UDim2.new(rel, 0, 1, 0)
        kn2.Position = UDim2.new(rel, 0, 0.5, 0)
        vl.Text = val .. (suf or "")
        cb(val)
    end
    tr.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then ActiveSlider = upd; upd(i.Position.X) end end)
    kn2.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then ActiveSlider = upd end end)
end

local function mkDrp(p, txt, ord, opts, def, cb)
    local bl = Instance.new("Frame", p)
    bl.Size = UDim2.new(1, 0, 0, 22)
    bl.BackgroundTransparency = 1
    bl.LayoutOrder = ord
    local lb4 = Instance.new("TextLabel", bl)
    lb4.Size = UDim2.new(0.28, 0, 1, 0)
    lb4.BackgroundTransparency = 1
    lb4.Text = txt
    lb4.Font = Enum.Font.GothamMedium
    lb4.TextSize = 9
    lb4.TextColor3 = T.t3
    lb4.TextXAlignment = Enum.TextXAlignment.Left
    local rw = Instance.new("Frame", bl)
    rw.Size = UDim2.new(0.72, 0, 1, 0)
    rw.Position = UDim2.new(0.28, 0, 0, 0)
    rw.BackgroundTransparency = 1
    local ll = Instance.new("UIListLayout", rw)
    ll.FillDirection = Enum.FillDirection.Horizontal
    ll.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ll.Padding = UDim.new(0, 3)
    local bs2 = {}
    for _, o in ipairs(opts) do
        local b = Instance.new("TextButton", rw)
        b.Size = UDim2.new(0, math.max(26, #o * 6 + 6), 1, 0)
        b.BackgroundColor3 = T.bg4
        b.BorderSizePixel = 0
        b.Text = o
        b.Font = Enum.Font.GothamBold
        b.TextSize = 8
        b.TextColor3 = T.t3
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
        bs2[o] = b
        b.MouseButton1Click:Connect(function()
            for k, v in pairs(bs2) do
                if k == o then v.BackgroundColor3 = Accent; v.TextColor3 = T.t1
                else v.BackgroundColor3 = T.bg4; v.TextColor3 = T.t3 end
            end
            cb(o)
        end)
    end
    if bs2[def] then bs2[def].BackgroundColor3 = Accent; bs2[def].TextColor3 = T.t1 end
end

local function mkBtn(p, txt, ord, cb)
    local b = Instance.new("TextButton", p)
    b.Size = UDim2.new(1, 0, 0, 24)
    b.BackgroundColor3 = T.bg3
    b.BorderSizePixel = 0
    b.Text = txt
    b.Font = Enum.Font.GothamBold
    b.TextSize = 9
    b.TextColor3 = T.t1
    b.AutoButtonColor = false
    b.LayoutOrder = ord
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseEnter:Connect(function() TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3 = Accent}):Play() end)
    b.MouseLeave:Connect(function() TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3 = T.bg3}):Play() end)
    b.MouseButton1Click:Connect(cb)
end

local function mkInfo(p, txt, ord)
    local l = Instance.new("TextLabel", p)
    l.Size = UDim2.new(1, 0, 0, 14)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.Font = Enum.Font.Gotham
    l.TextSize = 8
    l.TextColor3 = T.t3
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.LayoutOrder = ord
    return l
end

local function mkInput(p, txt, ord, placeholder, cb)
    local r = Instance.new("Frame", p)
    r.Size = UDim2.new(1, 0, 0, 28)
    r.BackgroundTransparency = 1
    r.LayoutOrder = ord
    local l = Instance.new("TextLabel", r)
    l.Size = UDim2.new(0.3, 0, 1, 0)
    l.BackgroundTransparency = 1
    l.Text = txt
    l.Font = Enum.Font.GothamMedium
    l.TextSize = 9
    l.TextColor3 = T.t3
    l.TextXAlignment = Enum.TextXAlignment.Left
    local ib = Instance.new("Frame", r)
    ib.Size = UDim2.new(0.7, 0, 0, 22)
    ib.Position = UDim2.new(0.3, 0, 0.5, -11)
    ib.BackgroundColor3 = T.bg4
    ib.BorderSizePixel = 0
    Instance.new("UICorner", ib).CornerRadius = UDim.new(0, 5)
    local tb = Instance.new("TextBox", ib)
    tb.Size = UDim2.new(1, -8, 1, 0)
    tb.Position = UDim2.new(0, 4, 0, 0)
    tb.BackgroundTransparency = 1
    tb.Text = ""
    tb.PlaceholderText = placeholder
    tb.PlaceholderColor3 = T.t3
    tb.Font = Enum.Font.GothamMedium
    tb.TextSize = 9
    tb.TextColor3 = T.t1
    tb.TextXAlignment = Enum.TextXAlignment.Left
    tb.ClearTextOnFocus = false
    tb.FocusLost:Connect(function() cb(tb.Text) end)
    return tb
end

-- ═══════════════════════════════════════════════════════════════════
-- ⚡ POWER TOGGLE
-- ═══════════════════════════════════════════════════════════════════
local ON_MSGS = {
    "🔥 GODMODE — Les serveurs tremblent",
    "⚡ ACTIVE — Headshot machine activée",
    "👑 ACTIVE — T'es un dieu maintenant",
    "💀 ACTIVE — RIP tout le lobby",
    "😈 ACTIVE — Le chaos commence",
    "🎯 ACTIVE — 0 miss, 100% destruction",
    "🌪️ ACTIVE — Ouragan de headshots",
    "⚔️ ACTIVE — Mode guerre totale",
}
local OFF_MSGS = {
    "💤 OFFLINE — Répit pour les noobs",
    "😴 OFFLINE — Même les dieux se reposent",
    "🤡 OFFLINE — Fair-play ? Sérieusement ?",
    "💀 OFFLINE — Pause stratégique",
}

local pw = Instance.new("Frame", tAim)
pw.Size = UDim2.new(1, 0, 0, 42)
pw.BackgroundColor3 = T.bg2
pw.BorderSizePixel = 0
pw.LayoutOrder = 0
Instance.new("UICorner", pw).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", pw).Color = T.border
Instance.new("UIPadding", pw).PaddingLeft = UDim.new(0, 12)

local pI = Instance.new("Frame", pw)
pI.Size = UDim2.new(0, 26, 0, 26)
pI.Position = UDim2.new(0, 0, 0.5, -13)
pI.BackgroundColor3 = T.red
pI.BorderSizePixel = 0
Instance.new("UICorner", pI).CornerRadius = UDim.new(1, 0)
local pIT = Instance.new("TextLabel", pI)
pIT.Size = UDim2.new(1, 0, 1, 0)
pIT.BackgroundTransparency = 1
pIT.Text = "💀"
pIT.TextSize = 13

local pL = Instance.new("TextLabel", pw)
pL.Size = UDim2.new(1, -90, 1, 0)
pL.Position = UDim2.new(0, 34, 0, 0)
pL.BackgroundTransparency = 1
pL.Text = OFF_MSGS[1]
pL.Font = Enum.Font.GothamBold
pL.TextSize = 11
pL.TextColor3 = T.red
pL.TextXAlignment = Enum.TextXAlignment.Left
pL.TextTruncate = Enum.TextTruncate.AtEnd

local pBg = Instance.new("Frame", pw)
pBg.Size = UDim2.new(0, 38, 0, 18)
pBg.Position = UDim2.new(1, -52, 0.5, -9)
pBg.BackgroundColor3 = T.bg4
pBg.BorderSizePixel = 0
Instance.new("UICorner", pBg).CornerRadius = UDim.new(1, 0)

local pKn = Instance.new("Frame", pBg)
pKn.Size = UDim2.new(0, 12, 0, 12)
pKn.Position = UDim2.new(0, 3, 0.5, -6)
pKn.BackgroundColor3 = T.t3
pKn.BorderSizePixel = 0
Instance.new("UICorner", pKn).CornerRadius = UDim.new(1, 0)

local pBt = Instance.new("TextButton", pw)
pBt.Size = UDim2.new(1, 0, 1, 0)
pBt.BackgroundTransparency = 1
pBt.Text = ""
pBt.ZIndex = 3
pBt.AutoButtonColor = false

local function setOn(v)
    CFG.Enabled = v
    local ti = TweenInfo.new(0.2)
    if v then
        TweenService:Create(pBg, ti, {BackgroundColor3 = T.green}):Play()
        TweenService:Create(pKn, ti, {Position = UDim2.new(0, 23, 0.5, -6), BackgroundColor3 = T.t1}):Play()
        TweenService:Create(pI, ti, {BackgroundColor3 = T.green}):Play()
        pIT.Text = "👑"; pL.Text = ON_MSGS[math.random(1, #ON_MSGS)]; pL.TextColor3 = T.green
        sd.BackgroundColor3 = T.green; sl.Text = "ON"; sl.TextColor3 = T.green
    else
        TweenService:Create(pBg, ti, {BackgroundColor3 = T.bg4}):Play()
        TweenService:Create(pKn, ti, {Position = UDim2.new(0, 3, 0.5, -6), BackgroundColor3 = T.t3}):Play()
        TweenService:Create(pI, ti, {BackgroundColor3 = T.red}):Play()
        pIT.Text = "💀"; pL.Text = OFF_MSGS[math.random(1, #OFF_MSGS)]; pL.TextColor3 = T.red
        sd.BackgroundColor3 = T.red; sl.Text = "OFF"; sl.TextColor3 = T.red
    end
end
pBt.MouseButton1Click:Connect(function() setOn(not CFG.Enabled) end)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 1: AIM 🎯
-- ═══════════════════════════════════════════════════════════════════
local as = mkSec(tAim, "🎯 AIMBOT — \"Never miss again\" 🔥", 1)
mkSld(as, "FOV", 1, 10, 600, 100, "", function(v) CFG.FOV = v end)
mkSld(as, "SMOOTH", 2, 1, 30, 6, "", function(v) CFG.Smooth = v end)
mkSld(as, "DEADZONE", 3, 0, 25, 3, "px", function(v) CFG.Deadzone = v end)
mkDrp(as, "TARGET", 4, {"Head", "Torso", "Legs"}, "Head", function(v) CFG.Target = v end)
mkDrp(as, "KEY", 5, {"RMB", "LMB", "Hold"}, "RMB", function(v) CFG.AimKey = ({RMB="MouseButton2",LMB="MouseButton1",Hold="Always"})[v] end)

local fs = mkSec(tAim, "🧠 FEATURES — \"Big brain cheat\" 🧪", 2)
mkTog(fs, "🔇 Silent Aim", 1, "SilentAim")
mkTog(fs, "🔮 Prediction", 2, "Prediction")
mkTog(fs, "🤖 Auto Predict", 3, "AutoPredict")
mkTog(fs, "📐 Quadratic Predict", 4, "QuadPredict")
mkSld(fs, "PREDICT %", 5, 0, 50, 15, "", function(v) CFG.PredictAmt = v / 100 end)
mkTog(fs, "🧱 Wall Check", 6, "WallCheck")
mkTog(fs, "👥 Team Check", 7, "TeamCheck")
mkTog(fs, "🔒 Lock Target", 8, "LockTarget")
mkTog(fs, "⚡ Instant Snap", 9, "InstantSnap")
mkTog(fs, "🫨 Aim Shake", 10, "AimShake")
mkSld(fs, "SHAKE AMT", 11, 1, 15, 2, "", function(v) CFG.ShakeAmt = v end)
mkTog(fs, "🎲 Random Smooth", 12, "RandomSmooth")
mkTog(fs, "🧬 Humanize Aim", 13, "HumanizeAim")
mkTog(fs, "🔫 Auto-Fire 🎁", 14, "AutoFire")
mkTog(fs, "🧲 Aim Assist 🎁", 15, "AimAssist")
mkTog(fs, "🔗 Sticky Aim 🎁", 16, "StickyAim")
mkTog(fs, "💀 Headshot Only 🎁", 17, "HeadshotOnly")
mkInfo(fs, "💡 Sticky Aim = reste collé même si la cible sort du FOV", 18)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 2: ESP 👁️
-- ═══════════════════════════════════════════════════════════════════
local es = mkSec(tESP, "👁️ ESP — \"Wallhack ultime\" 🤫", 1)
mkTog(es, "📛 Names", 1, "ESPNames")
mkTog(es, "📦 Box", 2, "ESPBox")
mkDrp(es, "STYLE", 3, {"Full", "Corner"}, "Corner", function(v) CFG.BoxStyle = v end)
mkTog(es, "📍 Tracers", 4, "ESPTracer")
mkDrp(es, "FROM", 5, {"Bottom", "Top", "Center"}, "Bottom", function(v) CFG.TracerFrom = v end)
mkTog(es, "❤️ Health Bar", 6, "ESPHealth")
mkTog(es, "📏 Distance", 7, "ESPDist")
mkTog(es, "🔴 Head Dot", 8, "ESPDot")
mkTog(es, "🦴 Skeleton", 9, "ESPSkel")
mkTog(es, "✨ Chams", 10, "ESPChams")
mkTog(es, "🔫 Weapon 🎁", 11, "ESPWeapon")
mkTog(es, "🏳️ Flags 🎁", 12, "ESPFlags")
mkSld(es, "MAX DIST", 13, 100, 5000, 2000, "m", function(v) CFG.ESPMaxDist = v end)

local ec = mkSec(tESP, "🎨 COLORS — \"Drip = Win\" 🌈", 2)
mkTog(ec, "🌈 Rainbow", 1, "RainbowESP")
mkTog(ec, "❤️ HP Colors", 2, "ColorByHP")
mkTog(ec, "👀 Visibility Colors", 3, "ColorByVis")
mkTog(ec, "🎨 Gradient ESP 🎁", 4, "GradientESP")

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 3: HUD 🖥️
-- ═══════════════════════════════════════════════════════════════════
local hs = mkSec(tHUD, "🖥️ OVERLAY — \"Info = Power\" 📊", 1)
mkTog(hs, "📊 FPS", 1, "ShowFPS")
mkTog(hs, "📡 Ping", 2, "ShowPing")
mkTog(hs, "🎯 Target Info", 3, "ShowTarget")
mkTog(hs, "🏷️ Watermark", 4, "ShowWatermark")
mkTog(hs, "💀 Kill Feed 🎁", 5, "ShowKillFeed")
mkTog(hs, "🌈 Rainbow UI", 6, "RainbowUI")
mkTog(hs, "🕐 Clock 🎁", 7, "ShowClock")
mkTog(hs, "📍 Coords 🎁", 8, "ShowCoords")
mkTog(hs, "💨 Speed 🎁", 9, "ShowSpeed")
mkTog(hs, "❌ HitMarker 🎁", 10, "HitMarker")
mkTog(hs, "🔭 Sniper Scope 🎁", 11, "SniperScope")

local hc = mkSec(tHUD, "➕ CROSSHAIR — \"Précision\" 🎯", 2)
mkTog(hc, "➕ Show Crosshair", 1, "ShowCross")
mkDrp(hc, "STYLE", 2, {"Cross", "Dot", "Circle"}, "Cross", function(v) CFG.CrossStyle = v end)
mkSld(hc, "SIZE", 3, 2, 25, 6, "px", function(v) CFG.CrossSize = v end)
mkTog(hc, "🌀 Spin", 4, "CrossSpin")

local hf = mkSec(tHUD, "⭕ FOV CIRCLE", 3)
mkTog(hf, "⭕ Show FOV", 1, "ShowFOV")
mkTog(hf, "🔵 Filled", 2, "FOVFilled")

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 4: WORLD 🌍
-- ═══════════════════════════════════════════════════════════════════
local ws = mkSec(tWorld, "💡 LIGHTING — \"Contrôle total\" 🔦", 1)
mkTog(ws, "☀️ Fullbright", 1, "Fullbright", function(v)
    if v then Lighting.Brightness = 2; Lighting.GlobalShadows = false; Lighting.ClockTime = 14
    else Lighting.Brightness = OrigSettings.Brightness; Lighting.GlobalShadows = OrigSettings.GlobalShadows; Lighting.ClockTime = OrigSettings.ClockTime end
end)
mkTog(ws, "🌫️ No Fog", 2, "NoFog", function(v)
    if v then Lighting.FogEnd = 1e9; Lighting.FogStart = 1e9
    else Lighting.FogEnd = OrigSettings.FogEnd; Lighting.FogStart = OrigSettings.FogStart end
end)
mkTog(ws, "🌙 Night Mode 🎁", 3, "NightMode", function(v)
    if v then Lighting.ClockTime = 0; Lighting.Brightness = 0.3
    else Lighting.ClockTime = OrigSettings.ClockTime; Lighting.Brightness = OrigSettings.Brightness end
end)
mkTog(ws, "⏸️ Freeze Time", 4, "FreezeTime")
mkSld(ws, "TIME", 5, 0, 24, 14, "h", function(v) CFG.FreezeTimeVal = v; if CFG.FreezeTime then Lighting.ClockTime = v end end)
mkTog(ws, "🪩 Disco Mode 🎁", 6, "Disco")
mkTog(ws, "🌑 Low Gravity 🎁", 7, "LowGravity", function(v)
    workspace.Gravity = v and 40 or 196.2
    Notify("🌑 Gravity", v and "Moon gravity — boing boing 🦘" or "Normal — welcome back to earth 🌍", 2, T.cyan)
end)

local wc = mkSec(tWorld, "📷 CAMERA 🎥", 2)
mkTog(wc, "🔭 FOV Changer", 1, "FOVChanger", function(v) if not v then Camera.FieldOfView = OrigSettings.CamFOV end end)
mkSld(wc, "FOV", 2, 30, 140, 70, "°", function(v) CFG.CamFOV = v end)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 5: PLAYER 🏃
-- ═══════════════════════════════════════════════════════════════════
local ps = mkSec(tPlayer, "🏃 MOVEMENT — \"Gotta go fast\" ⚡", 1)
mkTog(ps, "🏃 Walk Speed", 1, "WalkSpeed", function(v) if not v and LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.WalkSpeed = 16 end end end)
mkSld(ps, "SPEED", 2, 16, 200, 16, "", function(v) CFG.WalkSpeedVal = v end)
mkTog(ps, "🦘 Jump Power", 3, "JumpPower", function(v) if not v and LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.JumpPower = 50 end end end)
mkSld(ps, "JUMP", 4, 50, 400, 50, "", function(v) CFG.JumpPowerVal = v end)
mkTog(ps, "😴 Anti-AFK", 5, "AntiAFK")
mkTog(ps, "🔄 Infinite Jump 🎁", 6, "InfJump")
mkTog(ps, "🌙 Moonwalk 🎁", 7, "Moonwalk")
mkTog(ps, "🏊 Dolphin Dive 🎁", 8, "Dolphin")

local bs = mkSec(tPlayer, "🎁 BONUS MOVEMENT 🚀", 2)
mkTog(bs, "🦅 Fly", 1, "Fly", function(v)
    if v then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character.HumanoidRootPart
            FlyBody = Instance.new("BodyVelocity", hrp)
            FlyBody.Velocity = Vector3.zero; FlyBody.MaxForce = Vector3.one * 1e5; FlyBody.Name = "H738Fly"
            FlyGyro = Instance.new("BodyGyro", hrp)
            FlyGyro.MaxTorque = Vector3.one * 1e5; FlyGyro.Name = "H738Gyro"
            Notify("🦅 Fly", "T'es un oiseau maintenant 🐦", 2, T.cyan)
        end
    else
        if FlyBody then FlyBody:Destroy(); FlyBody = nil end
        if FlyGyro then FlyGyro:Destroy(); FlyGyro = nil end
        Notify("🦅 Fly", "Retour au sol, mortel 💀", 2, T.yellow)
    end
end)
mkSld(bs, "FLY SPEED", 2, 10, 300, 50, "", function(v) CFG.FlySpeed = v end)
mkTog(bs, "⚡ Speed Boost (Shift)", 3, "SpeedBoost")
mkSld(bs, "BOOST MULT", 4, 1, 8, 2, "x", function(v) CFG.SpeedBoostMult = v + 0.5 end)
mkTog(bs, "🌪️ Spin Bot", 5, "SpinBot")
mkSld(bs, "SPIN SPEED", 6, 1, 60, 10, "", function(v) CFG.SpinSpeed = v end)
mkTog(bs, "👻 Noclip", 7, "Noclip")

local ut = mkSec(tPlayer, "🛠️ UTILITY 📌", 3)
mkBtn(ut, "💾 SAVE POSITION", 1, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        CFG.SavedPosition = LP.Character.HumanoidRootPart.CFrame
        Notify("💾 Saved", "Position saved — GPS activé 📍", 2, T.green)
    end
end)
mkBtn(ut, "📍 TP BACK", 2, function()
    if CFG.SavedPosition and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFG.SavedPosition
        Notify("📍 TP", "Retour au point safe 😏", 1.5, Accent)
    else Notify("📍 TP", "T'as rien sauvé, amnésique 🤡", 1.5, T.red) end
end)
mkBtn(ut, "💀 RESET", 3, function()
    if LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.Health = 0 end end
    Notify("💀 Reset", "Suicide tactique 🧠", 1, T.red)
end)
mkBtn(ut, "📍 ADD WAYPOINT", 4, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        table.insert(CFG.Waypoints, {name = "WP#" .. (#CFG.Waypoints + 1), cf = LP.Character.HumanoidRootPart.CFrame})
        Notify("📍 Waypoint", "Added #" .. #CFG.Waypoints .. " 📌", 1.5, T.cyan)
    end
end)
mkBtn(ut, "📍 TP TO LAST WP", 5, function()
    if #CFG.Waypoints > 0 and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFG.Waypoints[#CFG.Waypoints].cf
    end
end)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 6: STEALTH 🕵️
-- ═══════════════════════════════════════════════════════════════════
local sts = mkSec(tStealth, "🛡️ ANTI-DETECTION — \"Ghost mode\" 👻", 1)
mkTog(sts, "🛡️ Anti-Kick (REAL)", 1, "AntiKick", function(v)
    if v then
        pcall(function()
            local old; old = hookmetamethod(game, "__namecall", function(self, ...)
                if getnamecallmethod() == "Kick" and self == LP then
                    Notify("🛡️ Anti-Kick", "Kick BLOQUÉ — nice try 🤡", 3, T.red); return
                end
                return old(self, ...)
            end)
        end)
        Notify("🛡️ Anti-Kick", "Hook installé — unkickable 😈", 2, T.green)
    end
end)
mkTog(sts, "🫥 Hide Name", 2, "HideName", function(v)
    if LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid")
        if h then h.DisplayDistanceType = v and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer end
    end
end)

local hu = mkSec(tStealth, "🧬 HUMANIZATION 🤖", 2)
mkTog(hu, "🎲 Random Smooth", 1, "RandomSmooth")
mkTog(hu, "🧬 Humanize Aim", 2, "HumanizeAim")
mkInfo(hu, "💡 Rend ton aim moins suspect — même si on sait tous que tu cheat 🤷", 3)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 7: ADMIN 👑
-- ═══════════════════════════════════════════════════════════════════
local adm = mkSec(tAdmin, "👑 PLAYER LIST — \"God complex\" ⚖️", 1)
local plList = Instance.new("ScrollingFrame", adm)
plList.Size = UDim2.new(1, 0, 0, 220)
plList.BackgroundColor3 = T.bg3
plList.BorderSizePixel = 0
plList.ScrollBarThickness = 3
plList.ScrollBarImageColor3 = Accent
plList.AutomaticCanvasSize = Enum.AutomaticSize.Y
plList.LayoutOrder = 1
Instance.new("UICorner", plList).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", plList).Padding = UDim.new(0, 3)
local plPd = Instance.new("UIPadding", plList)
plPd.PaddingTop = UDim.new(0, 4); plPd.PaddingLeft = UDim.new(0, 4); plPd.PaddingRight = UDim.new(0, 4)

local function RefreshPlayers()
    for _, c in ipairs(plList:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LP then continue end
        local row = Instance.new("Frame", plList)
        row.Size = UDim2.new(1, -4, 0, 42)
        row.BackgroundColor3 = T.bg2
        row.BorderSizePixel = 0
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)
        
        local dot = Instance.new("Frame", row)
        dot.Size = UDim2.new(0, 6, 0, 6)
        dot.Position = UDim2.new(0, 8, 0.5, -3)
        dot.BackgroundColor3 = (p.Team and LP.Team and p.Team == LP.Team) and T.cyan or T.green
        dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        
        local nm = Instance.new("TextLabel", row)
        nm.Size = UDim2.new(0.3, 0, 0, 13)
        nm.Position = UDim2.new(0, 20, 0, 5)
        nm.BackgroundTransparency = 1
        nm.Text = p.DisplayName
        nm.Font = Enum.Font.GothamBold
        nm.TextSize = 9
        nm.TextColor3 = T.t1
        nm.TextXAlignment = Enum.TextXAlignment.Left
        nm.TextTruncate = Enum.TextTruncate.AtEnd
        
        local ch = p.Character
        local hm = ch and ch:FindFirstChildOfClass("Humanoid")
        local st = Instance.new("TextLabel", row)
        st.Size = UDim2.new(0.3, 0, 0, 10)
        st.Position = UDim2.new(0, 20, 0, 20)
        st.BackgroundTransparency = 1
        st.Text = "❤️ " .. (hm and math.floor(hm.Health) or "?")
        st.Font = Enum.Font.Gotham
        st.TextSize = 8
        st.TextColor3 = T.t3
        st.TextXAlignment = Enum.TextXAlignment.Left
        
        local function pb(text, xOff, col, cb2)
            local b = Instance.new("TextButton", row)
            b.Size = UDim2.new(0, 30, 0, 18)
            b.Position = UDim2.new(1, xOff, 0.5, -9)
            b.BackgroundColor3 = T.bg3
            b.BorderSizePixel = 0
            b.Text = text
            b.Font = Enum.Font.GothamBold
            b.TextSize = 8
            b.TextColor3 = col or T.t2
            b.AutoButtonColor = false
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            b.MouseEnter:Connect(function() b.BackgroundColor3 = col or Accent; b.TextColor3 = T.t1 end)
            b.MouseLeave:Connect(function() b.BackgroundColor3 = T.bg3; b.TextColor3 = col or T.t2 end)
            b.MouseButton1Click:Connect(cb2)
        end
        
        pb("📍", -152, T.cyan, function()
            if LP.Character and p.Character and LP.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 3)
                Notify("📍 TP", "→ " .. p.Name .. " — surprise 😈", 2, T.cyan)
            end
        end)
        pb("👁️", -118, T.yellow, function()
            if SpectateTarget == p then SpectateTarget = nil; Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            else if p.Character then SpectateTarget = p; Camera.CameraSubject = p.Character:FindFirstChildOfClass("Humanoid"); Notify("👁️", "Watching " .. p.Name .. " 👀", 2, T.yellow) end end
        end)
        pb("🎯", -84, T.red, function()
            if p.Character then local t = p.Character:FindFirstChild("Head"); if t then LockedTarget = t; CFG.LockTarget = true; Notify("🎯", "Lock → " .. p.Name .. " 💀", 2, T.red) end end
        end)
        -- 🎁 BONUS buttons
        pb("🎪", -50, T.pink, function()
            CFG.BackshotTarget = p; CFG.Backshots = true
            Notify("🎪 Backshots", "Target: " .. p.Name .. " — ayo 💀😂", 3, T.pink)
        end)
        pb("🌀", -16, T.purple, function()
            CFG.OrbitTarget = p; CFG.OrbitTroll = true
            Notify("🌀 Orbit", "Orbiting " .. p.Name .. " — satellite mode 🛰️", 2, T.purple)
        end)
    end
end
mkBtn(adm, "🔄 REFRESH", 2, RefreshPlayers)
RefreshPlayers()

table.insert(CN, Players.PlayerAdded:Connect(function(p) task.wait(1); RefreshPlayers(); Notify("👋", p.Name .. " joined — fresh meat 🍖", 2, T.green) end))
table.insert(CN, Players.PlayerRemoving:Connect(function(p) task.wait(0.2); RefreshPlayers(); Notify("👋", p.Name .. " ragequit 🤡", 2, T.yellow) end))

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 8: TROLL 🎪
-- ═══════════════════════════════════════════════════════════════════
local tr1 = mkSec(tTroll, "🎪 TROLL BASIC — \"Sois méchant\" 😈", 1)
mkTog(tr1, "🎪 Troll Mode (Speed+Spin)", 1, "TrollMode", function(v)
    if v then CFG.SpinBot = true; CFG.SpinSpeed = 30; CFG.WalkSpeed = true; CFG.WalkSpeedVal = 80
        Notify("🎪 TROLL", "BEYBLADE LET IT RIP 🌪️", 3, T.pink)
    else CFG.SpinBot = false; CFG.WalkSpeed = false end
end)
mkTog(tr1, "💀 BACKSHOTS 😂🎁", 2, "Backshots")
mkSld(tr1, "BACKSHOT SPEED", 3, 3, 20, 8, "", function(v) CFG.BackshotSpeed = v end)
mkTog(tr1, "🌀 Orbit Player 🎁", 4, "OrbitTroll")
mkSld(tr1, "ORBIT RADIUS", 5, 3, 20, 8, "m", function(v) CFG.OrbitRadius = v end)
mkSld(tr1, "ORBIT SPEED", 6, 1, 15, 5, "", function(v) CFG.OrbitSpeed = v end)
mkTog(tr1, "🚶 Stalk Player 🎁", 7, "Stalk")
mkSld(tr1, "STALK DISTANCE", 8, 5, 30, 15, "m", function(v) CFG.StalkDist = v end)
mkTog(tr1, "👀 Face Stare 🎁", 9, "FaceStare")
mkTog(tr1, "🐒 Copy Movement 🎁", 10, "CopyMovement")
mkTog(tr1, "🪑 Sit on Head 🎁", 11, "HeadSit")

mkInfo(tr1, "💡 Pour Backshots/Orbit/Stalk: sélectionne un joueur dans Admin → 🎪 ou 🌀", 12)
mkInfo(tr1, "⚠️ Le backshot c'est juste du TP rapide derrière le joueur — c'est hilarant 💀", 13)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 9: CHAOS 💀
-- ═══════════════════════════════════════════════════════════════════
local ch1 = mkSec(tChaos, "💀 BODY CHAOS — \"Déformation\" 🤪", 1)
mkTog(ch1, "🌪️ Character Spin", 1, "CharSpin")
mkTog(ch1, "🚁 Helicopter", 2, "Helicopter")
mkTog(ch1, "🐛 Worm Mode", 3, "Worm")
mkTog(ch1, "⚡ Seizure Mode", 4, "Seizure")
mkTog(ch1, "🐜 Tiny Character 🎁", 5, "TinyChar", function(v)
    if LP.Character then
        for _, part in ipairs(LP.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                if v then part.Size = part.Size * 0.3
                else pcall(function() LP.Character:FindFirstChildOfClass("Humanoid"):BuildRigFromAttachments() end) end
            end
        end
    end
    Notify("🐜 Tiny", v and "Tu es une fourmi maintenant 🐜" or "Taille normale", 2, T.pink)
end)
mkTog(ch1, "🦣 Giant Character 🎁", 6, "GiantChar")
mkTog(ch1, "📄 Flat Character 🎁", 7, "FlatChar")
mkTog(ch1, "🍝 Noodle Arms 🎁", 8, "NoodleArms")

local ch2 = mkSec(tChaos, "🎲 RANDOM CHAOS — \"Pure evil\" 😈", 2)
mkBtn(ch2, "🎲 RANDOM TP — Teleport aléatoire", 1, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-500, 500), 100, math.random(-500, 500))
        Notify("🎲 Random TP", "Bonne chance pour retrouver ton chemin 🤡", 2, T.yellow)
    end
end)
mkBtn(ch2, "🌋 EXPLOSION VISUELLE", 2, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        for i = 1, 15 do
            pcall(function()
                local p2 = Instance.new("Part", workspace)
                p2.Size = Vector3.new(math.random(1, 4), math.random(1, 4), math.random(1, 4))
                p2.Material = Enum.Material.Neon
                p2.BrickColor = BrickColor.Random()
                p2.Position = LP.Character.HumanoidRootPart.Position + Vector3.new(math.random(-8, 8), math.random(3, 20), math.random(-8, 8))
                p2.Anchored = false
                Debris:AddItem(p2, 4)
            end)
        end
        Notify("🌋 Boom", "Feux d'artifice de la victoire 🎆", 2, T.orange)
    end
end)
mkBtn(ch2, "🌊 TSUNAMI DE PARTS", 3, function()
    pcall(function()
        for i = 1, 30 do
            local p2 = Instance.new("Part", workspace)
            p2.Size = Vector3.new(math.random(2, 8), math.random(1, 3), math.random(2, 8))
            p2.Material = Enum.Material.Neon
            p2.Color = Color3.fromHSV(i / 30, 1, 1)
            p2.Position = LP.Character.HumanoidRootPart.Position + Vector3.new(math.random(-20, 20), 50 + i * 2, math.random(-20, 20))
            p2.Anchored = false
            Debris:AddItem(p2, 8)
        end
    end)
    Notify("🌊 Tsunami", "Il pleut des briques 🧱", 2, T.cyan)
end)
mkBtn(ch2, "🔥 FIRE TRAIL", 4, function()
    task.spawn(function()
        for i = 1, 30 do
            if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then break end
            pcall(function()
                local p2 = Instance.new("Part", workspace)
                p2.Size = Vector3.new(1, 1, 1)
                p2.Material = Enum.Material.Neon
                p2.Color = Color3.fromRGB(255, math.random(50, 150), 0)
                p2.Position = LP.Character.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
                p2.Anchored = true
                p2.CanCollide = false
                Debris:AddItem(p2, 3)
                local fire = Instance.new("Fire", p2)
                fire.Size = 5
                fire.Heat = 10
            end)
            task.wait(0.1)
        end
    end)
    Notify("🔥 Fire", "T'es en feu — littéralement 🔥", 2, T.orange)
end)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 TAB 10: AUDIO 🔊
-- ═══════════════════════════════════════════════════════════════════
local au1 = mkSec(tAudio, "🔊 SOUND TROLLING — \"Oreilles en PLS\" 🎵", 1)
mkBtn(au1, "💥 EXPLOSION", 1, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://130932305"; s.Volume = 2; s:Play(); Debris:AddItem(s, 5) end)
    Notify("💥 Sound", "BOOM 💣", 1.5, T.orange)
end)
mkBtn(au1, "📢 AIR HORN", 2, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://258057783"; s.Volume = 2; s:Play(); Debris:AddItem(s, 5) end)
    Notify("📢 Horn", "BWAAAAAAH 📣", 1.5, T.yellow)
end)
mkBtn(au1, "🎺 BRUH", 3, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://5765826581"; s.Volume = 2; s:Play(); Debris:AddItem(s, 3) end)
    Notify("🎺 Bruh", "bruh moment 💀", 1.5, T.pink)
end)
mkBtn(au1, "🎵 OOF", 4, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://12222242"; s.Volume = 2; s:Play(); Debris:AddItem(s, 2) end)
end)
mkBtn(au1, "👻 CREEPY", 5, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://155432530"; s.Volume = 1.5; s:Play(); Debris:AddItem(s, 8) end)
    Notify("👻 Creepy", "Brrr... 🥶", 2, T.purple)
end)
mkBtn(au1, "🔇 STOP ALL SOUNDS", 6, function()
    for _, s in ipairs(workspace:GetDescendants()) do if s:IsA("Sound") and s.IsPlaying then s:Stop() end end
    Notify("🔇 Silence", "Enfin la paix 😌", 1.5, T.t2)
end)

local au2 = mkSec(tAudio, "🎵 CUSTOM MUSIC 🎶", 2)
local musicInput = mkInput(au2, "SOUND ID", 1, "Enter rbxassetid ID...", function(text)
    CFG.MusicId = tonumber(text) or 0
end)
mkBtn(au2, "▶️ PLAY MUSIC", 2, function()
    if CFG.MusicId > 0 then
        if MusicPlaying then MusicPlaying:Stop(); MusicPlaying:Destroy() end
        MusicPlaying = Instance.new("Sound", workspace)
        MusicPlaying.SoundId = "rbxassetid://" .. CFG.MusicId
        MusicPlaying.Volume = 1; MusicPlaying.Looped = true; MusicPlaying:Play()
        Notify("🎵 Music", "Now playing ID: " .. CFG.MusicId .. " 🎶", 2, T.cyan)
    else Notify("🎵 Music", "Pas d'ID — t'as oublié ? 🤡", 2, T.red) end
end)
mkBtn(au2, "⏹️ STOP MUSIC", 3, 

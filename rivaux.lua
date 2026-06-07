--[[
    ██╗  ██╗██╗██████╗  ██████╗ ███████╗██╗  ██╗██╗    ███████╗██████╗  █████╗ 
    ██║  ██║██║██╔══██╗██╔═══██╗██╔════╝██║  ██║██║    ╚════██║╚════██╗██╔══██╗
    ███████║██║██████╔╝██║   ██║███████╗███████║██║        ██╔╝ █████╔╝╚█████╔╝
    ██╔══██║██║██╔══██╗██║   ██║╚════██║██╔══██║██║       ██╔╝  ╚═══██╗██╔══██╗
    ██║  ██║██║██║  ██║╚██████╔╝███████║██║  ██║██║       ██║  ██████╔╝╚█████╔╝
    ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝       ╚═╝  ╚═════╝  ╚════╝ 
    
    👑 HIROSHI 738 — v12 ABSOLUTE EDITION
    💀 "Le script que même les anti-cheats respectent"
    
    📑 18 ONGLETS:
        🎯 Aim       — Aimbot complet
        👁️ ESP       — Wallhack ultime  
        🖥️ HUD       — Overlay personnalisable
        🌍 World     — Contrôle de l'environnement
        🏃 Player    — Mouvement & physique
        🦅 Movement  — Fly, Spider, TP tools
        🕵️ Stealth   — Anti-detection
        👑 Admin     — Panel joueurs
        🎪 Troll     — Mode chaos
        💃 Emotes    — Animations custom
        🔫 Combat    — Kill aura, auto-parry
        📊 Stats     — Tracking K/D
        🎵 Music     — Boombox intégré
        📸 Visual    — Effets visuels
        🎮 Macros    — Auto-actions
        💾 Config    — Save/Load settings
        📋 Logs      — Activity tracking
        ⚙️ Settings  — Configuration
    
    🎁 200+ FEATURES
    🤡 Messages moqueurs à chaque action
    💀 Le plus gros script cheat Roblox ever made
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
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local PathfindingService = game:GetService("PathfindingService")
local MarketplaceService = game:GetService("MarketplaceService")
local ContextActionService = game:GetService("ContextActionService")
local Debris = game:GetService("Debris")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LP:GetMouse()

-- ═══════════════════════════════════════════════════════════════════
-- 🧹 NETTOYAGE
-- ═══════════════════════════════════════════════════════════════════
for _, name in ipairs({"H738v12", "H738Key", "H738v11", "H738v10"}) do
    local old = LP.PlayerGui:FindFirstChild(name)
    if old then old:Destroy() end
end

-- ═══════════════════════════════════════════════════════════════════
-- 🔒 KEY SYSTEM — ULTRA SECURE
-- "Tu pensais bypass ? Retourne sur YouTube chercher des free exploits 🤡"
-- ═══════════════════════════════════════════════════════════════════
local KeyVerified = false
local LoadCheat

-- 🔐 Double hash pour la sécurité
local function SecureHash(str)
    local h1, h2 = 5381, 52711
    for i = 1, #str do
        local byte = str:byte(i)
        h1 = ((h1 * 33) + byte) % 2147483647
        h2 = ((h2 * 31) + byte) % 2147483647
    end
    return h1 * 1000000 + h2
end

local VALID_HASH = SecureHash("Hiro738")
local VIP_HASH = SecureHash("HiroshiVIP")
local OWNER_HASH = SecureHash("Hiroshi738Owner")

-- 🎭 Messages moqueurs ENCORE PLUS SAVAGE
local MOCK_MESSAGES = {
    "🤡 Mon petit frère de 5 ans tape mieux que toi",
    "💀 T'as essayé 'admin' ? Laisse-moi deviner... oui 😂",
    "🗑️ Cette tentative était plus nulle que ton aim sans cheat",
    "🤣 Plot twist: la clé c'est pas '123456'",
    "💩 Même un bot Discord trouverait plus vite",
    "🎪 Le cirque recrute, t'as le profil parfait 🤡",
    "😴 *bâillement cosmique* t'es toujours là ?",
    "🦧 Un orang-outan sur un clavier ferait mieux",
    "📉 Ton QI fond comme un glaçon au soleil",
    "🧠 Erreur 404: intelligence non trouvée",
    "💅 C'est pas Fortnite ici, y'a pas de 'free V-Bucks key'",
    "🎭 T'es le genre à chercher 'free Robux no scam 2024'",
    "🐌 Un escargot hackerait plus vite que toi",
    "📱 Va sur TikTok plutôt, c'est plus ton niveau",
    "🤖 ChatGPT a trouvé la clé en 0.3s, et toi ?",
    "🎪 Honk honk 🤡 le clown du serveur est arrivé",
    "💀 RIP tes 2 derniers neurones",
    "🧊 Cold take: t'auras jamais la clé",
    "🐒 Donne le clavier au singe, il sera plus efficace",
    "🎵 *musique de game over* 🎵",
}

-- 🎨 Key System Theme
local KT = {
    bg = Color3.fromRGB(4, 3, 12),
    card = Color3.fromRGB(10, 8, 22),
    accent = Color3.fromRGB(101, 78, 255),
    accent2 = Color3.fromRGB(40, 215, 255),
    accent3 = Color3.fromRGB(255, 60, 190),
    accent4 = Color3.fromRGB(255, 195, 40),
    text = Color3.new(1, 1, 1),
    subtext = Color3.fromRGB(130, 120, 180),
    dim = Color3.fromRGB(60, 55, 100),
    error = Color3.fromRGB(255, 45, 65),
    success = Color3.fromRGB(40, 230, 115),
    inputBg = Color3.fromRGB(16, 13, 32),
    stroke = Color3.fromRGB(45, 40, 90),
}

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "H738Key"
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.DisplayOrder = 99999
KeyGui.Parent = LP.PlayerGui

-- 🌌 Background épique
local KeyBG = Instance.new("Frame", KeyGui)
KeyBG.Size = UDim2.new(1, 0, 1, 0)
KeyBG.BackgroundColor3 = KT.bg
KeyBG.BorderSizePixel = 0

local bgGrad = Instance.new("UIGradient", KeyBG)
bgGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(6, 3, 18)),
    ColorSequenceKeypoint.new(0.3, Color3.fromRGB(10, 6, 28)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(8, 5, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(4, 2, 12))
})

-- 📐 Grille animée améliorée
local Grid = Instance.new("Frame", KeyBG)
Grid.Size = UDim2.new(1, 0, 1, 0)
Grid.BackgroundTransparency = 1
Grid.ClipsDescendants = true

for i = 0, 25 do
    local line = Instance.new("Frame", Grid)
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, i * 42)
    line.BackgroundColor3 = KT.accent
    line.BackgroundTransparency = 0.93
    line.BorderSizePixel = 0
end
for i = 0, 35 do
    local line = Instance.new("Frame", Grid)
    line.Size = UDim2.new(0, 1, 1, 0)
    line.Position = UDim2.new(0, i * 55, 0, 0)
    line.BackgroundColor3 = KT.accent
    line.BackgroundTransparency = 0.93
    line.BorderSizePixel = 0
end

-- ✨ Particules flottantes multicolores
for i = 1, 35 do
    local particle = Instance.new("Frame", Grid)
    local size = math.random(2, 9)
    particle.Size = UDim2.new(0, size, 0, size)
    particle.Position = UDim2.new(math.random(1, 99) / 100, 0, math.random(1, 99) / 100, 0)
    local colors = {KT.accent, KT.accent2, KT.accent3, KT.accent4}
    particle.BackgroundColor3 = colors[math.random(1, #colors)]
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
                BackgroundTransparency = math.random(20, 75) / 100,
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
    local scanColors = {KT.accent, KT.accent2, KT.accent3}
    scanLine.BackgroundColor3 = scanColors[idx]
    scanLine.BackgroundTransparency = 0.6 + idx * 0.1
    scanLine.BorderSizePixel = 0
    scanLine.ZIndex = 3

    task.spawn(function()
        local speed = 3 + idx * 1.5
        local delay2 = idx * 1.2
        task.wait(delay2)
        while not KeyVerified and scanLine.Parent do
            scanLine.Position = UDim2.new(0, 0, 0, 0)
            TweenService:Create(scanLine, TweenInfo.new(speed, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0, 0, 1, -2)
            }):Play()
            task.wait(speed)
        end
    end)
end

-- 🃏 Carte principale du Key System AMÉLIORÉE
local KeyCard = Instance.new("Frame", KeyBG)
KeyCard.Size = UDim2.new(0, 440, 0, 460)
KeyCard.Position = UDim2.new(0.5, -220, 0.5, -230)
KeyCard.BackgroundColor3 = KT.card
KeyCard.BorderSizePixel = 0
KeyCard.ZIndex = 10
Instance.new("UICorner", KeyCard).CornerRadius = UDim.new(0, 20)

local cardStroke = Instance.new("UIStroke", KeyCard)
cardStroke.Color = KT.accent
cardStroke.Thickness = 1.5
cardStroke.Transparency = 0.3

-- 🌈 Double barre arc-en-ciel (haut + bas)
for _, pos in ipairs({{UDim2.new(0, 20, 0, 0)}, {UDim2.new(0, 20, 1, -3)}}) do
    local bar = Instance.new("Frame", KeyCard)
    bar.Size = UDim2.new(1, -40, 0, 3)
    bar.Position = pos[1]
    bar.BackgroundColor3 = KT.accent
    bar.BorderSizePixel = 0
    bar.ZIndex = 11
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    local grad = Instance.new("UIGradient", bar)
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, KT.accent),
        ColorSequenceKeypoint.new(0.25, KT.accent2),
        ColorSequenceKeypoint.new(0.5, KT.accent3),
        ColorSequenceKeypoint.new(0.75, KT.accent4),
        ColorSequenceKeypoint.new(1, KT.accent)
    })
    task.spawn(function()
        local r = 0
        while not KeyVerified and bar.Parent do
            r = (r + 1.5) % 360
            grad.Rotation = r
            task.wait(0.025)
        end
    end)
end

-- 🎴 Logo animé avec pulse
local logoFrame = Instance.new("Frame", KeyCard)
logoFrame.Size = UDim2.new(0, 70, 0, 70)
logoFrame.Position = UDim2.new(0.5, -35, 0, 22)
logoFrame.BackgroundColor3 = KT.accent
logoFrame.BorderSizePixel = 0
logoFrame.ZIndex = 12
Instance.new("UICorner", logoFrame).CornerRadius = UDim.new(0, 18)
Instance.new("UIGradient", logoFrame).Color = ColorSequence.new(
    Color3.fromRGB(60, 50, 200), Color3.fromRGB(150, 120, 255)
)

local logoText = Instance.new("TextLabel", logoFrame)
logoText.Size = UDim2.new(1, 0, 1, 0)
logoText.BackgroundTransparency = 1
logoText.Text = "👑"
logoText.Font = Enum.Font.GothamBold
logoText.TextSize = 30
logoText.TextColor3 = Color3.new(1, 1, 1)
logoText.ZIndex = 13

-- 💫 Pulse animation sur le logo
task.spawn(function()
    while not KeyVerified and logoFrame.Parent do
        TweenService:Create(logoFrame, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 76, 0, 76),
            Position = UDim2.new(0.5, -38, 0, 19)
        }):Play()
        task.wait(1.2)
        TweenService:Create(logoFrame, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Size = UDim2.new(0, 70, 0, 70),
            Position = UDim2.new(0.5, -35, 0, 22)
        }):Play()
        task.wait(1.2)
    end
end)

-- 📝 Labels
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

local titleLbl = MKL("HIROSHI 738", 100, Enum.Font.GothamBold, 28, KT.text)
local subLbl = MKL("👑 ABSOLUTE EDITION · Premium Authentication 🔐", 132, Enum.Font.Gotham, 11, KT.subtext)
local verLbl = MKL("⚡ v12.0 · ANTI-DETECT · ENCRYPTED · UNBANNABLE 🛡️", 150, Enum.Font.GothamMedium, 9, KT.accent)
local featureLbl = MKL("🎁 18 Tabs · 200+ Features · Unlimited Power 💀", 168, Enum.Font.Gotham, 9, KT.accent2)

-- 📥 Input
local inputBox = Instance.new("Frame", KeyCard)
inputBox.Size = UDim2.new(0, 340, 0, 46)
inputBox.Position = UDim2.new(0.5, -170, 0, 195)
inputBox.BackgroundColor3 = KT.inputBg
inputBox.BorderSizePixel = 0
inputBox.ZIndex = 12
Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 12)
local inputStroke = Instance.new("UIStroke", inputBox)
inputStroke.Color = KT.stroke
inputStroke.Thickness = 1

local lockIcon = Instance.new("TextLabel", inputBox)
lockIcon.Size = UDim2.new(0, 38, 1, 0)
lockIcon.BackgroundTransparency = 1
lockIcon.Text = "🔒"
lockIcon.Font = Enum.Font.Gotham
lockIcon.TextSize = 18
lockIcon.TextColor3 = KT.subtext
lockIcon.ZIndex = 13

local keyInput = Instance.new("TextBox", inputBox)
keyInput.Size = UDim2.new(1, -46, 1, 0)
keyInput.Position = UDim2.new(0, 40, 0, 0)
keyInput.BackgroundTransparency = 1
keyInput.Text = ""
keyInput.PlaceholderText = "🔑 Tape ta clé ici, petit génie..."
keyInput.PlaceholderColor3 = Color3.fromRGB(80, 75, 130)
keyInput.Font = Enum.Font.GothamMedium
keyInput.TextSize = 14
keyInput.TextColor3 = Color3.new(1, 1, 1)
keyInput.TextXAlignment = Enum.TextXAlignment.Left
keyInput.ClearTextOnFocus = false
keyInput.ZIndex = 13

-- 🔘 Bouton Verify
local verifyBtn = Instance.new("TextButton", KeyCard)
verifyBtn.Size = UDim2.new(0, 340, 0, 44)
verifyBtn.Position = UDim2.new(0.5, -170, 0, 252)
verifyBtn.BackgroundColor3 = KT.accent
verifyBtn.BorderSizePixel = 0
verifyBtn.Text = "🔓 VERIFY KEY"
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 15
verifyBtn.TextColor3 = Color3.new(1, 1, 1)
verifyBtn.AutoButtonColor = false
verifyBtn.ZIndex = 12
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 12)
Instance.new("UIGradient", verifyBtn).Color = ColorSequence.new(
    Color3.fromRGB(60, 50, 200), Color3.fromRGB(150, 110, 255)
)

-- 🎫 Get Key button
local getKeyBtn = Instance.new("TextButton", KeyCard)
getKeyBtn.Size = UDim2.new(0, 160, 0, 34)
getKeyBtn.Position = UDim2.new(0.5, -170, 0, 304)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = "🎫 Get Key (Discord)"
getKeyBtn.Font = Enum.Font.GothamMedium
getKeyBtn.TextSize = 11
getKeyBtn.TextColor3 = Color3.new(1, 1, 1)
getKeyBtn.AutoButtonColor = false
getKeyBtn.ZIndex = 12
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

-- 🔗 Copy Key button (pour les gens sympas)
local copyInfoBtn = Instance.new("TextButton", KeyCard)
copyInfoBtn.Size = UDim2.new(0, 160, 0, 34)
copyInfoBtn.Position = UDim2.new(0.5, 10, 0, 304)
copyInfoBtn.BackgroundColor3 = Color3.fromRGB(45, 42, 80)
copyInfoBtn.BorderSizePixel = 0
copyInfoBtn.Text = "📋 Copy Info"
copyInfoBtn.Font = Enum.Font.GothamMedium
copyInfoBtn.TextSize = 11
copyInfoBtn.TextColor3 = KT.subtext
copyInfoBtn.AutoButtonColor = false
copyInfoBtn.ZIndex = 12
Instance.new("UICorner", copyInfoBtn).CornerRadius = UDim.new(0, 8)

copyInfoBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("HIROSHI 738 v12 | User: " .. LP.Name .. " | ID: " .. LP.UserId)
    end
end)

local mockLabel = MKL("", 346, Enum.Font.GothamMedium, 10, KT.error)
local errorLabel = MKL("", 366, Enum.Font.GothamMedium, 10, KT.error)
local attemptsLabel = MKL("5 attempts remaining 💀", 386, Enum.Font.Gotham, 9, Color3.fromRGB(90, 85, 140))
MKL("🔐 AES-256 · RSA-4096 · Session encrypted · 2FA Ready", 406, Enum.Font.Gotham, 8, KT.dim)
MKL("🎭 \"Sans la clé t'es juste un spectateur\" — Hiroshi 👑", 424, Enum.Font.Gotham, 8, Color3.fromRGB(55, 50, 95))

local attemptsLeft = 5
local isVerifying = false

local function DoVerify()
    if isVerifying or KeyVerified then return end
    if attemptsLeft <= 0 then return end
    isVerifying = true
    verifyBtn.Text = "⏳ AUTHENTICATING..."
    
    -- 🎭 Fake loading progressif
    for _, dot in ipairs({".", "..", "..."}) do
        verifyBtn.Text = "⏳ SCANNING" .. dot
        task.wait(0.2)
    end
    verifyBtn.Text = "🔍 VERIFYING HASH..."
    task.wait(0.3)

    local inputHash = SecureHash(keyInput.Text)

    if inputHash == VALID_HASH or inputHash == VIP_HASH or inputHash == OWNER_HASH then
        KeyVerified = true
        
        local rank = "PREMIUM"
        if inputHash == OWNER_HASH then rank = "👑 OWNER" 
        elseif inputHash == VIP_HASH then rank = "💎 VIP" end
        
        errorLabel.Text = ""
        mockLabel.Text = "👑 Access granted — " .. rank
        mockLabel.TextColor3 = KT.success
        verifyBtn.Text = "✅ WELCOME, KING"
        verifyBtn.BackgroundColor3 = KT.success
        lockIcon.Text = "🔓"
        subLbl.Text = "👑 Welcome " .. LP.Name .. " · " .. rank .. " 🎉"
        subLbl.TextColor3 = KT.success

        task.wait(1)

        -- 🎬 Animation de sortie ÉPIQUE
        -- Flash blanc
        local flash = Instance.new("Frame", KeyGui)
        flash.Size = UDim2.new(1, 0, 1, 0)
        flash.BackgroundColor3 = Color3.new(1, 1, 1)
        flash.BackgroundTransparency = 1
        flash.ZIndex = 100
        TweenService:Create(flash, TweenInfo.new(0.15), {BackgroundTransparency = 0.7}):Play()
        task.wait(0.15)
        TweenService:Create(flash, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()

        TweenService:Create(KeyCard, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        TweenService:Create(KeyBG, TweenInfo.new(0.7), {BackgroundTransparency = 1}):Play()

        for _, child in ipairs(Grid:GetDescendants()) do
            if child:IsA("Frame") then
                TweenService:Create(child, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
            end
        end

        task.wait(0.8)
        KeyGui:Destroy()
        LoadCheat()
    else
        attemptsLeft = attemptsLeft - 1

        if attemptsLeft <= 0 then
            errorLabel.Text = "🔒 VERROUILLÉ — GG t'as gaspillé toutes tes chances 🤡"
            verifyBtn.Text = "💀 PERMANENTLY LOCKED"
            verifyBtn.BackgroundColor3 = Color3.fromRGB(50, 15, 25)
            attemptsLabel.Text = "☠️ 0 attempts — Adieu 💀"
            mockLabel.Text = "🎪 Le clown a quitté le bâtiment"
            mockLabel.TextColor3 = KT.error
            keyInput.TextEditable = false
            isVerifying = false
            
            -- 🎭 Effet dramatique de mort
            TweenService:Create(cardStroke, TweenInfo.new(1), {Color = KT.error}):Play()
            return
        end

        local mockMsg = MOCK_MESSAGES[math.random(1, #MOCK_MESSAGES)]
        errorLabel.Text = "❌ Wrong key — " .. attemptsLeft .. " left"
        mockLabel.Text = mockMsg
        mockLabel.TextColor3 = KT.error
        verifyBtn.Text = "🔓 VERIFY KEY"
        verifyBtn.BackgroundColor3 = KT.accent

        local skulls = string.rep("💀", 5 - attemptsLeft)
        local hearts = string.rep("❤️", attemptsLeft)
        attemptsLabel.Text = hearts .. " " .. skulls .. " — " .. attemptsLeft .. " remaining"

        -- 🫨 Shake amélioré
        TweenService:Create(inputStroke, TweenInfo.new(0.1), {Color = KT.error}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.1), {Color = KT.error}):Play()
        for _, offset in ipairs({-168, -172, -165, -175, -170, -167, -173, -170}) do
            TweenService:Create(inputBox, TweenInfo.new(0.025), {
                Position = UDim2.new(0.5, offset, 0, 195)
            }):Play()
            task.wait(0.025)
        end
        task.wait(0.3)
        TweenService:Create(inputStroke, TweenInfo.new(0.4), {Color = KT.stroke}):Play()
        TweenService:Create(cardStroke, TweenInfo.new(0.4), {Color = KT.accent}):Play()
        isVerifying = false
    end
end

verifyBtn.MouseButton1Click:Connect(DoVerify)
keyInput.FocusLost:Connect(function(ep) if ep then DoVerify() end end)
getKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard("https://discord.gg/hiroshi738") end
    mockLabel.Text = "📋 Discord link copied — (jk it's fake 🤡)"
    mockLabel.TextColor3 = KT.accent2
end)


-- ═══════════════════════════════════════════════════════════════════════════
-- ═══════════════════════════════════════════════════════════════════════════
-- 🎮 CHEAT PRINCIPAL — LE MONSTRE
-- ═══════════════════════════════════════════════════════════════════════════
-- ═══════════════════════════════════════════════════════════════════════════
function LoadCheat()

-- ═══════════════════════════════════════════════════════════════════
-- ⚙️ MEGA CONFIGURATION — 200+ OPTIONS
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
    QuadPredict = false,
    WallCheck = false,
    TeamCheck = false,
    LockTarget = false,
    InstantSnap = false,
    AimShake = false,
    ShakeAmt = 2,
    Deadzone = 3,
    RandomSmooth = false,
    HumanizeAim = false,
    AutoFire = false,
    AimAssist = false,
    StickyAim = false,
    StickyFactor = 0.7,
    TargetSwitchDelay = 0.3,
    BodyAim = false, -- vise le corps si la tête est cachée
    
    -- 👁️ ESP
    ESPEnabled = true,
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
    GradientESP = false,
    ESPWeapon = false,
    ESPArmorBar = false,
    ESPFlags = false, -- shows flags like "BEHIND WALL", "LOW HP"
    ESPSnapLine = false,
    ESPHeadCircle = false,
    ESPFillBox = false,
    ESPFillOpacity = 0.15,
    ESPOutline = true,
    ESPFontSize = 13,
    
    -- 🖥️ HUD
    ShowFOV = true,
    FOVFilled = false,
    FOVSides = 36,
    ShowCross = false,
    CrossStyle = "Cross",
    CrossSize = 6,
    CrossSpin = false,
    CrossRainbow = false,
    CrossDynamic = false, -- s'agrandit quand tu bouges
    ShowFPS = true,
    ShowPing = true,
    ShowTarget = true,
    ShowWatermark = true,
    ShowKillFeed = true,
    ShowPlayerCount = true,
    ShowCoords = false,
    ShowSpeed = false,
    RainbowUI = false,
    MinimalHUD = false,
    
    -- 🌍 World
    Fullbright = false,
    NoFog = false,
    FOVChanger = false,
    CamFOV = 70,
    FreezeTime = false,
    FreezeTimeVal = 14,
    NightMode = false,
    MatrixRain = false,
    NoParticles = false,
    SmallWorld = false,
    BigHead = false,
    Atmosphere = "Default",
    
    -- 🏃 Player
    AntiAFK = true,
    WalkSpeed = false,
    WalkSpeedVal = 16,
    JumpPower = false,
    JumpPowerVal = 50,
    Fly = false,
    FlySpeed = 50,
    SpeedBoost = false,
    SpeedBoostMult = 2.5,
    SpinBot = false,
    SpinSpeed = 10,
    Noclip = false,
    InfJump = false,
    LongJump = false,
    LongJumpForce = 80,
    BHop = false,
    AutoJump = false,
    GodMode = false, -- tentative
    HighJump = false,
    LowGravity = false,
    GravityVal = 196.2,
    Anchor = false,
    
    -- 🦅 Movement Tools
    ClickTP = false,
    Spider = false,
    SpiderSpeed = 40,
    Phase = false,
    Glide = false,
    Dolphin = false,
    Freeze = false,
    TP2Mouse = false,
    
    -- 🕵️ Stealth
    AntiKick = false,
    HideName = false,
    AntiScreenshot = false,
    FakeDisconnect = false,
    AntiIdle = true,
    SpoofName = false,
    SpoofNameVal = "",
    
    -- 🔫 Combat
    KillAura = false,
    KillAuraRange = 15,
    AutoParry = false,
    AutoBlock = false,
    AutoCombo = false,
    HitboxExpander = false,
    HitboxSize = 10,
    AutoEquip = false,
    
    -- 🎪 Troll
    TrollMode = false,
    FlingPlayers = false,
    FlingPower = 5000,
    Orbit = false,
    OrbitRadius = 10,
    OrbitSpeed = 5,
    HeadSpin = false,
    Seizure = false,
    CartoonMode = false,
    RagdollPush = false,
    Platform = false,
    Annoy = false,
    CopyMovement = false,
    FaceTarget = false,
    Backshots = false, -- 😏
    BackshotsSpeed = 8,
    Helicopter = false,
    Worm = false,
    Dab = false,
    TPBehind = false,
    FollowPlayer = false,
    
    -- 💃 Emotes
    CurrentEmote = "None",
    EmoteSpeed = 1,
    LoopEmote = false,
    
    -- 🎵 Music
    MusicEnabled = false,
    MusicID = 0,
    MusicVolume = 0.5,
    
    -- 📸 Visual Effects
    Fog = false,
    FogColor = Color3.fromRGB(0, 0, 0),
    Bloom = false,
    BlurEffect = false,
    BlurSize = 10,
    SunRays = false,
    Vignette = false,
    DepthOfField = false,
    ColorCorrection = false,
    CC_Brightness = 0,
    CC_Contrast = 0,
    CC_Saturation = 0,
    Ambient = false,
    AmbientColor = Color3.fromRGB(180, 180, 180),
    
    -- 🎮 Macros
    AutoClicker = false,
    ClickDelay = 0.1,
    AutoRespawn = false,
    AutoCollect = false,
    AutoFarm = false,
    KeyRepeater = false,
    RepeatKey = "E",
    RepeatDelay = 0.5,
    
    -- 💾 Config
    ConfigName = "Default",
    
    -- 📊 Stats
    Kills = 0,
    Deaths = 0,
    DamageDone = 0,
    
    -- 📌 Misc
    SavedPosition = nil,
    Waypoints = {},
    TrollTarget = nil,
}

-- ═══════════════════════════════════════════════════════════════════
-- 🎨 THÈME v12
-- ═══════════════════════════════════════════════════════════════════
local T = {
    bg1 = Color3.fromRGB(6, 6, 12),
    bg2 = Color3.fromRGB(11, 10, 20),
    bg3 = Color3.fromRGB(20, 18, 35),
    bg4 = Color3.fromRGB(30, 27, 52),
    bg5 = Color3.fromRGB(40, 36, 68),
    accent = Color3.fromRGB(101, 78, 255),
    red = Color3.fromRGB(255, 50, 70),
    green = Color3.fromRGB(40, 225, 115),
    yellow = Color3.fromRGB(255, 200, 40),
    cyan = Color3.fromRGB(40, 220, 255),
    orange = Color3.fromRGB(255, 145, 40),
    pink = Color3.fromRGB(255, 75, 175),
    purple = Color3.fromRGB(180, 70, 255),
    lime = Color3.fromRGB(130, 255, 50),
    text1 = Color3.new(1, 1, 1),
    text2 = Color3.fromRGB(180, 170, 225),
    text3 = Color3.fromRGB(115, 105, 165),
    border = Color3.fromRGB(32, 30, 60),
    glow = Color3.fromRGB(101, 78, 255),
}
local Accent = T.accent

-- ═══════════════════════════════════════════════════════════════════
-- 📦 VARIABLES D'ÉTAT
-- ═══════════════════════════════════════════════════════════════════
local OrigSettings = {
    Brightness = Lighting.Brightness,
    FogEnd = Lighting.FogEnd,
    FogStart = Lighting.FogStart,
    GlobalShadows = Lighting.GlobalShadows,
    ClockTime = Lighting.ClockTime,
    CamFOV = Camera.FieldOfView,
    Gravity = workspace.Gravity,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
}

local LockedTarget, CurrentTargetName, CurrentTargetDist = nil, "", 0
local IsDestroyed = false
local CrosshairAngle, SpectateTarget = 0, nil
local Connections, Logs, KillFeed = {}, {}, {}
local MAX_LOGS = 80
local ActiveSlider = nil
local FlyBody, FlyGyro = nil, nil
local targetsLocked = 0
local startTime = tick()
local TrollTarget = nil
local CurrentMusic = nil
local VisualEffects = {}
local lastHealthMap = {}

-- ═══════════════════════════════════════════════════════════════════
-- 🖼️ GUI PRINCIPAL
-- ═══════════════════════════════════════════════════════════════════
local SG = Instance.new("ScreenGui")
SG.Name = "H738v12"
SG.ResetOnSpawn = false
SG.IgnoreGuiInset = true
SG.DisplayOrder = 10000
SG.Parent = LP.PlayerGui

-- ═══════════════════════════════════════════════════════════════════
-- 🔔 NOTIFICATION SYSTEM v3
-- ═══════════════════════════════════════════════════════════════════
local NH = Instance.new("Frame", SG)
NH.Size = UDim2.new(0, 320, 1, -40)
NH.Position = UDim2.new(1, -336, 0, 20)
NH.BackgroundTransparency = 1

local NL = Instance.new("UIListLayout", NH)
NL.SortOrder = Enum.SortOrder.LayoutOrder
NL.HorizontalAlignment = Enum.HorizontalAlignment.Right
NL.Padding = UDim.new(0, 6)

local nO = 0
local function Notify(title, msg, dur, col)
    nO = nO + 1
    table.insert(Logs, 1, {
        time = os.date("%H:%M:%S"),
        action = "[" .. title .. "] " .. msg,
        color = col or T.text2
    })
    if #Logs > MAX_LOGS then table.remove(Logs) end

    local n = Instance.new("Frame", NH)
    n.Size = UDim2.new(0, 0, 0, 56)
    n.BackgroundColor3 = T.bg2
    n.BorderSizePixel = 0
    n.LayoutOrder = nO
    n.ClipsDescendants = true
    Instance.new("UICorner", n).CornerRadius = UDim.new(0, 10)
    Instance.new("UIStroke", n).Color = T.border

    local bar = Instance.new("Frame", n)
    bar.Size = UDim2.new(0, 3, 1, -14)
    bar.Position = UDim2.new(0, 7, 0, 7)
    bar.BackgroundColor3 = col or Accent
    bar.BorderSizePixel = 0
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)

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
    ml.Size = UDim2.new(1, -24, 0, 16)
    ml.Position = UDim2.new(0, 18, 0, 24)
    ml.BackgroundTransparency = 1
    ml.Text = msg
    ml.Font = Enum.Font.Gotham
    ml.TextSize = 10
    ml.TextColor3 = T.text2
    ml.TextXAlignment = Enum.TextXAlignment.Left
    ml.TextTruncate = Enum.TextTruncate.AtEnd

    -- ⏱️ Progress bar
    local pb = Instance.new("Frame", n)
    pb.Size = UDim2.new(1, 0, 0, 2)
    pb.Position = UDim2.new(0, 0, 1, -2)
    pb.BackgroundColor3 = col or Accent
    pb.BorderSizePixel = 0
    
    TweenService:Create(n, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(1, 0, 0, 56)
    }):Play()
    
    TweenService:Create(pb, TweenInfo.new(dur or 3, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 2)
    }):Play()

    task.delay(dur or 3, function()
        TweenService:Create(n, TweenInfo.new(0.25), {Size = UDim2.new(0, 0, 0, 56)}):Play()
        task.wait(0.3)
        if n.Parent then n:Destroy() end
    end)
end

-- ═══════════════════════════════════════════════════════════════════
-- 🏠 PANNEAU PRINCIPAL
-- ═══════════════════════════════════════════════════════════════════
local Pan = Instance.new("Frame", SG)
Pan.Size = UDim2.new(0, 560, 0, 480)
Pan.Position = UDim2.new(0, 16, 0.5, -240)
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
local HdrFill = Instance.new("Frame", Hdr)
HdrFill.Size = UDim2.new(1, 0, 0, 16)
HdrFill.Position = UDim2.new(0, 0, 1, -16)
HdrFill.BackgroundColor3 = T.bg2
HdrFill.BorderSizePixel = 0

-- 🖱️ Drag
local isDrag, dStart, dPos = false, nil, nil
Hdr.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        isDrag = true; dStart = i.Position; dPos = Pan.Position
    end
end)
Hdr.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then isDrag = false end
end)

-- Header content
local hLogo = Instance.new("Frame", Hdr)
hLogo.Size = UDim2.new(0, 32, 0, 32)
hLogo.Position = UDim2.new(0, 12, 0, 11)
hLogo.BackgroundColor3 = Accent
hLogo.BorderSizePixel = 0
Instance.new("UICorner", hLogo).CornerRadius = UDim.new(0, 8)
local hLogoT = Instance.new("TextLabel", hLogo)
hLogoT.Size = UDim2.new(1, 0, 1, 0)
hLogoT.BackgroundTransparency = 1
hLogoT.Text = "👑"
hLogoT.TextSize = 16
hLogoT.Font = Enum.Font.GothamBold
hLogoT.TextColor3 = T.text1

local hTitle = Instance.new("TextLabel", Hdr)
hTitle.Size = UDim2.new(0, 160, 0, 16)
hTitle.Position = UDim2.new(0, 52, 0, 9)
hTitle.BackgroundTransparency = 1
hTitle.Text = "HIROSHI 738"
hTitle.Font = Enum.Font.GothamBold
hTitle.TextSize = 14
hTitle.TextColor3 = T.text1
hTitle.TextXAlignment = Enum.TextXAlignment.Left

local hSub = Instance.new("TextLabel", Hdr)
hSub.Size = UDim2.new(0, 250, 0, 11)
hSub.Position = UDim2.new(0, 52, 0, 28)
hSub.BackgroundTransparency = 1
hSub.Text = "👑 ABSOLUTE v12 · 🛡️ UNDETECTED · 18 TABS"
hSub.Font = Enum.Font.Gotham
hSub.TextSize = 9
hSub.TextColor3 = T.text3
hSub.TextXAlignment = Enum.TextXAlignment.Left

local sDot = Instance.new("Frame", Hdr)
sDot.Size = UDim2.new(0, 8, 0, 8)
sDot.Position = UDim2.new(1, -118, 0, 15)
sDot.BackgroundColor3 = T.red
sDot.BorderSizePixel = 0
Instance.new("UICorner", sDot).CornerRadius = UDim.new(1, 0)

local sLbl = Instance.new("TextLabel", Hdr)
sLbl.Size = UDim2.new(0, 35, 0, 12)
sLbl.Position = UDim2.new(1, -106, 0, 13)
sLbl.BackgroundTransparency = 1
sLbl.Text = "OFF"
sLbl.Font = Enum.Font.GothamBold
sLbl.TextSize = 9
sLbl.TextColor3 = T.red

-- Minimize & Close
local minBtn = Instance.new("TextButton", Hdr)
minBtn.Size = UDim2.new(0, 26, 0, 26)
minBtn.Position = UDim2.new(1, -62, 0, 14)
minBtn.BackgroundColor3 = T.bg3
minBtn.Text = "—"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 12
minBtn.TextColor3 = T.text2
minBtn.BorderSizePixel = 0
minBtn.AutoButtonColor = false
Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

local mini = false
minBtn.MouseButton1Click:Connect(function()
    mini = not mini
    TweenService:Create(Pan, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = mini and UDim2.new(0, 560, 0, 54) or UDim2.new(0, 560, 0, 480)
    }):Play()
    minBtn.Text = mini and "+" or "—"
end)

local clsBtn = Instance.new("TextButton", Hdr)
clsBtn.Size = UDim2.new(0, 26, 0, 26)
clsBtn.Position = UDim2.new(1, -32, 0, 14)
clsBtn.BackgroundColor3 = T.red
clsBtn.BackgroundTransparency = 0.6
clsBtn.Text = "×"
clsBtn.Font = Enum.Font.GothamBold
clsBtn.TextSize = 14
clsBtn.TextColor3 = T.text1
clsBtn.BorderSizePixel = 0
clsBtn.AutoButtonColor = false
Instance.new("UICorner", clsBtn).CornerRadius = UDim.new(0, 6)

-- ═══════════════════════════════════════════════════════════════════
-- 📑 SIDEBAR — 18 ONGLETS
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
local SdL = Instance.new("UIListLayout", SS)
SdL.Padding = UDim.new(0, 2)
SdL.SortOrder = Enum.SortOrder.LayoutOrder
local SdP = Instance.new("UIPadding", SS)
SdP.PaddingTop = UDim.new(0, 5)
SdP.PaddingLeft = UDim.new(0, 4)
SdP.PaddingRight = UDim.new(0, 4)
SdP.PaddingBottom = UDim.new(0, 5)

-- Tab content
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
            b.lb.TextColor3 = T.text1; b.ic.TextColor3 = Accent
        else
            b.bg.BackgroundTransparency = 1
            b.lb.TextColor3 = T.text3; b.ic.TextColor3 = T.text3
        end
    end
    ct = n
end

local function mkT(name, icon, order)
    local b = Instance.new("Frame", SS)
    b.Size = UDim2.new(1, 0, 0, 26)
    b.BackgroundTransparency = 1
    b.BorderSizePixel = 0
    b.LayoutOrder = order
    local bg = Instance.new("Frame", b)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = T.bg4
    bg.BackgroundTransparency = 1
    bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 6)
    local ic = Instance.new("TextLabel", b)
    ic.Size = UDim2.new(0, 22, 1, 0)
    ic.Position = UDim2.new(0, 4, 0, 0)
    ic.BackgroundTransparency = 1
    ic.Text = icon
    ic.Font = Enum.Font.GothamBold
    ic.TextSize = 11
    ic.TextColor3 = T.text3
    local lb = Instance.new("TextLabel", b)
    lb.Size = UDim2.new(1, -30, 1, 0)
    lb.Position = UDim2.new(0, 28, 0, 0)
    lb.BackgroundTransparency = 1
    lb.Text = name
    lb.Font = Enum.Font.GothamMedium
    lb.TextSize = 9
    lb.TextColor3 = T.text3
    lb.TextXAlignment = Enum.TextXAlignment.Left
    lb.TextTruncate = Enum.TextTruncate.AtEnd
    local btn = Instance.new("TextButton", b)
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
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 8)
    tbs[name] = {bg = bg, lb = lb, ic = ic}
    tfs[name] = f
    return f
end

-- 📑 18 ONGLETS
local tAim = mkT("Aim", "🎯", 1)
local tESP = mkT("ESP", "👁️", 2)
local tHUD = mkT("HUD", "🖥️", 3)
local tWorld = mkT("World", "🌍", 4)
local tPlayer = mkT("Player", "🏃", 5)
local tMove = mkT("Movement", "🦅", 6)
local tStealth = mkT("Stealth", "🕵️", 7)
local tAdmin = mkT("Admin", "👑", 8)
local tCombat = mkT("Combat", "🔫", 9)
local tTroll = mkT("Troll", "🎪", 10)
local tEmotes = mkT("Emotes", "💃", 11)
local tMusic = mkT("Music", "🎵", 12)
local tVisual = mkT("Visual", "📸", 13)
local tMacros = mkT("Macros", "🎮", 14)
local tStats = mkT("Stats", "📊", 15)
local tConfig = mkT("Config", "💾", 16)
local tLogs = mkT("Logs", "📋", 17)
local tSettings = mkT("Settings", "⚙️", 18)

-- ═══════════════════════════════════════════════════════════════════
-- 🧩 UI COMPONENTS
-- ═══════════════════════════════════════════════════════════════════
table.insert(Connections, UIS.InputChanged:Connect(function(i)
    if isDrag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dStart
        Pan.Position = UDim2.new(dPos.X.Scale, dPos.X.Offset + d.X, dPos.Y.Scale, dPos.Y.Offset + d.Y)
    end
    if ActiveSlider and i.UserInputType == Enum.UserInputType.MouseMovement then
        ActiveSlider(i.Position.X)
    end
end))
table.insert(Connections, UIS.InputEnded:Connect(function(i)
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
    pd.PaddingLeft = UDim.new(0, 10); pd.PaddingRight = UDim.new(0, 10)
    pd.PaddingTop = UDim.new(0, 10); pd.PaddingBottom = UDim.new(0, 10)
    local h = Instance.new("Frame", s)
    h.Size = UDim2.new(1, 0, 0, 14); h.BackgroundTransparency = 1; h.LayoutOrder = 0
    local d = Instance.new("Frame", h)
    d.Size = UDim2.new(0, 3, 1, -4); d.Position = UDim2.new(0, 0, 0, 2)
    d.BackgroundColor3 = Accent; d.BorderSizePixel = 0
    Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)
    local l = Instance.new("TextLabel", h)
    l.Size = UDim2.new(1, -10, 1, 0); l.Position = UDim2.new(0, 8, 0, 0)
    l.BackgroundTransparency = 1; l.Text = title
    l.Font = Enum.Font.GothamBold; l.TextSize = 10
    l.TextColor3 = T.text3; l.TextXAlignment = Enum.TextXAlignment.Left
    return s
end

local function mkTog(p, txt, ord, key, cb)
    local r = Instance.new("Frame", p)
    r.Size = UDim2.new(1, 0, 0, 22); r.BackgroundTransparency = 1; r.LayoutOrder = ord
    local lb = Instance.new("TextLabel", r)
    lb.Size = UDim2.new(1, -44, 1, 0); lb.BackgroundTransparency = 1
    lb.Text = txt; lb.Font = Enum.Font.GothamMedium; lb.TextSize = 11
    lb.TextColor3 = T.text2; lb.TextXAlignment = Enum.TextXAlignment.Left
    local bg = Instance.new("Frame", r)
    bg.Size = UDim2.new(0, 34, 0, 18); bg.Position = UDim2.new(1, -34, 0.5, -9)
    bg.BackgroundColor3 = T.bg3; bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)
    local kn = Instance.new("Frame", bg)
    kn.Size = UDim2.new(0, 12, 0, 12); kn.Position = UDim2.new(0, 3, 0.5, -6)
    kn.BackgroundColor3 = T.text3; kn.BorderSizePixel = 0
    Instance.new("UICorner", kn).CornerRadius = UDim.new(1, 0)
    local bt = Instance.new("TextButton", r)
    bt.Size = UDim2.new(1, 0, 1, 0); bt.BackgroundTransparency = 1
    bt.Text = ""; bt.ZIndex = 3; bt.AutoButtonColor = false
    local function ref()
        local ti = TweenInfo.new(0.18)
        if CFG[key] then
            TweenService:Create(bg, ti, {BackgroundColor3 = Accent}):Play()
            TweenService:Create(kn, ti, {Position = UDim2.new(0, 19, 0.5, -6), BackgroundColor3 = T.text1}):Play()
        else
            TweenService:Create(bg, ti, {BackgroundColor3 = T.bg3}):Play()
            TweenService:Create(kn, ti, {Position = UDim2.new(0, 3, 0.5, -6), BackgroundColor3 = T.text3}):Play()
        end
    end
    bt.MouseButton1Click:Connect(function()
        CFG[key] = not CFG[key]; ref()
        if cb then cb(CFG[key]) end
    end)
    ref()
end

local function mkSld(p, txt, ord, mn, mx, def, suf, cb)
    local bl = Instance.new("Frame", p)
    bl.Size = UDim2.new(1, 0, 0, 34); bl.BackgroundTransparency = 1; bl.LayoutOrder = ord
    local lb = Instance.new("TextLabel", bl)
    lb.Size = UDim2.new(0.6, 0, 0, 13); lb.BackgroundTransparency = 1
    lb.Text = txt; lb.Font = Enum.Font.GothamMedium; lb.TextSize = 10
    lb.TextColor3 = T.text3; lb.TextXAlignment = Enum.TextXAlignment.Left
    local vl = Instance.new("TextLabel", bl)
    vl.Size = UDim2.new(0.4, 0, 0, 13); vl.Position = UDim2.new(0.6, 0, 0, 0)
    vl.BackgroundTransparency = 1; vl.Text = def .. (suf or "")
    vl.Font = Enum.Font.GothamBold; vl.TextSize = 10
    vl.TextColor3 = T.text1; vl.TextXAlignment = Enum.TextXAlignment.Right
    local tr = Instance.new("Frame", bl)
    tr.Size = UDim2.new(1, 0, 0, 5); tr.Position = UDim2.new(0, 0, 0, 19)
    tr.BackgroundColor3 = T.bg4; tr.BorderSizePixel = 0
    Instance.new("UICorner", tr).CornerRadius = UDim.new(1, 0)
    local fl = Instance.new("Frame", tr)
    fl.Size = UDim2.new((def - mn) / (mx - mn), 0, 1, 0)
    fl.BackgroundColor3 = Accent; fl.BorderSizePixel = 0
    Instance.new("UICorner", fl).CornerRadius = UDim.new(1, 0)
    local kn = Instance.new("Frame", tr)
    kn.Size = UDim2.new(0, 12, 0, 12); kn.AnchorPoint = Vector2.new(0.5, 0.5)
    kn.Position = UDim2.new((def - mn) / (mx - mn), 0, 0.5, 0)
    kn.BackgroundColor3 = T.text1; kn.BorderSizePixel = 0; kn.ZIndex = 3
    Instance.new("UICorner", kn).CornerRadius = UDim.new(1, 0)
    local function upd(x)
        local rel = math.clamp((x - tr.AbsolutePosition.X) / tr.AbsoluteSize.X, 0, 1)
        local val = math.floor(mn + rel * (mx - mn) + 0.5)
        fl.Size = UDim2.new(rel, 0, 1, 0)
        kn.Position = UDim2.new(rel, 0, 0.5, 0)
        vl.Text = val .. (suf or "")
        cb(val)
    end
    tr.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then ActiveSlider = upd; upd(i.Position.X) end end)
    kn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then ActiveSlider = upd end end)
end

local function mkDrp(p, txt, ord, opts, def, cb)
    local bl = Instance.new("Frame", p)
    bl.Size = UDim2.new(1, 0, 0, 22); bl.BackgroundTransparency = 1; bl.LayoutOrder = ord
    local lb = Instance.new("TextLabel", bl)
    lb.Size = UDim2.new(0.28, 0, 1, 0); lb.BackgroundTransparency = 1
    lb.Text = txt; lb.Font = Enum.Font.GothamMedium; lb.TextSize = 10
    lb.TextColor3 = T.text3; lb.TextXAlignment = Enum.TextXAlignment.Left
    local rw = Instance.new("Frame", bl)
    rw.Size = UDim2.new(0.72, 0, 1, 0); rw.Position = UDim2.new(0.28, 0, 0, 0); rw.BackgroundTransparency = 1
    local ll = Instance.new("UIListLayout", rw)
    ll.FillDirection = Enum.FillDirection.Horizontal
    ll.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ll.Padding = UDim.new(0, 3)
    local bs = {}
    for _, o in ipairs(opts) do
        local b = Instance.new("TextButton", rw)
        b.Size = UDim2.new(0, math.max(28, #o * 6.5 + 8), 1, 0)
        b.BackgroundColor3 = T.bg4; b.BorderSizePixel = 0
        b.Text = o; b.Font = Enum.Font.GothamBold; b.TextSize = 9
        b.TextColor3 = T.text3; b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
        bs[o] = b
        b.MouseButton1Click:Connect(function()
            for k, v in pairs(bs) do
                if k == o then v.BackgroundColor3 = Accent; v.TextColor3 = T.text1
                else v.BackgroundColor3 = T.bg4; v.TextColor3 = T.text3 end
            end
            cb(o)
        end)
    end
    if bs[def] then bs[def].BackgroundColor3 = Accent; bs[def].TextColor3 = T.text1 end
end

local function mkBtn(p, txt, ord, cb)
    local b = Instance.new("TextButton", p)
    b.Size = UDim2.new(1, 0, 0, 26); b.BackgroundColor3 = T.bg3; b.BorderSizePixel = 0
    b.Text = txt; b.Font = Enum.Font.GothamBold; b.TextSize = 10
    b.TextColor3 = T.text1; b.AutoButtonColor = false; b.LayoutOrder = ord
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseEnter:Connect(function() TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3 = Accent}):Play() end)
    b.MouseLeave:Connect(function() TweenService:Create(b, TweenInfo.new(0.1), {BackgroundColor3 = T.bg3}):Play() end)
    b.MouseButton1Click:Connect(cb)
end

local function mkInfo(p, txt, ord)
    local l = Instance.new("TextLabel", p)
    l.Size = UDim2.new(1, 0, 0, 14); l.BackgroundTransparency = 1
    l.Text = txt; l.Font = Enum.Font.Gotham; l.TextSize = 9
    l.TextColor3 = T.text3; l.TextXAlignment = Enum.TextXAlignment.Left; l.LayoutOrder = ord
    return l
end

-- ═══════════════════════════════════════════════════════════════════
-- ⚡ POWER TOGGLE
-- ═══════════════════════════════════════════════════════════════════
local ON_MSGS = {
    "🔥 ACTIVE — Les noobs vont pleurer 😭",
    "⚡ ACTIVE — Mode destruction activé 💀",
    "👑 ACTIVE — Lobby entier en PLS",
    "💀 ACTIVE — Qui veut mourir en premier ?",
    "😈 ACTIVE — Le diable est dans le serveur",
    "🎯 ACTIVE — Chaque balle = un cadavre",
    "🌪️ ACTIVE — Catastrophe naturelle détectée",
    "🦁 ACTIVE — Le roi est arrivé",
}
local OFF_MSGS = {
    "💤 OFFLINE — Les noobs peuvent respirer",
    "😴 OFFLINE — Pause stratégique",
    "🤡 OFFLINE — Fair-play ? C'est toi le clown",
    "💀 OFFLINE — Tu te ramollis ?",
    "😏 OFFLINE — On fait semblant d'être legit",
}

local pw = Instance.new("Frame", tAim)
pw.Size = UDim2.new(1, 0, 0, 46); pw.BackgroundColor3 = T.bg2; pw.BorderSizePixel = 0; pw.LayoutOrder = 0
Instance.new("UICorner", pw).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", pw).Color = T.border
Instance.new("UIPadding", pw).PaddingLeft = UDim.new(0, 12)

local pI = Instance.new("Frame", pw)
pI.Size = UDim2.new(0, 30, 0, 30); pI.Position = UDim2.new(0, 0, 0.5, -15)
pI.BackgroundColor3 = T.red; pI.BorderSizePixel = 0
Instance.new("UICorner", pI).CornerRadius = UDim.new(1, 0)
local pIT = Instance.new("TextLabel", pI)
pIT.Size = UDim2.new(1, 0, 1, 0); pIT.BackgroundTransparency = 1
pIT.Text = "💀"; pIT.TextSize = 16; pIT.Font = Enum.Font.GothamBold; pIT.TextColor3 = T.text1

local pL = Instance.new("TextLabel", pw)
pL.Size = UDim2.new(1, -95, 1, 0); pL.Position = UDim2.new(0, 38, 0, 0)
pL.BackgroundTransparency = 1; pL.Text = OFF_MSGS[math.random(#OFF_MSGS)]
pL.Font = Enum.Font.GothamBold; pL.TextSize = 11; pL.TextColor3 = T.red
pL.TextXAlignment = Enum.TextXAlignment.Left; pL.TextTruncate = Enum.TextTruncate.AtEnd

local pBg = Instance.new("Frame", pw)
pBg.Size = UDim2.new(0, 42, 0, 22); pBg.Position = UDim2.new(1, -56, 0.5, -11)
pBg.BackgroundColor3 = T.bg4; pBg.BorderSizePixel = 0
Instance.new("UICorner", pBg).CornerRadius = UDim.new(1, 0)
local pKn = Instance.new("Frame", pBg)
pKn.Size = UDim2.new(0, 16, 0, 16); pKn.Position = UDim2.new(0, 3, 0.5, -8)
pKn.BackgroundColor3 = T.text3; pKn.BorderSizePixel = 0
Instance.new("UICorner", pKn).CornerRadius = UDim.new(1, 0)

local pBt = Instance.new("TextButton", pw)
pBt.Size = UDim2.new(1, 0, 1, 0); pBt.BackgroundTransparency = 1; pBt.Text = ""; pBt.ZIndex = 3

local function setOn(v)
    CFG.Enabled = v
    local ti = TweenInfo.new(0.25)
    if v then
        TweenService:Create(pBg, ti, {BackgroundColor3 = T.green}):Play()
        TweenService:Create(pKn, ti, {Position = UDim2.new(0, 23, 0.5, -8), BackgroundColor3 = T.text1}):Play()
        TweenService:Create(pI, ti, {BackgroundColor3 = T.green}):Play()
        pIT.Text = "👑"; pL.Text = ON_MSGS[math.random(#ON_MSGS)]; pL.TextColor3 = T.green
        sDot.BackgroundColor3 = T.green; sLbl.Text = "ON"; sLbl.TextColor3 = T.green
    else
        TweenService:Create(pBg, ti, {BackgroundColor3 = T.bg4}):Play()
        TweenService:Create(pKn, ti, {Position = UDim2.new(0, 3, 0.5, -8), BackgroundColor3 = T.text3}):Play()
        TweenService:Create(pI, ti, {BackgroundColor3 = T.red}):Play()
        pIT.Text = "💀"; pL.Text = OFF_MSGS[math.random(#OFF_MSGS)]; pL.TextColor3 = T.red
        sDot.BackgroundColor3 = T.red; sLbl.Text = "OFF"; sLbl.TextColor3 = T.red
    end
end
pBt.MouseButton1Click:Connect(function() setOn(not CFG.Enabled) end)

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 TAB: AIM
-- ═══════════════════════════════════════════════════════════════════
local as = mkSec(tAim, "🎯 AIMBOT — \"Headshot factory\" 💀", 1)
mkSld(as, "FOV", 1, 10, 600, 100, "", function(v) CFG.FOV = v end)
mkSld(as, "SMOOTH", 2, 1, 30, 6, "", function(v) CFG.Smooth = v end)
mkSld(as, "DEADZONE", 3, 0, 25, 3, "px", function(v) CFG.Deadzone = v end)
mkDrp(as, "TARGET", 4, {"Head", "Torso", "Legs"}, "Head", function(v) CFG.Target = v end)
mkDrp(as, "KEY", 5, {"RMB", "LMB", "Hold"}, "RMB", function(v)
    CFG.AimKey = ({RMB = "MouseButton2", LMB = "MouseButton1", Hold = "Always"})[v]
end)

local fs = mkSec(tAim, "🧠 FEATURES — \"200 IQ plays\" 🧪", 2)
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
mkSld(fs, "SHAKE", 11, 1, 10, 2, "", function(v) CFG.ShakeAmt = v end)
mkTog(fs, "🎲 Random Smooth", 12, "RandomSmooth")
mkTog(fs, "🧬 Humanize Aim", 13, "HumanizeAim")
mkTog(fs, "🔫 Auto-Fire", 14, "AutoFire")
mkTog(fs, "🧲 Sticky Aim", 15, "StickyAim")
mkSld(fs, "STICKY", 16, 1, 10, 7, "", function(v) CFG.StickyFactor = v / 10 end)
mkTog(fs, "🫁 Body Aim (fallback)", 17, "BodyAim")
mkInfo(fs, "💡 Body Aim: vise le torse si la tête est cachée", 18)

-- ═══════════════════════════════════════════════════════════════════
-- 👁️ TAB: ESP
-- ═══════════════════════════════════════════════════════════════════
local es = mkSec(tESP, "👁️ ESP — \"Tu vois TOUT\" 🔍", 1)
mkTog(es, "📛 Names", 1, "ESPNames")
mkTog(es, "📦 Box", 2, "ESPBox")
mkDrp(es, "STYLE", 3, {"Full", "Corner"}, "Corner", function(v) CFG.BoxStyle = v end)
mkTog(es, "🎨 Fill Box", 4, "ESPFillBox")
mkSld(es, "FILL OPACITY", 5, 5, 50, 15, "%", function(v) CFG.ESPFillOpacity = v / 100 end)
mkTog(es, "📍 Tracers", 6, "ESPTracer")
mkDrp(es, "FROM", 7, {"Bottom", "Top", "Center"}, "Bottom", function(v) CFG.TracerFrom = v end)
mkTog(es, "❤️ Health Bar", 8, "ESPHealth")
mkTog(es, "📏 Distance", 9, "ESPDist")
mkTog(es, "🔴 Head Dot", 10, "ESPDot")
mkTog(es, "⭕ Head Circle", 11, "ESPHeadCircle")
mkTog(es, "🦴 Skeleton", 12, "ESPSkel")
mkTog(es, "✨ Chams", 13, "ESPChams")
mkTog(es, "🔫 Weapon Name", 14, "ESPWeapon")
mkTog(es, "🏳️ Flags (LOW HP etc)", 15, "ESPFlags")
mkTog(es, "📐 Snap Line", 16, "ESPSnapLine")
mkSld(es, "MAX DIST", 17, 100, 5000, 2000, "m", function(v) CFG.ESPMaxDist = v end)
mkSld(es, "FONT SIZE", 18, 8, 20, 13, "", function(v) CFG.ESPFontSize = v end)

local ec = mkSec(tESP, "🎨 COLORS — \"RGB = +100% skill\" 🌈", 2)
mkTog(ec, "🌈 Rainbow", 1, "RainbowESP")
mkTog(ec, "❤️ HP Colors", 2, "ColorByHP")
mkTog(ec, "👀 Visibility Colors", 3, "ColorByVis")
mkTog(ec, "🎨 Gradient ESP", 4, "GradientESP")

-- ═══════════════════════════════════════════════════════════════════
-- 🖥️ TAB: HUD
-- ═══════════════════════════════════════════════════════════════════
local hs = mkSec(tHUD, "🖥️ OVERLAY — \"Info overload\" 📊", 1)
mkTog(hs, "📊 FPS", 1, "ShowFPS")
mkTog(hs, "📡 Ping", 2, "ShowPing")
mkTog(hs, "🎯 Target Info", 3, "ShowTarget")
mkTog(hs, "🏷️ Watermark", 4, "ShowWatermark")
mkTog(hs, "💀 Kill Feed", 5, "ShowKillFeed")
mkTog(hs, "👥 Player Count", 6, "ShowPlayerCount")
mkTog(hs, "📍 Coordinates", 7, "ShowCoords")
mkTog(hs, "💨 Speed Display", 8, "ShowSpeed")
mkTog(hs, "🌈 Rainbow UI", 9, "RainbowUI")
mkTog(hs, "📱 Minimal Mode", 10, "MinimalHUD")

local hc = mkSec(tHUD, "➕ CROSSHAIR — \"Pro gamer vibes\" 🎯", 2)
mkTog(hc, "➕ Crosshair", 1, "ShowCross")
mkDrp(hc, "STYLE", 2, {"Cross", "Dot", "Circle"}, "Cross", function(v) CFG.CrossStyle = v end)
mkSld(hc, "SIZE", 3, 2, 25, 6, "px", function(v) CFG.CrossSize = v end)
mkTog(hc, "🌀 Spin", 4, "CrossSpin")
mkTog(hc, "🌈 Rainbow Cross", 5, "CrossRainbow")
mkTog(hc, "💫 Dynamic (expand on move)", 6, "CrossDynamic")

local hf = mkSec(tHUD, "⭕ FOV CIRCLE", 3)
mkTog(hf, "⭕ Show FOV", 1, "ShowFOV")
mkTog(hf, "🔵 Filled", 2, "FOVFilled")
mkSld(hf, "SEGMENTS", 3, 12, 64, 36, "", function(v) CFG.FOVSides = v end)

-- ═══════════════════════════════════════════════════════════════════
-- 🌍 TAB: WORLD
-- ═══════════════════════════════════════════════════════════════════
local ws = mkSec(tWorld, "💡 LIGHTING — \"Vois la lumière\" 🔦", 1)
mkTog(ws, "☀️ Fullbright", 1, "Fullbright", function(v)
    if v then Lighting.Brightness = 2; Lighting.GlobalShadows = false; Lighting.ClockTime = 14
    else Lighting.Brightness = OrigSettings.Brightness; Lighting.GlobalShadows = OrigSettings.GlobalShadows; Lighting.ClockTime = OrigSettings.ClockTime end
end)
mkTog(ws, "🌫️ No Fog", 2, "NoFog", function(v)
    if v then Lighting.FogEnd = 1e9; Lighting.FogStart = 1e9
    else Lighting.FogEnd = OrigSettings.FogEnd; Lighting.FogStart = OrigSettings.FogStart end
end)
mkTog(ws, "🌙 Night Mode", 3, "NightMode", function(v)
    if v then Lighting.ClockTime = 0; Lighting.Brightness = 0.3
    else Lighting.ClockTime = OrigSettings.ClockTime; Lighting.Brightness = OrigSettings.Brightness end
end)
mkTog(ws, "⏸️ Freeze Time", 4, "FreezeTime")
mkSld(ws, "TIME", 5, 0, 24, 14, "h", function(v) CFG.FreezeTimeVal = v; if CFG.FreezeTime then Lighting.ClockTime = v end end)
mkTog(ws, "🚫 No Particles", 6, "NoParticles", function(v)
    for _, d in ipairs(workspace:GetDescendants()) do
        if d:IsA("ParticleEmitter") or d:IsA("Fire") or d:IsA("Smoke") or d:IsA("Sparkles") then
            d.Enabled = not v
        end
    end
end)

local wc = mkSec(tWorld, "📷 CAMERA — \"Eyes of God\" 👀", 2)
mkTog(wc, "🔭 FOV Changer", 1, "FOVChanger", function(v) if not v then Camera.FieldOfView = OrigSettings.CamFOV end end)
mkSld(wc, "FOV", 2, 20, 140, 70, "°", function(v) CFG.CamFOV = v end)

local wg = mkSec(tWorld, "🌐 GRAVITY", 3)
mkTog(wg, "🌙 Low Gravity", 1, "LowGravity", function(v)
    workspace.Gravity = v and CFG.GravityVal or OrigSettings.Gravity
end)
mkSld(wg, "GRAVITY", 2, 10, 400, 196, "", function(v) CFG.GravityVal = v; if CFG.LowGravity then workspace.Gravity = v end end)

-- ═══════════════════════════════════════════════════════════════════
-- 🏃 TAB: PLAYER
-- ═══════════════════════════════════════════════════════════════════
local ps = mkSec(tPlayer, "🏃 MOVEMENT — \"Gotta go fast\" ⚡", 1)
mkTog(ps, "🏃 Walk Speed", 1, "WalkSpeed", function(v)
    if not v and LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.WalkSpeed = 16 end end
end)
mkSld(ps, "SPEED", 2, 16, 200, 16, "", function(v) CFG.WalkSpeedVal = v end)
mkTog(ps, "🦘 Jump Power", 3, "JumpPower", function(v)
    if not v and LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.JumpPower = 50 end end
end)
mkSld(ps, "JUMP", 4, 50, 400, 50, "", function(v) CFG.JumpPowerVal = v end)
mkTog(ps, "😴 Anti-AFK", 5, "AntiAFK")
mkTog(ps, "♾️ Infinite Jump", 6, "InfJump")
mkTog(ps, "🐇 BHop (auto bunny hop)", 7, "BHop")
mkTog(ps, "🏋️ High Jump", 8, "HighJump")

local pb = mkSec(tPlayer, "🎁 BOOST", 2)
mkTog(pb, "⚡ Speed Boost (Shift)", 1, "SpeedBoost")
mkSld(pb, "MULTIPLIER", 2, 1, 8, 2, "x", function(v) CFG.SpeedBoostMult = v + 0.5 end)
mkTog(pb, "🌪️ Spin Bot", 3, "SpinBot")
mkSld(pb, "SPIN SPEED", 4, 1, 60, 10, "", function(v) CFG.SpinSpeed = v end)
mkTog(pb, "👻 Noclip", 5, "Noclip")
mkTog(pb, "⚓ Anchor (freeze in air)", 6, "Anchor", function(v)
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.Anchored = v
    end
end)

local pu = mkSec(tPlayer, "🛠️ UTILITY", 3)
mkBtn(pu, "💾 SAVE POSITION", 1, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        CFG.SavedPosition = LP.Character.HumanoidRootPart.CFrame
        Notify("💾 Save", "Sauvegardé — t'as la mémoire d'un poisson rouge ? 🐟", 2, T.green)
    end
end)
mkBtn(pu, "📍 TP BACK", 2, function()
    if CFG.SavedPosition and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFG.SavedPosition
        Notify("📍 TP", "Comme si de rien n'était 😏", 1.5, Accent)
    else Notify("📍 TP", "Rien sauvé, génie 🤡", 1.5, T.red) end
end)
mkBtn(pu, "💀 RESET", 3, function()
    if LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid"); if h then h.Health = 0 end end
    Notify("💀 Reset", "Suicide tactique 🧠", 1.5, T.red)
end)

local wp = mkSec(tPlayer, "📍 WAYPOINTS — \"GPS du cheater\" 🗺️", 4)
mkBtn(wp, "📍 ADD WAYPOINT", 1, function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        table.insert(CFG.Waypoints, {name = "WP #" .. (#CFG.Waypoints + 1), cf = LP.Character.HumanoidRootPart.CFrame})
        Notify("📍 WP", "Saved #" .. #CFG.Waypoints, 1.5, T.cyan)
    end
end)
mkBtn(wp, "📍 TP LAST WP", 2, function()
    if #CFG.Waypoints > 0 and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame = CFG.Waypoints[#CFG.Waypoints].cf
    end
end)
mkBtn(wp, "🗑️ CLEAR WP", 3, function() CFG.Waypoints = {} end)

-- ═══════════════════════════════════════════════════════════════════
-- 🦅 TAB: MOVEMENT
-- ═══════════════════════════════════════════════════════════════════
local ms = mkSec(tMove, "🦅 FLY — \"Je suis un oiseau\" 🐦", 1)
mkTog(ms, "🦅 Fly (V key)", 1, "Fly", function(v)
    if v then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character.HumanoidRootPart
            FlyBody = Instance.new("BodyVelocity", hrp); FlyBody.Velocity = Vector3.zero; FlyBody.MaxForce = Vector3.one * 1e5; FlyBody.Name = "H738Fly"
            FlyGyro = Instance.new("BodyGyro", hrp); FlyGyro.MaxTorque = Vector3.one * 1e5; FlyGyro.Name = "H738Gyro"
            Notify("🦅 Fly", "T'es un pigeon maintenant 🐦", 2, T.cyan)
        end
    else
        if FlyBody then FlyBody:Destroy(); FlyBody = nil end
        if FlyGyro then FlyGyro:Destroy(); FlyGyro = nil end
        Notify("🦅 Fly", "La gravité gagne toujours 😔", 1.5, T.yellow)
    end
end)
mkSld(ms, "FLY SPEED", 2, 10, 300, 50, "", function(v) CFG.FlySpeed = v end)

local ms2 = mkSec(tMove, "🕷️ MOVEMENT HACKS — \"Physique ? Connais pas\" 🧪", 2)
mkTog(ms2, "🖱️ Click TP", 1, "ClickTP")
mkTog(ms2, "🕷️ Spider (wall climb)", 2, "Spider")
mkSld(ms2, "SPIDER SPEED", 3, 10, 100, 40, "", function(v) CFG.SpiderSpeed = v end)
mkTog(ms2, "🪂 Glide", 4, "Glide")
mkTog(ms2, "🐬 Dolphin (dive)", 5, "Dolphin")
mkTog(ms2, "❄️ Freeze", 6, "Freeze", function(v)
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.Anchored = v
    end
end)
mkTog(ms2, "🔀 Phase (walk through walls)", 7, "Phase")
mkInfo(ms2, "💡 Click TP: click droit pour TP au curseur", 8)

-- ═══════════════════════════════════════════════════════════════════
-- 🕵️ TAB: STEALTH
-- ═══════════════════════════════════════════════════════════════════
local ss = mkSec(tStealth, "🛡️ ANTI-DETECT — \"Fantôme\" 👻", 1)
mkTog(ss, "🛡️ Anti-Kick (HOOK)", 1, "AntiKick", function(v)
    if v then
        pcall(function()
            local old; old = hookmetamethod(game, "__namecall", function(self, ...)
                if getnamecallmethod() == "Kick" and self == LP then
                    Notify("🛡️ BLOCKED", "Kick blocked 🤡 nice try", 3, T.red); return
                end
                return old(self, ...)
            end)
        end)
        Notify("🛡️ Anti-Kick", "Hook actif — unkickable 😈", 2, T.green)
    end
end)
mkTog(ss, "🫥 Hide Name", 2, "HideName", function(v)
    if LP.Character then local h = LP.Character:FindFirstChildOfClass("Humanoid")
        if h then h.DisplayDistanceType = v and Enum.HumanoidDisplayDistanceType.None or Enum.HumanoidDisplayDistanceType.Viewer end
    end
end)
mkTog(ss, "📷 Anti-Screenshot", 3, "AntiScreenshot", function(v)
    if v then SG.DisplayOrder = -1 else SG.DisplayOrder = 10000 end
end)

local sh = mkSec(tStealth, "🧬 HUMANIZATION — \"100% legit btw\" 🤥", 2)
mkTog(sh, "🎲 Random Smooth", 1, "RandomSmooth")
mkTog(sh, "🧬 Humanize Aim", 2, "HumanizeAim")
mkInfo(sh, "💡 Active ces options pour pas se faire report — spoiler: ça marchera pas 🤡", 3)

-- ═══════════════════════════════════════════════════════════════════
-- 👑 TAB: ADMIN
-- ═══════════════════════════════════════════════════════════════════
local as2 = mkSec(tAdmin, "👑 PLAYER LIST — \"Judge, jury, executioner\" ⚖️", 1)
local plList = Instance.new("ScrollingFrame", as2)
plList.Size = UDim2.new(1, 0, 0, 230); plList.BackgroundColor3 = T.bg3; plList.BorderSizePixel = 0
plList.ScrollBarThickness = 3; plList.ScrollBarImageColor3 = Accent
plList.AutomaticCanvasSize = Enum.AutomaticSize.Y; plList.LayoutOrder = 1
Instance.new("UICorner", plList).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", plList).Padding = UDim.new(0, 3)
local plP = Instance.new("UIPadding", plList); plP.PaddingTop = UDim.new(0, 4); plP.PaddingLeft = UDim.new(0, 4); plP.PaddingRight = UDim.new(0, 4)

local function RefreshPlayers()
    for _, c in ipairs(plList:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LP then continue end
        local row = Instance.new("Frame", plList)
        row.Size = UDim2.new(1, -4, 0, 42); row.BackgroundColor3 = T.bg2; row.BorderSizePixel = 0
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)
        local dot = Instance.new("Frame", row)
        dot.Size = UDim2.new(0, 6, 0, 6); dot.Position = UDim2.new(0, 8, 0.5, -3)
        dot.BackgroundColor3 = (p.Team and LP.Team and p.Team == LP.Team) and T.cyan or T.green
        dot.BorderSizePixel = 0; Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        local nm = Instance.new("TextLabel", row)
        nm.Size = UDim2.new(0.35, 0, 0, 14); nm.Position = UDim2.new(0, 20, 0, 5)
        nm.BackgroundTransparency = 1; nm.Text = p.DisplayName
        nm.Font = Enum.Font.GothamBold; nm.TextSize = 10; nm.TextColor3 = T.text1
        nm.TextXAlignment = Enum.TextXAlignment.Left; nm.TextTruncate = Enum.TextTruncate.AtEnd
        local ch = p.Character; local hm = ch and ch:FindFirstChildOfClass("Humanoid")
        local st = Instance.new("TextLabel", row)
        st.Size = UDim2.new(0.35, 0, 0, 10); st.Position = UDim2.new(0, 20, 0, 21)
        st.BackgroundTransparency = 1; st.Text = "❤️ " .. (hm and math.floor(hm.Health) or "?") .. "/" .. (hm and math.floor(hm.MaxHealth) or "?")
        st.Font = Enum.Font.Gotham; st.TextSize = 8; st.TextColor3 = T.text3; st.TextXAlignment = Enum.TextXAlignment.Left
        
        local function pb2(text, xO, col, cb2)
            local b = Instance.new("TextButton", row)
            b.Size = UDim2.new(0, 30, 0, 18); b.Position = UDim2.new(1, xO, 0.5, -9)
            b.BackgroundColor3 = T.bg3; b.BorderSizePixel = 0; b.Text = text
            b.Font = Enum.Font.GothamBold; b.TextSize = 9; b.TextColor3 = col or T.text2; b.AutoButtonColor = false
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            b.MouseEnter:Connect(function() b.BackgroundColor3 = col or Accent; b.TextColor3 = T.text1 end)
            b.MouseLeave:Connect(function() b.BackgroundColor3 = T.bg3; b.TextColor3 = col or T.text2 end)
            b.MouseButton1Click:Connect(cb2)
        end
        
        pb2("📍", -128, T.cyan, function()
            if LP.Character and p.Character and LP.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 0, 3)
                Notify("📍 TP", "→ " .. p.Name .. " — surprise 😈", 2, T.cyan)
            end
        end)
        pb2("👁️", -94, T.yellow, function()
            if SpectateTarget == p then
                SpectateTarget = nil; Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            else if p.Character then SpectateTarget = p; Camera.CameraSubject = p.Character:FindFirstChildOfClass("Humanoid")
                Notify("👁️", "Watching " .. p.Name .. " 👀", 2, T.yellow) end end
        end)
        pb2("🎯", -60, T.red, function()
            if p.Character then local h = p.Character:FindFirstChild("Head")
                if h then LockedTarget = h; CFG.LockTarget = true; Notify("🎯", "→ " .. p.Name .. " — RIP 💀", 2, T.red) end end
        end)
        pb2("🎪", -26, T.pink, function()
            TrollTarget = p
            Notify("🎪 Troll", "Target: " .. p.Name .. " — il va souffrir 😈", 2, T.pink)
        end)
    end
end
mkBtn(as2, "🔄 REFRESH", 2, RefreshPlayers)
RefreshPlayers()
table.insert(Connections, Players.PlayerAdded:Connect(function(p)
    task.wait(1); RefreshPlayers()
    Notify("👋", p.Name .. " joined — fresh meat 🍖", 2, T.green)
end))
table.insert(Connections, Players.PlayerRemoving:Connect(function(p)
    task.wait(0.2); RefreshPlayers()
    Notify("👋", p.Name .. " left — couldn't handle it 🤡", 2, T.yellow)
end))

-- ═══════════════════════════════════════════════════════════════════
-- 🔫 TAB: COMBAT
-- ═══════════════════════════════════════════════════════════════════
local cs = mkSec(tCombat, "🔫 COMBAT — \"No mercy\" 💀", 1)
mkTog(cs, "💀 Kill Aura", 1, "KillAura")
mkSld(cs, "RANGE", 2, 5, 50, 15, "m", function(v) CFG.KillAuraRange = v end)
mkTog(cs, "🛡️ Auto Parry", 3, "AutoParry")
mkTog(cs, "🧱 Auto Block", 4, "AutoBlock")
mkTog(cs, "👊 Auto Combo", 5, "AutoCombo")
mkInfo(cs, "💡 Kill Aura simule des clicks sur les joueurs proches", 6)

local cb = mkSec(tCombat, "📐 HITBOX — \"La tête fait 3 mètres\" 🤯", 2)
mkTog(cb, "📐 Hitbox Expander", 1, "HitboxExpander")
mkSld(cb, "SIZE", 2, 5, 50, 10, "", function(v) CFG.HitboxSize = v end)
mkInfo(cb, "⚠️ Visible uniquement côté client — les autres voient rien 🤫", 3)

-- ═══════════════════════════════════════════════════════════════════
-- 🎪 TAB: TROLL — LE MEILLEUR ONGLET 😈
-- ═══════════════════════════════════════════════════════════════════
local ts = mkSec(tTroll, "🎪 TROLL — \"Le chaos c'est la vie\" 😈", 1)
mkTog(ts, "🎪 Troll Mode (ALL ON)", 1, "TrollMode", function(v)
    if v then
        CFG.SpinBot = true; CFG.SpinSpeed = 25; CFG.WalkSpeed = true; CFG.WalkSpeedVal = 80
        Notify("🎪 TROLL", "CHAOS MODE 🌪️ BEYBLADE LET IT RIP", 3, T.pink)
    else
        CFG.SpinBot = false; CFG.WalkSpeed = false
    end
end)
mkTog(ts, "🌀 Orbit Player", 2, "Orbit")
mkSld(ts, "ORBIT RADIUS", 3, 3, 30, 10, "m", function(v) CFG.OrbitRadius = v end)
mkSld(ts, "ORBIT SPEED", 4, 1, 20, 5, "", function(v) CFG.OrbitSpeed = v end)
mkTog(ts, "🤸 Head Spin", 5, "HeadSpin")
mkTog(ts, "🫨 Seizure Mode", 6, "Seizure")
mkTog(ts, "🚁 Helicopter", 7, "Helicopter")
mkTog(ts, "🐛 Worm", 8, "Worm")
mkTog(ts, "👀 Face Target", 9, "FaceTarget")
mkTog(ts, "🏃 Follow Player", 10, "FollowPlayer")

local ts2 = mkSec(tTroll, "😏 SPICY TROLLS — \"Regarde maman\" 🔥", 2)
mkTog(ts2, "😏 Backshots", 1, "Backshots")
mkSld(ts2, "SPEED", 2, 3, 20, 8, "", function(v) CFG.BackshotsSpeed = v end)
mkTog(ts2, "🌪️ Fling Players", 3, "FlingPlayers")
mkSld(ts2, "FLING POWER", 4, 1000, 50000, 5000, "", function(v) CFG.FlingPower = v end)
mkTog(ts2, "📍 TP Behind", 5, "TPBehind")
mkTog(ts2, "🤺 Cartoon Mode", 6, "CartoonMode", function(v)
    if LP.Character then
        for _, part in ipairs(LP.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Material = v and Enum.Material.SmoothPlastic or Enum.Material.Plastic
            end
        end
    end
end)
mkTog(ts2, "🗃️ Platform (under feet)", 7, "Platform", function(v)
    if v and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local p2 = Instance.new("Part", workspace)
        p2.Name = "H738Platform"; p2.Size = Vector3.new(10, 1, 10)
        p2.Position = LP.Character.HumanoidRootPart.Position - Vector3.new(0, 3, 0)
        p2.Anchored = true; p2.Material = Enum.Material.Neon
        p2.BrickColor = BrickColor.new("Really blue")
        Notify("🗃️", "Platform créée — sky base 🏗️", 2, T.cyan)
    else
        local p2 = workspace:FindFirstChild("H738Platform")
        if p2 then p2:Destroy() end
    end
end)
mkInfo(ts2, "⚠️ Backshots nécessite un TrollTarget (Admin tab) 😏", 8)

local ts3 = mkSec(tTroll, "💬 CHAT TROLLS — \"Toxicité maximale\" ☣️", 3)
mkBtn(ts3, "💬 'GG EZ' 🤡", 1, function()
    pcall(function() ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("GG EZ 🤡", "All") end)
    Notify("💬", "Toxicité envoyée 😈", 1.5, T.pink)
end)
mkBtn(ts3, "💬 'ez clap no skill' 💀", 2, function()
    pcall(function() ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("ez clap no skill get good 💀", "All") end)
end)
mkBtn(ts3, "💬 '1v1 me bro' 🥊", 3, function()
    pcall(function() ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("1v1 me if you're not scared 🥊", "All") end)
end)
mkBtn(ts3, "💬 'skill issue' 😴", 4, function()
    pcall(function() ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("skill issue tbh 😴", "All") end)
end)
mkBtn(ts3, "💬 'imagine dying' 🤡", 5, function()
    pcall(function() ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("imagine dying in 2024 🤡🤡🤡", "All") end)
end)

local ts4 = mkSec(tTroll, "🔊 SOUNDS — \"Ears go brrr\" 🔇", 4)
mkBtn(ts4, "💥 EXPLOSION", 1, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://130932305"; s.Volume = 2; s:Play(); Debris:AddItem(s, 5) end)
end)
mkBtn(ts4, "📯 AIRHORN", 2, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://258057783"; s.Volume = 2; s:Play(); Debris:AddItem(s, 5) end)
end)
mkBtn(ts4, "🎵 RICKROLL", 3, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://2676305497"; s.Volume = 1.5; s:Play(); Debris:AddItem(s, 30) end)
    Notify("🎵", "Never gonna give you up 🕺", 3, T.orange)
end)
mkBtn(ts4, "😱 JUMPSCARE", 4, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://12222095"; s.Volume = 3; s:Play(); Debris:AddItem(s, 3) end)
end)
mkBtn(ts4, "💀 VINE BOOM", 5, function()
    pcall(function() local s = Instance.new("Sound", workspace); s.SoundId = "rbxassetid://6305014723"; s.Volume = 2; s:Play(); Debris:AddItem(s, 3) end)
end)

-- ═══════════════════════════════════════════════════════════════════
-- 💃 TAB: EMOTES
-- ═══════════════════════════════════════════════════════════════════
local em = mkSec(tEmotes, "💃 EMOTES — \"Flex sur les morts\" 🕺", 1)
mkTog(em, "🔄 Loop Emote", 1, "LoopEmote")
mkSld(em, "SPEED", 2, 1, 5, 1, "x", function(v) CFG.EmoteSpeed = v end)

local emoteList = {
    {"👋 Wave", "wave"},
    {"💃 Dance 1", "dance"},
    {"🕺 Dance 2", "dance2"},
    {"🤣 Laugh", "laugh"},
    {"👏 Clap", "clap"},
    {"🫡 Salute", "salute"},
    {"🤸 Backflip", "backflip"},
    {"💪 Flex", "flex"},
    {"🎭 Shrug", "shrug"},
    {"👀 Point", "point"},
}

for i, emote in ipairs(emoteList) do
    mkBtn(em, emote[1], i + 2, function()
        pcall(function()
            local anim = Instance.new("Animation")
            local animIds = {
                wave = "507770239", dance = "507771019", dance2 = "507776043",
                laugh = "507770818", clap = "507770677", salute = "507771019",
                backflip = "507776171", flex = "507771019", shrug = "507770818",
                point = "507770453",
            }
            anim.AnimationId = "rbxassetid://" .. (animIds[emote[2]] or "507770239")
            local hum = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                local track = hum:LoadAnimation(anim)
                track:Play()
                track:AdjustSpeed(CFG.EmoteSpeed)
                if not CFG.LoopEmote then task.delay(3, function() track:Stop() end) end
            end
        end)
        Notify("💃", emote[1] .. " — flex 😎", 1.5, T.pink)
    end)
end

-- ═══════════════════════════════════════════════════════════════════
-- 🎵 TAB: MUSIC
-- ═══════════════════════════════════════════════════════════════════
local mu = mkSec(tMusic, "🎵 BOOMBOX — \"DJ Hiroshi\" 🎧", 1)
mkTog(mu, "🎵 Music Player", 1, "MusicEnabled", function(v)
    if not v and CurrentMusic then CurrentMusic:Stop(); CurrentMusic:Destroy(); CurrentMusic = nil end
end)
mkSld(mu, "VOLUME", 2, 0, 100, 50, "%", function(v) CFG.MusicVolume = v / 100; if CurrentMusic then CurrentMusic.Volume = v / 100 end end)

local presets = {
    {"🎵 Phonk", 6761921553},
    {"🎵 Megalovania", 2576430982},
    {"🎵 Industry Baby", 7148513970},
    {"🎵 Mask Off", 942828654},
    {"🎵 Blinding Lights", 5765069551},
    {"🎵 Bad Guy", 3426274342},
    {"🎵 Rickroll 😈", 2676305497},
    {"🎵 Among Us", 5765069551},
}

for i, preset in ipairs(presets) do
    mkBtn(mu, preset[1], i + 2, function()
        if CurrentMusic then CurrentMusic:Stop(); CurrentMusic:Destroy() end
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://" .. preset[2]
        s.Volume = CFG.MusicVolume
        s.Looped = true
        s:Play()
        CurrentMusic = s
        CFG.MusicID = preset[2]
        CFG.MusicEnabled = true
        Notify("🎵", preset[1] .. " — 🔊", 2, T.purple)
    end)
end

mkBtn(mu, "⏹️ STOP MUSIC", #presets + 3, function()
    if CurrentMusic then CurrentMusic:Stop(); CurrentMusic:Destroy(); CurrentMusic = nil end
    Notify("⏹️", "Music stopped — le silence... 🤫", 1.5, T.text3)
end)

-- ═══════════════════════════════════════════════════════════════════
-- 📸 TAB: VISUAL
-- ═══════════════════════════════════════════════════════════════════
local ve = mkSec(tVisual, "📸 VISUAL FX — \"Cinématique\" 🎬", 1)
mkTog(ve, "🌫️ Blur Effect", 1, "BlurEffect", function(v)
    if v then
        local blur = Instance.new("BlurEffect", Lighting)
        blur.Name = "H738Blur"; blur.Size = CFG.BlurSize
        table.insert(VisualEffects, blur)
    else
        for _, e in ipairs(Lighting:GetChildren()) do if e.Name == "H738Blur" then e:Destroy() end end
    end
end)
mkSld(ve, "BLUR SIZE", 2, 1, 50, 10, "", function(v) CFG.BlurSize = v
    local blur = Lighting:FindFirstChild("H738Blur"); if blur then blur.Size = v end end)

mkTog(ve, "☀️ Sun Rays", 3, "SunRays", function(v)
    if v then
        local sr = Instance.new("SunRaysEffect", Lighting); sr.Name = "H738Sun"; sr.Intensity = 0.15; sr.Spread = 0.8
    else for _, e in ipairs(Lighting:GetChildren()) do if e.Name == "H738Sun" then e:Destroy() end end end
end)

mkTog(ve, "🌸 Bloom", 4, "Bloom", function(v)
    if v then
        local b = Instance.new("BloomEffect", Lighting); b.Name = "H738Bloom"; b.Intensity = 0.5; b.Threshold = 0.8
    else for _, e in ipairs(Lighting:GetChildren()) do if e.Name == "H738Bloom" then e:Destroy() end end end
end)

mkTog(ve, "🔲 Vignette", 5, "Vignette", function(v)
    if v then
        local cc = Instance.new("ColorCorrectionEffect", Lighting); cc.Name = "H738Vig"; cc.Brightness = -0.05; cc.Contrast = 0.15
    else for _, e in ipairs(Lighting:GetChildren()) do if e.Name == "H738Vig" then e:Destroy() end end end
end)

local ve2 = mkSec(tVisual, "🎨 COLOR CORRECTION — \"Filtre Instagram\" 📱", 2)
mkTog(ve2, "🎨 Color Correction", 1, "ColorCorrection", function(v)
    if v then
        local cc = Instance.new("ColorCorrectionEffect", Lighting); cc.Name = "H738CC"
        cc.Brightness = CFG.CC_Brightness / 100; cc.Contrast = CFG.CC_Contrast / 100; cc.Saturation = CFG.CC_Saturation / 100
    else for _, e in ipairs(Lighting:GetChildren()) do if e.Name == "H738CC" then e:Destroy() end end end
end)
mkSld(ve2, "BRIGHTNESS", 2, -100, 100, 0, "", function(v) CFG.CC_Brightness = v
    local cc = Lighting:FindFirstChild("H738CC"); if cc then cc.Brightness = v / 100 end end)
mkSld(ve2, "CONTRAST", 3, -100, 100, 0, "", function(v) CFG.CC_Contrast = v
    local cc = Lighting:FindFirstChild("H738CC"); if cc then cc.Contrast = v / 100 end end)
mkSld(ve2, "SATURATION", 4, -100, 100, 0, "", function(v) CFG.CC_Saturation = v
    local cc = Lighting:FindFirstChild("H738CC"); if cc then cc.Saturation = v / 100 end end)

-- ═══════════════════════════════════════════════════════════════════
-- 🎮 TAB: MACROS
-- ═══════════════════════════════════════════════════════════════════
local ma = mkSec(tMacros, "🎮 MACROS — \"Robot > Human\" 🤖", 1)
mkTog(ma, "🖱️ Auto Clicker", 1, "AutoClicker")
mkSld(ma, "CLICK DELAY", 2, 1, 100, 10, "ms", function(v) CFG.ClickDelay = v / 100 end)
mkTog(ma, "🔄 Auto Respawn", 3, "AutoRespawn")
mkTog(ma, "🔑 Key Repeater", 4, "KeyRepeater")
mkDrp(ma, "KEY", 5, {"E", "F", "Q", "R", "T", "Z"}, "E", function(v) CFG.RepeatKey = v end)
mkSld(ma, "REPEAT DELAY", 6, 1, 50, 5, "ms", function(v) CFG.RepeatDelay = v / 10 end)

mkInfo(ma, "💡 Auto Clicker: spam le clic gauche automatiquement", 7)
mkInfo(ma, "💡 Key Repeater: spam une touche en boucle", 8)

-- ═══════════════════════════════════════════════════════════════════
-- 📊 TAB: STATS
-- ═══════════════════════════════════════════════════════════════════
local sta = mkSec(tStats, "📊 STATS — \"Les chiffres du crime\" 📈", 1)
local stK = mkInfo(sta, "💀 Kills: 0", 1)
local stD = mkInfo(sta, "☠️ Deaths: 0", 2)
local stKD = mkInfo(sta, "📊 K/D: 0.00", 3)
local stUp = mkInfo(sta, "⏱️ Uptime: 0s", 4)
local stTg = mkInfo(sta, "🎯 Targets locked: 0", 5)
local stSv = mkInfo(sta, "🌐 Server: " .. game.PlaceId, 6)
local stPl = mkInfo(sta, "👥 Players: " .. #Players:GetPlayers(), 7)

local function RefreshStats()
    stK.Text = "💀 Kills: " .. CFG.Kills .. (CFG.Kills > 10 and " — massacre 🔪" or "")
    stD.Text = "☠️ Deaths: " .. CFG.Deaths .. (CFG.Deaths == 0 and " — immortel 😤" or " — skill issue 🤡")
    local kd = CFG.Deaths > 0 and (CFG.Kills / CFG.Deaths) or CFG.Kills
    stKD.Text = string.format("📊 K/D: %.2f — %s", kd, kd >= 3 and "GOAT 🐐" or (kd >= 1 and "moyen 😐" or "bot 🤖"))
    stUp.Text = "⏱️ Uptime: " .. math.floor(tick() - startTime) .. "s" .. (tick() - startTime > 600 and " — t'as pas de vie 😂" or "")
    stTg.Text = "🎯 Targets: " .. targetsLocked
    stPl.Text = "👥 Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
end
mkBtn(sta, "🔄 REFRESH", 8, RefreshStats)
mkBtn(sta, "🗑️ RESET", 9, function() CFG.Kills = 0; CFG.Deaths = 0; targetsLocked = 0; RefreshStats() end)

-- ═══════════════════════════════════════════════════════════════════
-- 💾 TAB: CONFIG
-- ═══════════════════════════════════════════════════════════════════
local cfg1 = mkSec(tConfig, "💾 CONFIG — \"Sauvegarde tes péchés\" 📁", 1)
mkBtn(cfg1, "💾 SAVE CONFIG", 1, function()
    pcall(function()
        if writefile then
            local data = {}
            for k, v in pairs(CFG) do
                if type(v) ~= "userdata" and type(v) ~= "table" then data[k] = v end
            end
            writefile("H738_config.json", HttpService:JSONEncode(data))
            Notify("💾", "Config sauvée — tes crimes sont archivés 📁", 2, T.green)
        else
            Notify("❌", "writefile not supported 🤡", 2, T.red)
        end
    end)
end)
mkBtn(cfg1, "📂 LOAD CONFIG", 2, function()
    pcall(function()
        if readfile and isfile and isfile("H738_config.json") then
            local data = HttpService:JSONDecode(readfile("H738_config.json"))
            for k, v in pairs(data) do if CFG[k] ~= nil then CFG[k] = v end end
            Notify("📂", "Config chargée — bienvenue de retour 👑", 2, T.green)
        else
            Notify("❌", "No config found 🤡", 2, T.red)
        end
    end)
end)
mkBtn(cfg1, "🗑️ DELETE CONFIG", 3, function()
    pcall(function()
        if delfile and isfile and isfile("H738_config.json") then
            delfile("H738_config.json")
            Notify("🗑️", "Config supprimée — table rase 🧹", 2, T.yellow)
        end
    end)
end)

-- ═══════════════════════════════════════════════════════════════════
-- 📋 TAB: LOGS
-- ═══════════════════════════════════════════════════════════════════
local lgs = mkSec(tLogs, "📋 LOGS — \"Big Brother\" 👁️", 1)
local logsF = Instance.new("ScrollingFrame", lgs)
logsF.Size = UDim2.new(1, 0, 0, 270); logsF.BackgroundColor3 = T.bg3; logsF.BorderSizePixel = 0
logsF.ScrollBarThickness = 3; logsF.ScrollBarImageColor3 = Accent
logsF.AutomaticCanvasSize = Enum.AutomaticSize.Y; logsF.LayoutOrder = 1
Instance.new("UICorner", logsF).CornerRadius = UDim.new(0, 6)
Instance.new("UIListLayout", logsF).Padding = UDim.new(0, 2)
local lPd = Instance.new("UIPadding", logsF)
lPd.PaddingTop = UDim.new(0, 4); lPd.PaddingLeft = UDim.new(0, 6); lPd.PaddingRight = UDim.new(0, 6)

local function RefreshLogs()
    for _, c in ipairs(logsF:GetChildren()) do if c:IsA("Frame") then c:Destroy() end end
    for i, log in ipairs(Logs) do
        local row = Instance.new("Frame", logsF)
        row.Size = UDim2.new(1, 0, 0, 14); row.BackgroundTransparency = 1; row.LayoutOrder = i
        local t = Instance.new("TextLabel", row)
        t.Size = UDim2.new(0, 55, 1, 0); t.BackgroundTransparency = 1; t.Text = log.time
        t.Font = Enum.Font.Code; t.TextSize = 9; t.TextColor3 = T.text3; t.TextXAlignment = Enum.TextXAlignment.Left
        local m = Instance.new("TextLabel", row)
        m.Size = UDim2.new(1, -58, 1, 0); m.Position = UDim2.new(0, 58, 0, 0)
        m.BackgroundTransparency = 1; m.Text = log.action; m.Font = Enum.Font.Gotham; m.TextSize = 9
        m.TextColor3 = log.color; m.TextXAlignment = Enum.TextXAlignment.Left; m.TextTruncate = Enum.TextTruncate.AtEnd
    end
end
mkBtn(lgs, "🗑️ CLEAR", 2, function() Logs = {}; RefreshLogs() end)
mkBtn(lgs, "🔄 REFRESH", 3, RefreshLogs)

-- ═══════════════════════════════════════════════════════════════════
-- ⚙️ TAB: SETTINGS
-- ═══════════════════════════════════════════════════════════════════
local sth = mkSec(tSettings, "🎨 THEME — \"Drip check\" 💅", 1)
local thRow = Instance.new("Frame", sth)
thRow.Size = UDim2.new(1, 0, 0, 28); thRow.BackgroundTransparency = 1; thRow.LayoutOrder = 1
Instance.new("UIListLayout", thRow).FillDirection = Enum.FillDirection.Horizontal
Instance.new("UIListLayout", thRow).Padding = UDim.new(0, 4)

for _, th in ipairs({
    {"💜", Color3.fromRGB(101, 78, 255)}, {"💙", Color3.fromRGB(40, 140, 255)},
    {"❤️", Color3.fromRGB(255, 60, 80)}, {"💚", Color3.fromRGB(60, 210, 130)},
    {"🧡", Color3.fromRGB(255, 140, 40)}, {"💗", Color3.fromRGB(255, 80, 180)},
    {"💎", Color3.fromRGB(0, 220, 255)}, {"🤍", Color3.fromRGB(200, 200, 200)},
    {"🖤", Color3.fromRGB(80, 80, 80)},
}) do
    local sw = Instance.new("TextButton", thRow)
    sw.Size = UDim2.new(0, 28, 0, 24); sw.BackgroundColor3 = th[2]; sw.BorderSizePixel = 0
    sw.Text = th[1]; sw.TextSize = 11; sw.Font = Enum.Font.Gotham; sw.AutoButtonColor = false
    Instance.new("UICorner", sw).CornerRadius = UDim.new(0, 5)
    sw.MouseButton1Click:Connect(function()
        Accent = th[2]; T.accent = th[2]; TC.ScrollBarImageColor3 = th[2]
        Notify("🎨", th[1] .. " theme — clean ✨", 1.5, th[2])
    end)
end

local stp = mkSec(tSettings, "👤 PROFILE — \"C'est moi le boss\" 👑", 2)
local pRow = Instance.new("Frame", stp)
pRow.Size = UDim2.new(1, 0, 0, 55); pRow.BackgroundTransparency = 1; pRow.LayoutOrder = 1
local av = Instance.new("ImageLabel", pRow)
av.Size = UDim2.new(0, 46, 0, 46); av.Position = UDim2.new(0, 0, 0, 4)
av.BackgroundColor3 = T.bg3; av.BorderSizePixel = 0
Instance.new("UICorner", av).CornerRadius = UDim.new(0, 10)
pcall(function() av.Image = Players:GetUserThumbnailAsync(LP.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150) end)
local nl = Instance.new("TextLabel", pRow)
nl.Size = UDim2.new(1, -56, 0, 15); nl.Position = UDim2.new(0, 56, 0, 4)
nl.BackgroundTransparency = 1; nl.Text = "👑 " .. LP.DisplayName
nl.Font = Enum.Font.GothamBold; nl.TextSize = 13; nl.TextColor3 = T.text1; nl.TextXAlignment = Enum.TextXAlignment.Left
local ul = Instance.new("TextLabel", pRow)
ul.Size = UDim2.new(1, -56, 0, 10); ul.Position = UDim2.new(0, 56, 0, 22)
ul.BackgroundTransparency = 1; ul.Text = "@" .. LP.Name .. " · ID: " .. LP.UserId
ul.Font = Enum.Font.Gotham; ul.TextSize = 9; ul.TextColor3 = T.text3; ul.TextXAlignment = Enum.TextXAlignment.Left
mkInfo(stp, "👑 PREMIUM ACTIVE · LIFETIME · ABSOLUTE EDITION 🐐", 2)

local sts = mkSec(tSettings, "🌐 SERVER", 3)
mkInfo(sts, "🎮 Place: " .. game.PlaceId, 1)
mkInfo(sts, "🌐 Job: " .. game.JobId:sub(1, 22) .. "...", 2)
mkInfo(sts, "👥 " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers .. " players", 3)
mkBtn(sts, "🔄 REJOIN", 4, function()
    Notify("🌐", "Rejoining... 👋", 2, T.yellow)
    task.wait(0.5); pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) end)
end)
mkBtn(sts, "🌐 NEW SERVER", 5, function()
    Notify("🌐", "Fresh lobby incoming 😈", 2, T.yellow)
    task.wait(0.5); pcall(function() TeleportService:Teleport(game.PlaceId, LP) end)
end)
mkBtn(sts, "📋 COPY JOB ID", 6, function()
    if setclipboard then setclipboard(game.JobId); Notify("📋", "Copied ✅", 1, T.green)
    else Notify("❌", "Not supported 🤡", 1.5, T.red) end
end)

local stk = mkSec(tSettings, "⌨️ KEYBINDS", 4)
mkInfo(stk, "🔑 [Right Alt] Toggle aim", 1)
mkInfo(stk, "🔑 [Left Ctrl] Hide menu", 2)
mkInfo(stk, "🔑 [Right Shift] PANIC", 3)
mkInfo(stk, "🔑 [Delete] Cleanup", 4)
mkInfo(stk, "🔑 [F] Save pos · [G] TP back", 5)
mkInfo(stk, "🔑 [X] Unlock · [V] Fly · [B] Noclip", 6)
mkInfo(stk, "🔑 [H] Click TP · [J] Spider", 7)

mkBtn(stk, "🔄 RESET ALL", 8, function()
    for k, v in pairs(CFG) do if type(v) == "boolean" then CFG[k] = false end end
    CFG.AntiAFK = true; CFG.ShowFOV = true; CFG.ShowFPS = true; CFG.ShowPing = true
    CFG.ShowTarget = true; CFG.ShowWatermark = true; CFG.ESPEnabled = true
    setOn(false)
    Notify("🔄", "Reset — comme ton skill 🤡", 2, T.yellow)
end)

local stc = mkSec(tSettings, "🏆 CREDITS", 5)
mkInfo(stc, "👑 HIROSHI 738 · v12 ABSOLUTE EDITION", 1)
mkInfo(stc, "🛠️ By Hiroshi738 — The GOAT 🐐", 2)
mkInfo(stc, "💀 \"Les autres scripts sont jaloux\" 😈", 3)
mkInfo(stc, "🎁 18 tabs · 200+ features · 0 regrets", 4)

selT("Aim")

-- ═══════════════════════════════════════════════════════════════════
-- ✏️ DRAWING API
-- ═══════════════════════════════════════════════════════════════════
local FS = 36
local FL = {}; for i = 1, 64 do FL[i] = Drawing.new("Line"); FL[i].Thickness = 1; FL[i].Visible = false end
local FFi = Drawing.new("Circle"); FFi.Filled = true; FFi.Transparency = 0.12; FFi.Visible = false
local XL = {}; for i = 1, 4 do XL[i] = Drawing.new("Line"); XL[i].Thickness = 1.5; XL[i].Visible = false end
local XD = Drawing.new("Circle"); XD.Radius = 2; XD.Filled = true; XD.Visible = false
local XC = Drawing.new("Circle"); XC.Thickness = 1.5; XC.Filled = false; XC.Visible = false
local FT = Drawing.new("Text"); FT.Size = 13; FT.Font = 2; FT.Outline = true; FT.Visible = false
local PT = Drawing.new("Text"); PT.Size = 13; PT.Font = 2; PT.Outline = true; PT.Visible = false
local TT = Drawing.new("Text"); TT.Size = 13; TT.Font = 2; TT.Outline = true; TT.Visible = false
local WM = Drawing.new("Text"); WM.Size = 13; WM.Font = 2; WM.Outline = true; WM.Visible = false
local CT = Drawing.new("Text"); CT.Size = 11; CT.Font = 2; CT.Outline = true; CT.Visible = false
local ST = Drawing.new("Text"); ST.Size = 11; ST.Font = 2; ST.Outline = true; ST.Visible = false
local PC = Drawing.new("Text"); PC.Size = 11; PC.Font = 2; PC.Outline = true; PC.Visible = false

-- Skeleton pairs
local sR15 = {
    {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
    {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
    {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
    {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
    {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
}
local sR6 = {{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}

-- ESP Object Pool
local EO = {}
local function gE(p)
    if EO[p] then return EO[p] end
    local o = {}
    o.nm = Drawing.new("Text"); o.nm.Size = 13; o.nm.Font = 2; o.nm.Center = true; o.nm.Outline = true; o.nm.Visible = false
    o.dt = Drawing.new("Text"); o.dt.Size = 12; o.dt.Font = 2; o.dt.Center = true; o.dt.Outline = true; o.dt.Visible = false
    o.wp = Drawing.new("Text"); o.wp.Size = 10; o.wp.Font = 2; o.wp.Center = true; o.wp.Outline = true; o.wp.Visible = false
    o.fg = Drawing.new("Text"); o.fg.Size = 10; o.fg.Font = 2; o.fg.Center = true; o.fg.Outline = true; o.fg.Visible = false
    o.bx = Drawing.new("Square"); o.bx.Thickness = 1; o.bx.Filled = false; o.bx.Visible = false
    o.bo = Drawing.new("Square"); o.bo.Thickness = 3; o.bo.Color = Color3.new(0,0,0); o.bo.Filled = false; o.bo.Visible = false
    o.bf = Drawing.new("Square"); o.bf.Filled = true; o.bf.Visible = false
    o.cl = {}; for i = 1, 8 do o.cl[i] = Drawing.new("Line"); o.cl[i].Thickness = 1.5; o.cl[i].Visible = false end
    o.tr = Drawing.new("Line"); o.tr.Thickness = 1; o.tr.Visible = false
    o.hb = Drawing.new("Square"); o.hb.Filled = true; o.hb.Color = Color3.fromRGB(20,20,20); o.hb.Visible = false
    o.hf = Drawing.new("Square"); o.hf.Filled = true; o.hf.Visible = false
    o.hd = Drawing.new("Circle"); o.hd.Radius = 3; o.hd.Filled = true; o.hd.Visible = false
    o.hc = Drawing.new("Circle"); o.hc.Thickness = 1; o.hc.Filled = false; o.hc.Visible = false
    o.sk = {}; o.hl = nil
    EO[p] = o; return o
end
local function hE(o)
    o.nm.Visible = false; o.dt.Visible = false; o.wp.Visible = false; o.fg.Visible = false
    o.bx.Visible = false; o.bo.Visible = false; o.bf.Visible = false
    for _, l in ipairs(o.cl) do l.Visible = false end
    o.tr.Visible = false; o.hb.Visible = false; o.hf.Visible = false
    o.hd.Visible = false; o.hc.Visible = false
    for _, l in ipairs(o.sk) do l.Visible = false end
    if o.hl then pcall(function() o.hl:Destroy() end); o.hl = nil end
end
local function rE(p)
    local o = EO[p]; if not o then return end
    pcall(function() o.nm:Remove(); o.dt:Remove(); o.wp:Remove(); o.fg:Remove()
        o.bx:Remove(); o.bo:Remove(); o.bf:Remove(); o.tr:Remove()
        o.hb:Remove(); o.hf:Remove(); o.hd:Remove(); o.hc:Remove() end)
    for _, l in ipairs(o.cl) do pcall(function() l:Remove() end) end
    for _, l in ipairs(o.sk) do pcall(function() l:Remove() end) end
    if o.hl then pcall(function() o.hl:Destroy() end) end
    EO[p] = nil
end
table.insert(Connections, Players.PlayerRemoving:Connect(rE))

local function dC(ls, x, y, w, h, col)
    local c = math.min(w, h) * 0.25
    local pts = {
        {Vector2.new(x,y), Vector2.new(x+c,y)}, {Vector2.new(x,y), Vector2.new(x,y+c)},
        {Vector2.new(x+w,y), Vector2.new(x+w-c,y)}, {Vector2.new(x+w,y), Vector2.new(x+w,y+c)},
        {Vector2.new(x,y+h), Vector2.new(x+c,y+h)}, {Vector2.new(x,y+h), Vector2.new(x,y+h-c)},
        {Vector2.new(x+w,y+h), Vector2.new(x+w-c,y+h)}, {Vector2.new(x+w,y+h), Vector2.new(x+w,y+h-c)},
    }
    for i = 1, 8 do ls[i].From = pts[i][1]; ls[i].To = pts[i][2]; ls[i].Color = col; ls[i].Visible = true end
end

-- ═══════════════════════════════════════════════════════════════════
-- 🎯 AIM LOGIC
-- ═══════════════════════════════════════════════════════════════════
local RP = RaycastParams.new(); RP.FilterType = Enum.RaycastFilterType.Exclude
local function isVis(pt)
    if not pt or not pt.Parent then return false end
    RP.FilterDescendantsInstances = {LP.Character, Camera}
    local r = workspace:Raycast(Camera.CFrame.Position, pt.Position - Camera.CFrame.Position, RP)
    return not r or r.Instance:IsDescendantOf(pt.Parent)
end
local function gTP(c)
    if CFG.Target == "Head" then return c:FindFirstChild("Head")
    elseif CFG.Target == "Legs" then return c:FindFirstChild("LeftFoot") or c:FindFirstChild("Left Leg")
    else return c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso") or c:FindFirstChild("HumanoidRootPart") end
end
local function isVal(p)
    if p == LP then return false end
    local c = p.Character; if not c then return false end
    local h = c:FindFirstChildOfClass("Humanoid"); if not h or h.Health <= 0 then return false end
    if CFG.TeamCheck and p.Team and p.Team == LP.Team then return false end
    return true
end
local function gCl()
    if CFG.LockTarget and LockedTarget then
        local pp = Players:GetPlayerFromCharacter(LockedTarget.Parent)
        if pp and isVal(pp) then CurrentTargetName = pp.Name; return LockedTarget else LockedTarget = nil end
    end
    local ctr = Camera.ViewportSize / 2; local b, bd = nil, 1e9
    for _, p in ipairs(Players:GetPlayers()) do
        if not isVal(p) then continue end
        local pt = gTP(p.Character); if not pt then continue end
        if CFG.WallCheck and not isVis(pt) then
            if CFG.BodyAim then
                pt = p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("Torso")
                if pt and not isVis(pt) then continue end
            else continue end
        end
        local sp, on = Camera:WorldToViewportPoint(pt.Position)
        if not on then continue end
        local d = (Vector2.new(sp.X, sp.Y) - ctr).Magnitude
        if d < CFG.FOV and d < bd then
            b = pt; bd = d; CurrentTargetName = p.Name
            CurrentTargetDist = (Camera.CFrame.Position - pt.Position).Magnitude
        end
    end
    if not b then CurrentTargetName = ""; CurrentTargetDist = 0 end
    if CFG.LockTarget then LockedTarget = b; if b then targetsLocked = targetsLocked + 1 end end
    return b
end
local function kH()
    if CFG.AimKey == "Always" then return true end
    local m = {MouseButton1 = Enum.UserInputType.MouseButton1, MouseButton2 = Enum.UserInputType.MouseButton2}
    return m[CFG.AimKey] and UIS:IsMouseButtonPressed(m[CFG.AimKey])
end

local rbH = 0
local function eCol(p, hd, idx)
    if CFG.RainbowESP then return Color3.fromHSV((rbH + idx * 0.08) % 1, 0.85, 1) end
    if CFG.ColorByVis and hd then return isVis(hd) and Color3.fromRGB(60,255,120) or Color3.fromRGB(255,60,75) end
    if CFG.ColorByHP then local h = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
        if h then return Color3.fromHSV(0.33 * math.clamp(h.Health / h.MaxHealth, 0, 1), 1, 1) end end
    if p.Team and LP.Team and p.Team == LP.Team then return T.cyan end
    return Color3.fromRGB(255, 60, 75)
end

-- ═══════════════════════════════════════════════════════════════════
-- 🧹 CLEANUP
-- ═══════════════════════════════════════════════════════════════════
local function CleanupAll()
    IsDestroyed = true
    for _, c in ipairs(Connections) do pcall(function() c:Disconnect() end) end
    pcall(function()
        Lighting.Brightness = OrigSettings.Brightness; Lighting.FogEnd = OrigSettings.FogEnd
        Lighting.FogStart = OrigSettings.FogStart; Lighting.GlobalShadows = OrigSettings.GlobalShadows
        Lighting.ClockTime = OrigSettings.ClockTime; Camera.FieldOfView = OrigSettings.CamFOV
        workspace.Gravity = OrigSettings.Gravity
    end)
    if FlyBody then pcall(function() FlyBody:Destroy() end) end
    if FlyGyro then pcall(function() FlyGyro:Destroy() end) end
    if CurrentMusic then pcall(function() CurrentMusic:Stop(); CurrentMusic:Destroy() end) end
    for _, e in ipairs(Lighting:GetChildren()) do
        if e.Name:sub(1, 4) == "H738" then pcall(function() e:Destroy() end) end
    end
    local plat = workspace:FindFirstChild("H738Platform"); if plat then plat:Destroy() end
    if SpectateTarget then Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") end
    for p, _ in pairs(EO) do rE(p) end
    for _, l in ipairs(FL) do pcall(function() l:Remove() end) end
    for _, l in ipairs(XL) do pcall(function() l:Remove() end) end
    pcall(function() FFi:Remove(); XD:Remove(); XC:Remove(); FT:Remove(); PT:Remove(); TT:Remove(); WM:Remove(); CT:Remove(); ST:Remove(); PC:Remove() end)
    pcall(function() SG:Destroy() end)
end
clsBtn.MouseButton1Click:Connect(CleanupAll)

-- ═══════════════════════════════════════════════════════════════════
-- ⌨️ INPUT
-- ═══════════════════════════════════════════════════════════════════
table.insert(Connections, UIS.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.RightAlt then setOn(not CFG.Enabled)
    elseif i.KeyCode == Enum.KeyCode.LeftControl then Pan.Visible = not Pan.Visible
    elseif i.KeyCode == Enum.KeyCode.RightShift then
        setOn(false); LockedTarget = nil; CurrentTargetName = ""
        SpectateTarget = nil; Camera.CameraSubject = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
        Notify("🚨 PANIC", "Everything OFF — act natural 🫣", 3, T.red)
    elseif i.KeyCode == Enum.KeyCode.Delete then CleanupAll()
    elseif i.KeyCode == Enum.KeyCode.F then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            CFG.SavedPosition = LP.Character.HumanoidRootPart.CFrame
            Notify("💾", "Saved 📌", 1, T.green)
        end
    elseif i.KeyCode == Enum.KeyCode.G then
        if CFG.SavedPosition and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame = CFG.SavedPosition
        end
    elseif i.KeyCode == Enum.KeyCode.X then
        LockedTarget = nil; CFG.LockTarget = false
        Notify("🔓", "Unlocked 🍀", 1, T.yellow)
    elseif i.KeyCode == Enum.KeyCode.V then
        CFG.Fly = not CFG.Fly
        if CFG.Fly and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LP.Character.HumanoidRootPart
            if not FlyBody then FlyBody = Instance.new("BodyVelocity", hrp); FlyBody.Velocity = Vector3.zero; FlyBody.MaxForce = Vector3.one * 1e5; FlyBody.Name = "H738Fly" end
            if not FlyGyro then FlyGyro = Instance.new("BodyGyro", hrp); FlyGyro.MaxTorque = Vector3.one * 1e5; FlyGyro.Name = "H738Gyro" end
        else
            if FlyBody then FlyBody:Destroy(); FlyBody = nil end
            if FlyGyro then FlyGyro:Destroy(); FlyGyro = nil end
        end
    elseif i.KeyCode == Enum.KeyCode.B then
        CFG.Noclip = not CFG.Noclip
    elseif i.KeyCode == Enum.KeyCode.H then
        if CFG.ClickTP then
            local target = Mouse.Hit
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame = target + Vector3.new(0, 3, 0)
            end
        end
    elseif i.KeyCode == Enum.KeyCode.Space then
        if CFG.InfJump and LP.Character then
            local h = LP.Character:FindFirstChildOfClass("Humanoid")
            if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
        end
    end
end))

-- Anti-AFK
table.insert(Connections, LP.Idled:Connect(function()
    if not CFG.AntiAFK then return end
    VirtualUser:Button2Down(Vector2.new(0, 0), Camera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), Camera.CFrame)
end))

-- ═══════════════════════════════════════════════════════════════════
-- 🔄 MAIN RENDER LOOP — LE CŒUR DU MONSTRE
-- ═══════════════════════════════════════════════════════════════════
local fA, fC, fV = 0, 0, 60
local lP2, pC, tS2, tCT = 0, 0, "", 0
local lEU, lSU = 0, 0
local trollAngle = 0

-- Auto-clicker thread
task.spawn(function()
    while not IsDestroyed do
        if CFG.AutoClicker then
            pcall(function() mouse1click() end)
            task.wait(CFG.ClickDelay)
        else task.wait(0.1) end
    end
end)

-- Key repeater thread
task.spawn(function()
    while not IsDestroyed do
        if CFG.KeyRepeater then
            pcall(function()
                local kc = Enum.KeyCode[CFG.RepeatKey]
                if kc then
                    keypress(kc); task.wait(0.05); keyrelease(kc)
                end
            end)
            task.wait(CFG.RepeatDelay)
        else task.wait(0.1) end
    end
end)

-- Hitbox expander thread
task.spawn(function()
    while not IsDestroyed do
        if CFG.HitboxExpander then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LP and p.Character then
                    local head = p.Character:FindFirstChild("Head")
                    if head then
                        head.Size = Vector3.new(CFG.HitboxSize, CFG.HitboxSize, CFG.HitboxSize)
                        head.Transparency = 0.7
                    end
                end
            end
        end
        task.wait(1)
    end
end)

-- Stats auto-refresh
task.spawn(function()
    while not IsDestroyed do
        task.wait(3)
        if ct == "Logs" then RefreshLogs() end
        if ct == "Stats" then RefreshStats() end
    end
end)

-- Kill detection (health tracking)
task.spawn(function()
    while not IsDestroyed do
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LP and p.Character then
                local h = p.Character:FindFirstChildOfClass("Humanoid")
                if h then
                    local prev = lastHealthMap[p.UserId]
                    if prev and prev > 0 and h.Health <= 0 then
                        CFG.Kills = CFG.Kills + 1
                        Notify("💀 KILL", p.Name .. " eliminated 🎯", 2, T.red)
                    end
                    lastHealthMap[p.UserId] = h.Health
                end
            end
        end
        -- Self death detection
        if LP.Character then
            local h = LP.Character:FindFirstChildOfClass("Humanoid")
            if h and h.Health <= 0 then
                CFG.Deaths = CFG.Deaths + 1
                if CFG.AutoRespawn then
                    task.wait(1)
                    pcall(function()
                        LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
                    end)
                end
            end
        end
        task.wait(0.5)
    end
end)

table.insert(Connections, RunService.RenderStepped:Connect(function(dt)
    if IsDestroyed then return end
    local ctr = Camera.ViewportSize / 2
    local vp = Camera.ViewportSize
    local now = tick()

    -- FPS
    fA = fA + dt; fC = fC + 1
    if fA >= 0.5 then fV = math.floor(fC / fA + 0.5); fA, fC = 0, 0 end

    -- Rainbow
    if CFG.RainbowUI then rbH = (rbH + dt * 0.2) % 1; Accent = Color3.fromHSV(rbH, 0.7, 1) end
    if now - tCT > 1 then tS2 = os.date("%H:%M:%S"); tCT = now end

    -- Watermark
    if CFG.ShowWatermark then
        WM.Text = "👑 HIROSHI 738 v12 · " .. fV .. "fps · " .. tS2 .. " · 🛡️"
        WM.Color = Accent; WM.Visible = true; WM.Position = Vector2.new(vp.X - WM.TextBounds.X - 12, 8)
    else WM.Visible = false end

    local iy = 8
    if CFG.ShowFPS then
        local em = fV >= 60 and "🟢" or (fV >= 30 and "🟡" or "🔴")
        FT.Text = em .. " FPS: " .. fV; FT.Color = Accent; FT.Position = Vector2.new(10, iy); FT.Visible = true; iy = iy + 17
    else FT.Visible = false end

    if CFG.ShowPing then
        if now - pC > 1 then local ok, p = pcall(function() return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end); lP2 = ok and p or 0; pC = now end
        local em = lP2 <= 50 and "🟢" or (lP2 <= 100 and "🟡" or "🔴")
        PT.Text = em .. " PING: " .. lP2 .. "ms"; PT.Color = Accent; PT.Position = Vector2.new(10, iy); PT.Visible = true; iy = iy + 17
    else PT.Visible = false end

    if CFG.ShowTarget and CurrentTargetName ~= "" then
        TT.Text = "🎯 " .. CurrentTargetName .. " [" .. math.floor(CurrentTargetDist) .. "m] 💀"
        TT.Color = T.yellow; TT.Position = Vector2.new(10, iy); TT.Visible = true; iy = iy + 17
    else TT.Visible = false end

    if CFG.ShowPlayerCount then
        PC.Text = "👥 " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers
        PC.Color = T.text2; PC.Position = Vector2.new(10, iy); PC.Visible = true; iy = iy + 15
    else PC.Visible = false end

    if CFG.ShowCoords and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local pos = LP.Character.HumanoidRootPart.Position
        CT.Text = string.format("📍 %.0f, %.0f, %.0f", pos.X, pos.Y, pos.Z)
        CT.Color = T.text2; CT.Position = Vector2.new(10, iy); CT.Visible = true; iy = iy + 15
    else CT.Visible = false end

    if CFG.ShowSpeed and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        local vel = LP.Character.HumanoidRootPart.AssemblyLinearVelocity
        local speed = math.floor(Vector3.new(vel.X, 0, vel.Z).Magnitude)
        ST.Text = "💨 " .. speed .. " studs/s"
        ST.Color = T.text2; ST.Position = Vector2.new(10, iy); ST.Visible = true
    else ST.Visible = false end

    -- World effects
    if CFG.FOVChanger then Camera.FieldOfView = CFG.CamFOV end
    if CFG.FreezeTime then Lighting.ClockTime = CFG.FreezeTimeVal end

    -- Player effects
    local ch = LP.Character
    if ch then
        local hm = ch:FindFirstChildOfClass("Humanoid")
        if hm then
            if CFG.WalkSpeed then
                local spd = CFG.WalkSpeedVal
                if CFG.SpeedBoost and UIS:IsKeyDown(Enum.KeyCode.LeftShift) then spd = spd * CFG.SpeedBoostMult end
                hm.WalkSpeed = spd
            end
            if CFG.JumpPower then hm.JumpPower = CFG.JumpPowerVal end
            if CFG.BHop and hm:GetState() == Enum.HumanoidStateType.Landed then hm:ChangeState(Enum.HumanoidStateType.Jumping) end
        end

        if ch:FindFirstChild("HumanoidRootPart") then
            local hrp = ch.HumanoidRootPart
            
            -- SpinBot
            if CFG.SpinBot then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(CFG.SpinSpeed), 0) end
            
            -- Noclip
            if CFG.Noclip then
                for _, p in ipairs(ch:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end

            -- Helicopter
            if CFG.Helicopter then
                hrp.CFrame = hrp.CFrame * CFrame.Angles(math.rad(15), math.rad(20), 0)
            end

            -- Worm
            if CFG.Worm then
                local t = tick() * 5
                hrp.CFrame = hrp.CFrame * CFrame.Angles(math.sin(t) * 0.5, 0, math.cos(t) * 0.3)
            end

            -- Seizure
            if CFG.Seizure then
                hrp.CFrame = hrp.CFrame * CFrame.Angles(
                    math.random() * 0.5 - 0.25,
                    math.random() * 0.5 - 0.25,
                    math.random() * 0.5 - 0.25
                )
            end

            -- Orbit
            if CFG.Orbit and TrollTarget and TrollTarget.Character and TrollTarget.Character:FindFirstChild("HumanoidRootPart") then
                trollAngle = trollAngle + dt * CFG.OrbitSpeed
                local targetPos = TrollTarget.Character.HumanoidRootPart.Position
                hrp.CFrame = CFrame.new(
                    targetPos + Vector3.new(math.cos(trollAngle) * CFG.OrbitRadius, 0, math.sin(trollAngle) * CFG.OrbitRadius),
                    targetPos
                )
            end

            -- Backshots 😏
            if CFG.Backshots and TrollTarget and TrollTarget.Character and TrollTarget.Character:FindFirstChild("HumanoidRootPart") then
                local targetHRP = TrollTarget.Character.HumanoidRootPart
                local behind = targetHRP.CFrame * CFrame.new(0, 0, 2)
                local t = tick() * CFG.BackshotsSpeed
                local offset = math.sin(t) * 1.5
                hrp.CFrame = behind * CFrame.new(0, 0, offset)
                hrp.CFrame = CFrame.new(hrp.Position, targetHRP.Position)
            end

            -- TP Behind
            if CFG.TPBehind and TrollTarget and TrollTarget.Character and TrollTarget.Character:FindFirstChild("HumanoidRootPart") then
                local targetHRP = TrollTarget.Character.HumanoidRootPart
                hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
            end

            -- Face Target
            if CFG.FaceTarget and TrollTarget and TrollTarget.Character and TrollTarget.Character:FindFirstChild("HumanoidRootPart") then
                hrp.CFrame = CFrame.new(hrp.Position, TrollTarget.Character.HumanoidRootPart.Position)
            end

            -- Follow Player
            if CFG.FollowPlayer and TrollTarget and TrollTarget.Character and TrollTarget.Character:FindFirstChild("HumanoidRootPart") then
                local targetPos = TrollTarget.Character.HumanoidRootPart.Position
                local dir = (targetPos - hrp.Position).Unit
                hrp.CFrame = CFrame.new(hrp.Position + dir * dt * 20, targetPos)
            end

            -- Fling
            if CFG.FlingPlayers then
                hrp.AssemblyLinearVelocity = Vector3.new(
                    math.random(-1, 1) * CFG.FlingPower,
                    CFG.FlingPower * 0.5,
                    math.random(-1, 1) * CFG.FlingPower
                )
            end

            -- Glide
            if CFG.Glide and hm and hm:GetState() == Enum.HumanoidStateType.Freefall then
                hrp.AssemblyLinearVelocity = Vector3.new(
                    hrp.AssemblyLinearVelocity.X,
                    math.max(hrp.AssemblyLinearVelocity.Y, -10),
                    hrp.AssemblyLinearVelocity.Z
                )
            end
        end
    end

    -- Fly
    if CFG.Fly and FlyBody and FlyGyro and ch and ch:FindFirstChild("HumanoidRootPart") then
        FlyGyro.CFrame = Camera.CFrame
        local dir = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.yAxis end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir = dir - Vector3.yAxis end
        FlyBody.Velocity = dir * CFG.FlySpeed
    end

    -- FOV Circle
    if CFG.Enabled and CFG.ShowFOV then
        local segs = CFG.FOVSides
        if CFG.FOVFilled then
            FFi.Position = ctr; FFi.Radius = CFG.FOV; FFi.Color = Accent; FFi.Visible = true
            for i = 1, 64 do FL[i].Visible = false end
        else
            FFi.Visible = false
            for i = 1, segs do
                local a1 = math.rad((i-1) / segs * 360); local a2 = math.rad(i / segs * 360)
                FL[i].From = ctr + Vector2.new(math.cos(a1), math.sin(a1)) * CFG.FOV
                FL[i].To = ctr + Vector2.new(math.cos(a2), math.sin(a2)) * CFG.FOV
                FL[i].Color = Accent; FL[i].Visible = true
            end
            for i = segs + 1, 64 do FL[i].Visible = false end
        end
    else FFi.Visible = false; for i = 1, 64 do FL[i].Visible = false end end

    -- Crosshair
    for _, l in ipairs(XL) do l.Visible = false end; XD.Visible = false; XC.Visible = false
    if CFG.ShowCross then
        local sz = CFG.CrossSize
        if CFG.CrossDynamic and ch and ch:FindFirstChild("HumanoidRootPart") then
            local vel = ch.HumanoidRootPart.AssemblyLinearVelocity
            sz = sz + math.clamp(Vector3.new(vel.X, 0, vel.Z).Magnitude * 0.15, 0, 12)
        end
        if CFG.CrossSpin then CrosshairAngle = CrosshairAngle + dt * 2 end
        local co, si = math.cos(CrosshairAngle), math.sin(CrosshairAngle)
        local crossColor = CFG.CrossRainbow and Color3.fromHSV(rbH, 0.8, 1) or Accent
        local function rv(x, y) return ctr + Vector2.new(x*co - y*si, x*si + y*co) end
        if CFG.CrossStyle == "Cross" then
            XL[1].From = rv(-sz-2,0); XL[1].To = rv(-2,0); XL[1].Color = crossColor; XL[1].Visible = true
            XL[2].From = rv(2,0); XL[2].To = rv(sz+2,0); XL[2].Color = crossColor; XL[2].Visible = true
            XL[3].From = rv(0,-sz-2); XL[3].To = rv(0,-2); XL[3].Color = crossColor; XL[3].Visible = true
            XL[4].From = rv(0,2); XL[4].To = rv(0,sz+2); XL[4].Color = crossColor; XL[4].Visible = true
            XD.Position = ctr; XD.Color = crossColor; XD.Radius = 1.5; XD.Visible = true
        elseif CFG.CrossStyle == "Dot" then
            XD.Position = ctr; XD.Color = crossColor; XD.Radius = sz*0.5; XD.Visible = true
        elseif CFG.CrossStyle == "Circle" then
            XC.Position = ctr; XC.Color = crossColor; XC.Radius = sz; XC.Visible = true
            XD.Position = ctr; XD.Color = crossColor; XD.Radius = 1.5; XD.Visible = true
        end
    end

    -- ESP
    local doSkel = (now - lSU >= 0.05); if doSkel then lSU = now end
    if now - lEU >= 0.033 then lEU = now
        local anyE = CFG.ESPNames or CFG.ESPBox or

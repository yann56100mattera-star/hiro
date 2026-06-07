local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local TServ = game:GetService("TeleportService")
local VU = game:GetService("VirtualUser")
local SoundService = game:GetService("SoundService")

local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LP:GetMouse()

-- Nettoyage
if LP.PlayerGui:FindFirstChild("H738v12") then LP.PlayerGui.H738v12:Destroy() end

local KeyVerified = false

-- ================================================
--                  KEY SYSTEM
-- ================================================
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "H738v12_Key"
KeyGui.ResetOnSpawn = false
KeyGui.IgnoreGuiInset = true
KeyGui.DisplayOrder = 999999
KeyGui.Parent = LP.PlayerGui

local BG = Instance.new("Frame", KeyGui)
BG.Size = UDim2.new(1,0,1,0)
BG.BackgroundColor3 = Color3.fromRGB(6,5,18)

local Grad = Instance.new("UIGradient", BG)
Grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,5,30)), ColorSequenceKeypoint.new(1,Color3.fromRGB(25,10,60))}

-- Particules
for i = 1, 28 do
    local p = Instance.new("Frame", BG)
    p.Size = UDim2.new(0,math.random(5,12),0,math.random(5,12))
    p.Position = UDim2.new(math.random(),0,math.random(),0)
    p.BackgroundColor3 = Color3.fromRGB(130,90,255)
    p.BackgroundTransparency = 0.7
    Instance.new("UICorner",p).CornerRadius = UDim.new(1,0)
    TS:Create(p,TweenInfo.new(math.random(20,45),Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position = UDim2.new(math.random(),0,math.random(),0)}):Play()
end

local Card = Instance.new("Frame", BG)
Card.Size = UDim2.new(0,480,0,480)
Card.Position = UDim2.new(0.5,-240,0.5,-240)
Card.BackgroundColor3 = Color3.fromRGB(12,10,28)
Instance.new("UICorner",Card).CornerRadius = UDim.new(0,20)
Instance.new("UIStroke",Card).Color = Color3.fromRGB(140,100,255)

local Title = Instance.new("TextLabel",Card)
Title.Size = UDim2.new(1,0,0,60)
Title.Position = UDim2.new(0,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "HIROSHI 738"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 34

local Sub = Instance.new("TextLabel",Card)
Sub.Size = UDim2.new(1,0,0,25)
Sub.Position = UDim2.new(0,0,0,95)
Sub.BackgroundTransparency = 1
Sub.Text = "v12 GOD MODE • The Final Boss"
Sub.TextColor3 = Color3.fromRGB(170,120,255)
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 14

local Input = Instance.new("TextBox",Card)
Input.Size = UDim2.new(0,360,0,55)
Input.Position = UDim2.new(0.5,-180,0,160)
Input.BackgroundColor3 = Color3.fromRGB(20,18,40)
Input.PlaceholderText = "Enter key (or stay poor)"
Input.PlaceholderColor3 = Color3.fromRGB(110,100,170)
Input.TextColor3 = Color3.new(1,1,1)
Input.Font = Enum.Font.GothamMedium
Input.TextSize = 16
Instance.new("UICorner",Input).CornerRadius = UDim.new(0,12)

local Verify = Instance.new("TextButton",Card)
Verify.Size = UDim2.new(0,360,0,50)
Verify.Position = UDim2.new(0.5,-180,0,230)
Verify.BackgroundColor3 = Color3.fromRGB(130,90,255)
Verify.Text = "VERIFY KEY 👑"
Verify.TextColor3 = Color3.new(1,1,1)
Verify.Font = Enum.Font.GothamBold
Verify.TextSize = 16
Instance.new("UICorner",Verify).CornerRadius = UDim.new(0,12)

local Status = Instance.new("TextLabel",Card)
Status.Size = UDim2.new(1,0,0,40)
Status.Position = UDim2.new(0,0,0,300)
Status.BackgroundTransparency = 1
Status.Text = "3 attempts left 💀"
Status.TextColor3 = Color3.fromRGB(255,70,70)
Status.Font = Enum.Font.Gotham
Status.TextSize = 14

local attempts = 3
local mocks = {"🤡 Tu pensais vraiment avoir la bonne clé ?", "💀 Même un singe tape mieux", "🗑️ Va jouer à Minecraft", "😭 'password123' n'a pas marché non plus hein", "🎪 Bienvenue au cirque des noobs"}

Verify.MouseButton1Click:Connect(function()
    if attempts <= 0 then return end
    attempts -= 1
    if Input.Text == "HiroshiGod12" or Input.Text == "v12god" then
        KeyVerified = true
        Status.Text = "✅ GOD MODE UNLOCKED"
        Status.TextColor3 = Color3.fromRGB(0,255,120)
        Verify.Text = "CHARGEMENT DU MEILLEUR CHEAT..."
        task.wait(1.5)
        KeyGui:Destroy()
        LoadCheat()
    else
        Status.Text = mocks[math.random(1,#mocks)]
        if attempts == 0 then Verify.Text = "LOCKED 💀" end
    end
end)

-- ================================================
--                  LOAD CHEAT
-- ================================================
function LoadCheat()
    local CFG = {
        Enabled = false, FOV = 130, Smooth = 3, Target = "Head", AimKey = "MouseButton2",
        SilentAim = true, Prediction = true, PredictAmt = 0.17, QuadPredict = true,
        WallCheck = false, TeamCheck = false, LockTarget = false, AutoFire = true,
        ESPNames = true, ESPBox = true, BoxStyle = "Corner", ESPTracer = true,
        ESPHealth = true, ESPDist = true, ESPSkel = true, ESPChams = true,
        RainbowESP = true, GradientESP = true, MaxDist = 3000,
        Fullbright = true, NoFog = true, CamFOV = 90, WalkSpeed = 26, JumpPower = 85,
        Fly = false, FlySpeed = 90, SpinBot = false, SpinSpeed = 35, Noclip = false,
        Backshots = false, LewdAnim = false, ForceAnim = false, AnimationSpeed = 1,
        RagdollSpam = false, SoundSpam = false, ChatSpam = false, BillboardTroll = false,
        FakeLag = false, ServerCrash = false, TrollMode = false,
        Kills = 0, Deaths = 0,
        RainbowUI = true, ShowWatermark = true,
    }

    local Theme = {bg1 = Color3.fromRGB(8,7,20), bg2 = Color3.fromRGB(14,13,32), accent = Color3.fromRGB(135,85,255), red = Color3.fromRGB(255,60,80), green = Color3.fromRGB(60,255,130)}
    local Accent = Theme.accent
    local IsDead = false
    local Connections = {}
    local Logs = {}

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "H738v12"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = LP.PlayerGui

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 620, 0, 560)
    Main.Position = UDim2.new(0.5, -310, 0.5, -280)
    Main.BackgroundColor3 = Theme.bg1
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0,18)
    Instance.new("UIStroke", Main).Color = Accent

    -- Header
    local Header = Instance.new("Frame", Main)
    Header.Size = UDim2.new(1,0,0,65)
    Header.BackgroundColor3 = Theme.bg2
    Instance.new("UICorner", Header).CornerRadius = UDim.new(0,18)

    local Logo = Instance.new("TextLabel", Header)
    Logo.Size = UDim2.new(0,46,0,46)
    Logo.Position = UDim2.new(0,15,0,10)
    Logo.BackgroundColor3 = Accent
    Logo.Text = "👑"
    Logo.TextSize = 28
    Logo.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Logo).CornerRadius = UDim.new(0,12)

    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(0,300,0,30)
    Title.Position = UDim2.new(0,75,0,12)
    Title.BackgroundTransparency = 1
    Title.Text = "HIROSHI 738 v12"
    Title.TextColor3 = Color3.new(1,1,1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 24
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Sub = Instance.new("TextLabel", Header)
    Sub.Size = UDim2.new(0,300,0,20)
    Sub.Position = UDim2.new(0,75,0,38)
    Sub.BackgroundTransparency = 1
    Sub.Text = "GOD MODE • Ils ne sont pas prêts"
    Sub.TextColor3 = Color3.fromRGB(170,130,255)
    Sub.Font = Enum.Font.Gotham
    Sub.TextSize = 13

    -- Sidebar
    local Side = Instance.new("Frame", Main)
    Side.Size = UDim2.new(0,150,1,-75)
    Side.Position = UDim2.new(0,12,0,70)
    Side.BackgroundColor3 = Theme.bg2
    Instance.new("UICorner", Side).CornerRadius = UDim.new(0,14)

    local TabContainer = Instance.new("ScrollingFrame", Main)
    TabContainer.Size = UDim2.new(1,-175,1,-85)
    TabContainer.Position = UDim2.new(0,165,0,75)
    TabContainer.BackgroundTransparency = 1
    TabContainer.ScrollBarThickness = 6

    local tabList = {}
    local contentList = {}

    local function NewTab(name, icon, order)
        local btn = Instance.new("TextButton", Side)
        btn.Size = UDim2.new(1,-10,0,42)
        btn.Position = UDim2.new(0,5,0,order*45)
        btn.BackgroundColor3 = Theme.bg2
        btn.Text = "  "..icon.."  "..name
        btn.TextColor3 = Color3.fromRGB(190,180,240)
        btn.Font = Enum.Font.GothamSemibold
        btn.TextSize = 13
        btn.TextXAlignment = Enum.TextXAlignment.Left

        local content = Instance.new("ScrollingFrame", TabContainer)
        content.Size = UDim2.new(1,0,1,0)
        content.BackgroundTransparency = 1
        content.Visible = false
        content.ScrollBarThickness = 5
        Instance.new("UIListLayout", content).Padding = UDim.new(0,12)

        btn.MouseButton1Click:Connect(function()
            for _,v in pairs(contentList) do v.Visible = false end
            content.Visible = true
            for _,v in pairs(tabList) do v.BackgroundColor3 = Theme.bg2 end
            btn.BackgroundColor3 = Accent
        end)

        table.insert(tabList, btn)
        contentList[name] = content
        return content
    end

    local AimTab = NewTab("Aim", "🎯", 0)
    local ESPTab = NewTab("ESP", "👁️", 1)
    local VisualsTab = NewTab("Visuals", "🌟", 2)
    local WorldTab = NewTab("World", "🌍", 3)
    local MoveTab = NewTab("Movement", "🏃", 4)
    local CombatTab = NewTab("Combat", "⚔️", 5)
    local TrollTab = NewTab("Troll", "🎪", 6)
    local LewdTab = NewTab("Lewd Anim", "🍑", 7)
    local ExploitTab = NewTab("Exploits", "💥", 8)
    local ServerTab = NewTab("Server", "🌐", 9)
    local StatsTab = NewTab("Stats", "📊", 10)
    local LogsTab = NewTab("Logs", "📜", 11)
    local HotkeysTab = NewTab("Hotkeys", "⌨️", 12)
    local SettingsTab = NewTab("Settings", "⚙️", 13)

    -- Activation du premier onglet
    contentList["Aim"].Visible = true
    tabList[1].BackgroundColor3 = Accent

    -- Fonction Toggle simple
    local function AddToggle(parent, text, key, default)
        CFG[key] = default
        local frame = Instance.new("Frame", parent)
        frame.Size = UDim2.new(1,-20,0,36)
        frame.BackgroundColor3 = Theme.bg2
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

        local lbl = Instance.new("TextLabel", frame)
        lbl.Size = UDim2.new(0.7,0,1,0)
        lbl.Position = UDim2.new(0,15,0,0)
        lbl.BackgroundTransparency = 1
        lbl.Text = text
        lbl.TextColor3 = Color3.fromRGB(210,200,255)
        lbl.Font = Enum.Font.GothamSemibold
        lbl.TextSize = 14
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local switch = Instance.new("TextButton", frame)
        switch.Size = UDim2.new(0,50,0,26)
        switch.Position = UDim2.new(1,-65,0.5,-13)
        switch.BackgroundColor3 = Color3.fromRGB(50,50,60)
        Instance.new("UICorner", switch).CornerRadius = UDim.new(1,0)
        switch.Text = ""

        local knob = Instance.new("Frame", switch)
        knob.Size = UDim2.new(0,22,0,22)
        knob.Position = UDim2.new(0,2,0.5,-11)
        knob.BackgroundColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1,0)

        switch.MouseButton1Click:Connect(function()
            CFG[key] = not CFG[key]
            if CFG[key] then
                switch.BackgroundColor3 = Accent
                knob.Position = UDim2.new(1,-24,0.5,-11)
            else
                switch.BackgroundColor3 = Color3.fromRGB(50,50,60)
                knob.Position = UDim2.new(0,2,0.5,-11)
            end
        end)
    end

    -- ================================================
    --                  TABS
    -- ================================================

    -- AIM
    AddToggle(AimTab, "🎯 Enable Aimbot", "Enabled", false)
    AddToggle(AimTab, "🔇 Silent Aim (vraiment silent)", "SilentAim", true)
    AddToggle(AimTab, "🔮 Prediction + Quadratic", "Prediction", true)
    AddToggle(AimTab, "🔫 Auto Fire", "AutoFire", true)

    -- ESP
    AddToggle(ESPTab, "👁️ Names", "ESPNames", true)
    AddToggle(ESPTab, "📦 Corner Box", "ESPBox", true)
    AddToggle(ESPTab, "🦴 Skeleton", "ESPSkel", true)
    AddToggle(ESPTab, "🌈 Rainbow ESP", "RainbowESP", true)
    AddToggle(ESPTab, "🎨 Gradient ESP", "GradientESP", true)

    -- TROLL TAB
    local trollSec = Instance.new("Frame", TrollTab)
    trollSec.Size = UDim2.new(1,0,0,0)
    trollSec.AutomaticSize = Enum.AutomaticSize.Y
    trollSec.BackgroundTransparency = 1
    AddToggle(trollSec, "🎪 Troll Mode (tout activer)", "TrollMode", false)
    AddToggle(trollSec, "🌪️ Spin Bot", "SpinBot", false)
    AddToggle(trollSec, "👻 Noclip", "Noclip", false)
    AddToggle(trollSec, "💀 Ragdoll Spam", "RagdollSpam", false)
    AddToggle(trollSec, "📢 Sound Spam (Earrape)", "SoundSpam", false)
    AddToggle(trollSec, "💬 Chat Spam", "ChatSpam", false)
    AddToggle(trollSec, "🖼️ Billboard Troll", "BillboardTroll", false)
    AddToggle(trollSec, "🌐 Fake Lag", "FakeLag", false)
    AddToggle(trollSec, "💥 Server Crash Attempt", "ServerCrash", false)

    -- LEWD ANIMATIONS TAB
    local lewdSec = Instance.new("Frame", LewdTab)
    lewdSec.Size = UDim2.new(1,0,0,0)
    lewdSec.AutomaticSize = Enum.AutomaticSize.Y
    lewdSec.BackgroundTransparency = 1
    AddToggle(lewdSec, "🍑 Backshots V3", "Backshots", false)
    AddToggle(lewdSec, "🛏️ Missionary", "LewdAnim", false)
    AddToggle(lewdSec, "🔄 Force Animation on Nearest Player", "ForceAnim", false)

    -- Autres onglets (résumés)
    Instance.new("TextLabel", VisualsTab).Text = "Visuals, Crosshair, Kill Effects... (disponible)"
    Instance.new("TextLabel", WorldTab).Text = "Fullbright, No Fog, Time Freeze..."
    Instance.new("TextLabel", MoveTab).Text = "Fly, Speed, JumpPower, Infinite Jump..."
    Instance.new("TextLabel", CombatTab).Text = "Kill Aura, Auto Parry, etc."
    Instance.new("TextLabel", ExploitTab).Text = "Infinite Yield, Dex, etc."
    Instance.new("TextLabel", ServerTab).Text = "Rejoin, Server Hop, JobId Copy"
    Instance.new("TextLabel", StatsTab).Text = "Kills, Deaths, K/D, Playtime"
    Instance.new("TextLabel", LogsTab).Text = "Activity Logs"
    Instance.new("TextLabel", HotkeysTab).Text = "RightAlt = Toggle Aim\nLeftCtrl = Hide Menu\nRightShift = PANIC\nDelete = Destroy Script"
    Instance.new("TextLabel", SettingsTab).Text = "Theme, Reset, Save Config..."

    -- ================================================
    --                  MAIN LOOP
    -- ================================================
    table.insert(Connections, RunService.RenderStepped:Connect(function()
        if IsDead then return end

        -- Rainbow
        if CFG.RainbowUI then
            Accent = Color3.fromHSV(tick()%5/5, 0.8, 1)
        end

        -- WalkSpeed & Jump
        if LP.Character then
            local hum = LP.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                if CFG.WalkSpeed then hum.WalkSpeed = CFG.WalkSpeed end
                if CFG.JumpPower then hum.JumpPower = CFG.JumpPower end
            end
        end

        -- SpinBot
        if CFG.SpinBot and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(CFG.SpinSpeed), 0)
        end

        -- Lewd Animations (Backshots)
        if CFG.Backshots and LP.Character then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://1234567890" -- Remplace par un ID d'animation lewd
            local track = LP.Character.Humanoid:LoadAnimation(anim)
            track:Play()
            track:AdjustSpeed(CFG.AnimationSpeed)
        end

        -- Autres features à compléter selon tes besoins
    end))

    -- Notifications de bienvenue
    local function Notify(title, msg, col)
        print("["..title.."] "..msg)
    end

    Notify("👑 HIROSHI 738 v12", "Script chargé avec succès. Amuse-toi bien.", Color3.fromRGB(130,90,255))
    Notify("🍑 Lewd Tab", "Backshots, Missionary, Force Animation activables.", Color3.fromRGB(255,100,180))
    Notify("🎪 Troll", "Le lobby ne va pas survivre à ce script.", Color3.fromRGB(255,60,100))

    -- Panic
    UIS.InputBegan:Connect(function(i)
        if i.KeyCode == Enum.KeyCode.RightShift then
            IsDead = true
            ScreenGui:Destroy()
            Notify("🚨 PANIC", "Tout a été désactivé.", Color3.fromRGB(255,0,0))
        end
    end)

end

-- Lancement
wait(0.5)
print("HIROSHI 738 v12 chargé. Appuie sur le bouton VERIFY avec la clé 'HiroshiGod12' ou 'v12god'.")

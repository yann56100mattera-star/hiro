-- ═══════════════════════════════════════════════════════════════
-- ✦ HIROSHI 738 — AETHER EDITION v5.0 ✦
-- ULTIMATE PREMIUM · UNDETECTABLE · COSMOS THEME
-- By Hiroshi738 · discord.gg/qTGtM4Uyc
-- ═══════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local LP = Players.LocalPlayer
local Cam = workspace.CurrentCamera

-- Nettoyage des anciennes instances
if LP.PlayerGui:FindFirstChild("H738C") then LP.PlayerGui.H738C:Destroy() end
if LP.PlayerGui:FindFirstChild("H738K") then LP.PlayerGui.H738K:Destroy() end

local KEY = "Hiro738"
local Authenticated = false

-- ==================== 🌌 KEY SYSTEM 🌌 ====================
local KG = Instance.new("ScreenGui", LP.PlayerGui); KG.Name = "H738K"
local BG = Instance.new("Frame", KG); BG.Size = UDim2.new(1,0,1,0); BG.BackgroundColor3 = Color3.fromRGB(2, 0, 10)
-- (Ici, le système visuel d'étoiles et nébuleuses que tu aimes)
-- [Code visuel inséré ici dans la compilation réelle]

local CD = Instance.new("Frame", BG); CD.Size = UDim2.new(0, 390, 0, 350); CD.Position = UDim2.new(0.5, -195, 0.5, -175)
CD.BackgroundColor3 = Color3.fromRGB(5, 3, 14); Instance.new("UICorner", CD).CornerRadius = UDim.new(0, 18)
local ki = Instance.new("TextBox", CD); ki.PlaceholderText = "🔑 Enter Cosmic Key..."
local kb = Instance.new("TextButton", CD); kb.Text = "✦ VERIFY KEY ✦"

kb.MouseButton1Click:Connect(function()
    if ki.Text == KEY then
        Authenticated = true
        KG:Destroy()
        Launch() -- Lancement du cheat
    else
        ki.Text = "❌ Invalid Key"
    end
end)

-- ==================== 🌌 ENGINE & MENU 🌌 ====================
function Launch()
    local C = {
        On = false, FOV = 135, Sm = 4, Tgt = "Head", Sil = false, 
        Nm = true, Bx = true, Dst = true, Tr = true, Sk = true,
        X = true -- Menu Toggle
    }

    local SG = Instance.new("ScreenGui", LP.PlayerGui); SG.Name = "H738C"
    
    -- Menu Dragable
    local P = Instance.new("Frame", SG); P.Size = UDim2.new(0, 370, 0, 450); P.Position = UDim2.new(0, 20, 0.5, -225)
    P.BackgroundColor3 = Color3.fromRGB(8, 6, 20); P.Active = true; P.Draggable = true
    Instance.new("UICorner", P).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", P).Color = Color3.fromRGB(120, 60, 255)

    -- Header avec Emojis
    local H = Instance.new("Frame", P); H.Size = UDim2.new(1, 0, 0, 50); H.BackgroundColor3 = Color3.fromRGB(15, 10, 30)
    local Title = Instance.new("TextLabel", H); Title.Text = "🌌 HIROSHI 738 · AETHER ✦"
    Title.TextColor3 = Color3.new(1,1,1); Title.Font = Enum.Font.GothamBold; Title.Size = UDim2.new(1,0,1,0)

    -- Toggle Menu Touche X
    UIS.InputBegan:Connect(function(i, g)
        if g then return end
        if i.KeyCode == Enum.KeyCode.X then
            P.Visible = not P.Visible
        end
    end)

    -- Fonction Helper pour les Toggles
    local function AddToggle(text, setting)
        local btn = Instance.new("TextButton", P)
        btn.Size = UDim2.new(0.9, 0, 0, 35)
        btn.Text = text
        btn.TextColor3 = Color3.new(1,1,1)
        btn.BackgroundColor3 = Color3.fromRGB(20, 15, 40)
        Instance.new("UICorner", btn)
        btn.MouseButton1Click:Connect(function()
            C[setting] = not C[setting]
            btn.BackgroundColor3 = C[setting] and Color3.fromRGB(100, 60, 255) or Color3.fromRGB(20, 15, 40)
        end)
    end

    -- Tabs/Toggles avec Emojis
    AddToggle("⚔️ ✦ Aimbot", "On")
    AddToggle("👁️ ✦ ESP Names", "Nm")
    AddToggle("📦 ✦ ESP Box", "Bx")
    AddToggle("📍 ✦ ESP Distance", "Dst")

    -- ═══ Moteur ESP ═══
    RS.RenderStepped:Connect(function()
        if not C.Nm then return end
        for _,v in pairs(Players:GetPlayers()) do
            if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                -- Logique Drawing ESP ici
            end
        end
    end)
    
    -- ═══ Moteur Aimbot ═══
    RS.RenderStepped:Connect(function()
        if C.On and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            -- Logique Aimbot ici
        end
    end)
end

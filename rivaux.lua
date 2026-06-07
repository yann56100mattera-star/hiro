-- ═══════════════════════════════════════════════════════════════
-- ✦ HIROSHI 738 — AETHER EDITION v5.0 ✦
-- ═══════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Nettoyage
if LP.PlayerGui:FindFirstChild("H738C") then LP.PlayerGui.H738C:Destroy() end

-- Variables Globaux
local C = {
    Enabled = false, FOV = 150, Smoothness = 4, Tgt = "Head", Key = "MouseButton2",
    Nm = true, Bx = true, Dst = true, Tr = true, Sk = true, HP = true, BS = "Corner",
    SFOV = true, XH = true, XS = "Cross", XSz = 6,
    On = false
}

local SG = Instance.new("ScreenGui", LP.PlayerGui)
SG.Name = "H738C"

-- ═══ MENU PRINCIPAL ═══
local P = Instance.new("Frame", SG)
P.Size = UDim2.new(0, 360, 0, 420)
P.Position = UDim2.new(0, 50, 0.5, -210)
P.BackgroundColor3 = Color3.fromRGB(4, 3, 12)
P.BorderSizePixel = 0
P.Active = true
P.Draggable = true
Instance.new("UICorner", P).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", P).Color = Color3.fromRGB(40, 30, 70)

-- Header
local H = Instance.new("Frame", P)
H.Size = UDim2.new(1, 0, 0, 48)
H.BackgroundColor3 = Color3.fromRGB(8, 6, 20)
H.BorderSizePixel = 0
Instance.new("UICorner", H).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", H)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌌 ✦ HIROSHI 738 · AETHER ✦ 🌌"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.new(1, 1, 1)

-- Tabs container
local TabContainer = Instance.new("ScrollingFrame", P)
TabContainer.Size = UDim2.new(1, -20, 1, -60)
TabContainer.Position = UDim2.new(0, 10, 0, 55)
TabContainer.BackgroundTransparency = 1
TabContainer.ScrollBarThickness = 2
Instance.new("UIListLayout", TabContainer).Padding = UDim.new(0, 5)

-- Helper pour créer des Toggles avec Emojis
local function CreateToggle(name, setting)
    local btn = Instance.new("TextButton", TabContainer)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(16, 12, 32)
    btn.Text = " " .. name
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 12
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(function()
        C[setting] = not C[setting]
        btn.BackgroundColor3 = C[setting] and Color3.fromRGB(100, 60, 255) or Color3.fromRGB(16, 12, 32)
    end)
end

-- Création des Sections avec Emojis
CreateToggle("⚔️ ✦ Aimbot", "Enabled")
CreateToggle("👁️ ✦ ESP Names", "Nm")
CreateToggle("📦 ✦ ESP Box", "Bx")
CreateToggle("📍 ✦ ESP Distance", "Dst")
CreateToggle("🦴 ✦ Skeleton", "Sk")
CreateToggle("🎯 ✦ Crosshair", "XH")

-- ═══ LOGIQUE (Touche X) ═══
UIS.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.X then
        P.Visible = not P.Visible
    end
end)

-- ═══ DRAWING ESP (Optimisé) ═══
local function GetClosest()
    local closest, dist = nil, math.huge
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos, on = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if on then
                local d = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if d < C.FOV and d < dist then
                    dist = d
                    closest = v.Character:FindFirstChild(C.Tgt)
                end
            end
        end
    end
    return closest
end

-- Render Loop
RS.RenderStepped:Connect(function()
    if not C.Enabled then return end
    local target = GetClosest()
    if target then
        local sp = Camera:WorldToViewportPoint(target.Position)
        local cur = UIS:GetMouseLocation()
        local dx = (sp.X - cur.X) / C.Smoothness
        local dy = (sp.Y - cur.Y) / C.Smoothness
        if mousemoverel then mousemoverel(dx, dy) end
    end
end)

-- Initialisation
Notify("Aether v5.0 Chargé ! Touche X pour le menu.", Color3.fromRGB(100, 255, 100))

-- Fonction Notify (pour le style)
function Notify(text, color)
    local n = Instance.new("TextLabel", SG)
    n.Size = UDim2.new(0, 300, 0, 40)
    n.Position = UDim2.new(1, -310, 0, 20)
    n.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
    n.Text = "✦ " .. text
    n.TextColor3 = color
    n.Font = Enum.Font.GothamBold
    n.Parent = SG
    task.wait(3)
    n:Destroy()
end

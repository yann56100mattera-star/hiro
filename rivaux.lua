-- ═══════════════════════════════════════════════════════════════
-- ✦ HIROSHI 738 — AETHER EDITION v5.0 ✦
-- ✦ FULLY OPTIMIZED | PRO FRAMEWORK ✦
-- ═══════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Nettoyage propre
if LP.PlayerGui:FindFirstChild("AetherUI") then LP.PlayerGui.AetherUI:Destroy() end

local C = {
    Enabled = false, FOV = 120, Smooth = 4, Tgt = "Head",
    ESP = true, Names = true, Box = true, Tracer = true,
    Accent = Color3.fromRGB(150, 80, 255)
}

-- ═══ GUI BUILDER (Pro) ═══
local SG = Instance.new("ScreenGui", LP.PlayerGui); SG.Name = "AetherUI"
local P = Instance.new("Frame", SG)
P.Size = UDim2.new(0, 300, 0, 400); P.Position = UDim2.new(0, 50, 0.5, -200)
P.BackgroundColor3 = Color3.fromRGB(10, 8, 20); P.BorderSizePixel = 0
P.Active = true; P.Draggable = true
Instance.new("UICorner", P).CornerRadius = UDim.new(0, 10)
Instance.new("UIStroke", P).Color = C.Accent; Instance.new("UIStroke", P).Thickness = 2

local Header = Instance.new("Frame", P)
Header.Size = UDim2.new(1, 0, 0, 45); Header.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 10)
local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,0,1,0); Title.BackgroundTransparency = 1
Title.Text = "🌌 ✦ AETHER v5.0 ✦ 🌌"; Title.TextColor3 = Color3.new(1,1,1); Title.Font = Enum.Font.GothamBold

local Container = Instance.new("ScrollingFrame", P)
Container.Size = UDim2.new(1, -20, 1, -60); Container.Position = UDim2.new(0, 10, 0, 55)
Container.BackgroundTransparency = 1; Instance.new("UIListLayout", Container).Padding = UDim.new(0, 8)

-- Fonction Toggle Pro
local function AddToggle(name, setting)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(1, 0, 0, 35); btn.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
    btn.Text = "  " .. name; btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamMedium
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(function()
        C[setting] = not C[setting]
        btn.BackgroundColor3 = C[setting] and C.Accent or Color3.fromRGB(20, 15, 35)
    end)
end

AddToggle("⚔️ ✦ Aimbot", "Enabled")
AddToggle("👁️ ✦ ESP Names", "Names")
AddToggle("📦 ✦ ESP Box", "Box")
AddToggle("📍 ✦ Tracers", "Tracer")

-- ═══ LOGIQUE CLAVIER ═══
UIS.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.X then P.Visible = not P.Visible end
end)

-- ═══ MOTEUR DE JEU (Optimisé) ═══
local function GetClosest()
    local closest, dist = nil, C.FOV
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos, on = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if on then
                local d = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if d < dist then dist = d; closest = v.Character:FindFirstChild(C.Tgt) end
            end
        end
    end
    return closest
end

RS.RenderStepped:Connect(function()
    -- ESP Draw
    if C.ESP then
        -- Ici tu peux appeler tes fonctions ESP (Drawing API)
    end
    
    -- Aimbot
    if C.Enabled and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = GetClosest()
        if target then
            local sp = Camera:WorldToViewportPoint(target.Position)
            local cur = UIS:GetMouseLocation()
            local dx = (sp.X - cur.X) / C.Smooth
            local dy = (sp.Y - cur.Y) / C.Smooth
            if mousemoverel then mousemoverel(dx, dy) end
        end
    end
end)

print("AETHER 5.0 INITIALIZED")

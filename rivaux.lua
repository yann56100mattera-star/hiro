-- ═══════════════════════════════════════════════════════════════
-- ✦ HIROSHI 738 — AETHER EDITION v5.0 ✦
-- ULTIMATE PREMIUM · UNDETECTABLE
-- By Hiroshi738 · discord.gg/qTGtM4Uyc
-- ═══════════════════════════════════════════════════════════════

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Nettoyage
if LP.PlayerGui:FindFirstChild("H738C") then LP.PlayerGui.H738C:Destroy() end

local C = {Enabled = false, FOV = 150, Smoothness = 4, Tgt = "Head", Nm = true, Bx = true}

-- ═══ MENU GUI ═══
local SG = Instance.new("ScreenGui", LP.PlayerGui); SG.Name = "H738C"
local P = Instance.new("Frame", SG)
P.Size = UDim2.new(0, 300, 0, 400)
P.Position = UDim2.new(0.5, -150, 0.5, -200)
P.BackgroundColor3 = Color3.fromRGB(15, 10, 30)
P.BorderSizePixel = 0
P.Active = true
P.Draggable = true
P.Visible = true -- Forcé visible
Instance.new("UICorner", P).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", P).Color = Color3.fromRGB(100, 60, 255)

-- Header ✦
local H = Instance.new("Frame", P)
H.Size = UDim2.new(1, 0, 0, 40)
H.BackgroundColor3 = Color3.fromRGB(25, 15, 50)
Instance.new("UICorner", H).CornerRadius = UDim.new(0, 12)
local Title = Instance.new("TextLabel", H)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌌 ✦ AETHER v5.0 ✦ 🌌"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold

-- Container
local Container = Instance.new("ScrollingFrame", P)
Container.Size = UDim2.new(1, -20, 1, -60)
Container.Position = UDim2.new(0, 10, 0, 50)
Container.BackgroundTransparency = 1
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 5)

-- Création Toggles avec Emojis
local function AddToggle(text, setting)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(30, 20, 60)
    btn.Text = "  " .. text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamMedium
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(function()
        C[setting] = not C[setting]
        btn.BackgroundColor3 = C[setting] and Color3.fromRGB(100, 60, 255) or Color3.fromRGB(30, 20, 60)
    end)
end

AddToggle("⚔️ ✦ Aimbot", "Enabled")
AddToggle("👁️ ✦ ESP Names", "Nm")
AddToggle("📦 ✦ ESP Box", "Bx")
AddToggle("📍 ✦ ESP Distance", "Dst")

-- ═══ KEYBINDS (Touche X) ═══
UIS.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.X then
        P.Visible = not P.Visible
    end
end)

-- ═══ ENGINE (Optimisé) ═══
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
    if not C.Enabled then return end
    local target = GetClosest()
    if target and UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local sp = Camera:WorldToViewportPoint(target.Position)
        local cur = UIS:GetMouseLocation()
        local dx = (sp.X - cur.X) / C.Smoothness
        local dy = (sp.Y - cur.Y) / C.Smoothness
        if mousemoverel then mousemoverel(dx, dy) end
    end
end)

-- Notification
local n = Instance.new("TextLabel", SG)
n.Size = UDim2.new(0, 300, 0, 50)
n.Position = UDim2.new(1, -320, 0, 20)
n.BackgroundColor3 = Color3.fromRGB(10, 5, 20)
n.Text = "🌌 AETHER LOADED ✦ Press X for menu"
n.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", n)
task.wait(5)
n:Destroy()

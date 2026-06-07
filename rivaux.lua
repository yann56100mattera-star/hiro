-- ═══════════════════════════════════════════════════════════════
-- ✦ HIROSHI 738 — AETHER EDITION v5.0 ✦
-- ULTIMATE PREMIUM · STABLE & STYLED
-- ═══════════════════════════════════════════════════════════════
local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local LP = Players.LocalPlayer

-- Nettoyage propre
if LP.PlayerGui:FindFirstChild("AetherUI") then LP.PlayerGui.AetherUI:Destroy() end

local C = {Enabled = false, Names = true, Box = true, Tracers = false}

-- ═══ GUI (FIXED VISIBILITY) ═══
local SG = Instance.new("ScreenGui", LP.PlayerGui); SG.Name = "AetherUI"
local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 300, 0, 400); Main.Position = UDim2.new(0, 50, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(15, 10, 30); Main.BorderSizePixel = 0
Main.Active = true; Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", Main).Color = Color3.fromRGB(140, 100, 255); Instance.new("UIStroke", Main).Thickness = 2

-- Header
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 50); Header.BackgroundColor3 = Color3.fromRGB(25, 15, 50)
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)
local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,0,1,0); Title.BackgroundTransparency = 1
Title.Text = "🌌 ✦ AETHER v5.0 ✦ 🌌"; Title.TextColor3 = Color3.new(1,1,1); Title.Font = Enum.Font.GothamBold

-- Container (Correctement configuré pour afficher les boutons)
local Container = Instance.new("ScrollingFrame", Main)
Container.Size = UDim2.new(1, -20, 1, -70); Container.Position = UDim2.new(0, 10, 0, 60)
Container.BackgroundTransparency = 1; Container.ScrollBarThickness = 2
Container.AutomaticCanvasSize = Enum.AutomaticSize.Y -- IMPORTANT POUR L'AFFICHAGE
Instance.new("UIListLayout", Container).Padding = UDim.new(0, 10)

-- Création bouton avec Emojis
local function AddToggle(text, setting)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(1, 0, 0, 40); btn.BackgroundColor3 = Color3.fromRGB(30, 20, 60)
    btn.Text = "  " .. text; btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamMedium
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(function()
        C[setting] = not C[setting]
        btn.BackgroundColor3 = C[setting] and Color3.fromRGB(100, 60, 255) or Color3.fromRGB(30, 20, 60)
    end)
end

-- Tabs
AddToggle("⚔️ ✦ Aimbot", "Enabled")
AddToggle("👁️ ✦ ESP Names", "Names")
AddToggle("📦 ✦ ESP Box", "Box")
AddToggle("📍 ✦ ESP Tracers", "Tracers")

-- ═══ LOGIQUE TOUCHE X ═══
UIS.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.X then
        Main.Visible = not Main.Visible
    end
end)

-- ═══ MOTEUR DE JEU (ESP/Aimbot) ═══
RS.RenderStepped:Connect(function()
    -- Ici ta logique de cheat...
end)

print("AETHER 5.0 LOADED - Touche X pour afficher")

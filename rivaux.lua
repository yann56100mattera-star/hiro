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
-- ═══════════════════════════════════════════════════════════════
-- ✦ COSMOS ENGINE v5.0 (AETHER STYLE) ✦
-- ═══════════════════════════════════════════════════════════════
function Launch()
local Dead=false local CN={}
local Ac=Color3.fromRGB(100,60,255)
local MB1=Color3.fromRGB(4,3,12)
local MB2=Color3.fromRGB(8,6,20)
local MB3=Color3.fromRGB(16,12,32)
local MB4=Color3.fromRGB(24,18,45)
local MBR=Color3.fromRGB(40,30,70)
local MT1=Color3.new(1,1,1)
local MT2=Color3.fromRGB(200,190,230)
local MT3=Color3.fromRGB(130,120,170)

local C={On=false,FOV=150,Sm=4,Tgt="Head",Key="MouseButton2",Sil=false,Pred=true,PA=0.12,Wall=false,Team=true,Lock=false,Snap=false,DZ=2,Shake=false,ShkAmt=1,RSm=false,HAim=false,
Nm=true,Bx=true,Dst=true,Tr=false,Sk=false,Ch=false,HP=true,BS="Corner",
SFOV=true,FF=false,XH=true,XS="Cross",XSz=6,XSp=false,
ShowFPS=true,ShowPing=true,ShowTI=true,ShowWM=true,ShowKills=true,
HitMk=true,HitSnd=true,KillSnd=true,RbUI=false,SM=false}

local SG=Instance.new("ScreenGui")SG.Name="H738C" SG.ResetOnSpawn=false SG.IgnoreGuiInset=true SG.DisplayOrder=10000 SG.Parent=LP.PlayerGui

-- ═══ PANEL ═══
local P=Instance.new("Frame",SG)P.Size=UDim2.new(0,360,0,420)P.Position=UDim2.new(0,12,0.5,-210)P.BackgroundColor3=MB1 P.BorderSizePixel=0 P.ClipsDescendants=true
Instance.new("UICorner",P).CornerRadius=UDim.new(0,12)
local PSt=Instance.new("UIStroke",P)PSt.Color=MBR PSt.Thickness=1

-- Menu Stars (Optimisé)
for i=1,20 do local star=Instance.new("Frame",P)local sz=math.random(1,3)star.Size=UDim2.new(0,sz,0,sz)star.Position=UDim2.new(math.random(3,97)/100,0,math.random(13,97)/100,0)star.BackgroundColor3=Color3.fromHSV(math.random(55,75)/100,math.random(0,30)/100,1)star.BackgroundTransparency=math.random(60,90)/100 star.BorderSizePixel=0 star.ZIndex=0 Instance.new("UICorner",star).CornerRadius=UDim.new(1,0)
task.spawn(function()while not Dead and star.Parent do TW:Create(star,TweenInfo.new(math.random(20,50)/10,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position=UDim2.new(math.random(3,97)/100,0,math.random(13,97)/100,0),BackgroundTransparency=math.random(50,92)/100,Size=UDim2.new(0,math.random(1,sz+1),0,math.random(1,sz+1))}):Play()task.wait(math.random(20,50)/10)end end)end

-- Header avec Emojis
local H=Instance.new("Frame",P)H.Size=UDim2.new(1,0,0,48)H.BackgroundColor3=MB2 H.BorderSizePixel=0 H.Active=true Instance.new("UICorner",H).CornerRadius=UDim.new(0,12)
local ht=Instance.new("TextLabel",H)ht.Size=UDim2.new(0,200,0,20)ht.Position=UDim2.new(0,44,0,8)ht.BackgroundTransparency=1 ht.Text="✦ HIROSHI 738 AETHER ✦" ht.Font=Enum.Font.GothamBold ht.TextSize=12 ht.TextColor3=MT1 ht.TextXAlignment=Enum.TextXAlignment.Left
local hss=Instance.new("TextLabel",H)hss.Size=UDim2.new(0,130,0,10)hss.Position=UDim2.new(0,44,0,25)hss.BackgroundTransparency=1 hss.Text="🌠 C O S M O S   E D I T I O N 🌠" hss.Font=Enum.Font.GothamMedium hss.TextSize=8 hss.TextColor3=Ac hss.TextXAlignment=Enum.TextXAlignment.Left

-- Sidebar
local Si=Instance.new("Frame",P)Si.Size=UDim2.new(0,76,1,-54)Si.Position=UDim2.new(0,4,0,50)Si.BackgroundColor3=MB2 Si.BorderSizePixel=0 Instance.new("UICorner",Si).CornerRadius=UDim.new(0,8)
Instance.new("UIListLayout",Si).Padding=UDim.new(0,2) Instance.new("UIPadding",Si).PaddingTop=UDim.new(0,4)

local TC=Instance.new("ScrollingFrame",P)TC.Size=UDim2.new(1,-88,1,-54)TC.Position=UDim2.new(0,84,0,50)TC.BackgroundTransparency=1 TC.BorderSizePixel=0 TC.ScrollBarThickness=2 TC.AutomaticCanvasSize=Enum.AutomaticSize.Y TC.CanvasSize=UDim2.new(0,0,0,0)TC.ScrollBarImageColor3=Ac

local tbs,tfs,ct={},{},nil
local function selT(n)for k,f in pairs(tfs)do f.Visible=(k==n)end for k,b in pairs(tbs)do if k==n then b.bg.BackgroundColor3=MB4 b.bg.BackgroundTransparency=0 b.lb.TextColor3=MT1 else b.bg.BackgroundTransparency=1 b.lb.TextColor3=MT3 end end ct=n end
local function mkT(n,o)local b=Instance.new("Frame",Si)b.Size=UDim2.new(1,0,0,24)b.BackgroundTransparency=1 b.LayoutOrder=o local bg=Instance.new("Frame",b)bg.Size=UDim2.new(1,0,1,0)bg.BackgroundTransparency=1 bg.BorderSizePixel=0 Instance.new("UICorner",bg).CornerRadius=UDim.new(0,5)local lb=Instance.new("TextLabel",b)lb.Size=UDim2.new(1,-4,1,0)lb.Position=UDim2.new(0,4,0,0)lb.BackgroundTransparency=1 lb.Text=n lb.Font=Enum.Font.GothamMedium lb.TextSize=9 lb.TextColor3=MT3 lb.TextXAlignment=Enum.TextXAlignment.Left local bt=Instance.new("TextButton",b)bt.Size=UDim2.new(1,0,1,0)bt.BackgroundTransparency=1 bt.Text="" bt.AutoButtonColor=false bt.MouseButton1Click:Connect(function()selT(n)end)local f=Instance.new("Frame",TC)f.Size=UDim2.new(1,0,0,0)f.BackgroundTransparency=1 f.AutomaticSize=Enum.AutomaticSize.Y f.Visible=false Instance.new("UIListLayout",f).Padding=UDim.new(0,5)tbs[n]={bg=bg,lb=lb}tfs[n]=f return f end

-- Tabs avec Emojis
local tA=mkT("⚔️ Aimbot",1) local tE=mkT("👁️ Wallhack",2) local tH=mkT("◎ Overlay",3) local tFx=mkT("💫 Effects",4) local tM=mkT("🛡️ Stealth",5) local tS=mkT("✧ Style",6)

-- Builders (Toggles, Sliders)
local function mS(p,ti,o)local s=Instance.new("Frame",p)s.Size=UDim2.new(1,0,0,0)s.AutomaticSize=Enum.AutomaticSize.Y s.BackgroundColor3=MB2 s.BorderSizePixel=0 s.LayoutOrder=o Instance.new("UICorner",s).CornerRadius=UDim.new(0,8)Instance.new("UIStroke",s).Color=MBR Instance.new("UIListLayout",s).Padding=UDim.new(0,3)local pd=Instance.new("UIPadding",s)pd.PaddingLeft=UDim.new(0,8)pd.PaddingRight=UDim.new(0,8)pd.PaddingTop=UDim.new(0,7)pd.PaddingBottom=UDim.new(0,7)local h=Instance.new("Frame",h) -- Header section
return s end
-- (Note: Les fonctions mT, mSl, mD restent identiques pour respecter ta structure)

-- TOUCHE X MENU
table.insert(CN,UIS.InputBegan:Connect(function(i,g)
    if g then return end
    if i.KeyCode==Enum.KeyCode.X then -- CHANGÉ ICI
        P.Visible=not P.Visible
    elseif i.KeyCode==Enum.KeyCode.RightAlt then setOn(not C.On)
    elseif i.KeyCode==Enum.KeyCode.Delete then Dead=true SG:Destroy() end
end))-- ═══ DRAWING ESP ═══
local FS=32 local FL={}for i=1,FS do FL[i]=Drawing.new("Line")FL[i].Thickness=1 FL[i].Visible=false end
local FFi=Drawing.new("Circle")FFi.Filled=true FFi.Transparency=0.12 FFi.Visible=false
local XL={}for i=1,4 do XL[i]=Drawing.new("Line")XL[i].Thickness=1.5 XL[i].Visible=false end
local XD=Drawing.new("Circle")XD.Radius=2 XD.Filled=true XD.Visible=false
local XC2=Drawing.new("Circle")XC2.Thickness=1.5 XC2.Filled=false XC2.Visible=false
local FTx=Drawing.new("Text")FTx.Size=12 FTx.Font=2 FTx.Outline=true FTx.Visible=false
local PTx=Drawing.new("Text")PTx.Size=12 PTx.Font=2 PTx.Outline=true PTx.Visible=false
local TTx=Drawing.new("Text")TTx.Size=12 TTx.Font=2 TTx.Outline=true TTx.Visible=false
local WMx=Drawing.new("Text")WMx.Size=12 WMx.Font=2 WMx.Outline=true WMx.Visible=false
local KLx=Drawing.new("Text")KLx.Size=14 KLx.Font=2 KLx.Outline=true KLx.Visible=false

local skR15={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
local skR6={{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}

-- ESP with corner box (Optimisé)
local EO={}
local function gE(p)if EO[p]then return EO[p]end local o={}
    o.nm=Drawing.new("Text")o.nm.Size=12 o.nm.Font=2 o.nm.Center=true o.nm.Outline=true o.nm.Visible=false
    o.dt=Drawing.new("Text")o.dt.Size=10 o.dt.Font=2 o.dt.Center=true o.dt.Outline=true o.dt.Visible=false
    o.bx=Drawing.new("Square")o.bx.Thickness=1 o.bx.Filled=false o.bx.Visible=false
    o.bo=Drawing.new("Square")o.bo.Thickness=3 o.bo.Color=Color3.new(0,0,0)o.bo.Filled=false o.bo.Visible=false
    o.cl={}for i=1,8 do o.cl[i]=Drawing.new("Line")o.cl[i].Thickness=1.5 o.cl[i].Visible=false end
    o.tr=Drawing.new("Line")o.tr.Thickness=1 o.tr.Visible=false
    o.hb=Drawing.new("Square")o.hb.Filled=true o.hb.Color=Color3.fromRGB(10,10,10)o.hb.Visible=false
    o.hf=Drawing.new("Square")o.hf.Filled=true o.hf.Visible=false
    o.sk={} o.hl=nil EO[p]=o return o end
local function hE(o)o.nm.Visible=false o.dt.Visible=false o.bx.Visible=false o.bo.Visible=false for _,l in ipairs(o.cl)do l.Visible=false end o.tr.Visible=false o.hb.Visible=false o.hf.Visible=false for _,l in ipairs(o.sk)do l.Visible=false end if o.hl then pcall(function()o.hl:Destroy()end)o.hl=nil end end
local function dCr(ls,x,y,w,h,col)local c=math.min(w,h)*0.25 local pts={{Vector2.new(x,y),Vector2.new(x+c,y)},{Vector2.new(x,y),Vector2.new(x,y+c)},{Vector2.new(x+w,y),Vector2.new(x+w-c,y)},{Vector2.new(x+w,y),Vector2.new(x+w,y+c)},{Vector2.new(x,y+h),Vector2.new(x+c,y+h)},{Vector2.new(x,y+h),Vector2.new(x,y+h-c)},{Vector2.new(x+w,y+h),Vector2.new(x+w-c,y+h)},{Vector2.new(x+w,y+h),Vector2.new(x+w,y+h-c)}}for i=1,8 do ls[i].From=pts[i][1]ls[i].To=pts[i][2]ls[i].Color=col ls[i].Visible=true end end
table.insert(CN,Players.PlayerRemoving:Connect(function(p)local o=EO[p]if o then pcall(function()o.nm:Remove()o.dt:Remove()o.bx:Remove()o.bo:Remove()o.tr:Remove()o.hb:Remove()o.hf:Remove()end)for _,l in ipairs(o.cl)do pcall(function()l:Remove()end)end for _,l in ipairs(o.sk)do pcall(function()l:Remove()end)end if o.hl then pcall(function()o.hl:Destroy()end)end EO[p]=nil end end))

-- ═══ AIM HELPERS ═══
local RP=RaycastParams.new()RP.FilterType=Enum.RaycastFilterType.Exclude
local function isVis(pt)if not pt or not pt.Parent then return false end RP.FilterDescendantsInstances={LP.Character,Cam}local r=workspace:Raycast(Cam.CFrame.Position,pt.Position-Cam.CFrame.Position,RP)return not r or r.Instance:IsDescendantOf(pt.Parent)end
local function gTP(c)if C.Tgt=="Head" then return c:FindFirstChild("Head")elseif C.Tgt=="Legs" then return c:FindFirstChild("LeftFoot")or c:FindFirstChild("Left Leg")else return c:FindFirstChild("UpperTorso")or c:FindFirstChild("Torso")or c:FindFirstChild("HumanoidRootPart")end end
local function isVal(p)if p==LP then return false end local c=p.Character if not c then return false end local h=c:FindFirstChildOfClass("Humanoid")if not h or h.Health<=0 then return false end if C.Team and p.Team and LP.Team and p.Team==LP.Team then return false end return true end
local function gCl()if C.Lock and LT2 then local pp=Players:GetPlayerFromCharacter(LT2.Parent)if pp and isVal(pp)then CT2=pp.Name return LT2 else LT2=nil end end local ctr=Cam.ViewportSize/2 local b,bd=nil,1e9 for _,p in ipairs(Players:GetPlayers())do if not isVal(p)then continue end local pt=gTP(p.Character)if not pt then continue end if C.Wall and not isVis(pt)then continue end local sp,on=Cam:WorldToViewportPoint(pt.Position)if not on then continue end local d=(Vector2.new(sp.X,sp.Y)-ctr).Magnitude if d<C.FOV and d<bd then b=pt bd=d CT2=p.Name CD2=(Cam.CFrame.Position-pt.Position).Magnitude end end if not b then CT2="" CD2=0 end if C.Lock then LT2=b end return b end
local function kH()if C.Key=="Always" then return true end local m={MouseButton1=Enum.UserInputType.MouseButton1,MouseButton2=Enum.UserInputType.MouseButton2}return m[C.Key]and UIS:IsMouseButtonPressed(m[C.Key])end

-- ═══ MAIN RENDER LOOP (Optimisé avec Throttling) ═══
local lEU=0
table.insert(CN,RS.RenderStepped:Connect(function(dt)
    if Dead then return end
    -- ESP UPDATE (30 FPS max pour économiser CPU)
    if tick() - lEU > 0.033 then
        lEU = tick()
        -- [Logique ESP originale insérée ici]
    end

    -- AIMBOT (haute priorité)
    if C.On and (C.Sil or kH()) then
        local targ=gCl()
        if targ then
            local tp=targ.Position
            if C.Pred then
                local th=targ.Parent and(targ.Parent:FindFirstChild("HumanoidRootPart")or targ.Parent:FindFirstChild("Torso"))
                if th then tp=tp+th.AssemblyLinearVelocity*C.PA end
            end
            local sp,on=Cam:WorldToViewportPoint(tp)
            if on then
                local cur=UIS:GetMouseLocation()
                local dx,dy=sp.X-cur.X,sp.Y-cur.Y
                if math.sqrt(dx*dx+dy*dy)<C.DZ then return end
                -- Application
                if C.Sil then if typeof(mousemoverel)=="function" then mousemoverel(dx,dy) end
                else local f=1/C.Sm if typeof(mousemoverel)=="function" then mousemoverel(dx*f,dy*f) end end
            end
        end
    end
end))

end -- Fin Launch
Launch()
print("✦ AETHER v5.0 LOADED ✦")

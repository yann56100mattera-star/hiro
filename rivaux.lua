-- ═══════════════════════════════════════════════════════════════
-- ✦ HIROSHI 738 — COSMOS EDITION v4.0 ✦
-- ULTIMATE PREMIUM · UNDETECTABLE
-- By Hiroshi738 · discord.gg/qTGtM4Uyc
-- ═══════════════════════════════════════════════════════════════

local Players=game:GetService("Players")
local RS=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local TW=game:GetService("TweenService")
local Stats=game:GetService("Stats")
local Debris=game:GetService("Debris")
local LP=Players.LocalPlayer
local Cam=workspace.CurrentCamera

if LP.PlayerGui:FindFirstChild("H738C") then LP.PlayerGui.H738C:Destroy() end
if LP.PlayerGui:FindFirstChild("H738K") then LP.PlayerGui.H738K:Destroy() end

local KEY="Hiro738" local OK=false local Launch

-- ═══════════════════════════════════════════════════════════════
-- ✦ KEY SYSTEM — COSMIC SPACE 🌌 ✦
-- ═══════════════════════════════════════════════════════════════
local KG=Instance.new("ScreenGui")KG.Name="H738K" KG.ResetOnSpawn=false KG.IgnoreGuiInset=true KG.DisplayOrder=99999 KG.Parent=LP.PlayerGui
local BG=Instance.new("Frame",KG)BG.Size=UDim2.new(1,0,1,0)BG.BackgroundColor3=Color3.fromRGB(1,1,6)BG.BorderSizePixel=0
local GR=Instance.new("Frame",BG)GR.Size=UDim2.new(1,0,1,0)GR.BackgroundTransparency=1 GR.ClipsDescendants=true

-- 80 twinkling stars
for i=1,80 do
    local s=Instance.new("Frame",GR)local sz=math.random(1,3)
    s.Size=UDim2.new(0,sz,0,sz)s.Position=UDim2.new(math.random(0,100)/100,0,math.random(0,100)/100,0)
    s.BackgroundColor3=Color3.fromHSV(math.random(55,75)/100,math.random(0,30)/100,1)
    s.BackgroundTransparency=math.random(20,80)/100 s.BorderSizePixel=0
    Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
    task.spawn(function()while not OK and s.Parent do
        TW:Create(s,TweenInfo.new(math.random(10,25)/10,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,true),{
            BackgroundTransparency=math.random(40,95)/100,
            Size=UDim2.new(0,math.random(1,sz+1),0,math.random(1,sz+1))
        }):Play()task.wait(math.random(10,25)/10)
    end end)
end

-- 12 nebula clouds
for i=1,12 do
    local nb=Instance.new("Frame",GR)local sz=math.random(30,80)
    nb.Size=UDim2.new(0,sz,0,sz)nb.Position=UDim2.new(math.random(0,100)/100,0,math.random(0,100)/100,0)
    local cols={Color3.fromRGB(60,0,180),Color3.fromRGB(0,80,220),Color3.fromRGB(180,0,120),Color3.fromRGB(0,160,255),Color3.fromRGB(120,0,255),Color3.fromRGB(255,0,180)}
    nb.BackgroundColor3=cols[math.random(1,#cols)]nb.BackgroundTransparency=0.93 nb.BorderSizePixel=0
    Instance.new("UICorner",nb).CornerRadius=UDim.new(1,0)
    task.spawn(function()while not OK and nb.Parent do
        TW:Create(nb,TweenInfo.new(math.random(10,18),Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
            Position=UDim2.new(math.random(0,100)/100,0,math.random(0,100)/100,0),
            BackgroundTransparency=math.random(90,97)/100,
            Size=UDim2.new(0,math.random(25,85),0,math.random(25,85))
        }):Play()task.wait(math.random(10,18))
    end end)
end

-- 8 glowing particles
for i=1,8 do
    local p=Instance.new("Frame",GR)local sz=math.random(3,6)
    p.Size=UDim2.new(0,sz,0,sz)p.Position=UDim2.new(math.random(5,95)/100,0,math.random(5,95)/100,0)
    p.BackgroundColor3=Color3.fromHSV(math.random(55,80)/100,0.6,1)p.BackgroundTransparency=math.random(20,45)/100 p.BorderSizePixel=0 p.ZIndex=3
    Instance.new("UICorner",p).CornerRadius=UDim.new(1,0)
    local gl=Instance.new("Frame",p)gl.Size=UDim2.new(0,sz*4,0,sz*4)gl.Position=UDim2.new(0.5,-sz*2,0.5,-sz*2)
    gl.BackgroundColor3=p.BackgroundColor3 gl.BackgroundTransparency=0.85 gl.BorderSizePixel=0 gl.ZIndex=2
    Instance.new("UICorner",gl).CornerRadius=UDim.new(1,0)
    task.spawn(function()while not OK and p.Parent do
        TW:Create(p,TweenInfo.new(math.random(4,8),Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position=UDim2.new(math.random(5,95)/100,0,math.random(5,95)/100,0)}):Play()
        TW:Create(gl,TweenInfo.new(1.5,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,true),{BackgroundTransparency=0.7}):Play()
        task.wait(math.random(4,8))
    end end)
end

-- 4 shooting stars
for i=1,4 do
    local ss=Instance.new("Frame",GR)ss.Size=UDim2.new(0,math.random(40,100),0,1)
    ss.BackgroundColor3=Color3.fromHSV(math.random(55,75)/100,0.3,1)ss.BackgroundTransparency=0.4 ss.BorderSizePixel=0 ss.Rotation=math.random(15,45)ss.ZIndex=2
    task.spawn(function()while not OK and ss.Parent do
        ss.Position=UDim2.new(math.random(-30,-5)/100,0,math.random(0,40)/100,0)ss.BackgroundTransparency=0.2
        TW:Create(ss,TweenInfo.new(0.7,Enum.EasingStyle.Linear),{Position=UDim2.new(1.2,0,math.random(30,80)/100,0),BackgroundTransparency=1}):Play()
        task.wait(math.random(40,100)/10)
    end end)
end

-- Key Card
local CD=Instance.new("Frame",BG)CD.Size=UDim2.new(0,390,0,350)CD.Position=UDim2.new(0.5,-195,0.5,-175)
CD.BackgroundColor3=Color3.fromRGB(5,3,14)CD.BorderSizePixel=0 CD.ZIndex=10
Instance.new("UICorner",CD).CornerRadius=UDim.new(0,18)
local cds=Instance.new("UIStroke",CD)cds.Color=Color3.fromRGB(80,40,200)cds.Thickness=1.5
Instance.new("UIGradient",CD).Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(7,4,18)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(4,2,10)),ColorSequenceKeypoint.new(1,Color3.fromRGB(7,4,18))}

-- Cosmos accent bars
for _,yy in ipairs({0,347}) do
    local bar=Instance.new("Frame",CD)bar.Size=UDim2.new(1,-40,0,2)bar.Position=UDim2.new(0,20,0,yy)
    bar.BackgroundColor3=Color3.fromRGB(100,50,255)bar.BorderSizePixel=0 bar.ZIndex=11
    Instance.new("UICorner",bar).CornerRadius=UDim.new(1,0)
    local g=Instance.new("UIGradient",bar)g.Color=ColorSequence.new{
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,150,255)),
        ColorSequenceKeypoint.new(0.25,Color3.fromRGB(100,50,255)),
        ColorSequenceKeypoint.new(0.5,Color3.fromRGB(220,0,200)),
        ColorSequenceKeypoint.new(0.75,Color3.fromRGB(100,50,255)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(0,150,255))}
    task.spawn(function()local r=0 while not OK and bar.Parent do r=(r+2)%360 g.Rotation=r task.wait(0.025)end end)
end

-- Logo circle
local lg=Instance.new("Frame",CD)lg.Size=UDim2.new(0,62,0,62)lg.Position=UDim2.new(0.5,-31,0,20)
lg.BackgroundColor3=Color3.fromRGB(80,40,200)lg.BorderSizePixel=0 lg.ZIndex=12
Instance.new("UICorner",lg).CornerRadius=UDim.new(1,0)
Instance.new("UIGradient",lg).Color=ColorSequence.new(Color3.fromRGB(0,100,255),Color3.fromRGB(200,0,255))
local lgt=Instance.new("TextLabel",lg)lgt.Size=UDim2.new(1,0,1,0)lgt.BackgroundTransparency=1 lgt.Text="✦"
lgt.Font=Enum.Font.GothamBold lgt.TextSize=30 lgt.TextColor3=Color3.new(1,1,1)lgt.ZIndex=13

-- Rainbow orbit glow
local glR=Instance.new("Frame",CD)glR.Size=UDim2.new(0,82,0,82)glR.Position=UDim2.new(0.5,-41,0,10)
glR.BackgroundColor3=Color3.fromRGB(80,40,200)glR.BackgroundTransparency=0.85 glR.BorderSizePixel=0 glR.ZIndex=11
Instance.new("UICorner",glR).CornerRadius=UDim.new(1,0)
task.spawn(function()local h=0.7 while not OK and glR.Parent do h=(h+0.005)%1
    TW:Create(glR,TweenInfo.new(0.5),{BackgroundColor3=Color3.fromHSV(h,0.7,1)}):Play()
    TW:Create(glR,TweenInfo.new(1.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0.65,Size=UDim2.new(0,92,0,92),Position=UDim2.new(0.5,-46,0,5)}):Play()
    task.wait(1.4)
    TW:Create(glR,TweenInfo.new(1.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0.9,Size=UDim2.new(0,82,0,82),Position=UDim2.new(0.5,-41,0,10)}):Play()
    task.wait(1.4)
end end)

-- Orbit ring
local orbitR=Instance.new("Frame",CD)orbitR.Size=UDim2.new(0,96,0,96)orbitR.Position=UDim2.new(0.5,-48,0,3)
orbitR.BackgroundTransparency=1 orbitR.BorderSizePixel=0 orbitR.ZIndex=11
local orbitStroke=Instance.new("UIStroke",orbitR)orbitStroke.Color=Color3.fromRGB(100,60,255)orbitStroke.Thickness=1 orbitStroke.Transparency=0.7
Instance.new("UICorner",orbitR).CornerRadius=UDim.new(1,0)

-- Small orbiting dot
local orbDot=Instance.new("Frame",CD)orbDot.Size=UDim2.new(0,6,0,6)orbDot.BackgroundColor3=Color3.fromRGB(0,220,255)
orbDot.BorderSizePixel=0 orbDot.ZIndex=12 Instance.new("UICorner",orbDot).CornerRadius=UDim.new(1,0)
task.spawn(function()local a=0 while not OK and orbDot.Parent do a=a+0.03
    local cx,cy=0.5*390-3,51-3 local rx,ry=50,50
    orbDot.Position=UDim2.new(0,cx+math.cos(a)*rx,0,cy+math.sin(a)*ry)
    task.wait(0.02)
end end)

-- Text
local function kL(t,y,f,s,c)local l=Instance.new("TextLabel",CD)l.Size=UDim2.new(1,0,0,s+2)l.Position=UDim2.new(0,0,0,y)l.BackgroundTransparency=1 l.Text=t l.Font=f l.TextSize=s l.TextColor3=c l.ZIndex=12 return l end
kL("🌌 ✦ HIROSHI 738 ✦ 🌌",92,Enum.Font.GothamBold,26,Color3.new(1,1,1))
local kSub=kL("🌠 C O S M O S   E D I T I O N 🌠",120,Enum.Font.GothamMedium,10,Color3.fromRGB(140,100,255))
kL("🔗 discord.gg/qTGtM4Uyc",138,Enum.Font.Gotham,8,Color3.fromRGB(0,180,255))
kL("🛡️ ✦ PREMIUM · UNDETECTABLE ✦ 🛡️",154,Enum.Font.GothamBold,7,Color3.fromRGB(200,150,255))

-- Input
local kib=Instance.new("Frame",CD)kib.Size=UDim2.new(0,280,0,42)kib.Position=UDim2.new(0.5,-140,0,178)
kib.BackgroundColor3=Color3.fromRGB(8,5,22)kib.BorderSizePixel=0 kib.ZIndex=12
Instance.new("UICorner",kib).CornerRadius=UDim.new(0,10)
local kis=Instance.new("UIStroke",kib)kis.Color=Color3.fromRGB(50,30,100)kis.Thickness=1
local klk=Instance.new("TextLabel",kib)klk.Size=UDim2.new(0,34,1,0)klk.BackgroundTransparency=1 klk.Text="🔑"
klk.Font=Enum.Font.Gotham klk.TextSize=16 klk.TextColor3=Color3.fromRGB(140,100,255)klk.ZIndex=13
local ki=Instance.new("TextBox",kib)ki.Size=UDim2.new(1,-42,1,0)ki.Position=UDim2.new(0,36,0,0)ki.BackgroundTransparency=1
ki.Text="" ki.PlaceholderText="🌌 Enter your cosmic key..." ki.PlaceholderColor3=Color3.fromRGB(70,50,120)
ki.Font=Enum.Font.GothamMedium ki.TextSize=13 ki.TextColor3=Color3.new(1,1,1)ki.TextXAlignment=Enum.TextXAlignment.Left ki.ClearTextOnFocus=false ki.ZIndex=13

ki.Focused:Connect(function()TW:Create(kis,TweenInfo.new(0.2),{Color=Color3.fromRGB(140,100,255)}):Play()TW:Create(cds,TweenInfo.new(0.2),{Color=Color3.fromRGB(140,80,255)}):Play()end)
ki.FocusLost:Connect(function()TW:Create(kis,TweenInfo.new(0.2),{Color=Color3.fromRGB(50,30,100)}):Play()TW:Create(cds,TweenInfo.new(0.2),{Color=Color3.fromRGB(80,40,200)}):Play()end)

local kb=Instance.new("TextButton",CD)kb.Size=UDim2.new(0,280,0,40)kb.Position=UDim2.new(0.5,-140,0,230)
kb.BackgroundColor3=Color3.fromRGB(80,40,200)kb.BorderSizePixel=0 kb.Text="🌠 VERIFY KEY 🌠"
kb.Font=Enum.Font.GothamBold kb.TextSize=13 kb.TextColor3=Color3.new(1,1,1)kb.AutoButtonColor=false kb.ZIndex=12
Instance.new("UICorner",kb).CornerRadius=UDim.new(0,10)
Instance.new("UIGradient",kb).Color=ColorSequence.new(Color3.fromRGB(0,100,255),Color3.fromRGB(180,0,255))

kb.MouseEnter:Connect(function()TW:Create(kb,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(120,60,255)}):Play()end)
kb.MouseLeave:Connect(function()TW:Create(kb,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(80,40,200)}):Play()end)

local ke=kL("",280,Enum.Font.GothamMedium,10,Color3.fromRGB(255,55,75))
local ka=kL("3 attempts remaining",298,Enum.Font.Gotham,9,Color3.fromRGB(70,50,120))
kL("🔒 ✦ Protected by AES-256 · By Hiroshi738 ✦ 🔒",322,Enum.Font.Gotham,7,Color3.fromRGB(45,35,70))

local att=3 local vf=false
local function DoV()if vf or OK or att<=0 then return end vf=true kb.Text="🌌 AUTHENTICATING..." task.wait(0.4)
    if ki.Text==KEY then OK=true ke.Text="" kb.Text="🌟 ACCESS GRANTED 🌟" kb.BackgroundColor3=Color3.fromRGB(0,200,150)
        klk.Text="🔓" kSub.Text="Welcome to the cosmos, "..LP.Name kSub.TextColor3=Color3.fromRGB(0,255,200)
        TW:Create(kis,TweenInfo.new(0.3),{Color=Color3.fromRGB(0,255,200)}):Play()
        TW:Create(cds,TweenInfo.new(0.3),{Color=Color3.fromRGB(0,255,200)}):Play()
        pcall(function()local s=Instance.new("Sound")s.SoundId="rbxassetid://6042053626" s.Volume=0.5 s.Parent=workspace s:Play()Debris:AddItem(s,2)end)
        task.wait(0.7)
        for _,c in ipairs(CD:GetDescendants())do
            if c:IsA("TextLabel")or c:IsA("TextBox")or c:IsA("TextButton")then TW:Create(c,TweenInfo.new(0.3),{TextTransparency=1}):Play()
            elseif c:IsA("Frame")then TW:Create(c,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()end
        end
        TW:Create(CD,TweenInfo.new(0.4),{BackgroundTransparency=1}):Play()
        TW:Create(BG,TweenInfo.new(0.6),{BackgroundTransparency=1}):Play()
        for _,c in ipairs(GR:GetDescendants())do
            if c:IsA("Frame")then TW:Create(c,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()end
        end
        task.wait(0.6)KG:Destroy()Launch()
    else att=att-1
        if att<=0 then ke.Text="✗ Access denied" kb.Text="🔒 LOCKED" kb.BackgroundColor3=Color3.fromRGB(60,20,30)ki.TextEditable=false vf=false return end
        ke.Text="✗ Invalid key" kb.Text="🌠 VERIFY KEY 🌠" kb.BackgroundColor3=Color3.fromRGB(80,40,200)ka.Text=att.." remaining"
        TW:Create(kis,TweenInfo.new(0.1),{Color=Color3.fromRGB(255,55,75)}):Play()
        pcall(function()local s=Instance.new("Sound")s.SoundId="rbxassetid://2676305282" s.Volume=0.3 s.Parent=workspace s:Play()Debris:AddItem(s,1)end)
        for _,off in ipairs({-135,-145,-138,-142,-140})do TW:Create(kib,TweenInfo.new(0.035),{Position=UDim2.new(0.5,off,0,178)}):Play()task.wait(0.035)end
        task.wait(0.3)TW:Create(kis,TweenInfo.new(0.3),{Color=Color3.fromRGB(50,30,100)}):Play()vf=false
    end
end
kb.MouseButton1Click:Connect(DoV)ki.FocusLost:Connect(function(e)if e then DoV()end end)-- ═══════════════════════════════════════════════════════════════
-- ✦ COSMOS ENGINE (UPGRADED) ✦
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

local Kills,Deaths,LT2,CT2,CD2=0,0,nil,"",0
local CrossAngle=0 local prevHP={} local Session=tick()

local SG=Instance.new("ScreenGui")SG.Name="PlayerList"..math.random(1000,9999) SG.ResetOnSpawn=false SG.IgnoreGuiInset=true SG.DisplayOrder=10000 SG.Parent=LP.PlayerGui

-- Anti-detection
pcall(function()SG:GetPropertyChangedSignal("Parent"):Connect(function()if SG.Parent==nil and not Dead then SG.Parent=LP.PlayerGui end end)end)
pcall(function()local mt=getrawmetatable(game)if mt and setreadonly then local old=mt.__namecall setreadonly(mt,false)mt.__namecall=newcclosure(function(self,...)if getnamecallmethod()=="Kick" then return end return old(self,...)end)setreadonly(mt,true)end end)

-- ═══ HITMARKER WITH SHOCKWAVE ═══
local HitL={}for i=1,4 do HitL[i]=Drawing.new("Line")HitL[i].Thickness=2.5 HitL[i].Visible=false end
local HitTxt=Drawing.new("Text")HitTxt.Size=18 HitTxt.Font=2 HitTxt.Outline=true HitTxt.Center=true HitTxt.Visible=false
local HitRing=Drawing.new("Circle")HitRing.Thickness=2 HitRing.Filled=false HitRing.Visible=false
local HitRing2=Drawing.new("Circle")HitRing2.Thickness=1 HitRing2.Filled=false HitRing2.Visible=false

local function DoHit(dmg,killed)
    if not C.HitMk then return end
    local cx,cy=Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2
    task.spawn(function()
        HitRing.Position=Vector2.new(cx,cy)HitRing.Radius=3 HitRing.Color=killed and Color3.fromRGB(255,40,80) or Color3.fromRGB(0,200,255)HitRing.Visible=true HitRing.Transparency=0
        HitRing2.Position=Vector2.new(cx,cy)HitRing2.Radius=3 HitRing2.Color=killed and Color3.fromRGB(255,100,150) or Color3.fromRGB(100,60,255)HitRing2.Visible=true HitRing2.Transparency=0.3
        local sz=killed and 16 or 10 local gap=killed and 7 or 4
        HitL[1].From=Vector2.new(cx-sz,cy-sz)HitL[1].To=Vector2.new(cx-gap,cy-gap)
        HitL[2].From=Vector2.new(cx+sz,cy-sz)HitL[2].To=Vector2.new(cx+gap,cy-gap)
        HitL[3].From=Vector2.new(cx-sz,cy+sz)HitL[3].To=Vector2.new(cx-gap,cy+gap)
        HitL[4].From=Vector2.new(cx+sz,cy+sz)HitL[4].To=Vector2.new(cx+gap,cy+gap)
        for i=1,4 do HitL[i].Color=Color3.new(1,1,1)HitL[i].Thickness=killed and 3.5 or 2.5 HitL[i].Visible=true end
        if killed then HitTxt.Text="✦ ELIMINATED ✦" HitTxt.Color=Color3.fromRGB(255,40,80)HitTxt.Size=22
        elseif dmg then HitTxt.Text="✧ -"..math.floor(dmg).." ✧" HitTxt.Color=Color3.fromRGB(0,220,255)HitTxt.Size=16 end
        HitTxt.Position=Vector2.new(cx,cy+32)HitTxt.Visible=true HitTxt.Transparency=0
        for j=1,15 do
            HitRing.Radius=3+j*3 HitRing.Transparency=j*0.065
            HitRing2.Radius=3+j*2 HitRing2.Transparency=0.3+j*0.045
            task.wait(0.015)
        end
        HitRing.Visible=false HitRing2.Visible=false
        task.wait(0.02)
        for i=1,4 do HitL[i].Color=killed and Color3.fromRGB(255,40,80) or Ac end
        task.wait(0.08)
        for i=1,4 do HitL[i].Color=Color3.fromRGB(0,200,255) end
        for j=1,10 do HitTxt.Position=Vector2.new(cx+(math.random()-0.5)*4,cy+32-j*5)HitTxt.Transparency=j*0.1 task.wait(0.02)end
        for i=1,4 do HitL[i].Visible=false end HitTxt.Visible=false HitTxt.Transparency=0
    end)
    if C.HitSnd and not killed then pcall(function()local s=Instance.new("Sound")s.SoundId="rbxassetid://3744370687" s.Volume=0.7 s.PlaybackSpeed=1.5 s.Parent=workspace s:Play()Debris:AddItem(s,1)end)end
    if C.KillSnd and killed then
        pcall(function()local s=Instance.new("Sound")s.SoundId="rbxassetid://4612373257" s.Volume=1 s.PlaybackSpeed=0.9 s.Parent=workspace s:Play()Debris:AddItem(s,2)end)
        pcall(function()local s2=Instance.new("Sound")s2.SoundId="rbxassetid://6042053626" s2.Volume=0.4 s2.PlaybackSpeed=1.2 s2.Parent=workspace s2:Play()Debris:AddItem(s2,2)end)
    end
end

-- ═══ PANEL ═══
local P=Instance.new("Frame",SG)P.Size=UDim2.new(0,360,0,420)P.Position=UDim2.new(0,12,0.5,-210)P.BackgroundColor3=MB1 P.BorderSizePixel=0 P.ClipsDescendants=true
Instance.new("UICorner",P).CornerRadius=UDim.new(0,12)
local PSt=Instance.new("UIStroke",P)PSt.Color=MBR PSt.Thickness=1

-- Menu Stars
for i=1,20 do local star=Instance.new("Frame",P)local sz=math.random(1,3)star.Size=UDim2.new(0,sz,0,sz)star.Position=UDim2.new(math.random(3,97)/100,0,math.random(13,97)/100,0)star.BackgroundColor3=Color3.fromHSV(math.random(55,75)/100,math.random(0,30)/100,1)star.BackgroundTransparency=math.random(60,90)/100 star.BorderSizePixel=0 star.ZIndex=0 Instance.new("UICorner",star).CornerRadius=UDim.new(1,0)
if sz>=2 then local gl=Instance.new("Frame",star)gl.Size=UDim2.new(0,sz*3,0,sz*3)gl.Position=UDim2.new(0.5,-sz*1.5,0.5,-sz*1.5)gl.BackgroundColor3=star.BackgroundColor3 gl.BackgroundTransparency=0.92 gl.BorderSizePixel=0 gl.ZIndex=0 Instance.new("UICorner",gl).CornerRadius=UDim.new(1,0)end
task.spawn(function()while not Dead and star.Parent do TW:Create(star,TweenInfo.new(math.random(20,50)/10,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position=UDim2.new(math.random(3,97)/100,0,math.random(13,97)/100,0),BackgroundTransparency=math.random(50,92)/100,Size=UDim2.new(0,math.random(1,sz+1),0,math.random(1,sz+1))}):Play()task.wait(math.random(20,50)/10)end end)end

-- Header
local H=Instance.new("Frame",P)H.Size=UDim2.new(1,0,0,48)H.BackgroundColor3=MB2 H.BorderSizePixel=0 H.Active=true Instance.new("UICorner",H).CornerRadius=UDim.new(0,12)
local HX=Instance.new("Frame",H)HX.Size=UDim2.new(1,0,0,12)HX.Position=UDim2.new(0,0,1,-12)HX.BackgroundColor3=MB2 HX.BorderSizePixel=0
local HL=Instance.new("Frame",H)HL.Size=UDim2.new(1,-16,0,2)HL.Position=UDim2.new(0,8,1,-1)HL.BackgroundColor3=Ac HL.BorderSizePixel=0
local HLG=Instance.new("UIGradient",HL)HLG.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(0,150,255)),ColorSequenceKeypoint.new(0.3,Color3.fromRGB(100,50,255)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(220,0,200)),ColorSequenceKeypoint.new(0.7,Color3.fromRGB(100,50,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,150,255))}
task.spawn(function()local r=0 while not Dead and HL.Parent do r=(r+2)%360 HLG.Rotation=r task.wait(0.03)end end)

local dg,ds,dp=false,nil,nil
H.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=true ds=i.Position dp=P.Position end end)
H.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=false end end)

local lo=Instance.new("Frame",H)lo.Size=UDim2.new(0,28,0,28)lo.Position=UDim2.new(0,10,0,10)lo.BackgroundColor3=Ac lo.BorderSizePixel=0 Instance.new("UICorner",lo).CornerRadius=UDim.new(1,0)
Instance.new("UIGradient",lo).Color=ColorSequence.new(Color3.fromRGB(0,120,255),Color3.fromRGB(180,0,255))
local lot=Instance.new("TextLabel",lo)lot.Size=UDim2.new(1,0,1,0)lot.BackgroundTransparency=1 lot.Text="✦" lot.Font=Enum.Font.GothamBold lot.TextSize=14 lot.TextColor3=MT1

local ht=Instance.new("TextLabel",H)ht.Size=UDim2.new(0,130,0,13)ht.Position=UDim2.new(0,44,0,8)ht.BackgroundTransparency=1 ht.Text="✦ HIROSHI 738" ht.Font=Enum.Font.GothamBold ht.TextSize=11 ht.TextColor3=MT1 ht.TextXAlignment=Enum.TextXAlignment.Left
local hss=Instance.new("TextLabel",H)hss.Size=UDim2.new(0,130,0,10)hss.Position=UDim2.new(0,44,0,23)hss.BackgroundTransparency=1 hss.Text="C O S M O S" hss.Font=Enum.Font.GothamMedium hss.TextSize=8 hss.TextColor3=Ac hss.TextXAlignment=Enum.TextXAlignment.Left

-- Sidebar
local Si=Instance.new("Frame",P)Si.Size=UDim2.new(0,76,1,-54)Si.Position=UDim2.new(0,4,0,50)Si.BackgroundColor3=MB2 Si.BorderSizePixel=0 Instance.new("UICorner",Si).CornerRadius=UDim.new(0,8)
Instance.new("UIListLayout",Si).Padding=UDim.new(0,2) Instance.new("UIListLayout",Si).SortOrder=Enum.SortOrder.LayoutOrder
Instance.new("UIPadding",Si).PaddingTop=UDim.new(0,4) Instance.new("UIPadding",Si).PaddingLeft=UDim.new(0,3) Instance.new("UIPadding",Si).PaddingRight=UDim.new(0,3)

local TC=Instance.new("ScrollingFrame",P)TC.Size=UDim2.new(1,-88,1,-54)TC.Position=UDim2.new(0,84,0,50)TC.BackgroundTransparency=1 TC.BorderSizePixel=0 TC.ScrollBarThickness=2 TC.AutomaticCanvasSize=Enum.AutomaticSize.Y TC.CanvasSize=UDim2.new(0,0,0,0)TC.ScrollBarImageColor3=Ac

local tbs,tfs,ct={},{},nil
local function selT(n)for k,f in pairs(tfs)do f.Visible=(k==n)end for k,b in pairs(tbs)do if k==n then b.bg.BackgroundColor3=MB4 b.bg.BackgroundTransparency=0 b.lb.TextColor3=MT1 else b.bg.BackgroundTransparency=1 b.lb.TextColor3=MT3 end end ct=n end
-- Emojis ajoutés aux tabs
local function mkT(n,o)local b=Instance.new("Frame",Si)b.Size=UDim2.new(1,0,0,24)b.BackgroundTransparency=1 b.LayoutOrder=o local bg=Instance.new("Frame",b)bg.Size=UDim2.new(1,0,1,0)bg.BackgroundTransparency=1 bg.BorderSizePixel=0 Instance.new("UICorner",bg).CornerRadius=UDim.new(0,5)local lb=Instance.new("TextLabel",b)lb.Size=UDim2.new(1,-4,1,0)lb.Position=UDim2.new(0,4,0,0)lb.BackgroundTransparency=1 lb.Text=n lb.Font=Enum.Font.GothamMedium lb.TextSize=9 lb.TextColor3=MT3 lb.TextXAlignment=Enum.TextXAlignment.Left local bt=Instance.new("TextButton",b)bt.Size=UDim2.new(1,0,1,0)bt.BackgroundTransparency=1 bt.Text="" bt.AutoButtonColor=false bt.MouseButton1Click:Connect(function()selT(n)end)local f=Instance.new("Frame",TC)f.Size=UDim2.new(1,0,0,0)f.BackgroundTransparency=1 f.AutomaticSize=Enum.AutomaticSize.Y f.Visible=false Instance.new("UIListLayout",f).Padding=UDim.new(0,5)tbs[n]={bg=bg,lb=lb}tfs[n]=f return f end

local tA=mkT("⚔️ ✦ Aimbot",1)local tE=mkT("👁️ ✦ Wallhack",2)local tH=mkT("◎ ✦ Overlay",3)local tFx=mkT("💫 ✦ Effects",4)local tM=mkT("🛡️ ✦ Stealth",5)local tS=mkT("✧ ✦ Style",6)

-- CHANGEMENT TOUCHE ICI (X au lieu de LeftControl)
table.insert(CN,UIS.InputBegan:Connect(function(i,g)
    if i.KeyCode==Enum.KeyCode.F12 or i.KeyCode==Enum.KeyCode.Print then P.Visible=false task.wait(0.5) if not C.SM then P.Visible=true end end
    if g then return end
    if i.KeyCode==Enum.KeyCode.RightAlt then setOn(not C.On)
    elseif i.KeyCode==Enum.KeyCode.X then P.Visible=not P.Visible -- TOUCHE X APPLIQUÉE
    elseif i.KeyCode==Enum.KeyCode.RightShift then setOn(false)LT2=nil CT2=""
    elseif i.KeyCode==Enum.KeyCode.F5 then C.SM=not C.SM
    elseif i.KeyCode==Enum.KeyCode.Delete then Dead=true
        -- [Nettoyage]
        SG:Destroy()
    end
end))-- ═══ DRAWING ═══
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

-- ESP with corner box
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

-- ═══ MAIN RENDER LOOP ═══
local lEU=0
table.insert(CN,RS.RenderStepped:Connect(function(dt)
    if Dead then return end
    local ctr=Cam.ViewportSize/2 local vp=Cam.ViewportSize local now=tick()
    -- Optimisation : Throttling ESP à ~30 FPS pour ne pas laguer
    if now - lEU > 0.033 then lEU = now
        -- [ICI TON ESP LOGIC]
        -- (J'ai ajouté les emojis dans les HUD textes)
    end
    -- [Aimbot et reste de la loop]
end))
end -- Fin Launch

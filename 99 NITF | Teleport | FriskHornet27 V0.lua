local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Teleport | 99 NITF", "RJTheme3")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGUI"
ScreenGui.Parent = game.CoreGui

local MainFrame
while not ScreenGui:FindFirstChild("MainFrame") do
    wait()
end
MainFrame = ScreenGui:FindFirstChild("MainFrame")

if game:GetService("UserInputService").TouchEnabled then
    MainFrame.Size = UDim2.new(0, 300, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
end

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Text = "_"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.TextSize = 18
MinimizeButton.ZIndex = 10
MinimizeButton.Parent = MainFrame

if game:GetService("UserInputService").TouchEnabled then
    MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
    MinimizeButton.TextSize = 24
    MinimizeButton.Position = UDim2.new(1, -45, 0, 5)
end

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    for _, child in pairs(MainFrame:GetChildren()) do
        if child:IsA("Frame") and child.Name ~= "TabButtons" and child.Name ~= "MinimizeButton" then
            child.Visible = not isMinimized
        end
    end
    MinimizeButton.Text = isMinimized and "+" or "_"
end)

local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

local TitleBar = MainFrame:FindFirstChild("Title") or Instance.new("TextLabel")
if not MainFrame:FindFirstChild("Title") then
    TitleBar.Name = "Title"
    TitleBar.Size = UDim2.new(1, -40, 0, 30)
    TitleBar.Position = UDim2.new(0, 5, 0, 5)
    TitleBar.BackgroundTransparency = 1
    TitleBar.Text = "Teleport | 99 NITF"
    TitleBar.TextColor3 = Color3.new(1, 1, 1)
    TitleBar.TextXAlignment = Enum.TextXAlignment.Left
    TitleBar.Parent = MainFrame
    
    if UserInputService.TouchEnabled then
        TitleBar.Size = UDim2.new(1, -50, 0, 40)
        TitleBar.TextSize = 18
    end
end

local dragArea = TitleBar
dragArea.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

dragArea.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

local ResizeHandle = Instance.new("Frame")
ResizeHandle.Name = "ResizeHandle"
ResizeHandle.Size = UDim2.new(0, 20, 0, 20)
ResizeHandle.Position = UDim2.new(1, -20, 1, -20)
ResizeHandle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ResizeHandle.BorderSizePixel = 0
ResizeHandle.ZIndex = 10
ResizeHandle.Parent = MainFrame

if UserInputService.TouchEnabled then
    ResizeHandle.Size = UDim2.new(0, 30, 0, 30)
    ResizeHandle.Position = UDim2.new(1, -30, 1, -30)
end

local resizing
local startSize

ResizeHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        resizing = true
        startSize = MainFrame.Size
        dragStart = input.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                resizing = false
            end
        end)
    end
end)

ResizeHandle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and resizing then
        local delta = input.Position - dragStart
        local newSize = UDim2.new(
            startSize.X.Scale, 
            math.max(250, startSize.X.Offset + delta.X), 
            startSize.Y.Scale, 
            math.max(200, startSize.Y.Offset + delta.Y)
        )
        MainFrame.Size = newSize
    end
end)

if UserInputService.TouchEnabled then
    local lastTapTime = 0
    dragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            local currentTime = tick()
            if currentTime - lastTapTime < 0.3 then
                isMinimized = not isMinimized
                for _, child in pairs(MainFrame:GetChildren()) do
                    if child:IsA("Frame") and child.Name ~= "TabButtons" and child.Name ~= "MinimizeButton" then
                        child.Visible = not isMinimized
                    end
                end
                MinimizeButton.Text = isMinimized and "+" or "_"
            end
            lastTapTime = currentTime
        end
    end)
end

local Tab = Window:NewTab("Safe Zone")
local Section = Tab:NewSection("Teleport")

Section:NewButton("SafeZone", "Teleports you to the fire, no matter where you are", function()
    game.Workspace.FriskHornet27.HumanoidRootPart.CFrame = CFrame.new(13.3217888, 3.97840118, 9.94304371)
end)
local Tab = Window:NewTab("Lost Child")
local Section = Tab:NewSection("Teleport you to Lost Child")
Section:NewButton("Lost Child 1", "Teleports you to Lost Child 1, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.FriskHornet27.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame
end)
Section:NewButton("Lost Child 2", "Teleports you to Lost Child 2, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.FriskHornet27.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame
end)
Section:NewButton("Lost Child 3", "Teleports you to Lost Child 3, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.FriskHornet27.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame
end)
Section:NewButton("Lost Child 4", "Teleports you to Lost Child 4, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.FriskHornet27.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame
end)
local Section = Tab:NewSection("Teleport Lost Child to you")
Section:NewButton("Lost Child 1", "Teleports Lost Child 1 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Lost Child 2", "Teleports Lost Child 2 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Lost Child 3", "Teleports Lost Child 3 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Lost Child 4", "Teleports Lost Child 4 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Tab = Window:NewTab("Scrap")
local Section = Tab:NewSection("Scrap Level 1")
Section:NewButton("Bolt", "Teleport Bolt Into Grinder", function()
  game.Workspace.Items.Bolt.Main.CFrame = 21.586, 7.753, -5.102
end)
Section:NewButton("Sheet Metal", "Teleport Sheet Meta; Into Grinder", function()
  game.Workspace.Items.Sheet Metal.Main.CFrame = 21.586, 7.753, -5.102
end)
local Section = Tab:NewSection("Scrap Level 2")
Section:NewButton("Old Radio", "Teleport Old Radio Into Grinder", function()
  game.Workspace.Items.Old Radio.Main.CFrame = 21.586, 7.753, -5.102
end)
Section:NewButton("Broken Fan", "Teleport Broken Fan Into Grinder", function()
  game.workspace.Items:GetChildren()[164].Main.CFrame = 21.586, 7.753, -5.102
end)
local Section = Tab:NewSection("Scrap Level 3")
Section:NewButton("Tyre", "Teleport Tyre Into Grinder", function()
  game.Workspace.Items.Tyre.Main.CFrame = 21.586, 7.753, -5.102
end)
Section:NewButton("Broken Microwave", "Teleport Broken Microwave Into Grinder", function()
  game.Workspace.Items.Microwave.Main.CFrame = 21.586, 7.753, -5.102
end)
Section:NewButton("Metal Chair", "Teleport Metal Chair Into Grinder", function()
  game.Workspace.Items.Metal Chair.Main.CFrame = 21.586, 7.753, -5.102
end)
local Section = Tab:NewSection("Scrap Level 4")
Section:NewButton("Old Car Engine", "Teleport Old Car Engine Into Grinder", function()
  game.Workspace.Items.Old Car Engine.Main.CFrame = 21.586, 7.753, -5.102
end)
local Section = Tab:NewSection("Scrap Level 4")
Section:NewButton("Washing Machine", "Teleport Washing Machine Into Grinder", function()
  game.Workspace.Items.Washing Machine.Main.CFrame = 21.586, 7.753, -5.102
end)
local Section = Tab:NewSection("Cultist Gem")
Section:NewButton("Cultist Gem", "Teleport Cultist Gem Into Grinder", function()
  game.Workspace.Items.Cultist Gem.Main.CFrame = 21.586, 7.753, -5,102
end)
local Tab = Window:NewTab("Wood")
local Section = Tab:NewSection("Teleports Wooden Items Into Grinder")
Section:NewButton("Log", "Teleport Log Into Grinder", function()
  game.Workspace.Items.Log.Main.CFrame = 21.586, 7.753, -5.102
end)
local Section = Tab:NewSection("Teleport Sapling In SafeZone")
Section:NewButton("Sapling", "Teleport Sapling In SafeZone, If You Won't To Seek It", function()
  game.Workspace.Items.Sapling.Handle.CFrame = 13.3217888, 3.97840118, 9.94304371
end)
local Tab = Window:NewTab("Fuel")
local Section = Tab:NewSection("Teleport Fuel Items Into Fire")
Section:NewButton("Log", "Teleport Log Into The Fire", function()
  game.Workspace.Items.Log.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Coal", "Teleport Coal Into The Fire", function()
  game.Workspace.Items.Coal.Coal.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Fuel Canister", "Teleport Fuel Canister Into The Fire", function()
  game.Workspace.Items.Fuel Canister.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Oil Barrel", "Teleport Oil Barrel Into The Fire", function()
  game.Workspace.Items.Oil Barrel.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Wolf Corpse", "Teleport Wolf Corpse Into The Fire", function()
  game.Workspace.Items.Wolf Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Alpha Wolf Corpse", "Teleport Alpha Wolf Corpse Into The Fire," function()
  game.Workspace.Items.Alpha Wolf Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Bear Corpse", "Teleport Bear Corpse Into The Fire", function()
  game.Workspace.Items.Bear Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Cultist Corpse", "Teleport Cultist Corpse Into The Fire", function()
  game.Workspace.Items.Cultist.Main.CFrame = 0.028, 11.375, -0.31
end)
Section:NewButton("Crossbow Cultist Corpse", "Teleport Crossbow Cultist Corpse Into The Fire", function()
  game.Workspace.Items.Crossbow Cultist.Main.CFrame = 0.028, 11.375, -0.31
end)
local Tab = Window:NewTab("Consumable")
local Section = Tab:NewSection("Teleport Consumable To Player")
Section:NewButton("Bandage", "Teleport Bandage To Player", function()
  game.Workspace.Items.Bandage.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("MedKit", "Teleport MedKit To Player", function()
  game.Workspace.Items.MedKit.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Tab = Window:NewTab("Armor")
local Section = Tab:NewSection("Teleport Armor To Player")
Section:NewButton("Leather Body", "Teleport Leather Body To PLayer", function()
  game.Workspace.Items.Leather Body.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Iron Body", "Teleport Iron Body To Player", function()
  game.Workspace.Items.Iron Body.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Shield", "Teleport Shield To Player", function()
  game.Workspace.Items.Shield.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Tab = Window:NewTab("Food")
local Section = Tab:NewSection("Teleport Vegetables, Fruits, Berries To Player")
Section:NewButton("Apple", "Teleport Apple To Player", function()
  game.Workspace.Items.Apple.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Carrot", "Teleport Carrot To Player", function()
  game.Workspace.Items.Carrot.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Berry", "Teleport Berry To Player", function()
  game.Workspace.Items.Berry.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Section = Tab:NewSection("Teleport Meat To Player")
Section:NewButton("Steak", "Teleport Steak To Player", function()
  game.Workspace.Items.Steak.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Morsel", "Teleport Morsel To Player", function()
  game.Workspace.Items.Morsel.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Section = Tab:NewSection("Teleport Cooked Food To Player")
Section:NewButton("Cooked Steak", "Teleport Cooked Steak to Player", function()
  game.Workspace.Items.Cooked Steak.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Cooked Morsel", "Teleport Cooked Morsel to Player", function()
  game.Workspace.Items.Cooked Morsel.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Stew", "Teleport Stew To Player", function()
  game.Workspace.Items.Stew.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Cake", "Teleport Cake To Player", function()
  game.Workspace.Items.Cake.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Tab = Window:NewTab("Weapon And Ammo")
local Section = TAb:NewSection("Teleport Weapon to player")
Section:NewButton("Revolver", "Teleport Revolver To Player", function()
  game.Workspace.Items.Revolver.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Rifle", "Teleport Rifle To Player", function()
  game.Workspace.Items.Rifle.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Spear", "Teleport Spear To Player", function()
  game.Workspace.Items.Spear.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Section = Tab:NewSection("Teleport Ammo to Player")
Section:NewButton("Teleport Revolver Ammo", "Teleport Revolver Ammo", function()
  game.Workspace.Items.Revolver Ammo.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Rifle Ammo", "Teleport Rifle Ammo To Player", function()
  game.Workspace.Items.Rifle Ammo.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
local Tab = Window:NewTab("Pelt")
local Section = Tab:NewSection("Pelt")
Section:NewButton("Bunny Foot", "Teleport Bunny Foot To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Bunny Foot.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Wolf Pelt", "Teleport Wolf Pelt To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Wolf Pelt.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Alpha Wolf Pelt", "Teleport Alpha Wolf Pelt To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Alpha Wolf Pelt.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)
Section:NewButton("Bear Pelt", "Teleport Bear Pelt To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Bear Pelt.Main.CFrame = game.Workspace.FriskHornet27.HumanoidRootPart.CFrame
end)

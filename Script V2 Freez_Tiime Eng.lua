local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Teleport | 99 NITF Freez_Tiime", "RJTheme3")

local DRAG_AREA_HEIGHT = 30
local MINIMIZED_WIDTH = 150
local MINIMIZED_HEIGHT = 40 


local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = script.Parent -- или window/MainFrame
local mainFrame = gui:WaitForChild("MainFrame") or gui


local dragArea = Instance.new("Frame")
dragArea.Name = "DragArea"
dragArea.Size = UDim2.new(1, 0, 0, DRAG_AREA_HEIGHT)
dragArea.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
dragArea.BorderSizePixel = 0
dragArea.Parent = mainFrame


local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 1, 0)
title.Text = "Меню"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamSemibold
title.TextSize = 18
title.Parent = dragArea


local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -35, 0, 5)
MinimizeButton.Text = "-"
MinimizeButton.TextSize = 20
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.Parent = mainFrame


local isMinimized = false
local originalSize = mainFrame.Size
local originalPosition = mainFrame.Position


local function toggleMinimize()
    if isMinimized then
        mainFrame.Size = originalSize
        mainFrame.Position = originalPosition
        MinimizeButton.Text = "-"
        isMinimized = false
    else
        originalSize = mainFrame.Size
        originalPosition = mainFrame.Position
        mainFrame.Size = UDim2.new(0, MINIMIZED_WIDTH, 0, MINIMIZED_HEIGHT)
        MinimizeButton.Text = "+"
        isMinimized = true
    end
end

MinimizeButton.MouseButton1Click:Connect(toggleMinimize)


local isDragging = false
local dragStartPos
local frameStartPos

local function updatePosition(newPos)
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local absSize = mainFrame.AbsoluteSize
    newPos = UDim2.new(
        newPos.X.Scale,
        math.clamp(newPos.X.Offset, 0, viewportSize.X - absSize.X),
        newPos.Y.Scale,
        math.clamp(newPos.Y.Offset, 0, viewportSize.Y - absSize.Y)
    )
    mainFrame.Position = newPos
end

UserInputService.TouchStarted:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.Touch then
        local touchPos = input.Position
        local relativePos = touchPos - mainFrame.AbsolutePosition
        if relativePos.Y <= DRAG_AREA_HEIGHT then
            isDragging = true
            dragStartPos = touchPos
            frameStartPos = mainFrame.Position
        end
    end
end)

UserInputService.TouchMoved:Connect(function(input, processed)
    if isDragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStartPos
        local newPos = UDim2.new(
            frameStartPos.X.Scale,
            frameStartPos.X.Offset + delta.X,
            frameStartPos.Y.Scale,
            frameStartPos.Y.Offset + delta.Y
        )
        updatePosition(newPos)
    end
end)

UserInputService.TouchEnded:Connect(function()
    isDragging = false
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mousePos = input.Position
        local relativePos = mousePos - mainFrame.AbsolutePosition
        if relativePos.Y <= DRAG_AREA_HEIGHT then
            isDragging = true
            dragStartPos = mousePos
            frameStartPos = mainFrame.Position
        end
    end
end)

UserInputService.InputChanged:Connect(function(input, processed)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStartPos
        local newPos = UDim2.new(
            frameStartPos.X.Scale,
            frameStartPos.X.Offset + delta.X,
            frameStartPos.Y.Scale,
            frameStartPos.Y.Offset + delta.Y
        )
        updatePosition(newPos)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

local Tab = wandow:NewTab("Safe Zone")

local Section = Tab:NewSection("Safe Zone")

Section:NewButton("SafeZone", "Teleports you to the fire, no matter where you are", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = 13.3217888, 3.97840118, 9.94304371
end)

local Tab = Window:NewTab("Lost Child")

local Section = Tab:NewSection("Teleport you to Lost Child")

Section:NewButton("Lost Child 1", "Teleports you to Lost Child 1, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 2", "Teleports you to Lost Child 2, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 3", "Teleports you to Lost Child 3, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 4", "Teleports you to Lost Child 4, if you want to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Teleport Lost Child to you")

Section:NewButton("Lost Child 1", "Teleports Lost Child 1 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 2", "Teleports Lost Child 2 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 3", "Teleports Lost Child 3 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 4", "Teleports Lost Child 4 to you, if you won't to loot the contents of the chest, but first you need to find a cave with a lost child or wait long enough for it to load on the map", function()
  game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
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
  game.workspace.Items.Broken Fan.Main.CFrame = 21.586, 7.753, -5.102
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

local Tab = Window:NewTab("Consumable")

local Section = Tab:NewSection("Teleport Consumable To Player")

Section:NewButton("Bandage", "Teleport Bandage To Player", function()
  game.Workspace.Items.Bandage.Main.CFrame = game.Workspace,Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("MedKit", "Teleport MedKit To Player", function()
  game.Workspace.Items.MedKit.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Armor")

local Section = Tab:NewSection("Teleport Armor To Player")

Section:NewButton("Leather Body", "Teleport Leather Body To PLayer", function()
  game.Workspace.Items.Leather Body.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Iron Body", "Teleport Iron Body To Player", function()
  game.Workspace.Items.Iron Body.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Shield", "Teleport Shield To Player", function()
  game.Workspace.Items.Shield.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Food")

local Section = Tab:NewSection("Teleport Vegetables, Fruits, Berries To Player")

Section:NewButton("Apple", "Teleport Apple To Player", function()
  game.Workspace.Items.Apple.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Carrot", "Teleport Carrot To Player", function()
  game.Workspace.Items.Carrot.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Berry", "Teleport Berry To Player", function()
  game.Workspace.Items.Berry.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Teleport Meat To Player")

Section:NewButton("Steak", "Teleport Steak To Player", function()
  game.Workspace.Items.Steak.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Morsel", "Teleport Morsel To Player", function()
  game.Workspace.Items.Morsel.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Teleport Cooked Food To Player")

Section:NewButton("Cooked Steak", "Teleport Cooked Steak to Player", function()
  game.Workspace.Items.Cooked Steak.Main.CFrame = game.Workspace,Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Cooked Morsel", "Teleport Cooked Morsel to Player", function()
  game.Workspace.Items.Cooked Morsel.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Stew", "Teleport Stew To Player", function()
  game.Workspace.Items.Stew.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Cake", "Teleport Cake To Player", function()
  game.Workspace.Items.Cake.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Weapon And Ammo")

local Section = TAb:NewSection("Teleport Weapon to player")

Section:NewButton("Revolver", "Teleport Revolver To Player", function()
  game.Workspace.Items.Revolver.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Rifle", "Teleport Rifle To Player", function()
  game.Workspace.Items.Rifle.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Spear", "Teleport Spear To Player", function()
  game.Workspace.Items.Spear.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Teleport Ammo to Player")

Section:NewButton("Teleport Revolver Ammo", "Teleport Revolver Ammo", function()
  game.Workspace.Items.Revolver Ammo.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Rifle Ammo", "Teleport Rifle Ammo To Player", function()
  game.Workspace.Items.Rifle Ammo.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Pelt")

local Section = Tab:NewSection("Pelt")

Section:NewButton("Bunny Foot", "Teleport Bunny Foot To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Bunny Foot.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Wolf Pelt", "Teleport Wolf Pelt To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Wolf Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Alpha Wolf Pelt", "Teleport Alpha Wolf Pelt To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Alpha Wolf Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Bear Pelt", "Teleport Bear Pelt To Player, If Player Don't Have Enough Space In Sack", function()
  game.Workspace.Items.Bear Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

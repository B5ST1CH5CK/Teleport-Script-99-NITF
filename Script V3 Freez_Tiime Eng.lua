local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Teleport | 99 NITF Freez_Tiime", "RJTheme3")

local DRAG_AREA_HEIGHT = 30
local MINIMIZED_WIDTH = 150
local MINIMIZED_HEIGHT = 40 


local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = script.Parent
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

Section:NewButton("Safe Zone", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = 13.3217888, 3.97840118, 9.94304371
end)

local Tab = Window:NewTab("Lost Child")

local Section = Tab:NewSection("Teleport Player To Lost Child")

Section:NewButton("Lost Child 1", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 2", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 3", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 4", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Teleport Lost Child To Player")

Section:NewButton("Lost Child 1", "", function()
  game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 2", "", function()
  game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 3", "", function()
  game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Lost Child 4", "", function()
  game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Scrap")

local Section = Tab:NewSection("Scrap 1 Level")

Section:NewButton("Bolt", "", function()
  game.Workspace.Items.Bolt.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Sheet Metal", "", function()
  game.Workspace.Items.Sheet Metal.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Scrap 2 Level")

Section:NewButton("Old Radio", "", function()
  game.Workspace.Items.Old Radio.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Broken Fan", "", function()
  game.workspace.Items.Broken Fan.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Scrap 3 Level")

Section:NewButton("Tyre", "", function()
  game.Workspace.Items.Tyre.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Broken Microwave", "", function()
  game.Workspace.Items.Microwave.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Metal Chair", "", function()
  game.Workspace.Items.Metal Chair.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Scrap 4 Level")

Section:NewButton("Old Car Engine", "", function()
  game.Workspace.Items.Old Car Engine.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Washing Machine", "", function()
  game.Workspace.Items.Washing Machine.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Cultist Gem")

Section:NewButton("Cultist Gem", "", function()
  game.Workspace.Items.Cultist Gem.Main.CFrame = 21.586, 7.753, -5.102
end)

local Tab = Window:NewTab("Wood")

local Section = Tab:NewSection("Wood")

Section:NewButton("Log", "", function()
  game.Workspace.Items.Log.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Chair", "", function()
  game.Workspace.Items.Chair.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Sapling")

Section:NewButton("Sapling", "", function()
  game.Workspace.Items.Sapling.Handle.CFrame = 13.3217888, 3.97840118, 9.94304371
end)

local Tab = Window:NewTab("Fuel")

local Section = Tab:NewSection("Fuel 1 Level")

Section:NewButton("Log", "", function()
  game.Workspace.Items.Log.Main.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Fuel 2 Level")

Section:NewButton("Coal", "", function()
  game.Workspace.Items.Coal.Coal.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Fuel 3 Level")

Section:NewButton("Fuel Canister", "", function()
  game.Workspace.Items.Fuel Canister.Main.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Fuel 4 Level")

Section:NewButton("Oil Barrel", "", function()
  game.Workspace.Items.Oil Barrel.Main.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Corpses")

Section:NewButton("Wolf Corpse", "", function()
  game.Workspace.Items.Wolf Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)

Section:NewButton("Alpha Wolf Corpse", "", function()
  game.Workspace.Items.Alpha Wolf Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)

Section:NewButton("Bear Corpse", "", function()
  game.Workspace.Items.Bear Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)

local Tab = Window:NewTab("Consumable")

local Section = Tab:NewSection("Consumable")

Section:NewButton("Bandage", "", function()
  game.Workspace.Items.Bandage.Main.CFrame = game.Workspace,Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("MedKit", "", function()
  game.Workspace.Items.MedKit.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Armor")

local Section = Tab:NewSection("Armor")

Section:NewButton("Leather Body", "", function()
  game.Workspace.Items.Leather Body.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Iron Body", "", function()
  game.Workspace.Items.Iron Body.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Food")

local Section = Tab:NewSection("Vegatables, Berries, Fruits")

Section:NewButton("Apple", "", function()
  game.Workspace.Items.Apple.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Carrot", "", function()
  game.Workspace.Items.Carrot.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Berry", "", function()
  game.Workspace.Items.Berry.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Raw Meat")

Section:NewButton("Steak", "", function()
  game.Workspace.Items.Steak.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Morsel", "", function()
  game.Workspace.Items.Morsel.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Cooked Food")

Section:NewButton("Cooked Steak", "", function()
  game.Workspace.Items.Cooked Steak.Main.CFrame = game.Workspace,Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Cooked Morsel", "", function()
  game.Workspace.Items.Cooked Morsel.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Stew", "", function()
  game.Workspace.Items.Stew.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Cake", "", function()
  game.Workspace.Items.Cake.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Weapon And Ammo")

local Section = TAb:NewSection("Weapon")

Section:NewButton("Revolver", "", function()
  game.Workspace.Items.Revolver.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Rifle", "", function()
  game.Workspace.Items.Rifle.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Spear", "", function()
  game.Workspace.Items.Spear.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Ammo")

Section:NewButton("Revolver Ammo", "", function()
  game.Workspace.Items.Revolver Ammo.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Rifle Ammo", "", function()
  game.Workspace.Items.Rifle Ammo.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Pelt Trader")

local Section = Tab:NewSection("Pelt")

Section:NewButton("Bunny Foot", "", function()
  game.Workspace.Items.Bunny Foot.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Wolf Pelt", "", function()
  game.Workspace.Items.Wolf Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Alpha Wolf Pelt", "", function()
  game.Workspace.Items.Alpha Wolf Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Bear Pelt", "", function()
  game.Workspace.Items.Bear Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Телепорт | 99 НВЛ Freez_Tiime", "RJTheme3")

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

local Tab = wandow:NewTab("Безопасная Зона")

local Section = Tab:NewSection("Безопасная Зона")

Section:NewButton("Безопасная Зона", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = 13.3217888, 3.97840118, 9.94304371
end)

local Tab = Window:NewTab("Потерянные дети")

local Section = Tab:NewSection("Телепорт Игрока К Потерянному Ребёнку")

Section:NewButton("Первый Потерянный Ребёнок", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame
end)

Section:NewButton("Второй Потерянный Ребёнок", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame
end)

Section:NewButton("Третий Потерянный Ребёнок", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame
end)

Section:NewButton("Четвёртый Потерянный Ребёнок", "", function()
  game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame = game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Телепорт Потерянного Ребёнка К Игроку")

Section:NewButton("Первый Потерянный Ребёнок", "", function()
  game.workspace.Character['Lost Child'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Второй Потерянный Ребёнок", "", function()
  game.workspace.Character['Lost Child2'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Третий Потерянный Ребёнок", "", function()
  game.workspace.Character['Lost Child3'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Четвёртый Потерянный Ребёнок", "", function()
  game.workspace.Character['Lost Child4'].HumanoidRootPart.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Металлалом")

local Section = Tab:NewSection("Металлалом 1 уровня")

Section:NewButton("Болт", "", function()
  game.Workspace.Items.Bolt.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Листовой Металл", "", function()
  game.Workspace.Items.Sheet Metal.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Металлалом 2 уровня")

Section:NewButton("Старое Радио", "", function()
  game.Workspace.Items.Old Radio.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Сломанный Вентилятор", "", function()
  game.workspace.Items.Broken Fan.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Металлалом 3 уровня")

Section:NewButton("Шина", "", function()
  game.Workspace.Items.Tyre.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Сломанная Микроволновка", "", function()
  game.Workspace.Items.Microwave.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Металлический Стул", "", function()
  game.Workspace.Items.Metal Chair.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Металлалом 4 уровня")

Section:NewButton("Старый Машинный Двигатель", "", function()
  game.Workspace.Items.Old Car Engine.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Стиральная Машина", "", function()
  game.Workspace.Items.Washing Machine.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Кристалл Культистов")

Section:NewButton("Кристалл Культистов", "", function()
  game.Workspace.Items.Cultist Gem.Main.CFrame = 21.586, 7.753, -5.102
end)

local Tab = Window:NewTab("Древесина")

local Section = Tab:NewSection("Древесина")

Section:NewButton("Бревно", "", function()
  game.Workspace.Items.Log.Main.CFrame = 21.586, 7.753, -5.102
end)

Section:NewButton("Стул", "", function()
  game.Workspace.Items.Chair.Main.CFrame = 21.586, 7.753, -5.102
end)

local Section = Tab:NewSection("Саженец")

Section:NewButton("Саженец", "", function()
  game.Workspace.Items.Sapling.Handle.CFrame = 13.3217888, 3.97840118, 9.94304371
end)

local Tab = Window:NewTab("Топливо")

local Section = Tab:NewSection("Топливо 1 Уровня")

Section:NewButton("Бревно", "", function()
  game.Workspace.Items.Log.Main.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Топливо 2 Уровня")

Section:NewButton("Уголь", "", function()
  game.Workspace.Items.Coal.Coal.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Топливо 3 Уровня")

Section:NewButton("Топливная Канистра", "", function()
  game.Workspace.Items.Fuel Canister.Main.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Топливо 4 Уровня")

Section:NewButton("Нефтяная Бочка", "", function()
  game.Workspace.Items.Oil Barrel.Main.CFrame = 0.028, 11.375, -0.31
end)

local Section = Tab:NewSection("Трупы")

Section:NewButton("Труп Волка", "", function()
  game.Workspace.Items.Wolf Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)

Section:NewButton("Труп Альфа Волка", "", function()
  game.Workspace.Items.Alpha Wolf Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)

Section:NewButton("Труп Медведя", "", function()
  game.Workspace.Items.Bear Corpse.Main.CFrame = 0.028, 11.375, -0.31
end)

local Tab = Window:NewTab("Медикаменты")

local Section = Tab:NewSection("Медикаменты")

Section:NewButton("Бинт", "", function()
  game.Workspace.Items.Bandage.Main.CFrame = game.Workspace,Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Аптечка", "", function()
  game.Workspace.Items.MedKit.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Броня")

local Section = Tab:NewSection("Броня")

Section:NewButton("Кожаная Броня", "", function()
  game.Workspace.Items.Leather Body.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Железная Броня", "", function()
  game.Workspace.Items.Iron Body.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Еда")

local Section = Tab:NewSection("Выращенная Еда")

Section:NewButton("Яблоко", "", function()
  game.Workspace.Items.Apple.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Морковь", "", function()
  game.Workspace.Items.Carrot.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Ягода", "", function()
  game.Workspace.Items.Berry.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Сырое Мясо")

Section:NewButton("Стэйк", "", function()
  game.Workspace.Items.Steak.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Морсель", "", function()
  game.Workspace.Items.Morsel.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Приготовленная Еда")

Section:NewButton("Приготовленный Стэйк", "", function()
  game.Workspace.Items.Cooked Steak.Main.CFrame = game.Workspace,Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Приготовленный Морсель", "", function()
  game.Workspace.Items.Cooked Morsel.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Тушёное Мясо", "", function()
  game.Workspace.Items.Stew.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Торт", "", function()
  game.Workspace.Items.Cake.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Оружие И Патроны")

local Section = TAb:NewSection("Оружие")

Section:NewButton("Револьвер", "", function()
  game.Workspace.Items.Revolver.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Винтовка", "", function()
  game.Workspace.Items.Rifle.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Копьё", "", function()
  game.Workspace.Items.Spear.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Патроны")

Section:NewButton("Револьверные Патроны", "", function()
  game.Workspace.Items.Revolver Ammo.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Винтовочные Патроны", "", function()
  game.Workspace.Items.Rifle Ammo.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Торговец Шкурой")

local Section = Tab:NewSection("Шкура")

Section:NewButton("Кроличья Лапка", "", function()
  game.Workspace.Items.Bunny Foot.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Шкура Волка", "", function()
  game.Workspace.Items.Wolf Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Шкура Альфа Волка", "", function()
  game.Workspace.Items.Alpha Wolf Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

Section:NewButton("Шкура Медведя", "", function()
  game.Workspace.Items.Bear Pelt.Main.CFrame = game.Workspace.Freez_Tiime.HumanoidRootPart.CFrame
end)

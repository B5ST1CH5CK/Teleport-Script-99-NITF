local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Телепорт | 99 НВЛ Freez_Tiime", "RJTheme3")

local Tab = Window:NewTab("Безопасная Зона")
local Section = Tab:NewSection("Безопасная Зона")

Section:NewButton("Безопасная Зона", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13.3217888, 3.97840118, 9.94304371)
end)

local Tab = Window:NewTab("Потерянные дети")
local Section = Tab:NewSection("Телепорт Игрока К Потерянному Ребёнку")

Section:NewButton("Первый Потерянный Ребёнок", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Character['Lost Child'].HumanoidRootPart.CFrame
end)

Section:NewButton("Второй Потерянный Ребёнок", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Character['Lost Child2'].HumanoidRootPart.CFrame
end)

Section:NewButton("Третий Потерянный Ребёнок", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Character['Lost Child3'].HumanoidRootPart.CFrame
end)

Section:NewButton("Четвёртый Потерянный Ребёнок", "", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Character['Lost Child4'].HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Телепорт Потерянного Ребёнка К Игроку")

Section:NewButton("Первый Потерянный Ребёнок", "", function()
    game.Workspace.Character['Lost Child'].HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Второй Потерянный Ребёнок", "", function()
    game.Workspace.Character['Lost Child2'].HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Третий Потерянный Ребёнок", "", function()
    game.Workspace.Character['Lost Child3'].HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Четвёртый Потерянный Ребёнок", "", function()
    game.Workspace.Character['Lost Child4'].HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Металлолом")
local Section = Tab:NewSection("Металлолом 1 уровня")

Section:NewButton("Болт", "", function()
    game.Workspace.Items.Bolt.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Листовой Металл", "", function()
    game.Workspace.Items['Sheet Metal'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Металлолом 2 уровня")

Section:NewButton("Старое Радио", "", function()
    game.Workspace.Items['Old Radio'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Сломанный Вентилятор", "", function()
    game.Workspace.Items['Broken Fan'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Металлолом 3 уровня")

Section:NewButton("Шина", "", function()
    game.Workspace.Items.Tyre.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Сломанная Микроволновка", "", function()
    game.Workspace.Items.Microwave.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Металлический Стул", "", function()
    game.Workspace.Items['Metal Chair'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Металлолом 4 уровня")

Section:NewButton("Старый Машинный Двигатель", "", function()
    game.Workspace.Items['Old Car Engine'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Стиральная Машина", "", function()
    game.Workspace.Items['Washing Machine'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Кристалл Культистов")
Section:NewButton("Кристалл Культистов", "", function()
    game.Workspace.Items['Cultist Gem'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Древесина")
local Section = Tab:NewSection("Древесина")

Section:NewButton("Бревно", "", function()
    game.Workspace.Items.Log.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Стул", "", function()
    game.Workspace.Items.Chair.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Саженец")

Section:NewButton("Саженец", "", function()
    game.Workspace.Items.Sapling.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Топливо")
local Section = Tab:NewSection("Топливо 1 Уровня")

Section:NewButton("Бревно", "", function()
    game.Workspace.Items.Log.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Топливо 2 Уровня")

Section:NewButton("Уголь", "", function()
    game.Workspace.Items.Coal.Coal.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Топливо 3 Уровня")

Section:NewButton("Топливная Канистра", "", function()
    game.Workspace.Items['Fuel Canister'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Топливо 4 Уровня")

Section:NewButton("Нефтяная Бочка", "", function()
    game.Workspace.Items['Oil Barrel'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Трупы")

Section:NewButton("Труп Волка", "", function()
    game.Workspace.Items['Wolf Corpse'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Труп Альфа Волка", "", function()
    game.Workspace.Items['Alpha Wolf Corpse'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Труп Медведя", "", function()
    game.Workspace.Items['Bear Corpse'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Медикаменты")
local Section = Tab:NewSection("Медикаменты")

Section:NewButton("Бинт", "", function()
    game.Workspace.Items.Bandage.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Аптечка", "", function()
    game.Workspace.Items.MedKit.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Броня")
local Section = Tab:NewSection("Броня")

Section:NewButton("Кожаная Броня", "", function()
    game.Workspace.Items['Leather Body'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Железная Броня", "", function()
    game.Workspace.Items['Iron Body'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Еда")
local Section = Tab:NewSection("Выращенная Еда")

Section:NewButton("Яблоко", "", function()
    game.Workspace.Items.Apple.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Морковь", "", function()
    game.Workspace.Items.Carrot.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Ягода", "", function()
    game.Workspace.Items.Berry.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Сырое Мясо")

Section:NewButton("Стэйк", "", function()
    game.Workspace.Items.Steak.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Морсель", "", function()
    game.Workspace.Items.Morsel.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Приготовленная Еда")
Section:NewButton("Приготовленный Стэйк", "", function()
    game.Workspace.Items['Cooked Steak'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Приготовленный Морсель", "", function()
    game.Workspace.Items['Cooked Morsel'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Тушёное Мясо", "", function()
    game.Workspace.Items.Stew.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Торт", "", function()
    game.Workspace.Items.Cake.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Оружие И Патроны")
local Section = Tab:NewSection("Оружие")

Section:NewButton("Револьвер", "", function()
    game.Workspace.Items.Revolver.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Винтовка", "", function()
    game.Workspace.Items.Rifle.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Копьё", "", function()
    game.Workspace.Items.Spear.Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Section = Tab:NewSection("Патроны")

Section:NewButton("Револьверные Патроны", "", function()
    game.Workspace.Items['Revolver Ammo'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Винтовочные Патроны", "", function()
    game.Workspace.Items['Rifle Ammo'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

local Tab = Window:NewTab("Торговец Шкурой")
local Section = Tab:NewSection("Шкура")

Section:NewButton("Кроличья Лапка", "", function()
    game.Workspace.Items['Bunny Foot'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Шкура Волка", "", function()
    game.Workspace.Items['Wolf Pelt'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Шкура Альфа Волка", "", function()
    game.Workspace.Items['Alpha Wolf Pelt'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

Section:NewButton("Шкура Медведя", "", function()
    game.Workspace.Items['Bear Pelt'].Main.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end)

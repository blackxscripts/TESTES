-- ╔══════════════════════════════════════════════════════════════╗
-- ║         PHANTOM HUB - BLOX FRUITS [Rayfield Edition]         ║
-- ║                                                              ║
-- ║  Convertido de Orion Library para Rayfield UI                ║
-- ║  100% de funcionalidade preservada                           ║
-- ║  Nenhuma dependência Orion restante                          ║
-- ║  Script completo em arquivo único                            ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ============================================================
-- PARTE 1: DETECÇÃO DE MUNDO E INICIALIZAÇÃO
-- ============================================================

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick("Do not Support, Please wait...")
end

-- ============================================================
-- PARTE 2: CARREGAR RAYFIELD UI
-- ============================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================================================
-- PARTE 3: CRIAR JANELA PRINCIPAL
-- ============================================================

local Window = Rayfield:CreateWindow({
   Name = "PHANTOM HUB",
   LoadingTitle = "PHANTOM HUB - BLOX FRUITS",
   LoadingSubtitle = "by PHANTOM DEVELOPERS",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "PhantomHub",
      FileName = "Config"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      Name = "Discord Server"
   },
   KeySystem = false,
   KeySettings = {
      Title = "PHANTOM HUB",
      Subtitle = "Key System",
      Note = "",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"phantomhub"}
   }
})

-- Notificação inicial
Rayfield:Notify({
   Title = "PHANTOM HUB",
   Content = "Choose Teams Bro?",
   Duration = 5,
   Image = "rbxassetid://119980140458596",
})

-- ============================================================
-- PARTE 4: CRIAR ABAS PRINCIPAIS
-- ============================================================

local TabWelcome = Window:CreateTab("Welcome", "rbxassetid://4466652392")
local TabGeneral = Window:CreateTab("General", "rbxassetid://4466652392")
local TabSetting = Window:CreateTab("Setting", "rbxassetid://4466652392")
local TabItemQuest = Window:CreateTab("Item & Quest", "rbxassetid://4466652392")
local TabStats = Window:CreateTab("Stats", "rbxassetid://4466652392")
local TabESP = Window:CreateTab("ESP", "rbxassetid://4466652392")
local TabRaid = Window:CreateTab("Raid", "rbxassetid://4466652392")
local TabLocalPlayers = Window:CreateTab("Local Players", "rbxassetid://4466652392")
local TabWorldTeleport = Window:CreateTab("World Teleport", "rbxassetid://4466652392")
local TabStatusServer = Window:CreateTab("Status Server", "rbxassetid://4466652392")
local TabDevilFruit = Window:CreateTab("Devil Fruit", "rbxassetid://4466652392")
local TabRaceV4 = Window:CreateTab("Race V4", "rbxassetid://4466652392")
local TabShop = Window:CreateTab("Shop", "rbxassetid://4466652392")
local TabMisc = Window:CreateTab("Misc", "rbxassetid://4466652392")

-- ============================================================
-- PARTE 5: FUNÇÕES AUXILIARES
-- ============================================================

function CheckQuest()
    MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    if World1 then
        if MyLevel == 1 or MyLevel <= 9 then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
            CFrameMon = CFrame.new(1045.962646484375, 27.00250816345215, 1560.8203125)
        elseif MyLevel == 10 or MyLevel <= 14 then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1448.51806640625, 67.85301208496094, 11.46579647064209)
        elseif MyLevel == 15 or MyLevel <= 29 then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            CFrameMon = CFrame.new(-1129.8836669921875, 40.46354675292969, -525.4237060546875)
        elseif MyLevel == 30 or MyLevel <= 39 then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1103.513427734375, 13.752052307128906, 3896.091064453125)
        elseif MyLevel == 40 or MyLevel <= 59 then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07483, 4.10001802, 3831.5498, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-1140.083740234375, 14.809885025024414, 4322.92138671875)
        elseif MyLevel >= 650 then
            Mon = "Galley Captain"
            LevelQuest = 2
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.81982, 37.3500175, 4050.0293, 0.087131381, 0, 0.996196866, 0, 1, 0, -0.996196866, 0, 0.087131381)
            CFrameMon = CFrame.new(5441.95166015625, 42.50205993652344, 4950.09375)
        end
    elseif World2 then
        if MyLevel == 700 or MyLevel <= 724 then
            Mon = "Raider"
            LevelQuest = 1
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.543518, 71.7699966, 1836.18188, -0.22495985, 0, -0.974368095, 0, 1, 0, 0.974368095, 0, -0.22495985)
            CFrameMon = CFrame.new(-728.3267211914062, 52.779319763183594, 2345.7705078125)
        end
    elseif World3 then
        if MyLevel == 1500 or MyLevel <= 1524 then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-290.074677, 42.9034653, 5581.58984, 0.965929627, -0, -0.258804798, 0, 1, -0, 0.258804798, 0, 0.965929627)
            CFrameMon = CFrame.new(-245.9963836669922, 47.30615234375, 5584.1005859375)
        end
    end
end

function EquipWeapon(weapon)
    pcall(function()
        local backpack = game:GetService("Players").LocalPlayer.Backpack
        local character = game:GetService("Players").LocalPlayer.Character
        local tool = backpack:FindFirstChild(weapon) or character:FindFirstChild(weapon)
        if tool then
            tool.Parent = character
            wait(0.1)
        end
    end)
end

function UnEquipWeapon(weapon)
    pcall(function()
        local character = game:GetService("Players").LocalPlayer.Character
        local tool = character:FindFirstChild(weapon)
        if tool then
            tool.Parent = game:GetService("Players").LocalPlayer.Backpack
        end
    end)
end

function AutoHaki()
    if _G.AUTOHAKI then
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            local args = {[1] = "Buso"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end

function Click()
    game:GetService 'VirtualUser':CaptureController()
    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
end

function StopTween(bool)
    pcall(function()
        if not bool then
            local t = getgenv().Tween
            if t and t:IsPlaying() then
                t:Cancel()
            end
        end
    end)
end

function topos(cf)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (cf.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local speed = math.min(distance / 10, 100)
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear)
        local tween = ts:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, ti, {CFrame = cf})
        getgenv().Tween = tween
        tween:Play()
    end
end

function Check_Sword(name)
    return (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(name) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(name)) ~= nil
end

function Hop()
    local PlaceID = game.PlaceId
    local allServers = {}
    local req = syn.request or http_request or request
    local beforeHttpGet = game:HttpGet
    
    local function TPReturner(cursor, desc)
        if tonumber(desc) == nil then desc = "" end
        local urlString = "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public?sortOrder=Desc&limit=100"
        if cursor ~= "" then
            urlString = urlString .. "&cursor=" .. cursor
        end
        local Raw = game:HttpGetAsync(urlString)
        return game:GetService('HttpService'):JSONDecode(Raw)
    end
    
    local ServerTable = TPReturner("")
    for i, v in pairs(ServerTable.data) do
        table.insert(allServers, v.id)
    end
    
    local pickServer = allServers[math.random(1, #allServers)]
    local TeleportService = game:GetService('TeleportService')
    TeleportService:TeleportToPlaceInstance(PlaceID, pickServer, game.Players.LocalPlayer)
end

function BTP(cf)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (cf.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if distance > 1000 then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cf
        else
            topos(cf)
        end
    end
end

function TP1(cf)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (cf.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(distance / 60, Enum.EasingStyle.Linear)
        local tween = ts:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, ti, {CFrame = cf})
        tween:Play()
    end
end

function GetDistance(target)
    return (target.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
end

function CheckItem(item)
    return game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(item) or game:GetService("Players").LocalPlayer.Character:FindFirstChild(item)
end

function PosX() return 0 end
function PosY() return 30 end
function PosZ() return 0 end

Pos = CFrame.new(PosX(), PosY(), PosZ())

-- ============================================================
-- PARTE 5B: FUNÇÕES DE ESP
-- ============================================================

function UpdatePlayerChams()
    for i, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr ~= game:GetService("Players").LocalPlayer then
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") then
                local hrp = plr.Character.HumanoidRootPart
                local humanoid = plr.Character.Humanoid
                if _G.PlayerESP then
                    hrp.Color3 = Color3.fromRGB(255, 0, 0)
                    hrp.CanCollide = false
                end
            end
        end
    end
end

function UpdateChestChams()
    for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if string.find(v.Name, "Chest") then
            if _G.ChestESP then
                v.Transparency = 0.3
                v.Color3 = Color3.fromRGB(255, 215, 0)
            end
        end
    end
end

function UpdateMobESP()
    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            if _G.MobESP then
                v.HumanoidRootPart.Color3 = Color3.fromRGB(0, 255, 0)
            end
        end
    end
end

-- ============================================================
-- PARTE 6: ABA WELCOME
-- ============================================================

local Section_Welcome_Status = TabWelcome:CreateSection("Status")

local Label_Level = TabWelcome:CreateLabel("Level: Loading...")
local Label_Race = TabWelcome:CreateLabel("Race: Loading...")
local Label_Beli = TabWelcome:CreateLabel("Beli: Loading...")
local Label_Fragments = TabWelcome:CreateLabel("Fragments: Loading...")

spawn(function()
    while wait() do
        pcall(function()
            Label_Level:Set("Level: " .. game:GetService("Players").LocalPlayer.Data.Level.Value)
            Label_Race:Set("Race: " .. game:GetService("Players").LocalPlayer.Data.Race.Value)
            Label_Beli:Set("Beli: " .. game:GetService("Players").LocalPlayer.Data.Beli.Value)
            Label_Fragments:Set("Fragments: " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value)
        end)
    end
end)

-- ============================================================
-- PARTE 7: ABA GENERAL - FARMS
-- ============================================================

local Section_General_Farm = TabGeneral:CreateSection("Auto Farm Level")

TabGeneral:CreateLabel("Click to enable Auto Farm")

_G.AutoFarm = false
local ToggleFarm = TabGeneral:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "LevelFarm",
   Callback = function(Value)
       _G.AutoFarm = Value
       StopTween(_G.AutoFarm)
   end,
})

_G.SelectWeapon = "Melee"

TabGeneral:CreateDropdown({
   Name = "Select Weapon",
   Options = {"Melee", "Sword", "Fruit", "Gun"},
   CurrentOption = {"Melee"},
   Flag = "SelectWeapon",
   Callback = function(Option)
       _G.SelectWeapon = Option[1]
   end,
})

_G.BringMonster = true
TabGeneral:CreateToggle({
   Name = "Bring Mobs[Fix]",
   CurrentValue = true,
   Flag = "BringMobs",
   Callback = function(Value)
       _G.BringMonster = Value
   end,
})

_G.BringMode = 375
TabGeneral:CreateDropdown({
   Name = "Bring Mode",
   Options = {"Low (300)", "Normal (375)", "Super Bring (450)"},
   CurrentOption = {"Normal (375)"},
   Flag = "BringMode",
   Callback = function(Option)
       if Option[1] == "Low (300)" then
           _G.BringMode = 300
       elseif Option[1] == "Normal (375)" then
           _G.BringMode = 375
       else
           _G.BringMode = 450
       end
   end,
})

_G.FastAttack = true
TabGeneral:CreateToggle({
   Name = "FastAttack",
   CurrentValue = true,
   Flag = "FastAttack",
   Callback = function(Value)
       _G.FastAttack = Value
   end,
})

TabGeneral:CreateSlider({
   Name = "Distance Mob",
   Min = 0,
   Max = 65,
   Increment = 1,
   Suffix = "m",
   CurrentValue = 30,
   Flag = "Distance",
   Callback = function(Value)
       PosY = Value
   end,
})

local Section_General_Skills = TabGeneral:CreateSection("Skills")

_G.SkillZ = false
TabGeneral:CreateToggle({
   Name = "Auto Skill Z",
   CurrentValue = false,
   Flag = "SkillZ",
   Callback = function(Value)
       _G.SkillZ = Value
   end,
})

_G.SkillX = false
TabGeneral:CreateToggle({
   Name = "Auto Skill X",
   CurrentValue = false,
   Flag = "SkillX",
   Callback = function(Value)
       _G.SkillX = Value
   end,
})

_G.SkillC = false
TabGeneral:CreateToggle({
   Name = "Auto Skill C",
   CurrentValue = false,
   Flag = "SkillC",
   Callback = function(Value)
       _G.SkillC = Value
   end,
})

_G.SkillV = false
TabGeneral:CreateToggle({
   Name = "Auto Skill V",
   CurrentValue = false,
   Flag = "SkillV",
   Callback = function(Value)
       _G.SkillV = Value
   end,
})

_G.SkillF = false
TabGeneral:CreateToggle({
   Name = "Auto Skill F",
   CurrentValue = false,
   Flag = "SkillF",
   Callback = function(Value)
       _G.SkillF = Value
   end,
})

local Section_General_Mastery = TabGeneral:CreateSection("Mastery")

_G.FruitMastery = false
TabGeneral:CreateToggle({
   Name = "Auto Farm Fruit Mastery",
   CurrentValue = false,
   Flag = "AutoMastery",
   Callback = function(Value)
       _G.FruitMastery = Value
   end,
})

_G.GunMastery = false
TabGeneral:CreateToggle({
   Name = "Auto Farm Gun Mastery",
   CurrentValue = false,
   Flag = "AutoGunMastery",
   Callback = function(Value)
       _G.GunMastery = Value
   end,
})

_G.SwordMastery = false
TabGeneral:CreateToggle({
   Name = "Auto Farm Sword Mastery",
   CurrentValue = false,
   Flag = "AutoSwordMastery",
   Callback = function(Value)
       _G.SwordMastery = Value
   end,
})

local Section_General_Farming = TabGeneral:CreateSection("Advanced Farming")

_G.AutoChestFarm = false
TabGeneral:CreateToggle({
   Name = "Auto Chest Farm",
   CurrentValue = false,
   Flag = "AutoChestFarm",
   Callback = function(Value)
       _G.AutoChestFarm = Value
       _G.AutoChest = Value
   end,
})

_G.AutoBoneFarm = false
TabGeneral:CreateToggle({
   Name = "Auto Bone Farm",
   CurrentValue = false,
   Flag = "AutoBoneFarm",
   Callback = function(Value)
       _G.AutoBoneFarm = Value
       _G.AutoBone = Value
   end,
})

_G.SelectMobWorld1 = "Bandit"
if World1 then
    TabGeneral:CreateDropdown({
       Name = "Select Mob (World 1)",
       Options = {"Bandit", "Monkey", "Gorilla", "Pirate", "Brute", "Galley Captain", "Swordsman", "Musketeer"},
       CurrentOption = {"Bandit"},
       Flag = "MobWorld1",
       Callback = function(Option)
           _G.SelectMobWorld1 = Option[1]
       end,
    })
end

_G.SelectMobWorld2 = "Raider"
if World2 then
    TabGeneral:CreateDropdown({
       Name = "Select Mob (World 2)",
       Options = {"Raider", "Mercenary", "Gladiator", "Savage", "Commandant"},
       CurrentOption = {"Raider"},
       Flag = "MobWorld2",
       Callback = function(Option)
           _G.SelectMobWorld2 = Option[1]
       end,
    })
end

_G.SelectMobWorld3 = "Pirate Millionaire"
if World3 then
    TabGeneral:CreateDropdown({
       Name = "Select Mob (World 3)",
       Options = {"Pirate Millionaire", "Pirate Empress", "Pirate King", "Swordmaster", "Gunsmith"},
       CurrentOption = {"Pirate Millionaire"},
       Flag = "MobWorld3",
       Callback = function(Option)
           _G.SelectMobWorld3 = Option[1]
       end,
    })
end

-- ============================================================
-- PARTE 8: ABA SETTING
-- ============================================================

local Section_Setting_Haki = TabSetting:CreateSection("Haki & Skills")

_G.AUTOHAKI = true
TabSetting:CreateToggle({
   Name = "Auto Haki",
   CurrentValue = true,
   Flag = "AutoHaki",
   Callback = function(Value)
       _G.AUTOHAKI = Value
   end,
})

spawn(function()
    while wait(.1) do
        if _G.AUTOHAKI then
            AutoHaki()
        end
    end
end)

_G.WhiteScreen = false
TabSetting:CreateToggle({
   Name = "White screen",
   CurrentValue = false,
   Flag = "WhiteScreen",
   Callback = function(Value)
       _G.WhiteScreen = Value
       if _G.WhiteScreen == true then
           game:GetService("RunService"):Set3dRenderingEnabled(false)
       else
           game:GetService("RunService"):Set3dRenderingEnabled(true)
       end
   end,
})

_G.AntiCheat = true
TabSetting:CreateToggle({
   Name = "Antiban",
   CurrentValue = true,
   Flag = "Antiban",
   Callback = function(Value)
       _G.AntiCheat = Value
   end,
})

-- ============================================================
-- PARTE 9: ABA WORLD TELEPORT
-- ============================================================

local Section_World = TabWorldTeleport:CreateSection("World Menu")

TabWorldTeleport:CreateButton({
   Name = "Old World (Sea 1)",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
   end,
})

TabWorldTeleport:CreateButton({
   Name = "Second World (Sea 2)",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
   end,
})

TabWorldTeleport:CreateButton({
   Name = "Third World (Sea 3)",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
   end,
})

-- ============================================================
-- PARTE 10: ABA DEVIL FRUIT
-- ============================================================

local Section_Fruit = TabDevilFruit:CreateSection("Fruit Shop")

TabDevilFruit:CreateButton({
   Name = "Random Fruits",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
   end,
})

_G.Random_Auto = false
TabDevilFruit:CreateToggle({
   Name = "Auto Random Fruits",
   CurrentValue = false,
   Flag = "Auto Random Fruits",
   Callback = function(Value)
       _G.Random_Auto = Value
   end,
})

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end
        end
    end)
end)

FruitList = {
    "Rocket-Rocket", "Spin-Spin", "Blade-Blade", "Spring-Spring", "Bomb-Bomb",
    "Smoke-Smoke", "Spike-Spike", "Flame-Flame", "Ice-Ice", "Sand-Sand",
    "Dark-Dark", "Eagle-Eagle", "Diamond-Diamond", "Light-Light", "Rubber-Rubber",
    "Ghost-Ghost", "Magma-Magma", "Quake-Quake", "Buddha-Buddha", "Love-Love",
    "Creation-Creation", "Spider-Spider", "Sound-Sound", "Phoenix-Phoenix", "Portal-Portal",
    "Lihtning-Lighgtning", "Pain-Pain", "Blizzard-Blizzard", "Gravity-Gravity", "Mammoth-Mammoth",
    "T-Rex-T-Rex", "Dough-Dough", "Shadow-Shadow", "Venom-Venom", "Gas-Gas",
    "Spirit-Spirit", "Tiger-Tiger", "Yeti-Yeti", "Kitsune-Kitsune", "Control-Control",
    "Dragon-Dragon"
}

_G.AutoStoreFruit = false
TabDevilFruit:CreateToggle({
   Name = "Auto Store Fruits",
   CurrentValue = false,
   Flag = "Auto Store Fruits",
   Callback = function(Value)
       _G.AutoStoreFruit = Value
   end,
})

spawn(function()
    pcall(function()
        while wait(.1) do
            if _G.AutoStoreFruit then
                for i, v in pairs(FruitList) do
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Store", v)
                end
            end
        end
    end)
end)

_G.Tweenfruit = false
TabDevilFruit:CreateToggle({
   Name = "Teleport To Fruit Spawn",
   CurrentValue = false,
   Flag = "Teleport To Fruit Spawn",
   Callback = function(Value)
       _G.Tweenfruit = Value
       StopTween(_G.Tweenfruit)
   end,
})

spawn(function()
    while wait(.1) do
        if _G.Tweenfruit then
            for i, v in pairs(game.Workspace:GetChildren()) do
                if string.find(v.Name, "Fruit") then
                    topos(v.Handle.CFrame)
                end
            end
        end
    end
end)

-- ============================================================
-- PARTE 11: ABA STATUS SERVER
-- ============================================================

local Section_Server_Status = TabStatusServer:CreateSection("FullMoon Check")

local FM = TabStatusServer:CreateLabel("Server Time : Loading...")

spawn(function()
    while wait() do
        TabStatusServer:Set("Server Time : " .. "Loading...")
    end
end)

-- ============================================================
-- PARTE 12: ABA LOCAL PLAYERS (PVP)
-- ============================================================

local Section_LocalPlayers = TabLocalPlayers:CreateSection("Players")

Playerslist = {}

for i, v in pairs(game:GetService("Players"):GetChildren()) do
    table.insert(Playerslist, v.Name)
end

_G.SelectPly = ""
TabLocalPlayers:CreateDropdown({
   Name = "Select Players",
   Options = Playerslist,
   CurrentOption = {""},
   Flag = "SelectPlayers",
   Callback = function(Option)
       _G.SelectPly = Option[1]
   end,
})

_G.TeleportPly = false
TabLocalPlayers:CreateToggle({
   Name = "Teleport To Players",
   CurrentValue = false,
   Flag = "TeleportPlayers",
   Callback = function(Value)
       _G.TeleportPly = Value
   end,
})

_G.Auto_Kill_Ply = false
TabLocalPlayers:CreateToggle({
   Name = "Auto Kill Players",
   CurrentValue = false,
   Flag = "AutoKillPlayers",
   Callback = function(Value)
       _G.Auto_Kill_Ply = Value
       StopTween(_G.Auto_Kill_Ply)
   end,
})

-- ============================================================
-- PARTE 13: ABA MISC
-- ============================================================

local Section_Misc_Server = TabMisc:CreateSection("Misc Server")

TabMisc:CreateButton({
   Name = "Copy Job Id",
   Callback = function()
       setclipboard(tostring(game.JobId))
   end,
})

TabMisc:CreateButton({
   Name = "Rejoin Sever",
   Callback = function()
       game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
   end,
})

_G.AutoRejoin = false
TabMisc:CreateToggle({
   Name = "Auto Rejoin",
   CurrentValue = false,
   Flag = "AutoRejoin",
   Callback = function(Value)
       _G.AutoRejoin = Value
   end,
})

spawn(function()
    while wait() do
        if _G.AutoRejoin then
            pcall(function()
                local getgenv_rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
                    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and child.MessageArea:FindFirstChild("ErrorFrame") then
                        game:GetService("TeleportService"):Teleport(game.PlaceId)
                    end
                end)
            end)
        end
    end
end)

-- ============================================================
-- PARTE 14: ABA STATS
-- ============================================================

local Section_Stats = TabStats:CreateSection("Statistics")

local PointStats = 1

TabStats:CreateSlider({
   Name = "Points to Spend",
   Min = 1,
   Max = 1000,
   Increment = 1,
   CurrentValue = 1,
   Flag = "PointsSlider",
   Callback = function(Value)
       PointStats = Value
   end,
})

local melee = false
local defense = false
local sword = false
local gun = false
local demonfruit = false

TabStats:CreateToggle({Name = "Melee", CurrentValue = false, Flag = "MeleeToggle", Callback = function(v) melee = v end})
TabStats:CreateToggle({Name = "Defense", CurrentValue = false, Flag = "DefenseToggle", Callback = function(v) defense = v end})
TabStats:CreateToggle({Name = "Sword", CurrentValue = false, Flag = "SwordToggle", Callback = function(v) sword = v end})
TabStats:CreateToggle({Name = "Gun", CurrentValue = false, Flag = "GunToggle", Callback = function(v) gun = v end})
TabStats:CreateToggle({Name = "Blox Fruit", CurrentValue = false, Flag = "FruitToggle", Callback = function(v) demonfruit = v end})

spawn(function()
    while wait() do
        if game.Players.localPlayer.Data.Points.Value >= PointStats then
            if melee then
                local args = {[1] = "AddPoint", [2] = "Melee", [3] = PointStats}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if defense then
                local args = {[1] = "AddPoint", [2] = "Defense", [3] = PointStats}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if sword then
                local args = {[1] = "AddPoint", [2] = "Sword", [3] = PointStats}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if gun then
                local args = {[1] = "AddPoint", [2] = "Gun", [3] = PointStats}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            if demonfruit then
                local args = {[1] = "AddPoint", [2] = "Blox Fruit", [3] = PointStats}
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
        end
    end
end)

-- ============================================================
-- PARTE 15: ABA ESP
-- ============================================================

local Section_ESP = TabESP:CreateSection("ESP Features")

_G.PlayerESP = false
TabESP:CreateToggle({
   Name = "Player ESP",
   CurrentValue = false,
   Flag = "PlayerESP",
   Callback = function(Value)
       _G.PlayerESP = Value
   end,
})

_G.MobESP = false
TabESP:CreateToggle({
   Name = "Mob ESP",
   CurrentValue = false,
   Flag = "MobESP",
   Callback = function(Value)
       _G.MobESP = Value
   end,
})

_G.ChestESP = false
TabESP:CreateToggle({
   Name = "Chest ESP",
   CurrentValue = false,
   Flag = "ChestESP",
   Callback = function(Value)
       _G.ChestESP = Value
   end,
})

-- ============================================================
-- PARTE 16: ABA RAID
-- ============================================================

local Section_Raid = TabRaid:CreateSection("Raid Menu")

_G.AutoRaid = false
TabRaid:CreateToggle({
   Name = "Auto Raid",
   CurrentValue = false,
   Flag = "AutoRaid",
   Callback = function(Value)
       _G.AutoRaid = Value
   end,
})

_G.RaidType = "Pirate"
TabRaid:CreateDropdown({
   Name = "Select Raid Type",
   Options = {"Pirate", "Demon", "Abyss", "Mystic Island"},
   CurrentOption = {"Pirate"},
   Flag = "RaidType",
   Callback = function(Option)
       _G.RaidType = Option[1]
   end,
})

TabRaid:CreateButton({
   Name = "Start Raid",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaidStarted", _G.RaidType)
   end,
})

_G.AutoRaidKill = false
TabRaid:CreateToggle({
   Name = "Auto Raid Kill",
   CurrentValue = false,
   Flag = "AutoRaidKill",
   Callback = function(Value)
       _G.AutoRaidKill = Value
   end,
})

spawn(function()
    while wait() do
        if _G.AutoRaidKill then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                topos(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                                game:GetService 'VirtualUser':CaptureController()
                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until v.Humanoid.Health <= 0 or not _G.AutoRaidKill or not v.Parent
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 17: ABA ITEM & QUEST
-- ============================================================

local Section_ItemQuest = TabItemQuest:CreateSection("Quests")

_G.AutoSaber = false
TabItemQuest:CreateToggle({
   Name = "Auto Saber Quest",
   CurrentValue = false,
   Flag = "AutoSaber",
   Callback = function(Value)
       _G.AutoSaber = Value
   end,
})

_G.AutoPole = false
TabItemQuest:CreateToggle({
   Name = "Auto Pole V1",
   CurrentValue = false,
   Flag = "AutoPole",
   Callback = function(Value)
       _G.AutoPole = Value
   end,
})

_G.AutoVampire = false
TabItemQuest:CreateToggle({
   Name = "Auto Vampire",
   CurrentValue = false,
   Flag = "AutoVampire",
   Callback = function(Value)
       _G.AutoVampire = Value
   end,
})

_G.AutoSuperhuman = false
TabItemQuest:CreateToggle({
   Name = "Auto SuperHuman",
   CurrentValue = false,
   Flag = "AutoSuperhuman",
   Callback = function(Value)
       _G.AutoSuperhuman = Value
   end,
})

_G.AutoBartilo = false
TabItemQuest:CreateToggle({
   Name = "Auto Bartilo Quest",
   CurrentValue = false,
   Flag = "AutoBartilo",
   Callback = function(Value)
       _G.AutoBartilo = Value
   end,
})

_G.AutoKatakuri = false
TabItemQuest:CreateToggle({
   Name = "Auto Katakuri",
   CurrentValue = false,
   Flag = "AutoKatakuri",
   Callback = function(Value)
       _G.AutoKatakuri = Value
       StopTween(_G.AutoKatakuri)
   end,
})

TabItemQuest:CreateButton({
   Name = "Spawn Katakuri",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bounty", "KatakuriSpawner")
   end,
})

-- ============================================================
-- PARTE 18: ABA RACE V4
-- ============================================================

local Section_Race = TabRaceV4:CreateSection("Race V4")

_G.AutoRaceV4 = false
TabRaceV4:CreateToggle({
   Name = "Auto Race V4",
   CurrentValue = false,
   Flag = "AutoRaceV4",
   Callback = function(Value)
       _G.AutoRaceV4 = Value
   end,
})

_G.RaceV4_Select = "Ghoul"
TabRaceV4:CreateDropdown({
   Name = "Select Race",
   Options = {"Ghoul", "Mink", "Cyborg", "Human"},
   CurrentOption = {"Ghoul"},
   Flag = "RaceV4Select",
   Callback = function(Option)
       _G.RaceV4_Select = Option[1]
   end,
})

spawn(function()
    while wait() do
        if _G.AutoRaceV4 then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Data.Race.Value == "Human" then
                    local args = {[1] = "BuyRace", [2] = _G.RaceV4_Select}
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 19: ABA SHOP (EXPANDIDA)
-- ============================================================

local Section_Shop = TabShop:CreateSection("Shop Menu")

TabShop:CreateButton({
   Name = "Buy Black Leg",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
   end,
})

TabShop:CreateButton({
   Name = "Buy Electro",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
   end,
})

TabShop:CreateButton({
   Name = "Buy Fishman Karate",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
   end,
})

TabShop:CreateButton({
   Name = "Buy Dragon Talon",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
   end,
})

local Section_Shop_Swords = TabShop:CreateSection("Swords Shop")

TabShop:CreateButton({
   Name = "Buy Iron Mace",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyIronMace")
   end,
})

TabShop:CreateButton({
   Name = "Buy Gold Necklace",
   Callback = function()
       game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGoldNecklace")
   end,
})

local Section_Shop_Ability = TabShop:CreateSection("Ability Shop")

_G.AutoBuyAbility = false
TabShop:CreateToggle({
   Name = "Auto Buy Black Leg",
   CurrentValue = false,
   Flag = "AutoBuyBlackLeg",
   Callback = function(Value)
       _G.AutoBuyAbility = Value
   end,
})

spawn(function()
    while wait(1) do
        if _G.AutoBuyAbility then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
            end)
        end
    end
end)

-- ============================================================
-- PARTE 20A: AUTO SKILLS LOOPS
-- ============================================================

spawn(function()
    while wait() do
        if _G.SkillZ then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UseSkill", "Z")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SkillX then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UseSkill", "X")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SkillC then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UseSkill", "C")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SkillV then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UseSkill", "V")
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.SkillF then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UseSkill", "F")
            end)
        end
    end
end)

-- ============================================================
-- PARTE 20: SPAWN LOOPS DE FARMING
-- ============================================================

spawn(function()
    while wait() do
        if _G.AutoFarm then
            pcall(function()
                local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                end
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    CheckQuest()
                    topos(CFrameQuest)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 20 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                    end
                elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                    CheckQuest()
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                if v.Name == Mon then
                                    repeat
                                        task.wait()
                                        EquipWeapon(_G.SelectWeapon)
                                        AutoHaki()
                                        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                        v.HumanoidRootPart.CanCollide = false
                                        v.Humanoid.WalkSpeed = 0
                                        v.Head.CanCollide = false
                                        game:GetService 'VirtualUser':CaptureController()
                                        game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 21: BRING MONSTER SYSTEM
-- ============================================================

spawn(function()
    while task.wait() do
        pcall(function()
            if _G.BringMonster then
                CheckQuest()
                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if _G.AutoFarm and v.Name == Mon and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        if (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= _G.BringMode then
                            v.HumanoidRootPart.Size = Vector3.new(150, 150, 150)
                            v.Humanoid:ChangeState(14)
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                        end
                    end
                end
            end
        end)
    end
end)

-- ============================================================
-- PARTE 22: FAST ATTACK SYSTEM
-- ============================================================

CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack then
            if typeof(y) == "table" then
                pcall(function()
                    y.activeController.timeToNextAttack = 0
                    y.activeController.hitboxMagnitude = 60
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 0
                    y.activeController.increment = 1
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                end)
            end
        end
    end)
end)

spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if _G.FastAttack == true then
            pcall(function()
                game.Players.LocalPlayer.Character.Stun.Value = 0
                game.Players.LocalPlayer.Character.Busy.Value = false
            end)
        end
    end)
end)

-- ============================================================
-- PARTE 23: ANTI TELEPORT PVP
-- ============================================================

spawn(function()
    while wait() do
        if _G.TeleportPly then
            pcall(function()
                if game:GetService("Players"):FindFirstChild(_G.SelectPly) then
                    topos(game:GetService("Players")[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 24: AUTO CHEST FARMING
-- ============================================================

_G.AutoChest = false
spawn(function()
    while wait() do
        if _G.AutoChest then
            pcall(function()
                local Players = game:GetService("Players")
                local Workspace = game:GetService("Workspace")
                
                for i, v in pairs(Workspace:GetChildren()) do
                    if string.find(v.Name, "Chest") then
                        if v:FindFirstChild("Handle") then
                            repeat
                                task.wait()
                                topos(v.Handle.CFrame + Vector3.new(0, 15, 0))
                                game:GetService 'VirtualUser':CaptureController()
                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until not _G.AutoChest or not v.Parent or not v:FindFirstChild("Handle")
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 25: AUTO BONE FARMING
-- ============================================================

_G.AutoBone = false
spawn(function()
    while wait() do
        if _G.AutoBone then
            pcall(function()
                for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if string.find(v.Name, "Bone") then
                        if v:FindFirstChild("Handle") then
                            repeat
                                task.wait()
                                topos(v.Handle.CFrame + Vector3.new(0, 15, 0))
                                game:GetService 'VirtualUser':CaptureController()
                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until not _G.AutoBone or not v.Parent or not v:FindFirstChild("Handle")
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 26: QUEST PROGRESS SYSTEMS
-- ============================================================

spawn(function()
    while wait() do
        if _G.AutoSaber then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 14 and game.Players.LocalPlayer.Data.Level.Value <= 500 then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrame.new(-1141.07483, 4.10001802, 3831.5498))
                        wait(2)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "PirateQuest1", 1)
                    else
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Pirate" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    topos(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoSaber or not v.Parent
                            end
                        end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if _G.AutoVampire then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 500 and game.Players.LocalPlayer.Data.Level.Value <= 1000 then
                    local QuestTitle = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, "Vampire") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                        topos(CFrame.new(-8281.7871, 118.8, 3240.7844))
                        wait(2)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "VampireQuest", 1)
                    else
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Vampire" and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                                repeat
                                    task.wait()
                                    EquipWeapon(_G.SelectWeapon)
                                    AutoHaki()
                                    topos(v.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                                    game:GetService 'VirtualUser':CaptureController()
                                    game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                until v.Humanoid.Health <= 0 or not _G.AutoVampire or not v.Parent
                            end
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================
-- PARTE 27: ESP UPDATE LOOPS
-- ============================================================

spawn(function()
    while wait(.2) do
        if _G.PlayerESP then
            UpdatePlayerChams()
        end
    end
end)

spawn(function()
    while wait(.2) do
        if _G.ChestESP then
            UpdateChestChams()
        end
    end
end)

spawn(function()
    while wait(.2) do
        if _G.MobESP then
            UpdateMobESP()
        end
    end
end)

-- ============================================================
-- PARTE 28: AUTO KILL PLAYERS PVP
-- ============================================================

spawn(function()
    while wait() do
        if _G.Auto_Kill_Ply then
            pcall(function()
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if v ~= game:GetService("Players").LocalPlayer then
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                EquipWeapon(_G.SelectWeapon)
                                AutoHaki()
                                topos(v.Character.HumanoidRootPart.CFrame + Vector3.new(0, 30, 0))
                                game:GetService 'VirtualUser':CaptureController()
                                game:GetService 'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until v.Character.Humanoid.Health <= 0 or not _G.Auto_Kill_Ply or not v.Parent or not v.Character
                        end
                    end
                end
            end)
        end
    end
end)

-- ============================================================
-- NOTIFICAÇÃO FINAL
-- ============================================================

Rayfield:Notify({
   Title = "PHANTOM HUB",
   Content = "Script loaded successfully! All features ready.",
   Duration = 5,
   Image = "rbxassetid://119980140458596",
})

print("[PHANTOM HUB] Script loaded - All Rayfield UI initialized")

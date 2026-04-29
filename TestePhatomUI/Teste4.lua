--// PHANTOM HUB (API V3 - ICONS + SOUND)

local PhantomUI = {}
PhantomUI.__index = PhantomUI

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- CONFIG
local LOGO_URL = "https://raw.githubusercontent.com/blackxscripts/phantom/main/phantom-logo1.png"
local TOP_LOGO_URL = "https://raw.githubusercontent.com/blackxscripts/phantom/main/phantom-logo2.png"

-- ICON & AUDIO BASE
local ICON_BASE = "https://raw.githubusercontent.com/blackxscripts/Icons/main/Icones2/"
local AUDIO_BASE = "https://raw.githubusercontent.com/blackxscripts/Icons/main/Audio-Effect/"

local CLICK_SOUND_URL = AUDIO_BASE .. "clicksoundeffect.mp3"
local TAB_SOUND_URL = AUDIO_BASE .. "minecraft_click.mp3"

-- SOUND FUNCTION
local function playSound(url)
    local s = Instance.new("Sound")
    s.SoundId = url
    s.Volume = 1
    s.Parent = game:GetService("SoundService")
    s:Play()
    game.Debris:AddItem(s, 2)
end

-- INIT
function PhantomUI:Init()
    local self = setmetatable({}, PhantomUI)

    local gui = Instance.new("ScreenGui")
    gui.Name = "PhantomUI"

    pcall(function()
        gui.Parent = game:GetService("CoreGui")
    end)
    if not gui.Parent then
        gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end

    self.Gui = gui

    -- MAIN
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 440, 0, 280)
    main.Position = UDim2.new(0.5, -220, 0.5, -140)
    main.BackgroundColor3 = Color3.fromRGB(15,15,15)
    main.BorderSizePixel = 0
    main.Active = true

    Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)
    self.Main = main

    -- TOPBAR
    local top = Instance.new("Frame", main)
    top.Size = UDim2.new(1, 0, 0, 32)
    top.BackgroundColor3 = Color3.fromRGB(20,20,20)
    Instance.new("UICorner", top)

    -- TITLE
    local title = Instance.new("TextLabel", top)
    title.Size = UDim2.new(1, -40, 1, 0)
    title.Position = UDim2.new(0,35,0,0)
    title.Text = "PHANTOM HUB"
    title.TextColor3 = Color3.new(1,1,1)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.TextXAlignment = Enum.TextXAlignment.Left

    -- CLOSE
    local close = Instance.new("TextButton", top)
    close.Size = UDim2.new(0, 32, 1, 0)
    close.Position = UDim2.new(1, -32, 0, 0)
    close.Text = "X"
    close.BackgroundColor3 = Color3.fromRGB(25,25,25)
    close.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", close)

    close.MouseButton1Click:Connect(function()
        playSound(CLICK_SOUND_URL)
        gui:Destroy()
    end)

    -- TAB HOLDER
    local tabHolder = Instance.new("Frame", main)
    tabHolder.Size = UDim2.new(0, 120, 1, -32)
    tabHolder.Position = UDim2.new(0,0,0,32)
    tabHolder.BackgroundColor3 = Color3.fromRGB(18,18,18)

    local tabLayout = Instance.new("UIListLayout", tabHolder)
    tabLayout.Padding = UDim.new(0,5)

    -- CONTENT
    local content = Instance.new("Frame", main)
    content.Size = UDim2.new(1, -120, 1, -32)
    content.Position = UDim2.new(0,120,0,32)
    content.BackgroundTransparency = 1

    self.Tabs = {}
    self.Content = content

    -- CREATE TAB
    function self:CreateTab(name, icon)
        local tabBtn = Instance.new("TextButton", tabHolder)
        tabBtn.Size = UDim2.new(1,0,0,40)
        tabBtn.Text = "   "..name
        tabBtn.TextColor3 = Color3.new(1,1,1)
        tabBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
        tabBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", tabBtn)

        -- ICON
        local img = Instance.new("ImageLabel", tabBtn)
        img.Size = UDim2.new(0,20,0,20)
        img.Position = UDim2.new(0,5,0.5,-10)
        img.BackgroundTransparency = 1
        img.Image = ICON_BASE .. icon .. ".png"

        -- PAGE
        local page = Instance.new("Frame", content)
        page.Size = UDim2.new(1,0,1,0)
        page.Visible = false

        local layout = Instance.new("UIListLayout", page)
        layout.Padding = UDim.new(0,8)

        tabBtn.MouseButton1Click:Connect(function()
            playSound(TAB_SOUND_URL)

            for _,v in pairs(self.Tabs) do
                v.Page.Visible = false
            end

            page.Visible = true
        end)

        table.insert(self.Tabs, {Page = page})

        return page
    end

    return self
end

-- BUTTON
function PhantomUI:CreateButton(parent, text, icon, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = "   "..text
    b.BackgroundColor3 = Color3.fromRGB(25,25,25)
    b.TextColor3 = Color3.new(1,1,1)
    b.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", b)

    -- ICON
    local img = Instance.new("ImageLabel", b)
    img.Size = UDim2.new(0,20,0,20)
    img.Position = UDim2.new(0,5,0.5,-10)
    img.BackgroundTransparency = 1
    img.Image = ICON_BASE .. icon .. ".png"

    b.MouseButton1Click:Connect(function()
        playSound(CLICK_SOUND_URL)
        callback()
    end)
end

-- TOGGLE
function PhantomUI:CreateToggle(parent, text, icon, callback)
    local state = false

    local frame = Instance.new("TextButton", parent)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.Text = "   "..text
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    frame.TextColor3 = Color3.new(1,1,1)
    frame.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", frame)

    -- ICON
    local img = Instance.new("ImageLabel", frame)
    img.Size = UDim2.new(0,20,0,20)
    img.Position = UDim2.new(0,5,0.5,-10)
    img.BackgroundTransparency = 1
    img.Image = ICON_BASE .. icon .. ".png"

    frame.MouseButton1Click:Connect(function()
        state = not state
        playSound(CLICK_SOUND_URL)
        callback(state)
    end)
end

return PhantomUI

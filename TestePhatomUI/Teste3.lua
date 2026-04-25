--// PHANTOM HUB (API V2)

local PhantomUI = {}
PhantomUI.__index = PhantomUI

local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- CONFIG
local LOGO_URL = "https://raw.githubusercontent.com/blackxscripts/phantom/main/phantom-logo1.png"
local TOP_LOGO_URL = "https://raw.githubusercontent.com/blackxscripts/phantom/main/phantom-logo2.png"

local FILE_NAME = "phantom_logo.png"
local TOP_FILE = "phantom_logo2.png"

local getAsset = getcustomasset or getsynasset or function(x) return x end

-- INIT
function PhantomUI:Init()
    local self = setmetatable({}, PhantomUI)

    -- GUI
    local gui = Instance.new("ScreenGui")
    gui.Name = "PhantomUI"

    pcall(function()
        gui.Parent = game:GetService("CoreGui")
    end)
    if not gui.Parent then
        gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end

    self.Gui = gui

    -- INTRO LOGO
    local logo = Instance.new("ImageLabel", gui)
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.Position = UDim2.new(0.5, 0, 0.5, 0)
    logo.Size = UDim2.new(0.12, 0, 0.12, 0)
    logo.BackgroundTransparency = 1
    logo.ImageTransparency = 1
    logo.ScaleType = Enum.ScaleType.Fit
    Instance.new("UIAspectRatioConstraint", logo)

    pcall(function()
        if isfile and writefile and not isfile(FILE_NAME) then
            writefile(FILE_NAME, game:HttpGet(LOGO_URL))
        end
        logo.Image = getAsset(FILE_NAME) or LOGO_URL
    end)

    TweenService:Create(logo, TweenInfo.new(0.8), {
        ImageTransparency = 0,
        Size = UDim2.new(0.28, 0, 0.28, 0)
    }):Play()

    task.wait(2)

    TweenService:Create(logo, TweenInfo.new(0.5), {
        ImageTransparency = 1
    }):Play()

    task.wait(0.5)
    logo:Destroy()

    -- MAIN
    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 420, 0, 260)
    main.Position = UDim2.new(0.5, -210, 0.5, -130)
    main.BackgroundColor3 = Color3.fromRGB(15,15,15)
    main.BorderSizePixel = 0
    main.Active = true
    main.BackgroundTransparency = 1

    Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

    TweenService:Create(main, TweenInfo.new(0.4), {
        BackgroundTransparency = 0
    }):Play()

    self.Main = main

    -- DRAG
    do
        local dragging, dragInput, dragStart, startPos

        main.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = main.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        main.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UIS.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end)
    end

    -- TOPBAR
    local top = Instance.new("Frame", main)
    top.Size = UDim2.new(1, 0, 0, 32)
    top.BackgroundColor3 = Color3.fromRGB(20,20,20)
    Instance.new("UICorner", top).CornerRadius = UDim.new(0,12)

    -- LOGO
    local topLogo = Instance.new("ImageLabel", top)
    topLogo.Size = UDim2.new(0, 22, 0, 22)
    topLogo.Position = UDim2.new(0, 8, 0.5, -11)
    topLogo.BackgroundTransparency = 1
    topLogo.ScaleType = Enum.ScaleType.Fit
    Instance.new("UIAspectRatioConstraint", topLogo)

    pcall(function()
        if isfile and writefile and not isfile(TOP_FILE) then
            writefile(TOP_FILE, game:HttpGet(TOP_LOGO_URL))
        end
        topLogo.Image = getAsset(TOP_FILE) or TOP_LOGO_URL
    end)

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
        gui:Destroy()
    end)

    -- CONTAINER
    local container = Instance.new("Frame", main)
    container.Size = UDim2.new(1, -20, 1, -42)
    container.Position = UDim2.new(0, 10, 0, 36)
    container.BackgroundTransparency = 1

    local layout = Instance.new("UIListLayout", container)
    layout.Padding = UDim.new(0,8)

    self.Container = container

    return self
end

-- BUTTON
function PhantomUI:CreateButton(text, callback)
    local b = Instance.new("TextButton", self.Container)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(25,25,25)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)

    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(35,35,35)
        }):Play()
    end)

    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(25,25,25)
        }):Play()
    end)

    b.MouseButton1Click:Connect(callback)
end

-- TOGGLE
function PhantomUI:CreateToggle(text, callback)
    local state = false

    local frame = Instance.new("Frame", self.Container)
    frame.Size = UDim2.new(1, 0, 0, 40)
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Instance.new("UICorner", frame)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.7,0,1,0)
    label.Text = text
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            state = not state
            callback(state)
        end
    end)
end

-- SLIDER (DRAG PROFISSIONAL)
function PhantomUI:CreateSlider(text, min, max, callback)
    local value = min
    local dragging = false

    local frame = Instance.new("Frame", self.Container)
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
    Instance.new("UICorner", frame)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1,0,0,20)
    label.Text = text .. ": " .. value
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1,1,1)

    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(1,-20,0,6)
    bar.Position = UDim2.new(0,10,0,30)
    bar.BackgroundColor3 = Color3.fromRGB(40,40,40)
    Instance.new("UICorner", bar)

    local fill = Instance.new("Frame", bar)
    fill.Size = UDim2.new(0,0,1,0)
    fill.BackgroundColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", fill)

    local function update(input)
        local pos = (input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X
        pos = math.clamp(pos, 0, 1)

        value = math.floor(min + (max - min) * pos)

        fill.Size = UDim2.new(pos,0,1,0)
        label.Text = text .. ": " .. value

        callback(value)
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            update(input)
        end
    end)

    bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            update(input)
        end
    end)
end

return PhantomUI

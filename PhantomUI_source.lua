--[[

	PhantomUI - BLACK X SCRIPTS
	
	Advanced UI System for Roblox
	Rebranded & Restructured
	
	No external dependencies
	No analytics
	No telemetry

]]

if debugX then
	warn('Initialising PhantomUI')
end

-- ================================================================================
-- PHANTOM UI CONFIG
-- ================================================================================

local Phantom = {
	Prefix = "BLACK X",
	Logo = "rbxassetid://102312081475888",
	Version = "1.0",
	Build = "PHANTOM-001"
}

-- ================================================================================
-- CORE SERVICES
-- ================================================================================

local function getService(name)
	local service = game:GetService(name)
	return if cloneref then cloneref(service) else service
end

local UserInputService = getService("UserInputService")
local TweenService = getService("TweenService")
local Players = getService("Players")
local CoreGui = getService("CoreGui")
local HttpService = getService('HttpService')
local RunService = getService('RunService')

-- ================================================================================
-- ENVIRONMENT & SETUP
-- ================================================================================

local useStudio = RunService:IsStudio() or false
local _getgenv = rawget(_G, "getgenv")

-- PhantomUI Folder Setup
local PhantomUIFolder = "PhantomUI"
local ConfigurationFolder = PhantomUIFolder.."/Configurations"
local ConfigurationExtension = ".phantom"

-- ================================================================================
-- SAFE FUNCTION WRAPPER
-- ================================================================================

local function callSafely(func, ...)
	if func then
		local success, result = pcall(func, ...)
		if not success then
			warn("PhantomUI | Function failed with error: ", result)
			return false
		else
			return result
		end
	end
end

local function ensureFolder(folderPath)
	if isfolder and not callSafely(isfolder, folderPath) then
		callSafely(makefolder, folderPath)
	end
end

-- ================================================================================
-- THEME SYSTEM - BLACK X ONLY
-- ================================================================================

local ThemeSystem = {
	Themes = {
		["BLACK X"] = {
			Name = "BLACK X",
			Accent = Color3.fromRGB(255, 255, 255),
			Background = Color3.fromRGB(0, 0, 0),
			Secondary = Color3.fromRGB(15, 15, 15),
			Text = Color3.fromRGB(240, 240, 240),
			Stroke = Color3.fromRGB(50, 50, 50),
			ElementBg = Color3.fromRGB(20, 20, 20),
		},
		["RED X"] = {
			Name = "RED X",
			Accent = Color3.fromRGB(255, 0, 0),
			Background = Color3.fromRGB(0, 0, 0),
			Secondary = Color3.fromRGB(15, 15, 15),
			Text = Color3.fromRGB(240, 240, 240),
			Stroke = Color3.fromRGB(50, 50, 50),
			ElementBg = Color3.fromRGB(20, 20, 20),
		},
		["BLUE X"] = {
			Name = "BLUE X",
			Accent = Color3.fromRGB(0, 170, 255),
			Background = Color3.fromRGB(0, 0, 0),
			Secondary = Color3.fromRGB(15, 15, 15),
			Text = Color3.fromRGB(240, 240, 240),
			Stroke = Color3.fromRGB(50, 50, 50),
			ElementBg = Color3.fromRGB(20, 20, 20),
		},
	},
	Current = nil,
	ThemedObjects = {}
}

function ThemeSystem:RegisterTheme(obj, objType)
	table.insert(self.ThemedObjects, {Object = obj, Type = objType})
end

function ThemeSystem:ApplyTheme(themeName)
	local theme = self.Themes[themeName]
	if not theme then
		warn("PhantomUI | Theme not found: " .. tostring(themeName))
		return
	end
	
	self.Current = theme
	
	for _, entry in pairs(self.ThemedObjects) do
		if not entry.Object or not entry.Object.Parent then continue end
		
		if entry.Type == "Accent" then
			if entry.Object:IsA("UIStroke") then
				entry.Object.Color = theme.Accent
			elseif entry.Object:IsA("TextLabel") or entry.Object:IsA("TextButton") then
				entry.Object.TextColor3 = theme.Accent
			else
				entry.Object.BackgroundColor3 = theme.Accent
			end
		elseif entry.Type == "Text" then
			if entry.Object:IsA("TextLabel") or entry.Object:IsA("TextBox") then
				entry.Object.TextColor3 = theme.Text
			end
		elseif entry.Type == "Element" then
			entry.Object.BackgroundColor3 = theme.ElementBg
		end
	end
end

-- ================================================================================
-- SETTINGS SYSTEM
-- ================================================================================

local settingsTable = {
	General = {
		phantomOpen = {Type = 'bind', Value = 'K', Name = 'PhantomUI Keybind'},
	},
	System = {}
}

local overriddenSettings = {}

local function overrideSetting(category, name, value)
	overriddenSettings[category .. "." .. name] = value
end

local function getSetting(category, name)
	if overriddenSettings[category .. "." .. name] ~= nil then
		return overriddenSettings[category .. "." .. name]
	elseif settingsTable[category][name] ~= nil then
		return settingsTable[category][name].Value
	end
end

local function loadSettings()
	local file = nil
	local success, result = pcall(function()
		if callSafely(isfolder, PhantomUIFolder) then
			if callSafely(isfile, PhantomUIFolder..'/settings'..ConfigurationExtension) then
				file = callSafely(readfile, PhantomUIFolder..'/settings'..ConfigurationExtension)
			end
		end

		if file then
			local decodeSuccess, decodedFile = pcall(function() return HttpService:JSONDecode(file) end)
			if decodeSuccess then
				file = decodedFile
			else
				file = {}
			end
		else
			file = {}
		end

		if next(file) ~= nil then
			for categoryName, settingCategory in pairs(settingsTable) do
				if file[categoryName] then
					for settingName, setting in pairs(settingCategory) do
						if file[categoryName][settingName] then
							setting.Value = file[categoryName][settingName].Value
						end
					end
				end
			end
		end
	end)
end

loadSettings()

-- ================================================================================
-- MAIN UI LIBRARY
-- ================================================================================

local PhantomUILibrary = {
	Flags = {},
	LocalFlags = {}
}

-- ================================================================================
-- INTERFACE SETUP
-- ================================================================================

local PhantomAssetId = 10804731440
local PhantomUI = useStudio and script.Parent:FindFirstChild('PhantomUI') or game:GetObjects("rbxassetid://"..PhantomAssetId)[1]
local buildAttempts = 0
local phantomDestroyed = false

repeat
	buildAttempts = buildAttempts + 1
	if buildAttempts >= 2 then
		if not PhantomUI or not PhantomUI.Parent then
			PhantomUI = game:GetObjects("rbxassetid://"..PhantomAssetId)[1]
		end
		break
	end
	task.wait(0.1)
until buildAttempts >= 2

PhantomUI.Enabled = false

if gethui then
	PhantomUI.Parent = gethui()
elseif syn and syn.protect_gui then 
	syn.protect_gui(PhantomUI)
	PhantomUI.Parent = CoreGui
elseif not useStudio and CoreGui:FindFirstChild("RobloxGui") then
	PhantomUI.Parent = CoreGui:FindFirstChild("RobloxGui")
elseif not useStudio then
	PhantomUI.Parent = CoreGui
end

-- Disable old instances
if gethui then
	for _, Interface in ipairs(gethui():GetChildren()) do
		if Interface.Name == PhantomUI.Name and Interface ~= PhantomUI then
			Interface.Enabled = false
			Interface.Name = "PhantomUI-Old"
		end
	end
elseif not useStudio then
	for _, Interface in ipairs(CoreGui:GetChildren()) do
		if Interface.Name == PhantomUI.Name and Interface ~= PhantomUI then
			Interface.Enabled = false
			Interface.Name = "PhantomUI-Old"
		end
	end
end

-- ================================================================================
-- OBJECT REFERENCES
-- ================================================================================

local Main = PhantomUI.Main
local MPrompt = PhantomUI:FindFirstChild('Prompt')
local Topbar = Main.Topbar
local Elements = Main.Elements
local LoadingFrame = Main.LoadingFrame
local TabList = Main.TabList
local dragBar = PhantomUI:FindFirstChild('Drag')
local dragInteract = dragBar and dragBar.Interact or nil
local dragBarCosmetic = dragBar and dragBar.Drag or nil

local dragOffset = 255
local dragOffsetMobile = 150

PhantomUI.DisplayOrder = 100

-- ================================================================================
-- STATE VARIABLES
-- ================================================================================

local CFileName = nil
local CEnabled = false
local Minimised = false
local Hidden = false
local Debounce = false
local searchOpen = false
local Notifications = PhantomUI.Notifications
local keybindConnections = {}

-- ================================================================================
-- SIMPLE ICON SYSTEM (LOCAL)
-- ================================================================================

local SimpleIcons = {
	["48px"] = {
		["home"] = {4483362458, {48, 48}, {0, 0}},
		["settings"] = {80503127983237, {48, 48}, {0, 0}},
		["search"] = {18458939117, {48, 48}, {0, 0}},
		["chevron"] = {111263549366178, {48, 48}, {0, 0}},
	}
}

local function getIcon(name)
	name = string.match(string.lower(name), "^%s*(.*)%s*$") or ""
	local sizedicons = SimpleIcons['48px']
	local r = sizedicons[name]
	if not r then
		return {id = 0, imageRectSize = Vector2.new(0, 0), imageRectOffset = Vector2.new(0, 0)}
	end

	local rirs = r[2]
	local riro = r[3]
	local irs = Vector2.new(rirs[1], rirs[2])
	local iro = Vector2.new(riro[1], riro[2])

	return {id = r[1], imageRectSize = irs, imageRectOffset = iro}
end

local function getAssetUri(id)
	if type(id) == "number" then
		return "rbxassetid://" .. id
	else
		return ""
	end
end

-- ================================================================================
-- NOTIFICATION SYSTEM
-- ================================================================================

function PhantomUILibrary:Notify(data)
	local Theme = ThemeSystem.Current or ThemeSystem.Themes["BLACK X"]
	
	local notificationTemplate = Notifications:FindFirstChild("Template")
	if not notificationTemplate then return end

	local notification = notificationTemplate:Clone()
	notification.Name = "PhantomNotification-".. math.random(1, 9999)
	notification.Parent = Notifications
	notification.Visible = true

	local title = notification:FindFirstChild("Title") or notification:FindFirstChildOfClass("TextLabel")
	local content = notification:FindFirstChild("Content") or notification:FindFirstChildOfClass("TextLabel", true)

	if title then
		title.Text = data.Title or "Notification"
		title.TextColor3 = Theme.Accent
	end

	if content then
		content.Text = data.Content or ""
		content.TextColor3 = Theme.Text
	end

	local duration = data.Duration or 5
	task.delay(duration, function()
		if notification and notification.Parent then
			notification:Destroy()
		end
	end)
end

-- ================================================================================
-- WINDOW CREATION
-- ================================================================================

function PhantomUILibrary:CreateWindow(Settings)
	Settings = Settings or {}
	
	local Theme = ThemeSystem.Themes["BLACK X"]
	
	-- Apply theme to main UI
	Main.BackgroundColor3 = Theme.Background
	Topbar.BackgroundColor3 = Theme.Background
	
	-- Set window title with PREFIX
	Topbar.Title.Text = Phantom.Prefix .. " | " .. (Settings.Name or "PhantomUI")
	Topbar.Title.TextColor3 = Theme.Accent
	
	-- Add logo to topbar
	if not Topbar:FindFirstChild("PhantomLogo") then
		local Logo = Instance.new("ImageLabel")
		Logo.Name = "PhantomLogo"
		Logo.Parent = Topbar
		Logo.BackgroundTransparency = 1
		Logo.Size = UDim2.new(0, 30, 0, 30)
		Logo.Position = UDim2.new(0, 5, 0.5, -15)
		Logo.Image = Phantom.Logo
	end
	
	-- Loading screen
	LoadingFrame.Title.Text = Settings.LoadingTitle or Phantom.Prefix
	LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "Advanced UI System"
	LoadingFrame.Title.TextColor3 = Theme.Accent
	LoadingFrame.Subtitle.TextColor3 = Theme.Text
	
	-- Apply initial theme globally
	ThemeSystem:ApplyTheme("BLACK X")
	
	Main.Visible = true
	
	ensureFolder(PhantomUIFolder)
	
	-- Configuration
	if Settings.ConfigurationSaving then
		CEnabled = Settings.ConfigurationSaving.Enabled or false
		CFileName = Settings.ConfigurationSaving.FileName or "DominionConfig"
	end

	local Window = {
		Tabs = {}
	}

	function Window:CreateTab(Name, Image)
		local tab = {
			Name = Name,
			Image = Image or 0,
			Sections = {}
		}

		local tabButton = TabList.Template:Clone()
		tabButton.Name = Name
		tabButton.Parent = TabList
		tabButton.Visible = true
		tabButton.Text = Name
		tabButton.TextColor3 = ThemeSystem.Current.Accent
		tabButton.BackgroundColor3 = ThemeSystem.Current.ElementBg
		ThemeSystem:RegisterTheme(tabButton, "Accent")

		-- Add glow stroke to tab button
		if not tabButton:FindFirstChild("UIStroke") then
			local tabStroke = Instance.new("UIStroke")
			tabStroke.Color = ThemeSystem.Current.Accent
			tabStroke.Thickness = 1
			tabStroke.Transparency = 0.5
			tabStroke.Parent = tabButton
			ThemeSystem:RegisterTheme(tabStroke, "Accent")
		end

		-- Tab selection
		tabButton.MouseButton1Click:Connect(function()
			for _, t in ipairs(TabList:GetChildren()) do
				if t:IsA("TextButton") then
					t.BackgroundColor3 = ThemeSystem.Current.ElementBg
					t.TextColor3 = ThemeSystem.Current.Accent
				end
			end
			tabButton.BackgroundColor3 = ThemeSystem.Current.Accent
			tabButton.TextColor3 = ThemeSystem.Current.Secondary
		end)

		function tab:CreateSection(SectionName)
			local section = {
				Name = SectionName,
				Elements = {}
			}

			local sectionFrame = Elements.Template:Clone()
			sectionFrame.Name = SectionName
			sectionFrame.Parent = Elements
			sectionFrame.Visible = true

			if sectionFrame:FindFirstChild("Title") then
				sectionFrame.Title.Text = SectionName
				sectionFrame.Title.TextColor3 = ThemeSystem.Current.Accent
				ThemeSystem:RegisterTheme(sectionFrame.Title, "Accent")
			end

			function section:CreateButton(ButtonSettings)
				ButtonSettings = ButtonSettings or {}
				
				local buttonFrame = sectionFrame:FindFirstChild("ButtonTemplate") or Instance.new("TextButton")
				local button = buttonFrame:Clone()
				button.Name = ButtonSettings.Name or "Button"
				button.Parent = sectionFrame
				button.Visible = true
				button.Text = ButtonSettings.Name or "Button"
				button.TextColor3 = ThemeSystem.Current.Accent
				button.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add UIStroke with glow effect
				if not button:FindFirstChild("UIStroke") then
					local stroke = Instance.new("UIStroke")
					stroke.Color = ThemeSystem.Current.Accent
					stroke.Thickness = 1.5
					stroke.Transparency = 0.4
					stroke.Parent = button
					ThemeSystem:RegisterTheme(stroke, "Accent")
				end

				ThemeSystem:RegisterTheme(button, "Text")

				if ButtonSettings.Callback then
					button.MouseButton1Click:Connect(ButtonSettings.Callback)
				end

				return button
			end

			function section:CreateToggle(ToggleSettings)
				ToggleSettings = ToggleSettings or {}
				
				local toggleFrame = sectionFrame:FindFirstChild("ToggleTemplate") or Instance.new("Frame")
				local toggle = toggleFrame:Clone()
				toggle.Name = ToggleSettings.Name or "Toggle"
				toggle.Parent = sectionFrame
				toggle.Visible = true
				toggle.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke
				if not toggle:FindFirstChild("UIStroke") then
					local toggleStroke = Instance.new("UIStroke")
					toggleStroke.Color = ThemeSystem.Current.Accent
					toggleStroke.Thickness = 1
					toggleStroke.Transparency = 0.5
					toggleStroke.Parent = toggle
					ThemeSystem:RegisterTheme(toggleStroke, "Accent")
				end

				local label = toggle:FindFirstChildOfClass("TextLabel")
				if label then
					label.Text = ToggleSettings.Name or "Toggle"
					label.TextColor3 = ThemeSystem.Current.Accent
					ThemeSystem:RegisterTheme(label, "Accent")
				end

				local circleButton = toggle:FindFirstChild("Circle") or Instance.new("TextButton")
				circleButton.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Enhanced circle stroke
				if not circleButton:FindFirstChild("UIStroke") then
					local circleStroke = Instance.new("UIStroke")
					circleStroke.Color = ThemeSystem.Current.Accent
					circleStroke.Thickness = 1.5
					circleStroke.Transparency = 0.4
					circleStroke.Parent = circleButton
					ThemeSystem:RegisterTheme(circleStroke, "Accent")
				end

				local toggled = ToggleSettings.Default or false
				
				circleButton.MouseButton1Click:Connect(function()
					toggled = not toggled
					circleButton.BackgroundColor3 = toggled and ThemeSystem.Current.Accent or ThemeSystem.Current.ElementBg
					
					if ToggleSettings.Callback then
						ToggleSettings.Callback(toggled)
					end
					
					if ToggleSettings.Flag then
						PhantomUILibrary.Flags[ToggleSettings.Flag] = toggled
					end
				end)

				if ToggleSettings.Flag then
					PhantomUILibrary.Flags[ToggleSettings.Flag] = toggled
				end

				return toggle
			end

			function section:CreateSlider(SliderSettings)
				SliderSettings = SliderSettings or {}
				
				local sliderFrame = sectionFrame:FindFirstChild("SliderTemplate") or Instance.new("Frame")
				local slider = sliderFrame:Clone()
				slider.Name = SliderSettings.Name or "Slider"
				slider.Parent = sectionFrame
				slider.Visible = true
				slider.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke
				if not slider:FindFirstChild("UIStroke") then
					local sliderStroke = Instance.new("UIStroke")
					sliderStroke.Color = ThemeSystem.Current.Accent
					sliderStroke.Thickness = 1
					sliderStroke.Transparency = 0.5
					sliderStroke.Parent = slider
					ThemeSystem:RegisterTheme(sliderStroke, "Accent")
				end

				local label = slider:FindFirstChildOfClass("TextLabel")
				if label then
					label.Text = SliderSettings.Name or "Slider"
					label.TextColor3 = ThemeSystem.Current.Accent
					ThemeSystem:RegisterTheme(label, "Accent")
				end

				local sliderBar = slider:FindFirstChild("SliderBar") or Instance.new("Frame")
				sliderBar.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add slider bar stroke
				if not sliderBar:FindFirstChild("UIStroke") then
					local barStroke = Instance.new("UIStroke")
					barStroke.Color = ThemeSystem.Current.Accent
					barStroke.Thickness = 1
					barStroke.Transparency = 0.5
					barStroke.Parent = sliderBar
					ThemeSystem:RegisterTheme(barStroke, "Accent")
				end

				local sliderFill = sliderBar:FindFirstChild("Fill") or Instance.new("Frame")
				sliderFill.BackgroundColor3 = ThemeSystem.Current.Accent
				sliderFill.Parent = sliderBar

				ThemeSystem:RegisterTheme(sliderFill, "Accent")

				local min = SliderSettings.Min or 0
				local max = SliderSettings.Max or 100
				local value = SliderSettings.Default or min

				local function updateSlider(inputPosition)
					local relativePosition = math.max(0, math.min(1, (inputPosition.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X))
					value = min + (relativePosition * (max - min))
					sliderFill.Size = UDim2.new(relativePosition, 0, 1, 0)

					if SliderSettings.Callback then
						SliderSettings.Callback(math.round(value))
					end

					if SliderSettings.Flag then
						PhantomUILibrary.Flags[SliderSettings.Flag] = math.round(value)
					end
				end

				sliderBar.InputBegan:Connect(function(input, gameProcessed)
					if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
						updateSlider(input.Position)
					end
				end)

				UserInputService.InputChanged:Connect(function(input, gameProcessed)
					if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseMovement then
						if UserInputService:IsMouseButtonPressed(Enum.UserInputButton.Left) then
							updateSlider(input.Position)
						end
					end
				end)

				if SliderSettings.Flag then
					PhantomUILibrary.Flags[SliderSettings.Flag] = math.round(value)
				end

				return slider
			end

			function section:CreateLabel(LabelText, Icon)
				local labelFrame = sectionFrame:FindFirstChild("LabelTemplate") or Instance.new("TextLabel")
				local label = labelFrame:Clone()
				label.Name = "Label"
				label.Parent = sectionFrame
				label.Visible = true
				label.Text = LabelText or "Label"
				label.TextColor3 = ThemeSystem.Current.Accent
				label.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke
				if not label:FindFirstChild("UIStroke") then
					local labelStroke = Instance.new("UIStroke")
					labelStroke.Color = ThemeSystem.Current.Accent
					labelStroke.Thickness = 0.8
					labelStroke.Transparency = 0.6
					labelStroke.Parent = label
					ThemeSystem:RegisterTheme(labelStroke, "Accent")
				end

				ThemeSystem:RegisterTheme(label, "Accent")

				return label
			end

			function section:CreateInput(InputSettings)
				InputSettings = InputSettings or {}
				
				local inputFrame = sectionFrame:FindFirstChild("InputTemplate") or Instance.new("Frame")
				local input = inputFrame:Clone()
				input.Name = InputSettings.Name or "Input"
				input.Parent = sectionFrame
				input.Visible = true
				input.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke to input frame
				if not input:FindFirstChild("UIStroke") then
					local inputStroke = Instance.new("UIStroke")
					inputStroke.Color = ThemeSystem.Current.Accent
					inputStroke.Thickness = 1
					inputStroke.Transparency = 0.5
					inputStroke.Parent = input
					ThemeSystem:RegisterTheme(inputStroke, "Accent")
				end

				local textBox = input:FindFirstChildOfClass("TextBox")
				if textBox then
					textBox.PlaceholderText = InputSettings.Placeholder or "Enter text..."
					textBox.TextColor3 = ThemeSystem.Current.Accent
					textBox.BackgroundColor3 = ThemeSystem.Current.ElementBg
					textBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)

					-- Add glow to textbox
					if not textBox:FindFirstChild("UIStroke") then
						local textStroke = Instance.new("UIStroke")
						textStroke.Color = ThemeSystem.Current.Accent
						textStroke.Thickness = 1
						textStroke.Transparency = 0.5
						textStroke.Parent = textBox
						ThemeSystem:RegisterTheme(textStroke, "Accent")
					end

					ThemeSystem:RegisterTheme(textBox, "Accent")

					textBox.FocusLost:Connect(function()
						if InputSettings.Callback then
							InputSettings.Callback(textBox.Text)
						end
						if InputSettings.Flag then
							PhantomUILibrary.Flags[InputSettings.Flag] = textBox.Text
						end
					end)
				end

				if InputSettings.Flag then
					PhantomUILibrary.Flags[InputSettings.Flag] = ""
				end

				return input
			end

			function section:CreateDropdown(DropdownSettings)
				DropdownSettings = DropdownSettings or {}
				
				local dropdownFrame = sectionFrame:FindFirstChild("DropdownTemplate") or Instance.new("Frame")
				local dropdown = dropdownFrame:Clone()
				dropdown.Name = DropdownSettings.Name or "Dropdown"
				dropdown.Parent = sectionFrame
				dropdown.Visible = true
				dropdown.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke to dropdown frame
				if not dropdown:FindFirstChild("UIStroke") then
					local dropdownStroke = Instance.new("UIStroke")
					dropdownStroke.Color = ThemeSystem.Current.Accent
					dropdownStroke.Thickness = 1
					dropdownStroke.Transparency = 0.5
					dropdownStroke.Parent = dropdown
					ThemeSystem:RegisterTheme(dropdownStroke, "Accent")
				end

				local selectedValue = DropdownSettings.Default or (DropdownSettings.Options and DropdownSettings.Options[1]) or ""
				
				local mainButton = dropdown:FindFirstChildOfClass("TextButton")
				if mainButton then
					mainButton.Text = selectedValue
					mainButton.TextColor3 = ThemeSystem.Current.Accent
					mainButton.BackgroundColor3 = ThemeSystem.Current.ElementBg
					ThemeSystem:RegisterTheme(mainButton, "Accent")
				end

				local dropdownContent = dropdown:FindFirstChild("Content") or Instance.new("Frame")
				dropdownContent.BackgroundColor3 = ThemeSystem.Current.Secondary
				
				local function updateDropdown()
					dropdownContent:ClearAllChildren()
					
					for _, option in ipairs(DropdownSettings.Options or {}) do
						local optionButton = Instance.new("TextButton")
						optionButton.Name = option
						optionButton.Text = option
						optionButton.TextColor3 = ThemeSystem.Current.Accent
						optionButton.BackgroundColor3 = ThemeSystem.Current.ElementBg
						optionButton.Size = UDim2.new(1, 0, 0, 30)
						optionButton.Parent = dropdownContent

						-- Add glow to options
						local optionStroke = Instance.new("UIStroke")
						optionStroke.Color = ThemeSystem.Current.Accent
						optionStroke.Thickness = 0.5
						optionStroke.Transparency = 0.7
						optionStroke.Parent = optionButton
						ThemeSystem:RegisterTheme(optionStroke, "Accent")

						optionButton.MouseButton1Click:Connect(function()
							selectedValue = option
							mainButton.Text = option
							dropdownContent.Visible = false

							if DropdownSettings.Callback then
								DropdownSettings.Callback(option)
							end

							if DropdownSettings.Flag then
								PhantomUILibrary.Flags[DropdownSettings.Flag] = option
							end
						end)
					end
				end

				mainButton.MouseButton1Click:Connect(function()
					dropdownContent.Visible = not dropdownContent.Visible
					if dropdownContent.Visible then
						updateDropdown()
					end
				end)

				if DropdownSettings.Flag then
					PhantomUILibrary.Flags[DropdownSettings.Flag] = selectedValue
				end

				return dropdown
			end

			function section:CreateColorPicker(ColorPickerSettings)
				ColorPickerSettings = ColorPickerSettings or {}
				
				local pickerFrame = sectionFrame:FindFirstChild("ColorPickerTemplate") or Instance.new("Frame")
				local picker = pickerFrame:Clone()
				picker.Name = ColorPickerSettings.Name or "Color Picker"
				picker.Parent = sectionFrame
				picker.Visible = true
				picker.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke to picker frame
				if not picker:FindFirstChild("UIStroke") then
					local pickerStroke = Instance.new("UIStroke")
					pickerStroke.Color = ThemeSystem.Current.Accent
					pickerStroke.Thickness = 1.5
					pickerStroke.Transparency = 0.4
					pickerStroke.Parent = picker
					ThemeSystem:RegisterTheme(pickerStroke, "Accent")
				end

				local selectedColor = ColorPickerSettings.Default or Color3.fromRGB(255, 255, 255)
				
				local colorDisplay = picker:FindFirstChildOfClass("Frame")
				if colorDisplay then
					colorDisplay.BackgroundColor3 = selectedColor
					
					-- Add border to color display
					if not colorDisplay:FindFirstChild("UIStroke") then
						local displayStroke = Instance.new("UIStroke")
						displayStroke.Color = ThemeSystem.Current.Accent
						displayStroke.Thickness = 1
						displayStroke.Transparency = 0.5
						displayStroke.Parent = colorDisplay
						ThemeSystem:RegisterTheme(displayStroke, "Accent")
					end
				end

				if ColorPickerSettings.Flag then
					PhantomUILibrary.Flags[ColorPickerSettings.Flag] = selectedColor
				end

				return picker
			end

			function section:CreateKeybind(KeybindSettings)
				KeybindSettings = KeybindSettings or {}
				
				local keybindFrame = sectionFrame:FindFirstChild("KeybindTemplate") or Instance.new("Frame")
				local keybind = keybindFrame:Clone()
				keybind.Name = KeybindSettings.Name or "Keybind"
				keybind.Parent = sectionFrame
				keybind.Visible = true
				keybind.BackgroundColor3 = ThemeSystem.Current.ElementBg

				-- Add glow stroke to keybind frame
				if not keybind:FindFirstChild("UIStroke") then
					local keybindStroke = Instance.new("UIStroke")
					keybindStroke.Color = ThemeSystem.Current.Accent
					keybindStroke.Thickness = 1.5
					keybindStroke.Transparency = 0.4
					keybindStroke.Parent = keybind
					ThemeSystem:RegisterTheme(keybindStroke, "Accent")
				end

				local button = keybind:FindFirstChildOfClass("TextButton")
				if button then
					button.Text = KeybindSettings.Default or "None"
					button.TextColor3 = ThemeSystem.Current.Accent
					button.BackgroundColor3 = ThemeSystem.Current.ElementBg
					ThemeSystem:RegisterTheme(button, "Accent")

					-- Add button stroke
					if not button:FindFirstChild("UIStroke") then
						local buttonStroke = Instance.new("UIStroke")
						buttonStroke.Color = ThemeSystem.Current.Accent
						buttonStroke.Thickness = 1
						buttonStroke.Transparency = 0.5
						buttonStroke.Parent = button
						ThemeSystem:RegisterTheme(buttonStroke, "Accent")
					end

					local boundKey = KeybindSettings.Default
					local listening = false

					button.MouseButton1Click:Connect(function()
						listening = not listening
						button.Text = listening and "[LISTENING...]" or (boundKey or "None")
					end)

					UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if not listening or gameProcessed then return end
						
						if input.UserInputType == Enum.UserInputType.Keyboard then
							boundKey = tostring(input.KeyCode)
							button.Text = boundKey
							listening = false

							if KeybindSettings.Callback then
								KeybindSettings.Callback()
							end

							if KeybindSettings.Flag then
								PhantomUILibrary.Flags[KeybindSettings.Flag] = boundKey
							end
						end
					end)

					if KeybindSettings.Flag then
						PhantomUILibrary.Flags[KeybindSettings.Flag] = boundKey or ""
					end
				end

				return keybind
			end

			function section:CreateDivider()
				local divider = Instance.new("Frame")
				divider.Name = "Divider"
				divider.Size = UDim2.new(1, 0, 0, 2)
				divider.BackgroundColor3 = ThemeSystem.Current.Accent
				divider.BorderSizePixel = 0
				divider.Parent = sectionFrame
				
				ThemeSystem:RegisterTheme(divider, "Accent")
				return divider
			end

			function section:CreateParagraph(ParagraphSettings)
				ParagraphSettings = ParagraphSettings or {}
				
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = "Paragraph"
				textLabel.Size = UDim2.new(1, 0, 0, 50)
				textLabel.BackgroundTransparency = 1
				textLabel.TextColor3 = ThemeSystem.Current.Text
				textLabel.TextWrapped = true
				textLabel.Text = ParagraphSettings.Content or ""
				textLabel.Parent = sectionFrame
				
				ThemeSystem:RegisterTheme(textLabel, "Text")
				return textLabel
			end

			table.insert(tab.Sections, section)
			return section
		end

		table.insert(Window.Tabs, tab)
		return tab
	end

	return Window
end

-- ================================================================================
-- LIBRARY METHODS
-- ================================================================================

function PhantomUILibrary:SetVisibility(visibility)
	Main.Visible = visibility
end

function PhantomUILibrary:IsVisible()
	return Main.Visible
end

function PhantomUILibrary:ChangeTheme(themeName)
	if ThemeSystem.Themes[themeName] then
		ThemeSystem:ApplyTheme(themeName)
	else
		warn("PhantomUI | Theme not found: " .. tostring(themeName))
	end
end

function PhantomUILibrary:SaveConfiguration()
	if not CEnabled or not CFileName then return end
	
	ensureFolder(PhantomUIFolder)
	
	local success, result = pcall(function()
		local configData = HttpService:JSONEncode(PhantomUILibrary.Flags)
		local configPath = PhantomUIFolder .. "/" .. CFileName .. ConfigurationExtension
		writefile(configPath, configData)
	end)

	if not success then
		warn("PhantomUI | Failed to save configuration: " .. tostring(result))
	end
end

function PhantomUILibrary:LoadConfiguration()
	if not CEnabled or not CFileName then return end
	
	local configPath = PhantomUIFolder .. "/" .. CFileName .. ConfigurationExtension
	
	if not isfile(configPath) then return end
	
	local success, result = pcall(function()
		local configData = readfile(configPath)
		local flags = HttpService:JSONDecode(configData)
		
		for flagName, flagValue in pairs(flags) do
			PhantomUILibrary.Flags[flagName] = flagValue
		end
	end)

	if not success then
		warn("PhantomUI | Failed to load configuration: " .. tostring(result))
	end
end

function PhantomUILibrary:Destroy()
	if phantomDestroyed then return end
	phantomDestroyed = true

	for _, connection in pairs(keybindConnections) do
		connection:Disconnect()
	end

	if PhantomUI and PhantomUI.Parent then
		PhantomUI:Destroy()
	end
end

-- ================================================================================
-- INITIALIZATION
-- ================================================================================

if debugX then
	warn('PhantomUI initialized successfully')
	warn('Theme System: Loaded')
	warn('Configuration: Ready')
	warn('Library: Ready')
end

return PhantomUILibrary
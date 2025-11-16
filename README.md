# ⚡ FATALITY UI Framework  
**A modular and modern UI system for Roblox script hubs.**

This framework allows you to easily build custom GUIs with menus, sliders, toggles, dropdowns, and notifications — all with beautiful theming support.

---

## 🚀 Loading the Library

```lua

local Fatality = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/FATALITY/refs/heads/main/FATALITYSOURCE.lua"))()
local Notification = Fatality:CreateNotifier()

Fatality:Loader({
	Name = "FATALITY",
	Duration = 4
})

Notification:Notify({
	Title = "FATALITY",
	Content = "Hello, " .. game.Players.LocalPlayer.DisplayName .. "! Welcome back.",
	Icon = "clipboard"
})
```

---

## 🪟 Creating a Window

```lua
local Window = Fatality.new({
	Name = "FATALITY",
	Expire = "never",
})

local Config = Window:AddConfig()
Config:Init("Counter-Strike 2", "Fatality-Win")
```

---

## 🧩 Adding Menus

```lua
local Rage = Window:AddMenu({
	Name = "RAGE",
	Icon = "skull"
})
```

---

## 📂 Adding Sections

```lua
local Weapon = Rage:AddSection({
	Position = "left",
	Name = "WEAPON"
})

local Extra = Rage:AddSection({
	Position = "center",
	Name = "EXTRA"
})

local General = Rage:AddSection({
	Position = "right",
	Name = "GENERAL"
})
```

---

## 🎚️ Sliders

```lua
Weapon:AddSlider({
	Name = "Hit-chance",
	Flag = "Hit-chance",
	Default = 61,
	Callback = function(value)
		-- your code here
	end
})
```

---

## 🧠 Dropdowns

### Single-select Dropdown
```lua
Weapon:AddDropdown({
	Name = "Hitboxes",
	Flag = "Hitboxes",
	Values = {"Head", "Neck", "Arms", "Legs"},
	Callback = function(value)
		-- your code here
	end
})
```

### Multi-select Dropdown
```lua
Weapon:AddDropdown({
	Name = "Hitboxes",
	Multi = true,
	Flag = "Hitboxes",
	Default = { ["Head"] = true },
	Values = {"Head", "Neck", "Arms", "Legs"},
	Callback = function(values)
		-- your code here
	end
})
```

---

## 🔘 Toggles

### Basic Toggle
```lua
General:AddToggle({
	Name = "Zeus bot",
	Flag = "Zeus bot",
	Risky = false,
	Callback = function(enabled)
		-- your code here
	end
})
```

### Toggle with Sub-options
```lua
local NoSpread = General:AddToggle({
	Name = "No Spread",
	Flag = "No Spread",
	Risky = false,
	Option = true,
	Callback = function(val)
		-- your code here
	end
})

NoSpread.Option:AddToggle({
	Name = "Something",
	Callback = function(val)
		-- your code here
	end
})
```

---

## 🔲 Buttons

```lua
General:AddButton({
	Name = "Notification",
	Callback = function()
		-- your code here
	end
})
```

---

## 🌈 Color Pickers

### Color Picker
```lua
pc:AddColorPicker({
	Name = "Walls",
	Flag = "Walls",
	Default = Color3.fromRGB(111, 255, 0),
	Callback = function(val)
		-- your code here
	end
})
```

### Toggle with Color Picker
```lua
General:AddToggle({
	Name = "Visualize fov",
	Flag = "Visualize fov",
	Risky = false,
	Option = true,
	Callback = function(val)
		-- your code here
	end
}).Option:AddColorPicker({
	Name = "Color",
	Flag = "Color",
	Default = Color3.fromRGB(255, 34, 75),
	Callback = function(val)
		-- your code here
	end
})
```

---

## 🎮 Keybinds

```lua
Model:AddKeybind({
	Name = "Toggle",
	Flag = "Toggle",
	Callback = function(val)
		-- your code here
	end
})
```

---

## 💾 Config Saving

Add a `Flag` to your UI elements to make them savable:
```lua
Flag = "the name of the toggle"
```

This applies to:
- Toggles  
- ColorPickers  
- Dropdowns  
- Sliders  

---

### ✅ Example Structure Overview

```
Fatality (Main Loader)
├── Window
│   ├── Menu ("RAGE")
│   │   ├── Section ("WEAPON")
│   │   │   ├── Slider
│   │   │   ├── Dropdown
│   │   │   └── Multi Dropdown
│   │   ├── Section ("GENERAL")
│   │   │   ├── Toggle
│   │   │   ├── Toggle + Sub Options
│   │   │   ├── Button
│   │   │   └── Toggle + Color Picker
│   └── Config System
```

---

# Menu theme changer dropdown
```lua
local originalColors = {}

Menu:AddDropdown({
	Name = "Menu theme",
	Flag = "Menu theme",
	Values = {"Dark", "Purple"},
	Callback = function(value)
		local fatalityGui = game.CoreGui:FindFirstChild("FATALITY")
		if not fatalityGui then
			warn("Fatality GUI not found!")
			return
		end

		if value == "Purple" then
			local colors = {
				FatalFtame = Color3.fromRGB(20, 14, 40),
				DropShadow = Color3.fromRGB(163, 162, 165),
				Header = Color3.fromRGB(25, 19, 53),
				HeaderLine = Color3.fromRGB(40, 34, 68),
				MenuButton = Color3.fromRGB(23, 17, 51),
				TextButton = Color3.fromRGB(163, 162, 165),
				HeaderLineShadow = Color3.fromRGB(0, 0, 0),
				Section = Color3.fromRGB(20, 14, 40),
				Elements = Color3.fromRGB(25, 19, 53),
				ValueFrame = Color3.fromRGB(15, 9, 44),
				boxli = Color3.fromRGB(245, 49, 116),
				Button = Color3.fromRGB(15, 9, 44),
				Bottom = Color3.fromRGB(25, 19, 53),
				HeaderLine_2 = Color3.fromRGB(40, 34, 68),
				HeaderLineShadow_2 = Color3.fromRGB(0, 0, 0),
				Open = Color3.fromRGB(162, 162, 162),
				SearchFrame = Color3.fromRGB(33, 27, 61),
				SearchBox = Color3.fromRGB(23, 17, 51),
				ConfigWindowFrame = Color3.fromRGB(23, 17, 51),
				Box = Color3.fromRGB(23, 17, 51),
				InputFrame = Color3.fromRGB(23, 17, 51),
				DropdownItemFrame = Color3.fromRGB(20, 14, 49),
				ExtElementFrame = Color3.fromRGB(33, 27, 61),
				ColorPickerFrame = Color3.fromRGB(20, 14, 49),
				hexCode = Color3.fromRGB(20, 14, 49),
				UIStroke = Color3.fromRGB(47, 42, 73),
			}

			for _, obj in ipairs(fatalityGui:GetDescendants()) do
				local color = colors[obj.Name]
				if color then
					-- save original before change
					if not originalColors[obj] then
						if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextBox") then
							originalColors[obj] = obj.BackgroundColor3
						elseif obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
							originalColors[obj] = obj.TextColor3
						elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
							originalColors[obj] = obj.ImageColor3
						elseif obj:IsA("UIStroke") then
							originalColors[obj] = obj.Color
						end
					end
					-- apply purple
					pcall(function()
						if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextBox") then
							obj.BackgroundColor3 = color
						elseif obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
							obj.TextColor3 = color
						elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
							obj.ImageColor3 = color
						elseif obj:IsA("UIStroke") then
							obj.Color = color
						end
					end)
				end
			end
		else
			-- DARK: restore original colors
			for obj, color in pairs(originalColors) do
				if obj and obj.Parent then
					pcall(function()
						if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextBox") then
							obj.BackgroundColor3 = color
						elseif obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
							obj.TextColor3 = color
						elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
							obj.ImageColor3 = color
						elseif obj:IsA("UIStroke") then
							obj.Color = color
						end
					end)
				end
			end
		end
	end
})
```

✨ **Made by others edited by CludeHubs — Fatality Framework**

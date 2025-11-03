# ⚡ FATALITY UI Framework  
**A modular and modern UI system for Roblox script hubs.**

This framework allows you to easily build custom GUIs with menus, sliders, toggles, dropdowns, and notifications — all with beautiful theming support.

---

## 🚀 Loading the Library

```lua
local Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/FATALITY/refs/heads/main/Theme.lua"))()
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

Theme:ApplyTheme("Purple")

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

✨ **Made by others edited by CludeHubs — Fatality Framework**

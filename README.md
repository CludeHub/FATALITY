# Load the Fatality with notification
```lua
local Fatality = loadstring(game:HttpGet("https://raw.githubusercontent.com/CludeHub/FATALITY/refs/heads/main/FATALITYSOURCE.lua"))();
local Notification = Fatality:CreateNotifier();

Fatality:Loader({
	Name = "FATALITY",
	Duration = 4
});

Notification:Notify({
	Title = "FATALITY",
	Content = "Hello, "..game.Players.LocalPlayer.DisplayName..' Welcome back!',
	Icon = "clipboard"
})
```

# Create the Window
```lua
local Window = Fatality.new({
	Name = "FATALITY",
	Expire = "never",
});
local Config = Window:AddConfig();

Config:Init("Counter-Strike 2","Fatality-Win");

```

# Add Menu
```lua
local Rage = Window:AddMenu({
	Name = "RAGE",
	Icon = "skull"
})
```

# Add Section
```lua
	local Weapon = Rage:AddSection({
		Position = 'left',
		Name = "WEAPON"
	});
	
local Extra = Rage:AddSection({
		Position = 'center',
		Name = "EXTREA"
	});
	

local General = Rage:AddSection({
		Position = 'right',
		Name = "GENERAL"
	});
```
# Add Slider
```lua
Weapon:AddSlider({
		Name = "Hit-chance",
		Default = 61,
		Callback = function(val)
	end
})
```
# Add Dropdown
```lua
	Weapon:AddDropdown({
		Name = "Hitboxes",
		Values = {"Head",'Neck','Arms','Legs'},
        Callback = function(val)
end
	})
```

# Add Toggle
```lua
	Extra:AddToggle({
		Name = "Ignore limbs on moving",
        Callback = function(val)
end
	});
```
# Add Toggle with Option
```lua
	
	local Autostop = Extra:AddToggle({
		Name = "Aimbot",
		Option = true;
        Callback = function(val)
end
	});

	Autostop.Option:AddToggle({
		Name = "Fov Circle",
        Callback = function(val)
end
	})
```
	

# Toggle with Risky
```lua
	General:AddToggle({
		Name = "Zeus bot",
		Risky = false,
        Callback = function(val)
end
	})
```
# Toggle with Risky and Option
```lua
	local NoSpread = General:AddToggle({
		Name = "Nospread",
		Risky = false,
		Option = true,
        Callback = function(val)
end
	})

	NoSpread.Option:AddToggle({
		Name = "Something",
        Callback = function(val)
end
	})
```
# Add Button
```lua
	General:AddButton({
		Name = "Notification",
		Callback = function()
		end,
	})
```
# Multi Dropdown
```lua
	
	Aim:AddDropdown({
		Name = "Hitboxes",
		Multi = true,
		Default = {
			["Head"] = true
		},
		Values = {
			"Head",
			'Neck',
			'Arms',
			'Legs'
		},
        Callback = function(val)
end
	})
```
# Toggle with Color picker
```lua
	General:AddToggle({
		Name = "Visualize fov",
		Option = true,
        Callback = function(val)
end
	}).Option:AddColorPicker({
		Name = "Color",
		Default = Color3.fromRGB(255, 34, 75),
        Callback = function(val)
end
	})
```
# Color Picker
```lua
	pc:AddColorPicker({
		Name = "Walls",
		Default = Color3.fromRGB(111, 255, 0),
        Callback = function(val)
end
	})
```
# Add Key Bind
```lua
	Model:AddKeybind({
		Name = "Toggle",
        Callback = function(val)
end
	})
```

# Configs saver
```
Flag = "the name of the toggle" -- add this on toggles colorpickers dropdown sliders
```

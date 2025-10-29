local Theme = {}

-- Store current theme
Theme.CurrentTheme = nil

function Theme:ApplyTheme(co)
    if not co then return end
    co = co:lower() -- case-insensitive

    if co == "purple" then
        -- Define all colors
        local colors = {
            FatalFtame = Color3.fromRGB(20, 14, 49),
            DropShadow = Color3.fromRGB(163, 162, 165),
            Header = Color3.fromRGB(33, 27, 61),
            HeaderLine = Color3.fromRGB(29, 29, 29),
            tbc = Color3.fromRGB(255, 255, 255),
            MenuButton = Color3.fromRGB(43, 37, 71),
            Icon = Color3.fromRGB(255, 255, 255),
            menu_name = Color3.fromRGB(255, 255, 255),
            TextButton = Color3.fromRGB(163, 162, 165),
            UserProfile = Color3.fromRGB(255, 255, 255),
            UserIcon = Color3.fromRGB(255, 255, 255),
            User_name = Color3.fromRGB(255, 255, 255),
            expire_days = Color3.fromRGB(255, 255, 255),
            HeaderLineShadow = Color3.fromRGB(0, 0, 0),
            MenuFrame = Color3.fromRGB(255, 255, 255),
            MenuLiber = Color3.fromRGB(255, 255, 255),
            Left = Color3.fromRGB(255, 255, 255),
            Center = Color3.fromRGB(255, 255, 255),
            Right = Color3.fromRGB(255, 255, 255),
            Section = Color3.fromRGB(33, 27, 61),
            Elements = Color3.fromRGB(23, 17, 51),
            SpaceBox = Color3.fromRGB(255, 255, 255),
            Slider = Color3.fromRGB(255, 255, 255),
            Slider_Name = Color3.fromRGB(255, 255, 255),
            ValueFrame = Color3.fromRGB(20, 14, 49),
            OptionButton = Color3.fromRGB(255, 255, 255),
            boxli = Color3.fromRGB(245, 49, 116),
            ValueText = Color3.fromRGB(255, 255, 255),
            Dropdown = Color3.fromRGB(255, 255, 255),
            Dropdown_Name = Color3.fromRGB(255, 255, 255),
            icon = Color3.fromRGB(255, 255, 255),
            Value_Text = Color3.fromRGB(255, 255, 255),
            Toggle = Color3.fromRGB(255, 255, 255),
            Toggle_Name = Color3.fromRGB(255, 255, 255),
            Button = Color3.fromRGB(245, 49, 116),
            Button_Name = Color3.fromRGB(255, 255, 255),
            ColorPicker_Name = Color3.fromRGB(255, 255, 255),
            Keybind = Color3.fromRGB(255, 255, 255),
            Keybind_Name = Color3.fromRGB(255, 255, 255),
            SectionName = Color3.fromRGB(255, 255, 255),
            Bottom = Color3.fromRGB(33, 27, 61),
            HeaderLine_2 = Color3.fromRGB(29, 29, 29),
            HeaderLineShadow_2 = Color3.fromRGB(0, 0, 0),
            InfoButton = Color3.fromRGB(255, 255, 255),
            SearchButton = Color3.fromRGB(255, 255, 255),
            SaveButton = Color3.fromRGB(255, 255, 255),
            ConfigButton = Color3.fromRGB(255, 255, 255),
            Open = Color3.fromRGB(162, 162, 162),
            SearchFrame = Color3.fromRGB(33, 27, 61),
            SearchBox = Color3.fromRGB(23, 17, 51),
            TextBox = Color3.fromRGB(255, 255, 255),
            ScrollingFrame = Color3.fromRGB(255, 255, 255),
            ConfigWindowFrame = Color3.fromRGB(23, 17, 51),
            Box = Color3.fromRGB(23, 17, 51),
            InputFrame = Color3.fromRGB(23, 17, 51),
            DropdownItemFrame = Color3.fromRGB(20, 14, 49),
            db_selected = Color3.fromRGB(255, 255, 255),
            ExtElementFrame = Color3.fromRGB(33, 27, 61),
            ColorPickerFrame = Color3.fromRGB(20, 14, 49),
            Color0pc = Color3.fromRGB(102, 255, 0),
            Color0pt = Color3.fromRGB(102, 255, 0),
            hexCode = Color3.fromRGB(20, 14, 49),
            HexCodeText = Color3.fromRGB(255, 255, 255)
        }

        local fatalityGui = game.CoreGui:FindFirstChild("FATALITY")
        if not fatalityGui then
            warn("Fatality GUI not found!")
            return
        end

        -- Update object color safely
        local function updateColor(obj)
            local color = colors[obj.Name]
            if not color then return end

            pcall(function()
                if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextBox") then
                    obj.BackgroundColor3 = color
                end
                if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                    obj.TextColor3 = color
                end
                if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                    obj.ImageColor3 = color
                end
                if obj:IsA("UIStroke") then
                    obj.Color = color
                end
            end)
        end

        -- Apply colors recursively
        local function applyColorsRecursively(parent)
            for _, obj in ipairs(parent:GetDescendants()) do
                updateColor(obj)
            end
            updateColor(parent)
        end

        -- Watch property changes for auto-correct
        local function watchProperties(obj)
            local props = {}
            if obj:IsA("Frame") or obj:IsA("ScrollingFrame") or obj:IsA("TextBox") then table.insert(props, "BackgroundColor3") end
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then table.insert(props, "TextColor3") end
            if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then table.insert(props, "ImageColor3") end
            if obj:IsA("UIStroke") then table.insert(props, "Color") end

            for _, prop in ipairs(props) do
                obj:GetPropertyChangedSignal(prop):Connect(function()
                    updateColor(obj)
                end)
            end
        end

        -- Initial application
        applyColorsRecursively(fatalityGui)

        -- Watch existing and future objects
        for _, obj in ipairs(fatalityGui:GetDescendants()) do
            watchProperties(obj)
        end
        fatalityGui.DescendantAdded:Connect(function(obj)
            updateColor(obj)
            watchProperties(obj)
        end)

        Theme.CurrentTheme = co
    else
        print("Theme not recognized!")
    end
end

return Theme

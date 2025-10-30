local Theme = {}


Theme.CurrentTheme = nil

function Theme:ApplyTheme(co)
    if not co then return end
    co = co:lower() 

    if co == "purple" then
        
        local colors = {
            FatalFtame = Color3.fromRGB(20, 14, 49),
            DropShadow = Color3.fromRGB(163, 162, 165),
            Header = Color3.fromRGB(23, 17, 51),
            HeaderLine = Color3.fromRGB(40, 34, 68),
            MenuButton = Color3.fromRGB(43, 37, 71),
            TextButton = Color3.fromRGB(163, 162, 165),
            HeaderLineShadow = Color3.fromRGB(0, 0, 0),
            Section = Color3.fromRGB(33, 27, 61),
            Elements = Color3.fromRGB(23, 17, 51),
            ValueFrame = Color3.fromRGB(15, 9, 44),
            boxli = Color3.fromRGB(245, 49, 116),
            Button = Color3.fromRGB(15, 9, 44),
            Bottom = Color3.fromRGB(23, 17, 51),
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
        }

        local fatalityGui = game.CoreGui:FindFirstChild("FATALITY")
        if not fatalityGui then
            warn("Fatality GUI not found!")
            return
        end

        
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

        
        local function applyColorsRecursively(parent)
            for _, obj in ipairs(parent:GetDescendants()) do
                updateColor(obj)
            end
            updateColor(parent)
        end

        
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

    
        applyColorsRecursively(fatalityGui)

        
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

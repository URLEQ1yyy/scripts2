local Plrs = game:GetService("Players")
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local WS = game:GetService("Workspace")
local TS = game:GetService("TeleportService")
local HS = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local LP = Plrs.LocalPlayer
local Cam = WS.CurrentCamera

-- Рандомизация сигнатур для обхода сканеров античита (Bypass signature scan)
local TAG = "SysCore_Hook_" .. math.random(100000, 999999)
local FILE = "cfg_" .. math.random(1000, 9999) .. ".dat"
local KEY_FILE = "sec_" .. math.random(1000, 9999) .. ".dat"

if _G[TAG] then pcall(function() _G[TAG]() end) end

local SHOP_URL = "https://funpay.com/lots/offer?id=79459602"

local VALID_KEYS = {
    ["URLEQ1yyy-LIFE-9A2K-7F4X"] = true,
    ["URLEQ1yyy-LIFE-3B8M-1P5Z"] = true,
    ["URLEQ1yyy-LIFE-8C4N-6Q2W"] = true,
    ["URLEQ1yyy-LIFE-5D9P-4R8Y"] = true,
    ["URLEQ1yyy-LIFE-2E1Q-9S3V"] = true,
    ["URLEQ1yyy-LIFE-7F6R-8T1U"] = true,
    ["URLEQ1yyy-LIFE-4G3S-5U7T"] = true,
    ["URLEQ1yyy-LIFE-1H5T-2V9R"] = true,
    ["URLEQ1yyy-LIFE-6J8U-3W4P"] = true,
    ["URLEQ1yyy-LIFE-0K2V-7X6M"] = true
}

local isAuthorized = false

pcall(function()
    if readfile and isfile and isfile(KEY_FILE) then
        local savedData = HS:JSONDecode(readfile(KEY_FILE))
        if savedData then
            if savedData.type == "lifetime" and VALID_KEYS[savedData.key] then
                isAuthorized = true
            elseif savedData.type == "trial" and os.time() < savedData.expireTime then
                isAuthorized = true
            end
        end
    end
end)

local guiTarget = CoreGui:FindFirstChild("RobloxGui") or LP:WaitForChild("PlayerGui")

if not isAuthorized then
    local keySg = Instance.new("ScreenGui")
    keySg.Name = "Auth_" .. math.random(100, 999)
    keySg.ResetOnSpawn = false
    keySg.Parent = guiTarget

    local keyFrame = Instance.new("Frame")
    keyFrame.Size = UDim2.new(0, 300, 0, 235)
    keyFrame.Position = UDim2.new(0.5, -150, 0.5, -115)
    keyFrame.BackgroundColor3 = Color3.fromRGB(20, 18, 15)
    keyFrame.BorderSizePixel = 0
    keyFrame.Active = true
    keyFrame.Draggable = true
    keyFrame.Parent = keySg

    local kCorner = Instance.new("UICorner")
    kCorner.CornerRadius = UDim.new(0, 10)
    kCorner.Parent = keyFrame

    local kTitle = Instance.new("TextLabel")
    kTitle.Size = UDim2.new(1, 0, 0, 25)
    kTitle.Position = UDim2.new(0, 0, 0, 10)
    kTitle.BackgroundTransparency = 1
    kTitle.Text = "✿ URLEQ1yyy HUB ✿"
    kTitle.TextColor3 = Color3.fromRGB(252, 186, 3)
    kTitle.TextSize = 15
    kTitle.Font = Enum.Font.SourceSansBold
    kTitle.Parent = keyFrame

    local kSmile = Instance.new("TextLabel")
    kSmile.Size = UDim2.new(1, 0, 0, 18)
    kSmile.Position = UDim2.new(0, 0, 0, 30)
    kSmile.BackgroundTransparency = 1
    kSmile.Text = "(˶ᵔ ᵕ ᵔ˶)"
    kSmile.TextColor3 = Color3.fromRGB(252, 186, 3)
    kSmile.TextSize = 15
    kSmile.Font = Enum.Font.SourceSans
    kSmile.Parent = keyFrame

    local keyBox = Instance.new("TextBox")
    keyBox.Size = UDim2.new(1, -40, 0, 32)
    keyBox.Position = UDim2.new(0, 20, 0, 58)
    keyBox.BackgroundColor3 = Color3.fromRGB(35, 30, 25)
    keyBox.BorderSizePixel = 0
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyBox.PlaceholderText = "Enter lifetime key..."
    keyBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    keyBox.Text = ""
    keyBox.TextSize = 13
    keyBox.Font = Enum.Font.SourceSansSemibold
    keyBox.Parent = keyFrame

    local kbCorner = Instance.new("UICorner")
    kbCorner.CornerRadius = UDim.new(0, 6)
    kbCorner.Parent = keyBox

    local submitBtn = Instance.new("TextButton")
    submitBtn.Size = UDim2.new(1, -40, 0, 30)
    submitBtn.Position = UDim2.new(0, 20, 0, 98)
    submitBtn.BackgroundColor3 = Color3.fromRGB(55, 45, 30)
    submitBtn.BorderSizePixel = 0
    submitBtn.TextColor3 = Color3.fromRGB(252, 186, 3)
    submitBtn.Text = "ACTIVATE KEY"
    submitBtn.TextSize = 13
    submitBtn.Font = Enum.Font.SourceSansBold
    submitBtn.Parent = keyFrame

    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 6)
    sCorner.Parent = submitBtn

    local trialBtn = Instance.new("TextButton")
    trialBtn.Size = UDim2.new(1, -40, 0, 30)
    trialBtn.Position = UDim2.new(0, 20, 0, 136)
    trialBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 25)
    trialBtn.BorderSizePixel = 0
    trialBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    trialBtn.Text = "GET 12-HOUR TRIAL"
    trialBtn.TextSize = 13
    trialBtn.Font = Enum.Font.SourceSansBold
    trialBtn.Parent = keyFrame

    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 6)
    tCorner.Parent = trialBtn

    local buyBtn = Instance.new("TextButton")
    buyBtn.Size = UDim2.new(1, -40, 0, 30)
    buyBtn.Position = UDim2.new(0, 20, 0, 174)
    buyBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 45)
    buyBtn.BorderSizePixel = 0
    buyBtn.TextColor3 = Color3.fromRGB(255, 105, 180)
    buyBtn.Text = "BUY LIFETIME ($1)"
    buyBtn.TextSize = 13
    buyBtn.Font = Enum.Font.SourceSansBold
    buyBtn.Parent = keyFrame

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 6)
    bCorner.Parent = buyBtn

    local function verify()
        pcall(function()
            local inputKey = string.gsub(keyBox.Text, "%s+", "")
            if VALID_KEYS[inputKey] then
                isAuthorized = true
                pcall(function()
                    if writefile then
                        writefile(KEY_FILE, HS:JSONEncode({type = "lifetime", key = inputKey}))
                    end
                end)
                keySg:Destroy()
            else
                keyBox.Text = ""
                keyBox.PlaceholderText = "Invalid Key! Try again."
            end
        end)
    end

    submitBtn.MouseButton1Click:Connect(verify)
    keyBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then verify() end
    end)

    trialBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local expireTime = os.time() + 43200
            isAuthorized = true
            pcall(function()
                if writefile then
                    writefile(KEY_FILE, HS:JSONEncode({type = "trial", expireTime = expireTime}))
                end
            end)
            keySg:Destroy()
        end)
    end)

    buyBtn.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then
                setclipboard(SHOP_URL)
                buyBtn.Text = "LINK COPIED TO CLIPBOARD!"
            else
                buyBtn.Text = "CHECK CONSOLE FOR LINK"
            end
        end)
    end)

    while not isAuthorized do
        task.wait(0.1)
    end
end

-- ==========================================
-- ОСНОВНОЙ СКРИПТ (С АНДЕТЕКТ-БАЙПАСОМ)
-- ==========================================

local keyOpts = {
    {n = "Right Mouse", type = "uis", val = Enum.UserInputType.MouseButton2},
    {n = "Key: Left Shift", type = "key", val = Enum.KeyCode.LeftShift},
    {n = "Key: Left Ctrl", type = "key", val = Enum.KeyCode.LeftControl},
    {n = "Key: E", type = "key", val = Enum.KeyCode.E},
    {n = "Key: Q", type = "key", val = Enum.KeyCode.Q},
    {n = "Key: C", type = "key", val = Enum.KeyCode.C},
    {n = "Key: X", type = "key", val = Enum.KeyCode.X},
    {n = "Key: V", type = "key", val = Enum.KeyCode.V},
    {n = "Key: F", type = "key", val = Enum.KeyCode.F}
}

local partOpts = {
    {n = "Head", k = "Head"},
    {n = "Torso", k = "HumanoidRootPart"},
    {n = "Random", k = "Random"}
}

local cfg = {
    esp = true, 
    team = true, 
    scale = 1.0, 
    dist = 700, 
    natoColor = {R = 252, G = 186, B = 3, Transp = 0},
    pactColor = {R = 255, G = 105, B = 180, Transp = 0},
    aimbot = false,
    aimTeam = true,
    aimPart = 1,
    fov = 100,
    smooth = 0.18,
    wallCheck = true,
    aimKey = 1
}

local function save()
    pcall(function()
        if writefile then writefile(FILE, HS:JSONEncode(cfg)) end
    end)
end

local function load()
    pcall(function()
        if readfile and isfile and isfile(FILE) then
            local d = HS:JSONDecode(readfile(FILE))
            if d then for k,v in pairs(d) do cfg[k] = v end end
        end
    end)
end
load()

local run, isAiming = true, false

local tabs = {
    {
        name = "ESP",
        items = {
            {n = "Visuals: ESP Boxes", t = "bool", k = "esp"},
            {n = "ESP: Team Check", t = "bool", k = "team"},
            {n = "Max Distance", t = "num", k = "dist", mn = 100, mx = 1500, st = 50},
            {n = "Color: NATO Team", t = "col", k = "natoColor"},
            {n = "Color: PACT Team", t = "col", k = "pactColor"}
        }
    },
    {
        name = "Aimbot",
        items = {
            {n = "Combat: Aimbot", t = "bool", k = "aimbot"},
            {n = "Aimbot: Team Check", t = "bool", k = "aimTeam"},
            {n = "Aimbot Target Part", t = "part", k = "aimPart"},
            {n = "Aimbot FOV", t = "num", k = "fov", mn = 20, mx = 250, st = 10},
            {n = "Aimbot Smooth", t = "num", k = "smooth", mn = 0.05, mx = 0.5, st = 0.05},
            {n = "Aimbot WallCheck", t = "bool", k = "wallCheck"},
            {n = "Aimbot Key", t = "key", k = "aimKey"}
        }
    },
    {
        name = "Settings",
        items = {
            {n = "Box Size", t = "num", k = "scale", mn = 0.5, mx = 2.0, st = 0.1},
            {n = "System: Reconnect", t = "act", a = "rejoin"},
            {n = "System: Unload Script", t = "act", a = "unload"}
        }
    }
}

local currentTabIdx = 1

local sg = Instance.new("ScreenGui")
sg.Name = "Panel_" .. math.random(1000, 9999)
sg.ResetOnSpawn = false
sg.Parent = guiTarget

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 310, 0, 340)
mainFrame.Position = UDim2.new(0.05, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 18, 15)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = sg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 22)
titleLabel.Position = UDim2.new(0, 0, 0, 6)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "✿ URLEQ1yyy HUB ✿"
titleLabel.TextColor3 = Color3.fromRGB(252, 186, 3)
titleLabel.TextSize = 15
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

local smileLabel = Instance.new("TextLabel")
smileLabel.Size = UDim2.new(1, 0, 0, 16)
smileLabel.Position = UDim2.new(0, 0, 0, 24)
smileLabel.BackgroundTransparency = 1
smileLabel.Text = "(˶ᵔ ᵕ ᵔ˶)"
smileLabel.TextColor3 = Color3.fromRGB(252, 186, 3)
smileLabel.TextSize = 15
smileLabel.Font = Enum.Font.SourceSans
smileLabel.Parent = mainFrame

local tabButtonsFolder = Instance.new("Frame")
tabButtonsFolder.Size = UDim2.new(1, -20, 0, 24)
tabButtonsFolder.Position = UDim2.new(0, 10, 0, 45)
tabButtonsFolder.BackgroundTransparency = 1
tabButtonsFolder.Parent = mainFrame

local tabUiButtons = {}
for tIdx, tabData in ipairs(tabs) do
    local tBtn = Instance.new("TextButton")
    tBtn.Size = UDim2.new(0.32, 0, 1, 0)
    tBtn.Position = UDim2.new((tIdx - 1) * 0.34, 0, 0, 0)
    tBtn.BackgroundColor3 = (tIdx == currentTabIdx) and Color3.fromRGB(55, 45, 30) or Color3.fromRGB(30, 25, 20)
    tBtn.BorderSizePixel = 0
    tBtn.TextColor3 = (tIdx == currentTabIdx) and Color3.fromRGB(252, 186, 3) or Color3.fromRGB(180, 180, 180)
    tBtn.Text = tabData.name
    tBtn.TextSize = 12
    tBtn.Font = Enum.Font.SourceSansBold
    tBtn.Parent = tabButtonsFolder
    
    local tCorner = Instance.new("UICorner")
    tCorner.CornerRadius = UDim.new(0, 5)
    tCorner.Parent = tBtn
    
    tabUiButtons[tIdx] = tBtn
end

local buttonFolder = Instance.new("ScrollingFrame")
buttonFolder.Size = UDim2.new(1, -20, 1, -85)
buttonFolder.Position = UDim2.new(0, 10, 0, 75)
buttonFolder.BackgroundTransparency = 1
buttonFolder.BorderSizePixel = 0
buttonFolder.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonFolder.ScrollBarThickness = 3
buttonFolder.Parent = mainFrame

local activeColorKey = nil
local colorPickerFrame = Instance.new("Frame")
colorPickerFrame.Size = UDim2.new(0, 260, 0, 245)
colorPickerFrame.Position = UDim2.new(1, 10, 0, 0)
colorPickerFrame.BackgroundColor3 = Color3.fromRGB(25, 22, 18)
colorPickerFrame.BorderSizePixel = 0
colorPickerFrame.Visible = false
colorPickerFrame.Parent = mainFrame

local cpCorner = Instance.new("UICorner")
cpCorner.CornerRadius = UDim.new(0, 8)
cpCorner.Parent = colorPickerFrame

local cpTitle = Instance.new("TextLabel")
cpTitle.Size = UDim2.new(1, 0, 0, 20)
cpTitle.Position = UDim2.new(0, 12, 0, 5)
cpTitle.BackgroundTransparency = 1
cpTitle.Text = "Palette"
cpTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
cpTitle.TextSize = 14
cpTitle.Font = Enum.Font.SourceSansBold
cpTitle.TextXAlignment = Enum.TextXAlignment.Left
cpTitle.Parent = colorPickerFrame

local colorBox = Instance.new("Frame")
colorBox.Size = UDim2.new(0, 236, 0, 70)
colorBox.Position = UDim2.new(0, 12, 0, 26)
colorBox.BackgroundColor3 = Color3.fromRGB(252, 186, 3)
colorBox.BorderSizePixel = 0
colorBox.Parent = colorPickerFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 4)
boxCorner.Parent = colorBox

local hueLabel = Instance.new("TextLabel")
hueLabel.Size = UDim2.new(0, 236, 0, 12)
hueLabel.Position = UDim2.new(0, 12, 0, 98)
hueLabel.BackgroundTransparency = 1
hueLabel.Text = "Hue:"
hueLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
hueLabel.TextSize = 10
hueLabel.TextXAlignment = Enum.TextXAlignment.Left
hueLabel.Parent = colorPickerFrame

local hueBar = Instance.new("TextButton")
hueBar.Size = UDim2.new(0, 236, 0, 10)
hueBar.Position = UDim2.new(0, 12, 0, 112)
hueBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
hueBar.Text = ""
hueBar.AutoButtonColor = false
hueBar.Parent = colorPickerFrame

local hbGradient = Instance.new("UIGradient")
hbGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
    ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
    ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
    ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
})
hbGradient.Parent = hueBar

local valLabel = Instance.new("TextLabel")
valLabel.Size = UDim2.new(0, 236, 0, 12)
valLabel.Position = UDim2.new(0, 12, 0, 125)
valLabel.BackgroundTransparency = 1
valLabel.Text = "Brightness / Value:"
valLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
valLabel.TextSize = 10
valLabel.TextXAlignment = Enum.TextXAlignment.Left
valLabel.Parent = colorPickerFrame

local valBar = Instance.new("TextButton")
valBar.Size = UDim2.new(0, 236, 0, 10)
valBar.Position = UDim2.new(0, 12, 0, 139)
valBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
valBar.Text = ""
valBar.AutoButtonColor = false
valBar.Parent = colorPickerFrame

local vbGradient = Instance.new("UIGradient")
vbGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
})
vbGradient.Parent = valBar

local transLabel = Instance.new("TextLabel")
transLabel.Size = UDim2.new(0, 236, 0, 12)
transLabel.Position = UDim2.new(0, 12, 0, 152)
transLabel.BackgroundTransparency = 1
transLabel.Text = "Transparency:"
transLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
transLabel.TextSize = 10
transLabel.TextXAlignment = Enum.TextXAlignment.Left
transLabel.Parent = colorPickerFrame

local transBar = Instance.new("TextButton")
transBar.Size = UDim2.new(0, 236, 0, 10)
transBar.Position = UDim2.new(0, 12, 0, 166)
transBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
transBar.Text = ""
transBar.AutoButtonColor = false
transBar.Parent = colorPickerFrame

local tbGradient = Instance.new("UIGradient")
tbGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
})
tbGradient.Parent = transBar

local hexLabel = Instance.new("TextLabel")
hexLabel.Size = UDim2.new(0, 236, 0, 24)
hexLabel.Position = UDim2.new(0, 12, 0, 182)
hexLabel.BackgroundColor3 = Color3.fromRGB(15, 13, 11)
hexLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
hexLabel.TextSize = 12
hexLabel.Font = Enum.Font.Code
hexLabel.Text = "HEX: #FCBA03"
hexLabel.Parent = colorPickerFrame

local hexCorner = Instance.new("UICorner")
hexCorner.CornerRadius = UDim.new(0, 4)
hexCorner.Parent = hexLabel

local renderedButtons = {}

local function renderTab(tIdx)
    pcall(function()
        for _, btn in pairs(renderedButtons) do
            btn:Destroy()
        end
        renderedButtons = {}
        
        currentTabIdx = tIdx
        for idx, tBtn in ipairs(tabUiButtons) do
            tBtn.BackgroundColor3 = (idx == currentTabIdx) and Color3.fromRGB(55, 45, 30) or Color3.fromRGB(30, 25, 20)
            tBtn.TextColor3 = (idx == currentTabIdx) and Color3.fromRGB(252, 186, 3) or Color3.fromRGB(180, 180, 180)
        end
        
        local activeItems = tabs[currentTabIdx].items
        buttonFolder.CanvasSize = UDim2.new(0, 0, 0, #activeItems * 29)
        
        for i, item in ipairs(activeItems) do
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 26)
            btn.Position = UDim2.new(0, 0, 0, (i - 1) * 29)
            btn.BackgroundColor3 = Color3.fromRGB(35, 30, 25)
            btn.BorderSizePixel = 0
            btn.TextColor3 = Color3.fromRGB(235, 235, 235)
            btn.TextXAlignment = Enum.TextXAlignment.Center
            btn.TextSize = 13
            btn.Font = Enum.Font.SourceSansSemibold
            btn.Parent = buttonFolder
            
            local btnCorner = Instance.new("UICorner")
            btnCorner.CornerRadius = UDim.new(0, 5)
            btnCorner.Parent = btn
            
            local function updateText()
                local txt = ""
                if item.t == "bool" then txt = cfg[item.k] and "[ ON ]" or "[ OFF ]"
                elseif item.t == "num" then 
                    if item.k == "scale" then txt = string.format("< %.1fx >", cfg[item.k])
                    elseif item.k == "smooth" then txt = string.format("< %.2f >", cfg[item.k])
                    elseif item.k =="fov" then txt = string.format("< %d >", cfg[item.k])
                    else txt = string.format("< %dm >", cfg[item.k]) end
                elseif item.t == "col" then 
                    local colData = cfg[item.k]
                    txt = string.format("< R:%d G:%d B:%d >", colData.R, colData.G, colData.B)
                elseif item.t == "key" then txt = "< " .. keyOpts[cfg[item.k]].n .. " >"
                elseif item.t == "part" then txt = "< " .. partOpts[cfg[item.k]].n .. " >"
                elseif item.t == "act" then txt = "[ Click ]" end
                btn.Text = item.n .. ": " .. txt
            end
            
            updateText()
            
            btn.MouseEnter:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(55, 45, 30)
                btn.TextColor3 = Color3.fromRGB(252, 186, 3)
            end)
            btn.MouseLeave:Connect(function()
                btn.BackgroundColor3 = Color3.fromRGB(35, 30, 25)
                btn.TextColor3 = Color3.fromRGB(235, 235, 235)
            end)
            
            btn.MouseButton1Click:Connect(function()
                pcall(function()
                    local mousePos = UIS:GetMouseLocation()
                    local btnAbsPos = btn.AbsolutePosition
                    local btnAbsSize = btn.AbsoluteSize
                    local relX = mousePos.X - btnAbsPos.X
                    local isRightSide = relX >= (btnAbsSize.X / 2)
                    
                    if item.t == "bool" then
                        cfg[item.k] = not cfg[item.k]
                        save()
                    elseif item.t == "num" then
                        local st = item.st or 1
                        if isRightSide then
                            cfg[item.k] = math.clamp(cfg[item.k] + st, item.mn, item.mx)
                        else
                            cfg[item.k] = math.clamp(cfg[item.k] - st, item.mn, item.mx)
                        end
                        save()
                    elseif item.t == "col" then
                        activeColorKey = item.k
                        colorPickerFrame.Visible = not colorPickerFrame.Visible
                    elseif item.t == "key" then
                        cfg[item.k] = cfg[item.k] + (isRightSide and 1 or -1)
                        if cfg[item.k] > #keyOpts then cfg[item.k] = 1 end
                        if cfg[item.k] < 1 then cfg[item.k] = #keyOpts end
                        save()
                    elseif item.t == "part" then
                        cfg[item.k] = cfg[item.k] + (isRightSide and 1 or -1)
                        if cfg[item.k] > #partOpts then cfg[item.k] = 1 end
                        if cfg[item.k] < 1 then cfg[item.k] = #partOpts end
                        save()
                    elseif item.t == "act" then
                        if item.a == "rejoin" then
                            if _G[TAG] then pcall(function() _G[TAG]() end) end
                            task.wait(0.2)
                            pcall(function()
                                if game.JobId ~= "" then TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP) else TS:Teleport(game.PlaceId, LP) end
                            end)
                        elseif item.a == "unload" then
                            if _G[TAG] then pcall(function() _G[TAG]() end) end
                        end
                    end
                    updateText()
                end)
            end)
            
            table.insert(renderedButtons, btn)
        end
    end)
end

for idx, tBtn in ipairs(tabUiButtons) do
    tBtn.MouseButton1Click:Connect(function()
        renderTab(idx)
    end)
end

renderTab(1)

local currentHue = 0.12
local currentVal = 1
local currentTrans = 0

local function applyColor(newCol)
    pcall(function()
        if activeColorKey and cfg[activeColorKey] then
            cfg[activeColorKey] = {
                R = math.floor(newCol.R * 255),
                G = math.floor(newCol.G * 255),
                B = math.floor(newCol.B * 255),
                Transp = currentTrans
            }
            save()
            renderTab(currentTabIdx)
        end
    end)
end

hueBar.MouseButton1Click:Connect(function()
    pcall(function()
        local mousePos = UIS:GetMouseLocation()
        local absPos = hueBar.AbsolutePosition
        local absSize = hueBar.AbsoluteSize
        currentHue = math.clamp((mousePos.X - absPos.X) / absSize.X, 0, 1)
        
        local col = Color3.fromHSV(currentHue, 1, currentVal)
        colorBox.BackgroundColor3 = col
        hexLabel.Text = string.format("HEX: #%02X%02X%02X", math.floor(col.R*255), math.floor(col.G*255), math.floor(col.B*255))
        applyColor(col)
    end)
end)

valBar.MouseButton1Click:Connect(function()
    pcall(function()
        local mousePos = UIS:GetMouseLocation()
        local absPos = valBar.AbsolutePosition
        local absSize = valBar.AbsoluteSize
        currentVal = math.clamp((mousePos.X - absPos.X) / absSize.X, 0, 1)
        
        local col = Color3.fromHSV(currentHue, 1, currentVal)
        colorBox.BackgroundColor3 = col
        hexLabel.Text = string.format("HEX: #%02X%02X%02X", math.floor(col.R*255), math.floor(col.G*255), math.floor(col.B*255))
        applyColor(col)
    end)
end)

transBar.MouseButton1Click:Connect(function()
    pcall(function()
        local mousePos = UIS:GetMouseLocation()
        local absPos = transBar.AbsolutePosition
        local absSize = transBar.AbsoluteSize
        currentTrans = math.clamp((mousePos.X - absPos.X) / absSize.X, 0, 1)
        
        local col = Color3.fromHSV(currentHue, 1, currentVal)
        applyColor(col)
    end)
end)

local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1.5
fovCircle.NumSides = 64
fovCircle.Filled = false
fovCircle.Transparency = 0.8
fovCircle.Color = Color3.fromRGB(252, 186, 3)
fovCircle.Visible = false

local function getChar(p)
    local charRes = nil
    pcall(function()
        if not p or not p.Parent then return end
        if p.Character and (p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")) then 
            charRes = p.Character 
            return
        end
        for _, f in ipairs({"Players", "Ignore", "Entities"}) do
            local c = WS:FindFirstChild(f)
            if c then
                local ch = c:FindFirstChild(p.Name, true)
                if ch and ch:IsA("Model") and (ch:FindFirstChild("Head") or ch:FindFirstChild("Torso")) then 
                    charRes = ch 
                    return
                end
            end
        end
    end)
    return charRes
end

local function getAimTargetPart(ch)
    local targetRes = nil
    pcall(function()
        local selected = partOpts[cfg.aimPart].k
        if selected == "Random" then
            targetRes = math.random(1, 2) == 1 and (ch:FindFirstChild("Head") or ch:FindFirstChild("HumanoidRootPart")) or (ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("Head"))
        else
            targetRes = ch:FindFirstChild(selected) or ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("Head")
        end
    end)
    return targetRes
end

local function isVisible(targetPart)
    local visibleRes = true
    pcall(function()
        if not cfg.wallCheck then return end
        local origin = Cam.CFrame.Position
        local direction = (targetPart.Position - origin)
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        
        local filterList = {Cam}
        if LP.Character then table.insert(filterList, LP.Character) end
        if targetPart.Parent and targetPart.Parent:IsA("Model") then
            table.insert(filterList, targetPart.Parent)
        end
        raycastParams.FilterDescendantsInstances = filterList
        
        local result = WS:Raycast(origin, direction, raycastParams)
        visibleRes = (result == nil)
    end)
    return visibleRes
end

local cache = {}
local function create(p)
    pcall(function()
        if cache[p] then return end
        local o = Drawing.new("Square")
        o.Thickness = 3
        o.Filled = false
        o.Color = Color3.fromRGB(0, 0, 0)
        o.Visible = false
        
        local b = Drawing.new("Square")
        b.Thickness = 1
        b.Filled = false
        b.Visible = false
        
        local l = Drawing.new("Text")
        l.Center = true
        l.Outline = true
        l.Color = Color3.fromRGB(255, 255, 255)
        l.Visible = false
        
        cache[p] = {o = o, b = b, l = l}
    end)
end

local function remove(p)
    pcall(function()
        if cache[p] then
            pcall(function() cache[p].o:Remove() cache[p].b:Remove() cache[p].l:Remove() end)
            cache[p] = nil
        end
    end)
end

-- Андетект-петля с плавной рандомизированной задержкой (Bypass Anti-Cheat Timer Hook)
local renderConnection
renderConnection = RS.RenderStepped:Connect(function()
    pcall(function()
        if not run then if renderConnection then renderConnection:Disconnect() end return end
        if not Cam then return end

        local cS = Cam.ViewportSize
        local centerScreen = Vector2.new(cS.X / 2, cS.Y / 2)

        fovCircle.Visible = cfg.aimbot
        fovCircle.Radius = cfg.fov
        fovCircle.Position = centerScreen
        fovCircle.Color = Color3.fromRGB(cfg.natoColor.R, cfg.natoColor.G, cfg.natoColor.B)

        local closestTarget = nil
        local shortestDist = cfg.fov

        for p, v in pairs(cache) do
            local ch = getChar(p)
            local root = ch and (ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("Head"))
            
            if root and cfg.esp and (not cfg.team or (p.Team ~= LP.Team or LP.Team == nil)) and root:IsA("BasePart") then
                local sPos, on = Cam:WorldToViewportPoint(root.Position)
                if on then
                    local dist = (Cam.CFrame.Position - root.Position).Magnitude
                    if dist <= cfg.dist then
                        local sY = math.clamp(2400 / dist, 6, 200) * cfg.scale
                        local sX = sY * 0.65
                        
                        local teamColData = cfg.natoColor
                        if p.Team then
                            local tName = string.upper(p.Team.Name)
                            if string.find(tName, "PACT") or string.find(tName, "EAST") then
                                teamColData = cfg.pactColor
                            end
                        end
                        local col = Color3.fromRGB(teamColData.R, teamColData.G, teamColData.B)
                        local transp = math.clamp(1 - (teamColData.Transp or 0), 0.1, 1)
                        
                        v.o.Size = Vector2.new(sX, sY)
                        v.o.Position = Vector2.new(sPos.X - sX / 2, sPos.Y - sY / 2)
                        v.o.Visible = true
                        v.o.Transparency = transp
                        
                        v.b.Size = v.o.Size
                        v.b.Position = v.o.Position
                        v.b.Color = col
                        v.b.Visible = true
                        v.b.Transparency = transp
                        
                        v.l.Size = dist > 300 and 12 or 14
                        v.l.Text = string.format("[%dm]", math.floor(dist * 0.3))
                        v.l.Position = Vector2.new(sPos.X, sPos.Y - (sY / 2) - 15)
                        v.l.Visible = true
                    else
                        v.o.Visible = false; v.b.Visible = false; v.l.Visible = false
                    end
                else
                    v.o.Visible = false; v.b.Visible = false; v.l.Visible = false
                end
            else
                v.o.Visible = false; v.b.Visible = false; v.l.Visible = false
            end

            if cfg.aimbot and isAiming and root and (not cfg.aimTeam or (p.Team ~= LP.Team or LP.Team == nil)) then
                local aimPart = getAimTargetPart(ch)
                if aimPart then
                    local sPos, on = Cam:WorldToViewportPoint(aimPart.Position)
                    if on and isVisible(aimPart) then
                        local screenDist = (Vector2.new(sPos.X, sPos.Y) - centerScreen).Magnitude
                        if screenDist <= shortestDist then
                            shortestDist = screenDist
                            closestTarget = aimPart
                        end
                    end
                end
            end
        end

        -- Андетект-наводка с рандомизацией шага (Humanized bypass vector interpolation)
        if cfg.aimbot and isAiming and closestTarget then
            local targetCFrame = CFrame.new(Cam.CFrame.Position, closestTarget.Position)
            local humanizedSmooth = math.clamp(cfg.smooth + (math.random() * 0.06 - 0.03), 0.05, 0.85)
            Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, humanizedSmooth)
        end
    end)
end)

task.spawn(function()
    while run do
        task.wait(0.3 + math.random() * 0.1) -- Байпас по частоте сканирования игроков
        pcall(function()
            for _, p in ipairs(Plrs:GetPlayers()) do
                if p ~= LP then
                    if getChar(p) then create(p) else remove(p) end
                end
            end
        end)
    end
end)

local inputConnection
inputConnection = UIS.InputBegan:Connect(function(inp, gpe)
    pcall(function()
        if not run then if inputConnection then inputConnection:Disconnect() end return end
        
        local curOpt = keyOpts[cfg.aimKey]
        if curOpt.type == "uis" and inp.UserInputType == curOpt.val then
            isAiming = true
        elseif curOpt.type == "key" and inp.KeyCode == curOpt.val then
            isAiming = true
        end

        if inp.KeyCode == Enum.KeyCode.Insert or inp.KeyCode == Enum.KeyCode.KeypadZero then 
            mainFrame.Visible = not mainFrame.Visible 
            return 
        end
    end)
end)

local inputEndConnection = UIS.InputEnded:Connect(function(inp)
    pcall(function()
        local curOpt = keyOpts[cfg.aimKey]
        if curOpt.type == "uis" and inp.UserInputType == curOpt.val then
            isAiming = false
        elseif curOpt.type == "key" and inp.KeyCode == curOpt.val then
            isAiming = false
        end
    end)
end)

_G[TAG] = function()
    run = false
    pcall(function() sg:Destroy() end)
    pcall(function() fovCircle:Remove() end)
    if inputEndConnection then inputEndConnection:Disconnect() end
    if inputConnection then inputConnection:Disconnect() end
    for p, _ in pairs(cache) do remove(p) end
end

Plrs.PlayerRemoving:Connect(remove)

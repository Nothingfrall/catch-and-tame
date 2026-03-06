-- [[ NEBULA HUB v19.0 – MIDNIGHT NEBULA FULL FEATURED EDITION + LASSO STRENGTH HACK ]]
-- Key: nebula666
-- Authority: iPowfu | Channel: Nebula Hub
local setclip = setclipboard or toclipboard or (syn and syn.clipboard) or (fluxus and fluxus.setClipboard) or Clipboard.set or function(txt)
    warn("[Clipboard] Executor does not support copy")
end
local ASSET_ID = "rbxassetid://108071691061975"
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NebulaFinalV19"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if gethui then ScreenGui.Parent = gethui() else ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") end

local function createNotif(title, msg, color)
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 250, 0, 60)
    NotifFrame.Position = UDim2.new(1, 20, 1, -80)
    NotifFrame.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = ScreenGui
    local Corner = Instance.new("UICorner", NotifFrame)
    Corner.CornerRadius = UDim.new(0, 6)
    local Stroke = Instance.new("UIStroke", NotifFrame)
    Stroke.Color = color
    Stroke.Thickness = 1.5
    local TTitle = Instance.new("TextLabel", NotifFrame)
    TTitle.Text = title
    TTitle.Size = UDim2.new(1, -20, 0, 25)
    TTitle.Position = UDim2.new(0, 10, 0, 5)
    TTitle.BackgroundTransparency = 1
    TTitle.TextColor3 = color
    TTitle.Font = Enum.Font.GothamBold
    TTitle.TextSize = 14
    TTitle.TextXAlignment = Enum.TextXAlignment.Left
    local TMsg = Instance.new("TextLabel", NotifFrame)
    TMsg.Text = msg
    TMsg.Size = UDim2.new(1, -20, 0, 20)
    TMsg.Position = UDim2.new(0, 10, 0, 28)
    TMsg.BackgroundTransparency = 1
    TMsg.TextColor3 = Color3.fromRGB(200, 200, 200)
    TMsg.Font = Enum.Font.Gotham
    TMsg.TextSize = 12
    TMsg.TextXAlignment = Enum.TextXAlignment.Left
    TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -270, 1, -80)}):Play()
    task.delay(3, function()
        local out = TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(1, 20, 1, -80)})
        out:Play()
        out.Completed:Connect(function() NotifFrame:Destroy() end)
    end)
end

local function saveKey(key)
    if writefile then writefile("NebulaHub_Config.json", HttpService:JSONEncode({SavedKey = key})) end
end

local function loadKey()
    if isfile and isfile("NebulaHub_Config.json") then
        local s, d = pcall(function() return HttpService:JSONDecode(readfile("NebulaHub_Config.json")) end)
        if s and d.SavedKey then return d.SavedKey end
    end
    return ""
end

local function validateKey(inputKey)
    if inputKey == "CAT888" then return true, "Success" end
    return false, "Invalid Key!"
end

local function t(obj, info, goal)
    local tween = TweenService:Create(obj, TweenInfo.new(unpack(info)), goal)
    tween:Play()
    return tween
end

local Main = Instance.new("CanvasGroup")
Main.Size = UDim2.new(0, 560, 0, 360)
Main.Position = UDim2.new(0.5, -280, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(10, 8, 18)
Main.GroupTransparency = 1
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)
local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 1.8
MainStroke.Color = Color3.fromRGB(110, 60, 255)

local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundTransparency = 1
TopBar.ZIndex = 10

local HeaderTitle = Instance.new("TextLabel", TopBar)
HeaderTitle.Text = ".iPowfu | Nebula Hub Key System"
HeaderTitle.Size = UDim2.new(1, -120, 1, 0)
HeaderTitle.Position = UDim2.new(0, 15, 0, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.TextColor3 = Color3.fromRGB(150, 140, 190)
HeaderTitle.Font = Enum.Font.GothamMedium
HeaderTitle.TextSize = 13
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left

local ControlFrame = Instance.new("Frame", TopBar)
ControlFrame.Size = UDim2.new(0, 80, 1, 0)
ControlFrame.Position = UDim2.new(1, -90, 0, 0)
ControlFrame.BackgroundTransparency = 1
local UIList = Instance.new("UIListLayout", ControlFrame)
UIList.FillDirection = Enum.FillDirection.Horizontal
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.VerticalAlignment = Enum.VerticalAlignment.Center
UIList.Padding = UDim.new(0, 8)

local function btn(col)
    local b = Instance.new("TextButton", ControlFrame)
    b.Size = UDim2.new(0, 12, 0, 12)
    b.BackgroundColor3 = col
    b.Text = ""
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    return b
end

local CloseBtn = btn(Color3.fromRGB(255, 95, 87))
local MiniBtn = btn(Color3.fromRGB(255, 189, 46))
local FullBtn = btn(Color3.fromRGB(39, 201, 63))

local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, 0, 1, -35)
Content.Position = UDim2.new(0, 0, 0, 35)
Content.BackgroundTransparency = 1

local LeftPane = Instance.new("Frame", Content)
LeftPane.Size = UDim2.new(0.38, 0, 1, 0)
LeftPane.ClipsDescendants = true
LeftPane.BorderSizePixel = 0

local BrandingImage = Instance.new("ImageLabel", LeftPane)
BrandingImage.Size = UDim2.new(1, 0, 1, 0)
BrandingImage.Image = ASSET_ID
BrandingImage.ScaleType = Enum.ScaleType.Crop
BrandingImage.ImageColor3 = Color3.fromRGB(150, 150, 150)

local LeftOverlay = Instance.new("Frame", LeftPane)
LeftOverlay.Size = UDim2.new(1, 0, 1, 0)
LeftOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LeftOverlay.BackgroundTransparency = 0.5

local LeftTitle = Instance.new("TextLabel", LeftOverlay)
LeftTitle.Text = "NEBULA\nHUB"
LeftTitle.Size = UDim2.new(1, -30, 0, 80)
LeftTitle.Position = UDim2.new(0, 20, 0, 10)
LeftTitle.BackgroundTransparency = 1
LeftTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LeftTitle.TextSize = 30
LeftTitle.Font = Enum.Font.GothamBold
LeftTitle.TextXAlignment = Enum.TextXAlignment.Left

local RightPane = Instance.new("Frame", Content)
RightPane.Size = UDim2.new(0.62, 0, 1, 0)
RightPane.Position = UDim2.new(0.38, 0, 0, 0)
RightPane.BackgroundTransparency = 1

local InputContainer = Instance.new("Frame", RightPane)
InputContainer.Size = UDim2.new(0, 240, 0, 40)
InputContainer.Position = UDim2.new(0.5, -120, 0, 125)
InputContainer.BackgroundColor3 = Color3.fromRGB(15, 12, 25)
local IC_Stroke = Instance.new("UIStroke", InputContainer)
IC_Stroke.Color = Color3.fromRGB(60, 50, 90)
Instance.new("UICorner", InputContainer).CornerRadius = UDim.new(0, 4)

local Input = Instance.new("TextBox", InputContainer)
Input.Size = UDim2.new(1, -20, 1, 0)
Input.Position = UDim2.new(0, 10, 0, 0)
Input.BackgroundTransparency = 1
Input.PlaceholderText = "> INSERT KEY HERE.. "
Input.Text = loadKey()
Input.Font = Enum.Font.Code
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 14

local LoginBtn = Instance.new("TextButton", RightPane)
LoginBtn.Size = UDim2.new(0, 240, 0, 42)
LoginBtn.Position = UDim2.new(0.5, -120, 0, 180)
LoginBtn.BackgroundColor3 = Color3.fromRGB(90, 50, 210)
LoginBtn.Text = "EXECUTE ACCESS"
LoginBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginBtn.Font = Enum.Font.GothamBold
LoginBtn.TextSize = 13
Instance.new("UICorner", LoginBtn).CornerRadius = UDim.new(0, 4)

LoginBtn.MouseButton1Click:Connect(function()
    local isValid, message = validateKey(Input.Text)
    if isValid then
        saveKey(Input.Text)
        createNotif("SUCCESS", "Access Granted! Welcome back.", Color3.fromRGB(50, 220, 110))
        t(LoginBtn, {0.3}, {BackgroundColor3 = Color3.fromRGB(50, 220, 110)})
        t(MainStroke, {0.3}, {Color = Color3.fromRGB(50, 220, 110)})
        task.wait(0.7)
        t(Main, {0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In}, {
            Size = UDim2.new(0, 600, 0, 400),
            Position = UDim2.new(0.5, -300, 0.5, -200),
            GroupTransparency = 1
        })
        task.wait(0.5)
        ScreenGui:Destroy()

        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local HttpService = game:GetService("HttpService")
        local UserInputService = game:GetService("UserInputService")
        local VirtualUser = game:GetService("VirtualUser")
        local TeleportService = game:GetService("TeleportService")
        local Lighting = game:GetService("Lighting")
        local cloneref = (cloneref or table.clone or function(instance) return instance end)
        local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
        local Workspace = game:GetService("Workspace")
        local lp = Players.LocalPlayer

        local function safeWaitForChild(parent, name, timeout)
            local result = parent:WaitForChild(name, timeout or 15)
            if not result then
                warn("[Nebula Hub] WaitForChild timeout: " .. tostring(name) .. " in " .. tostring(parent))
            end
            return result
        end

        local WindUI
        do
            local ok, result = pcall(function()
                return require(game:GetService("ProjectResources"):WaitForChild("Init"))
            end)
            if ok then
                WindUI = result
            else
                local success, res = pcall(function()
                    if cloneref(RunService):IsStudio() then
                        return require(cloneref(ReplicatedStorage:WaitForChild("WindUI"):WaitForChild("Init")))
                    else
                        return loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
                    end
                end)
                if success then WindUI = res end
            end
        end
        if not WindUI then warn("Nebula Hub: Failed to load WindUI!") return end

        local RoamingPetsRoot    = safeWaitForChild(Workspace, "RoamingPets", 15)
        local PetFolder          = RoamingPetsRoot and safeWaitForChild(RoamingPetsRoot, "Pets", 15)

        local SkyIslandRoot      = safeWaitForChild(Workspace, "SkyIslandPets", 15)
        local SkyIslandPetsFolder = SkyIslandRoot and safeWaitForChild(SkyIslandRoot, "Pets", 15)
        local DragonPetsFolder   = SkyIslandPetsFolder

        local WaterIslandRoot    = safeWaitForChild(Workspace, "WaterIslandPets", 15)
        local WaterPetsFolder    = WaterIslandRoot and safeWaitForChild(WaterIslandRoot, "Pets", 15)

        local PlayerPens         = safeWaitForChild(Workspace, "PlayerPens", 15)

        if PetFolder then print("[Nebula Hub] PetFolder:", PetFolder:GetFullName()) end
        if SkyIslandPetsFolder then print("[Nebula Hub] SkyIslandPetsFolder:", SkyIslandPetsFolder:GetFullName()) end
        if WaterPetsFolder then print("[Nebula Hub] WaterPetsFolder:", WaterPetsFolder:GetFullName()) end

        local Remotes            = safeWaitForChild(ReplicatedStorage, "Remotes", 15)
        local KnitPackages       = safeWaitForChild(ReplicatedStorage, "Packages", 15)
        local KnitIndex          = KnitPackages and safeWaitForChild(KnitPackages, "_Index", 15)
        local KnitServices       = KnitIndex and KnitIndex["sleitnick_knit@1.7.0"] and KnitIndex["sleitnick_knit@1.7.0"].knit.Services
        local TimerServiceRF     = KnitServices and KnitServices.TimerService and KnitServices.TimerService.RF

        local BreedRequest       = Remotes and safeWaitForChild(Remotes, "breedRequest", 10)
        local CollectCashRemote  = Remotes and safeWaitForChild(Remotes, "collectAllPetCash", 10)

        local FoodList = {"Steak", "Prime Feed", "Bone", "Hay", "Enriched Feed", "Farmers Feed"}
        local PetList  = {"Axolotl", "Cerberus", "Kitsune", "Red Panda", "elephant", "gorilla", "eagle", "yeti", "Phoenix"}

        local LassoList = {
            "Basic Lasso", "Rancher's Rope", "Metal Lasso", "Steelcoil Lasso",
            "Stormwrangler", "Sunforged Lasso", "Nightveil Lasso", "Voidweave Lasso",
            "Celestial Tether", "Nebula Lasso", "Fragmented Lasso", "Blackhole Lasso",
            "Helion Lasso", "Stellar Lasso", "Valentines Lasso",
            "Peppermint Lasso", "Frost Lasso", "Festive Lasso", "Holiday Lasso"
        }

        local Config = {
            AutoFarmMode = "Main",
            AutoFarm = false,
            Main_UseRarity = true,
            Main_UseMutation = false,
            Main_UseSize = false,
            Main_SelectedRarities = {"Secret", "Mythic"},
            Main_SelectedMutations = {"Shiny", "Albino", "Melanistic"},
            Main_SelectedSizes = {"Huge", "Colossal"},
            Main_SelectedSizeRarity = "None",
            Dragon_UseRarity = true,
            Dragon_UseMutation = false,
            Dragon_UseSize = false,
            Dragon_SelectedRarities = {"Secret", "Mythic"},
            Dragon_SelectedMutations = {"Shiny", "Albino", "Melanistic"},
            Dragon_SelectedSizes = {"Huge", "Colossal"},
            Dragon_SelectedSizeRarity = "None",
            Water_UseRarity = true,
            Water_UseMutation = false,
            Water_UseSize = false,
            Water_SelectedRarities = {"Secret", "Mythic"},
            Water_SelectedMutations = {"Shiny", "Albino", "Melanistic"},
            Water_SelectedSizes = {"Huge", "Colossal"},
            Water_SelectedSizeRarity = "None",
            JumpSize = 8,
            SkippedAnimals = {},
            WalkSpeed = 16,
            InfiniteJump = false,
            FlySpeed = 50,
            EnableESP = false,
            RenderDist = 1200,
            EspSelectedRarities = {"Secret", "Mythic", "Legendary"},
            AutoMerchant = false,
            AutoBuyFood = false,
            AutoBreed = false,
            BreedTarget1 = "",
            BreedTarget2 = "",
            AutoPickupAll = false,
            AutoCollectMoney = false,
            AntiAFK = false,
            AutoRejoin = false,
            AutoHideName = false,
            FPSBoost = false,
            AutoEquipBestLasso = false,
            EasyTamingMode = false,
            FakeLassoName = "Stellar Lasso",
        }

        local isTaming = false
        local Flying = false
        local Noclip = false
        local NoclipConn
        local AntiAFKConn
        local RejoinConn
        local HideNameConn
        local InviteCode = "dyt7dd55Ct"
        local espWasEnabled = false
        local easytamingHooked = false
        local originalLassoName = nil

        local function safeIter(tbl)
            if type(tbl) ~= "table" then return {} end
            local isArray = true
            for k, _ in pairs(tbl) do
                if type(k) ~= "number" then isArray = false break end
            end
            if isArray then return tbl end
            local result = {}
            for k, v in pairs(tbl) do
                if v == true and type(k) == "string" then table.insert(result, k) end
            end
            return result
        end

        local function normalizeDropdownValue(v) return safeIter(v) end

        local function SaveSettings()
            pcall(function()
                writefile("NebulaHub_v19.0.json", HttpService:JSONEncode({Config = Config}))
            end)
        end

        local function LoadSettings()
            if isfile and isfile("NebulaHub_v19.0.json") then
                pcall(function()
                    local decoded = HttpService:JSONDecode(readfile("NebulaHub_v19.0.json"))
                    if decoded.Config then
                        for k,v in pairs(decoded.Config) do Config[k] = v end
                        if type(Config.SkippedAnimals) == "string" then
                            Config.SkippedAnimals = string.split(Config.SkippedAnimals, ",")
                        end
                        local arrayFields = {
                            "Main_SelectedRarities","Main_SelectedMutations","Main_SelectedSizes",
                            "Dragon_SelectedRarities","Dragon_SelectedMutations","Dragon_SelectedSizes",
                            "Water_SelectedRarities","Water_SelectedMutations","Water_SelectedSizes",
                            "EspSelectedRarities","SkippedAnimals"
                        }
                        for _, field in ipairs(arrayFields) do
                            if type(Config[field]) == "table" then
                                Config[field] = safeIter(Config[field])
                            elseif Config[field] == nil then
                                Config[field] = {}
                            end
                        end
                        if Config.AutoFarmMode == "Underwater" then Config.AutoFarmMode = "Water" end
                    end
                end)
            end
        end
        LoadSettings()

        -- Lasso Hack Functions
        local function ApplyEasyTaming()
            if not Config.EasyTamingMode then return end
            pcall(function()
                local knit = require(ReplicatedStorage.Packages.knit)
                local LassoController = knit.GetController("LassoController")
                if LassoController then
                    originalLassoName = originalLassoName or LassoController.EquippedLasso
                    LassoController.EquippedLasso = Config.FakeLassoName
                end
                if not easytamingHooked then
                    local StarterPlayer = game:GetService("StarterPlayer")
                    for _, v in pairs(StarterPlayer.StarterPlayerScripts:GetDescendants()) do
                        if v.Name == "lassoMinigameHandler" then
                            local ok, module = pcall(require, v)
                            if ok and module and module.StartMinigame then
                                local hookOk = pcall(function()
                                    debug.setupvalue(module.StartMinigame, 6, function(lassoName, petStrength)
                                        return 1
                                    end)
                                end)
                                if hookOk then
                                    easytamingHooked = true
                                    print("[Nebula Hub] Lasso difficulty locked to Level 1")
                                else
                                    warn("[Nebula Hub] Failed to hook difficulty (upvalue index may have changed)")
                                end
                            end
                            break
                        end
                    end
                end
            end)
        end

        local function RemoveEasyTaming()
            pcall(function()
                local knit = require(ReplicatedStorage.Packages.knit)
                local LassoController = knit.GetController("LassoController")
                if LassoController and originalLassoName then
                    LassoController.EquippedLasso = originalLassoName
                    originalLassoName = nil
                end
                easytamingHooked = false
                print("[Nebula Hub] Easy Taming disabled — reload script to restore original difficulty")
            end)
        end
        
        -- Anti-AFK & Stability
        local function StartAntiAFK()
            if AntiAFKConn then AntiAFKConn:Disconnect() end
            AntiAFKConn = RunService.Heartbeat:Connect(function()
                if not Config.AntiAFK then return end
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
            end)
        end

        local function StopAntiAFK()
            if AntiAFKConn then AntiAFKConn:Disconnect() AntiAFKConn = nil end
        end

        local function StartAutoRejoin()
            if RejoinConn then RejoinConn:Disconnect() end
            RejoinConn = lp:GetPropertyChangedSignal("Parent"):Connect(function()
                if not lp.Parent and Config.AutoRejoin then
                    task.wait(5 + math.random(3,8))
                    pcall(function() TeleportService:Teleport(game.PlaceId, lp) end)
                end
            end)
        end

        local function StopAutoRejoin()
            if RejoinConn then RejoinConn:Disconnect() RejoinConn = nil end
        end

        local function ServerHop()
            pcall(function()
                local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
                for _, v in ipairs(servers.data) do
                    if v.playing < v.maxPlayers and v.id ~= game.JobId then
                        WindUI:Notify({Title = "Server Hop", Content = "Hopping to server ("..v.playing.."/"..v.maxPlayers..")..."})
                        task.wait(1.5)
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, lp)
                        return
                    end
                end
                WindUI:Notify({Title = "Server Hop", Content = "No low-player server found."})
            end)
        end

        local function UpdateHideName()
            if not Config.AutoHideName then return end
            pcall(function()
                local char = lp.Character
                if char and char:FindFirstChild("Head") then
                    local billboard = char.Head:FindFirstChildOfClass("BillboardGui")
                    if billboard then billboard.Enabled = false end
                end
            end)
        end

        local function ApplyFPSBoost()
            if Config.FPSBoost then
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 9e9
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("Fire")
                    or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
                        v.Enabled = false
                    end
                end
            end
        end

        local function AutoEquipBestLasso()
            if not Config.AutoEquipBestLasso then return end
            pcall(function()
                local best, bestPower = nil, 0
                for _, tool in ipairs(lp.Backpack:GetChildren()) do
                    if tool:IsA("Tool") and (tool.Name:lower():find("lasso") or tool:GetAttribute("Power")) then
                        local power = tonumber(tool:GetAttribute("Power") or 1) or 1
                        if power > bestPower then bestPower = power best = tool end
                    end
                end
                if best and lp.Character and not lp.Character:FindFirstChildWhichIsA("Tool") then
                    best.Parent = lp.Character
                end
            end)
        end

        local function normalize(str)
            return string.lower(string.gsub(tostring(str or ""), "%s+", ""))
        end

        local function IsValidTarget(v, mode)
            if not v:IsA("Model") then return false end
            if v:FindFirstAncestor("Plots") or v:FindFirstAncestor("PlayerPens") then return false end

            if mode == "Main" and (v.Parent == SkyIslandPetsFolder or v.Parent == WaterPetsFolder) then return false end
            if mode == "Dragon" and (v.Parent == PetFolder or v.Parent == WaterPetsFolder) then return false end
            if mode == "Water" and (v.Parent == PetFolder or v.Parent == SkyIslandPetsFolder) then return false end

            local petName = normalize(v:GetAttribute("Name") or v.Name)
            local rarity = normalize(v:GetAttribute("Rarity") or "")
            local mutation = normalize(v:GetAttribute("Mutation") or "None")
            local size = normalize(v:GetAttribute("SizeName") or "Normal")

            if type(Config.SkippedAnimals) == "table" and #safeIter(Config.SkippedAnimals) > 0 then
                for _, skip in ipairs(safeIter(Config.SkippedAnimals)) do
                    local cleanSkip = normalize(skip)
                    if cleanSkip ~= "" and petName:find(cleanSkip, 1, true) then return false end
                end
            end

            local useRarity = Config[mode .. "_UseRarity"]
            local useMutation = Config[mode .. "_UseMutation"]
            local useSize = Config[mode .. "_UseSize"]
            local selRar = safeIter(Config[mode .. "_SelectedRarities"])
            local selMut = safeIter(Config[mode .. "_SelectedMutations"])
            local selSize = safeIter(Config[mode .. "_SelectedSizes"])
            local selSizeRar = Config[mode .. "_SelectedSizeRarity"]

            if useMutation then
                local mutMatch = false
                for _, s in ipairs(selMut) do
                    if mutation:find(normalize(s), 1, true) then mutMatch = true break end
                end
                if not mutMatch then return false end
            end

            if useSize then
                local sizeMatch = false
                for _, s in ipairs(selSize) do
                    local target = normalize(s)
                    if size == target or (target == "large" and size == "big") then sizeMatch = true break end
                end
                if not sizeMatch then return false end
                if selSizeRar ~= "None" then
                    if not rarity:find(normalize(selSizeRar), 1, true) then return false end
                end
            elseif useRarity then
                local rarityMatch = false
                for _, s in ipairs(selRar) do
                    if rarity:find(normalize(s), 1, true) then rarityMatch = true break end
                end
                if not rarityMatch then return false end
            end

            return true
        end

        local function GetHabitatFolders(mode)
            if mode == "Main" then return {PetFolder}
            elseif mode == "Dragon" then return {DragonPetsFolder}
            elseif mode == "Water" then return {WaterPetsFolder} end
            return {}
        end

        local function GetNextTarget()
            local closest, minDist = nil, math.huge
            local charRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if not charRoot then return nil end
            local folders = GetHabitatFolders(Config.AutoFarmMode)
            for _, folder in ipairs(folders) do
                if folder then
                    for _, pet in ipairs(folder:GetChildren()) do
                        if IsValidTarget(pet, Config.AutoFarmMode) then
                            local root = pet.PrimaryPart or pet:FindFirstChildWhichIsA("BasePart")
                            if root then
                                local dist = (charRoot.Position - root.Position).Magnitude
                                if dist < minDist then minDist = dist closest = pet end
                            end
                        end
                    end
                end
            end
            return closest
        end

        local function GetGardenPlot()
            if not PlayerPens then return nil end
            local userIdStr = tostring(lp.UserId)
            local directPlot = PlayerPens:FindFirstChild(userIdStr)
            if directPlot and directPlot:FindFirstChild("Pets") and #directPlot.Pets:GetChildren() > 0 then return directPlot end
            for _, plot in ipairs(PlayerPens:GetChildren()) do
                if plot:FindFirstChild("Pets") then
                    for _, pet in ipairs(plot.Pets:GetChildren()) do
                        local owner = pet:GetAttribute("Owner") or pet:GetAttribute("UserId") or pet:GetAttribute("OwnerId")
                        if owner and (tostring(owner) == userIdStr or owner == lp) then return plot end
                    end
                end
            end
            for _, plot in ipairs(PlayerPens:GetChildren()) do
                if plot:FindFirstChild("Pets") and #plot.Pets:GetChildren() > 0 then return plot end
            end
            return nil
        end

        local function GetGardenPetNames()
            local names = {}
            pcall(function()
                local plot = GetGardenPlot()
                if plot and plot:FindFirstChild("Pets") then
                    for _, p in ipairs(plot.Pets:GetChildren()) do
                        local n = p:GetAttribute("Name") or p.Name
                        if not table.find(names, n) then table.insert(names, n) end
                    end
                end
            end)
            table.sort(names)
            return #names > 0 and names or {"No Pets Found"}
        end

        local lastBreedingFetch = 0
        local cachedActiveBreeding = {}
        local function GetAvailablePetInstancesByName(name, excluded)
            excluded = excluded or {}
            local found = {}
            pcall(function()
                local plot = GetGardenPlot()
                if not plot or not plot:FindFirstChild("Pets") then return end
                local now = tick()
                if now - lastBreedingFetch > 4 and TimerServiceRF then
                    local ok, active = pcall(function() return TimerServiceRF.GetAllActiveBreeding:InvokeServer() end)
                    if ok and active then cachedActiveBreeding = active end
                    lastBreedingFetch = now
                end
                local busy = {}
                for _, slot in pairs(cachedActiveBreeding) do
                    if slot then
                        if slot.Pet1 then busy[slot.Pet1.Name] = true end
                        if slot.Pet2 then busy[slot.Pet2.Name] = true end
                    end
                end
                for _, p in ipairs(plot.Pets:GetChildren()) do
                    local pName = p:GetAttribute("Name") or p.Name
                    if pName == name and not busy[p.Name] and not table.find(excluded, p) then
                        table.insert(found, p)
                    end
                end
            end)
            return found
        end

        local lastPickupTime = 0
        local function DoManualPickup()
            local now = tick()
            if now - lastPickupTime < 0.8 then return end
            lastPickupTime = now
            pcall(function()
                local plot = GetGardenPlot()
                if plot then
                    local delay = 0
                    if plot:FindFirstChild("Pets") then
                        for _, pet in ipairs(plot.Pets:GetChildren()) do
                            local capturedPet = pet
                            task.delay(delay, function()
                                pcall(function() Remotes.pickupRequest:InvokeServer("Pet", capturedPet.Name, capturedPet) end)
                            end)
                            delay = delay + 0.08
                        end
                    end
                    if plot:FindFirstChild("Eggs") then
                        for _, egg in ipairs(plot.Eggs:GetChildren()) do
                            local capturedEgg = egg
                            task.delay(delay, function()
                                pcall(function() Remotes.pickupRequest:InvokeServer("Egg", capturedEgg.Name, capturedEgg) end)
                            end)
                            delay = delay + 0.08
                        end
                    end
                end
            end)
        end

        local function DoManualBuyFood()
            pcall(function()
                local buyRem = ReplicatedStorage.Packages._Index["sleitnick_knit@1.7.0"].knit.Services.FoodService.RE.BuyFood
                for _, food in ipairs(FoodList) do buyRem:FireServer(food, 5) end
                WindUI:Notify({Title = "Shop", Content = "Auto Buy Food executed!", Buttons = {{Title = "Close", Callback = function() end}}})
            end)
        end

        local function DoManualMerchantBuy()
            local merchRemote = ReplicatedStorage:FindFirstChild("BuyMerchant", true)
            local merchGui = lp.PlayerGui:FindFirstChild("Merchant") and lp.PlayerGui.Merchant:FindFirstChild("Items")
            if merchRemote then
                for slot = 1, 9 do
                    local can = true
                    if merchGui then
                        local f = merchGui:FindFirstChild(tostring(slot))
                        if f and f:FindFirstChild("Stock") then
                            local stock = tonumber(f.Stock.Text:match("%d+")) or 0
                            if stock <= 0 then can = false end
                        end
                    end
                    if can then
                        for _, food in ipairs(FoodList) do pcall(function() merchRemote:FireServer(slot, food) end) end
                    end
                end
                WindUI:Notify({Title = "Merchant", Content = "Auto merchant purchase executed!", Buttons = {{Title = "Ok", Callback = function() end}}})
            end
        end

        local ESP_CACHE = {}
        local function GetTag(model)
            local tag = model:FindFirstChild("NebulaTag")
            if not tag then
                tag = Instance.new("BillboardGui")
                tag.Name = "NebulaTag"
                tag.AlwaysOnTop = true
                tag.Size = UDim2.new(0, 180, 0, 70)
                tag.ExtentsOffset = Vector3.new(0, 3.5, 0)
                tag.StudsOffset = Vector3.new(0, 0.1, 0)
                tag.Parent = model
                local txt = Instance.new("TextLabel")
                txt.Name = "MainLabel"
                txt.BackgroundTransparency = 1
                txt.Size = UDim2.new(1, 0, 1, 0)
                txt.Font = Enum.Font.GothamBold
                txt.TextSize = 13
                txt.TextStrokeTransparency = 0.4
                txt.RichText = true
                txt.Parent = tag
            end
            return tag
        end

        local function ClearESP()
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BillboardGui") and obj.Name == "NebulaTag" then obj:Destroy() end
            end
            ESP_CACHE = {}
        end

        local function UpdateESP()
            if not Config.EnableESP then
                if espWasEnabled then ClearESP() espWasEnabled = false end
                return
            end
            espWasEnabled = true
            local char = lp.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local pos = char.HumanoidRootPart.Position
            local now = tick()
            local habitats = {}
            if PetFolder then table.insert(habitats, PetFolder) end
            if SkyIslandPetsFolder then table.insert(habitats, SkyIslandPetsFolder) end
            if WaterPetsFolder then table.insert(habitats, WaterPetsFolder) end
            for model, data in pairs(ESP_CACHE) do
                if not model.Parent or (pos - (data.root.Position)).Magnitude > Config.RenderDist + 300 then
                    if model:FindFirstChild("NebulaTag") then model.NebulaTag:Destroy() end
                    ESP_CACHE[model] = nil
                end
            end
            for _, folder in ipairs(habitats) do
                for _, pet in ipairs(folder:GetChildren()) do
                    if pet:IsA("Model") then
                        local root = pet.PrimaryPart or pet:FindFirstChildWhichIsA("BasePart")
                        if not root then continue end
                        local dist = (pos - root.Position).Magnitude
                        if dist > Config.RenderDist then
                            if pet:FindFirstChild("NebulaTag") then pet.NebulaTag.Enabled = false end
                            continue
                        end
                        local r = tostring(pet:GetAttribute("Rarity") or "Common")
                        local show = false
                        for _, s in ipairs(safeIter(Config.EspSelectedRarities)) do
                            if r:lower():find(s:lower()) then show = true break end
                        end
                        if show then
                            local tag = GetTag(pet)
                            tag.Enabled = true
                            if not ESP_CACHE[pet] then
                                ESP_CACHE[pet] = {root = root, name = pet:GetAttribute("Name") or pet.Name, mut = pet:GetAttribute("Mutation") or "None", sz = pet:GetAttribute("SizeName") or "Normal", rarity = r}
                            end
                            local cached = ESP_CACHE[pet]
                            tag.MainLabel.Text = string.format("<b>%s</b> <font color='#00FFFF'>[%s]</font>\n<font size='11'>Mut: %s | Sz: %s</font>\n<b>%.0fm</b>", cached.name, cached.rarity, cached.mut, cached.sz, dist)
                            local color
                            if cached.rarity:lower():find("secret") then color = Color3.fromRGB(0, 255, 255)
                            elseif cached.rarity:lower():find("mythic") then color = Color3.fromHSV(now % 5 / 5, 0.8, 1)
                            elseif cached.rarity:lower():find("legendary") then color = Color3.fromRGB(170, 0, 255)
                            else color = Color3.fromRGB(220, 220, 220) end
                            tag.MainLabel.TextColor3 = color
                        else
                            if pet:FindFirstChild("NebulaTag") then pet.NebulaTag:Destroy() end
                            ESP_CACHE[pet] = nil
                        end
                    end
                end
            end
        end

        task.spawn(function()
            while true do
                task.wait(0.45)
                pcall(UpdateESP)
            end
        end)

        task.wait(0.1)
        local Window = WindUI:CreateWindow({
            Title = "NEBULA HUB",
            Folder = "nebula_configs",
            Icon = "solar:planet-2-bold-duotone",
            IconColor = Color3.fromHex("#BB86FC"),
            NewElements = true,
            AccentColor = Color3.fromHex("#6200EE"),
            HideSearchBar = false,
            PaddingTop = UDim.new(0, 32),
            Topbar = { Height = 68 },
            OpenButton = {
                Title = ".iPowfu | Nebula Hub",
                CornerRadius = UDim.new(0, 12),
                StrokeThickness = 2,
                Enabled = true,
                Draggable = true,
                OnlyMobile = false,
                Scale = 0.7,
                Position = UDim2.new(0.5, 0, 0, 20),
                AnchorPoint = Vector2.new(0.5, 0),
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
                    ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)),
                    ColorSequenceKeypoint.new(1, Color3.new(1,1,1))
                })
            },
        })

        -- Fixed Capsule Titles with Zero-Width Padding
        Window:Tag({ Title = " \226\128\139 iPowfu \226\128\139 ", Icon = "solar:shield-user-bold", Color = Color3.fromHex("#03DAC6"), Border = true })
        Window:Tag({ Title = " \226\128\139 v19.0 \226\128\139 ", Icon = "solar:star-fall-bold", Color = Color3.fromHex("#CF6679"), Border = true })

        local DiscordTab = Window:Tab({ Title = "Discord & Info", Icon = "solar:info-square-bold", Border = true })
        Window:Divider()
        local FarmTab = Window:Tab({ Title = "Automation", Icon = "solar:repeat-one-minimalistic-bold" })
        local GardenTab = Window:Tab({ Title = "My Plot", Icon = "solar:streets-map-point-bold" })
        local VisualTab = Window:Tab({ Title = "Visual", Icon = "solar:eye-bold" })
        local ShopTab = Window:Tab({ Title = "Shop", Icon = "solar:cart-large-2-bold" })
        local LassoTab = Window:Tab({ Title = "Lasso Strength", Icon = "solar:magic-stick-3-bold" })
        local MovementTab = Window:Tab({ Title = "Misc", Icon = "solar:danger-bold" })
        local ExecutorTab = Window:Tab({ Title = "Developer Script", Icon = "solar:code-bold" })

        local Response = nil
        pcall(function() Response = HttpService:JSONDecode(game:HttpGet("https://discord.com/api/v9/invites/" .. InviteCode .. "?with_counts=true")) end)
        if Response and Response.guild then
            DiscordTab:Section({ Title = "Join our Discord server!", TextSize = 20 })
            DiscordTab:Paragraph({
                Title = tostring(Response.guild.name),
                Desc = tostring(Response.guild.description or "Welcome to Nebula Hub Community"),
                Image = "https://cdn.discordapp.com/icons/" .. Response.guild.id .. "/" .. Response.guild.icon .. ".png?size=1024",
                Thumbnail = "https://cdn.discordapp.com/banners/1300692552005189632/35981388401406a4b7dffd6f447a64c4.png?size=512",
                ImageSize = 48,
                Buttons = {{Title = "Copy Invite Link", Icon = "link", Callback = function() setclip("https://discord.gg/" .. InviteCode) WindUI:Notify({Title = "Discord", Content = "Invite link copied!"}) end}}
            })
        else
            DiscordTab:Section({ Title = "Community Link" })
            DiscordTab:Paragraph({
                Title = "Nebula Hub Discord",
                Desc = "Join for updates, bug reports, and support.",
                Image = "solar:info-circle-bold",
                Buttons = {{Title = "Copy Invite Link", Icon = "link", Callback = function() setclip("https://discord.gg/" .. InviteCode) WindUI:Notify({Title = "Discord", Content = "Copied!"}) end}}
            })
        end
        DiscordTab:Section({ Title = "System Information" })
        DiscordTab:Button({ Title = "Master: iPowfu", Icon = "solar:verified-check-bold", Color = Color3.fromHex("#ffffff") })
        DiscordTab:Button({ Title = "Build: Nebula Hub v19.0 (Lasso Strength + Fixes)", Icon = "solar:sleeping-bold", Color = Color3.fromHex("#ffffff") })
        DiscordTab:Button({ Title = "Anti-AFK & Stability Tools Active", Icon = "solar:shield-bold", Color = Color3.fromHex("#00ff9d") })
        DiscordTab:Section({ Title = "Features Overview" })
        DiscordTab:Paragraph({
            Title = "Key Features v19.0",
            Desc = "• Auto Farm Main / Dragon / Underwater (separated)\n• Optimized ESP\n• Fixed Auto Breed\n• Auto Collect Cash & Pickup All\n• Auto Merchant & Food Stock\n• Anti-AFK, Auto Rejoin, Server Hop\n• Hide Username, FPS Boost\n• Auto Equip Best Lasso\n• Lasso Strength Hack (Easy Taming + Fake Lasso)\n• Developer Tools: Infinite Yield, Dex, RemoteSpy"
        })
        DiscordTab:Button({ Title = "Copy Discord Invite", Icon = "solar:share-circle-bold", Color = Color3.fromHSV(0.65, 0.8, 1), Callback = function() setclip("https://discord.gg/dyt7dd55Ct") WindUI:Notify({Title = "Nebula Hub", Content = "Invite copied!"}) end })

        -- Automation Tab
        FarmTab:Section({ Title = "Farm Mode Selection" })
        FarmTab:Dropdown({ Title = "Active Farm Location", Values = {"Main World", "Dragon Island", "Underwater"}, Value = (function() if Config.AutoFarmMode == "Main" then return "Main World" elseif Config.AutoFarmMode == "Dragon" then return "Dragon Island" else return "Underwater" end end)(), Callback = function(v) if v == "Main World" then Config.AutoFarmMode = "Main" elseif v == "Dragon Island" then Config.AutoFarmMode = "Dragon" else Config.AutoFarmMode = "Water" end SaveSettings() end })
        FarmTab:Toggle({ Title = "Enable Auto Farm", Value = Config.AutoFarm, Callback = function(v) Config.AutoFarm = v SaveSettings() end })
        FarmTab:Slider({ Title = "Taming Sensitivity", Step = 1, Value = {Min = 1, Max = 50, Default = Config.JumpSize}, Callback = function(v) Config.JumpSize = v SaveSettings() end })

        -- Main World Filters
        FarmTab:Section({ Title = "Main World Filters" })
        FarmTab:Toggle({ Title = "Use Rarity Filter (Main)", Value = Config.Main_UseRarity, Callback = function(v) Config.Main_UseRarity = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Rarities (Main)", Multi = true, Values = {"Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.Main_SelectedRarities, Callback = function(v) Config.Main_SelectedRarities = normalizeDropdownValue(v) SaveSettings() end })
        FarmTab:Toggle({ Title = "Use Mutation Filter (Main)", Value = Config.Main_UseMutation, Callback = function(v) Config.Main_UseMutation = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Mutations (Main)", Multi = true, Values = {"Shiny","Albino","Melanistic","Negative"}, Value = Config.Main_SelectedMutations, Callback = function(v) Config.Main_SelectedMutations = normalizeDropdownValue(v) SaveSettings() end })
        FarmTab:Toggle({ Title = "Use Size Filter (Main)", Value = Config.Main_UseSize, Callback = function(v) Config.Main_UseSize = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Size Synergy Rarity (Main)", Values = {"None","Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.Main_SelectedSizeRarity, Callback = function(v) Config.Main_SelectedSizeRarity = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Sizes (Main)", Multi = true, Values = {"Any Size","Tiny","Normal","Big","Large","Huge","Colossal"}, Value = (function() local tt = {} for _,s in ipairs(Config.Main_SelectedSizes) do table.insert(tt,s) end if #Config.Main_SelectedSizes == 0 then table.insert(tt,"Any Size") end return tt end)(), Callback = function(v) local c = {} for _,s in ipairs(safeIter(v)) do if s ~= "Any Size" then table.insert(c,s) end end Config.Main_SelectedSizes = c SaveSettings() end })

        -- Dragon Island Filters
        FarmTab:Section({ Title = "Dragon Island Filters" })
        FarmTab:Toggle({ Title = "Use Rarity Filter (Dragon)", Value = Config.Dragon_UseRarity, Callback = function(v) Config.Dragon_UseRarity = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Rarities (Dragon)", Multi = true, Values = {"Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.Dragon_SelectedRarities, Callback = function(v) Config.Dragon_SelectedRarities = normalizeDropdownValue(v) SaveSettings() end })
        FarmTab:Toggle({ Title = "Use Mutation Filter (Dragon)", Value = Config.Dragon_UseMutation, Callback = function(v) Config.Dragon_UseMutation = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Mutations (Dragon)", Multi = true, Values = {"Shiny","Albino","Melanistic","Negative"}, Value = Config.Dragon_SelectedMutations, Callback = function(v) Config.Dragon_SelectedMutations = normalizeDropdownValue(v) SaveSettings() end })
        FarmTab:Toggle({ Title = "Use Size Filter (Dragon)", Value = Config.Dragon_UseSize, Callback = function(v) Config.Dragon_UseSize = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Size Synergy Rarity (Dragon)", Values = {"None","Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.Dragon_SelectedSizeRarity, Callback = function(v) Config.Dragon_SelectedSizeRarity = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Sizes (Dragon)", Multi = true, Values = {"Any Size","Tiny","Normal","Big","Large","Huge","Colossal"}, Value = (function() local tt = {} for _,s in ipairs(Config.Dragon_SelectedSizes) do table.insert(tt,s) end if #Config.Dragon_SelectedSizes == 0 then table.insert(tt,"Any Size") end return tt end)(), Callback = function(v) local c = {} for _,s in ipairs(safeIter(v)) do if s ~= "Any Size" then table.insert(c,s) end end Config.Dragon_SelectedSizes = c SaveSettings() end })

        -- Underwater Filters
        FarmTab:Section({ Title = "Underwater Filters" })
        FarmTab:Toggle({ Title = "Use Rarity Filter (Water)", Value = Config.Water_UseRarity, Callback = function(v) Config.Water_UseRarity = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Rarities (Water)", Multi = true, Values = {"Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.Water_SelectedRarities, Callback = function(v) Config.Water_SelectedRarities = normalizeDropdownValue(v) SaveSettings() end })
        FarmTab:Toggle({ Title = "Use Mutation Filter (Water)", Value = Config.Water_UseMutation, Callback = function(v) Config.Water_UseMutation = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Mutations (Water)", Multi = true, Values = {"Shiny","Albino","Melanistic","Negative"}, Value = Config.Water_SelectedMutations, Callback = function(v) Config.Water_SelectedMutations = normalizeDropdownValue(v) SaveSettings() end })
        FarmTab:Toggle({ Title = "Use Size Filter (Water)", Value = Config.Water_UseSize, Callback = function(v) Config.Water_UseSize = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Size Synergy Rarity (Water)", Values = {"None","Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.Water_SelectedSizeRarity, Callback = function(v) Config.Water_SelectedSizeRarity = v SaveSettings() end })
        FarmTab:Dropdown({ Title = "Target Sizes (Water)", Multi = true, Values = {"Any Size","Tiny","Normal","Big","Large","Huge","Colossal"}, Value = (function() local tt = {} for _,s in ipairs(Config.Water_SelectedSizes) do table.insert(tt,s) end if #Config.Water_SelectedSizes == 0 then table.insert(tt,"Any Size") end return tt end)(), Callback = function(v) local c = {} for _,s in ipairs(safeIter(v)) do if s ~= "Any Size" then table.insert(c,s) end end Config.Water_SelectedSizes = c SaveSettings() end })

        FarmTab:Section({ Title = "Global Exclude" })
        local skipDropdown = FarmTab:Dropdown({ Title = "Exclude Species (all modes)", Multi = true, Values = PetList, Value = Config.SkippedAnimals, Callback = function(v) Config.SkippedAnimals = normalizeDropdownValue(v) SaveSettings() end })
        task.delay(1, function() if skipDropdown and skipDropdown.Refresh then skipDropdown:Refresh(PetList, Config.SkippedAnimals) end end)

        -- My Plot Tab
        GardenTab:Section({ Title = "Main Features" })
        GardenTab:Toggle({ Title = "Auto Collect Cash", Value = Config.AutoCollectMoney, Callback = function(v) Config.AutoCollectMoney = v SaveSettings() end })
        GardenTab:Toggle({ Title = "Auto Pickup All", Value = Config.AutoPickupAll, Callback = function(v) Config.AutoPickupAll = v SaveSettings() end })

        GardenTab:Section({ Title = "Auto Breeding" })
        GardenTab:Toggle({ Title = "Breed All Pets", Value = Config.AutoBreed, Callback = function(v) Config.AutoBreed = v SaveSettings() end })
        local p1Dropdown = GardenTab:Dropdown({ Title = "Target 1", Values = GetGardenPetNames(), Value = Config.BreedTarget1, Callback = function(v) Config.BreedTarget1 = v SaveSettings() end })
        local p2Dropdown = GardenTab:Dropdown({ Title = "Target 2", Values = GetGardenPetNames(), Value = Config.BreedTarget2, Callback = function(v) Config.BreedTarget2 = v SaveSettings() end })
        GardenTab:Button({ Title = "Sync DNA Data", Icon = "solar:refresh-square-bold", Color = Color3.new(1,1,1), Callback = function() local list = GetGardenPetNames() p1Dropdown:Refresh(list) p2Dropdown:Refresh(list) WindUI:Notify({Title = "Plot", Content = "Database synchronized."}) end })

        -- Visual Tab
        VisualTab:Section({ Title = "Entity Detection (Optimized)" })
        VisualTab:Toggle({ Title = "Enable ESP Overlay", Value = Config.EnableESP, Callback = function(v) Config.EnableESP = v SaveSettings() if not v then ClearESP() espWasEnabled = false end end })
        VisualTab:Slider({ Title = "Scan Radius", Step = 100, Value = {Min = 100, Max = 5000, Default = Config.RenderDist}, Callback = function(v) Config.RenderDist = v SaveSettings() end })
        VisualTab:Dropdown({ Title = "Highlight Rarities", Multi = true, Values = {"Common","Rare","Epic","Legendary","Mythic","Secret"}, Value = Config.EspSelectedRarities, Callback = function(v) Config.EspSelectedRarities = normalizeDropdownValue(v) SaveSettings() end })

        -- Shop Tab
        ShopTab:Section({ Title = "Shop Automation" })
        ShopTab:Toggle({ Title = "Auto Stock Food", Value = Config.AutoBuyFood, Callback = function(v) Config.AutoBuyFood = v SaveSettings() end })
        ShopTab:Toggle({ Title = "Auto Merchant Purchase", Value = Config.AutoMerchant, Callback = function(v) Config.AutoMerchant = v SaveSettings() end })
        ShopTab:Button({ Title = "Force Buy Merchant", Icon = "solar:cart-check-bold", Color = Color3.new(1,1,1), Callback = function() DoManualMerchantBuy() end })

        -- Lasso Strength Tab
        LassoTab:Section({ Title = "Easy Taming – Lasso Strength Hack" })

        LassoTab:Paragraph({
            Title = "How It Works",
            Desc = "1. Forces minigame difficulty to always Level 1 (easiest)\n2. Fakes the equipped lasso name to a powerful one you choose\n→ Result: Extremely easy taming even with weak lasso"
        })

        LassoTab:Divider()

        LassoTab:Toggle({
            Title = "Enable Easy Taming Mode",
            Desc = "Difficulty locked to Level 1 + fake lasso name",
            Value = Config.EasyTamingMode,
            Callback = function(v)
                Config.EasyTamingMode = v
                SaveSettings()
                if v then
                    ApplyEasyTaming()
                    WindUI:Notify({Title = "Lasso Hack", Content = "Easy Taming ENABLED\nDifficulty = Level 1", Duration = 4.5})
                else
                    RemoveEasyTaming()
                    WindUI:Notify({Title = "Lasso Hack", Content = "Easy Taming DISABLED\nReload script to restore original difficulty", Duration = 5})
                end
            end
        })

        LassoTab:Dropdown({
            Title = "Fake Lasso Name",
            Desc = "The lasso name to fake (doesn't need to be in inventory)\nRecommended: Stellar Lasso (3100 strength)",
            Values = LassoList,
            Value = Config.FakeLassoName,
            Callback = function(v)
                Config.FakeLassoName = v
                SaveSettings()
                if Config.EasyTamingMode then
                    ApplyEasyTaming()
                    WindUI:Notify({Title = "Fake Lasso", Content = "Changed to: " .. v, Duration = 3.5})
                end
            end
        })

        LassoTab:Divider()

        LassoTab:Section({ Title = "Lasso Strength Reference" })
        LassoTab:Paragraph({
            Title = "Recommended Lassos",
            Desc = "Stellar Lasso → 3100 (best/easiest)\nHelion Lasso → 2600\nBlackhole Lasso → 2100\nFragmented Lasso → 1700\nNebula Lasso → 1400\n...\nBasic Lasso → 10 (hardest)"
        })

        LassoTab:Divider()

        LassoTab:Section({ Title = "Quick Actions & Debug" })
        LassoTab:Button({
            Title = "Apply Now",
            Icon = "solar:magic-stick-3-bold",
            Color = Color3.fromHex("#00ff9d"),
            Callback = function()
                if Config.EasyTamingMode then
                    ApplyEasyTaming()
                    WindUI:Notify({Title = "Lasso Hack", Content = "Re-applied!\nFake: "..Config.FakeLassoName.." | Difficulty: Level 1", Duration = 4})
                else
                    WindUI:Notify({Title = "Info", Content = "Enable Easy Taming Mode first", Duration = 4})
                end
            end
        })

        LassoTab:Button({
            Title = "Check Current Lasso (Console)",
            Icon = "solar:eye-bold",
            Color = Color3.fromHex("#a5d8ff"),
            Callback = function()
                pcall(function()
                    local knit = require(ReplicatedStorage.Packages.knit)
                    local lc = knit.GetController("LassoController")
                    if lc then
                        local msg = "Current EquippedLasso: " .. tostring(lc.EquippedLasso)
                        print("[Nebula Hub Lasso]", msg)
                        WindUI:Notify({Title = "Lasso Info", Content = msg, Duration = 5})
                    else
                        WindUI:Notify({Title = "Error", Content = "LassoController not found", Duration = 4})
                    end
                end)
            end
        })

        -- Misc Tab (Movement)
        MovementTab:Section({ Title = "Movement Mods" })
        MovementTab:Slider({ Title = "Walk Speed", Step = 1, Value = {Min = 16, Max = 250, Default = Config.WalkSpeed}, Callback = function(v) Config.WalkSpeed = v SaveSettings() end })
        MovementTab:Toggle({ Title = "Infinite Jump", Value = Config.InfiniteJump, Callback = function(v) Config.InfiniteJump = v SaveSettings() end })

        MovementTab:Section({ Title = "Flight & Noclip" })
        MovementTab:Toggle({ Title = "Flight Mode", Value = false, Callback = function(v)
            Flying = v
            local char = lp.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local root = char.HumanoidRootPart
                if Flying then
                    local bg = Instance.new("BodyGyro", root) bg.Name = "NebulaFlyGyro" bg.P = 9e4 bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
                    local bv = Instance.new("BodyVelocity", root) bv.Name = "NebulaFlyVelocity" bv.MaxForce = Vector3.new(9e9,9e9,9e9)
                    task.spawn(function()
                        while Flying do
                            RunService.RenderStepped:Wait()
                            local cam = Workspace.CurrentCamera
                            local vel = Vector3.new(0,0.1,0)
                            if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel += cam.CFrame.LookVector * Config.FlySpeed end
                            if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel -= cam.CFrame.LookVector * Config.FlySpeed end
                            bv.Velocity = vel bg.CFrame = cam.CFrame
                        end
                        bg:Destroy() bv:Destroy()
                    end)
                end
            end
        end})

        MovementTab:Toggle({ Title = "Noclip", Value = false, Callback = function(v)
            Noclip = v
            if Noclip then
                NoclipConn = RunService.Stepped:Connect(function()
                    if lp.Character then for _, part in pairs(lp.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end
                end)
            else if NoclipConn then NoclipConn:Disconnect() end end
        end})

        MovementTab:Section({ Title = "Anti-AFK & Stability" })
        MovementTab:Toggle({ Title = "Anti-AFK", Value = Config.AntiAFK, Callback = function(v) Config.AntiAFK = v SaveSettings() if v then StartAntiAFK() else StopAntiAFK() end end})
        MovementTab:Toggle({ Title = "Auto Rejoin on Disconnect", Value = Config.AutoRejoin, Callback = function(v) Config.AutoRejoin = v SaveSettings() if v then StartAutoRejoin() else StopAutoRejoin() end end})

        MovementTab:Section({ Title = "Privacy & Performance" })
        MovementTab:Toggle({ Title = "Hide Username", Value = Config.AutoHideName, Callback = function(v) Config.AutoHideName = v SaveSettings() if v then HideNameConn = RunService.Heartbeat:Connect(UpdateHideName) else if HideNameConn then HideNameConn:Disconnect() HideNameConn = nil end end end})
        MovementTab:Toggle({ Title = "FPS Boost (Reduce Visuals)", Value = Config.FPSBoost, Callback = function(v) Config.FPSBoost = v SaveSettings() ApplyFPSBoost() end})

        MovementTab:Section({ Title = "Utility" })
        MovementTab:Toggle({ Title = "Auto Equip Best Lasso", Value = Config.AutoEquipBestLasso, Callback = function(v) Config.AutoEquipBestLasso = v SaveSettings() end})
        MovementTab:Button({ Title = "Server Hop Now", Callback = ServerHop })

        -- Developer Tab
        ExecutorTab:Section({ Title = "Developer Tools" })
        ExecutorTab:Button({ Title = "Execute Infinite Yield", Icon = "solar:link-bold", Color = Color3.fromHex("#00ff9d"), Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end })
        ExecutorTab:Button({ Title = "Execute Dex Explorer", Icon = "solar:link-bold", Color = Color3.new(0.98,0.99,0.98), Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))() end })
        ExecutorTab:Button({ Title = "Execute Cobalt RemoteSpy", Icon = "solar:link-bold", Color = Color3.fromHex("#00ff9d"), Callback = function() loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"))() end })

        -- Merchant Listener
        task.spawn(function()
            if not Remotes then return end
            local notificationRemote = Remotes:WaitForChild("notification", 10)
            if not notificationRemote then return end
            notificationRemote.OnClientEvent:Connect(function(data)
                if Config.AutoMerchant and data and typeof(data) == "table" and data.Title and data.Title:find("Merchant") then
                    task.wait(1) DoManualMerchantBuy()
                end
            end)
        end)

        -- Loops
        task.spawn(function() while true do task.wait(1.5) if Config.AutoPickupAll then DoManualPickup() end end end)
        task.spawn(function() while true do task.wait(2) if Config.AutoCollectMoney and CollectCashRemote then pcall(function() CollectCashRemote:FireServer() end) end end end)
        task.spawn(function() while true do task.wait(300) if Config.AutoMerchant then DoManualMerchantBuy() end end end)
        task.spawn(function() while true do task.wait(10) if Config.AutoBuyFood then DoManualBuyFood() end end end)

        task.spawn(function()
            while true do
                task.wait(5)
                if Config.AutoBreed and Config.BreedTarget1 ~= "" and Config.BreedTarget2 ~= "" and BreedRequest then
                    local a1 = GetAvailablePetInstancesByName(Config.BreedTarget1, {})
                    local a2 = GetAvailablePetInstancesByName(Config.BreedTarget2, {})
                    if Config.BreedTarget1 == Config.BreedTarget2 then
                        for i = 1, math.floor(#a1/2) do
                            local p1, p2 = a1[i], a1[#a1-i+1]
                            if p1 and p2 and p1 ~= p2 then pcall(function() BreedRequest:InvokeServer(p1, p2, Vector3.new(-7.81,12,-3082.16), Vector3.new(12.80,12,-3068.56)) end) task.wait(0.5) end
                        end
                    else
                        for i = 1, math.min(#a1, #a2) do
                            local p1, p2 = a1[i], a2[i]
                            if p1 and p2 then pcall(function() BreedRequest:InvokeServer(p1, p2, Vector3.new(-7.81,12,-3082.16), Vector3.new(12.80,12,-3068.56)) end) task.wait(0.5) end
                        end
                    end
                end
            end
        end)

        task.spawn(function()
            while true do
                task.wait(0.5)
                if Config.AutoFarm and not isTaming then
                    if Config.EasyTamingMode then ApplyEasyTaming() end
                    local target = GetNextTarget()
                    if target and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                        local tRoot = target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart")
                        if tRoot then
                            isTaming = true
                            local ok, err = pcall(function()
                                lp.Character.HumanoidRootPart.CFrame = tRoot.CFrame * CFrame.new(0, 1.5, 4.2)
                                if Remotes then
                                    pcall(function() Remotes.retrieveData:InvokeServer() end)
                                    pcall(function() Remotes.equipLassoVisual:InvokeServer() end)
                                end
                                task.wait(0.1)
                                if Remotes then pcall(function() Remotes.ThrowLasso:FireServer(0.9, (tRoot.Position - lp.Character.HumanoidRootPart.Position).Unit) end) end
                                task.wait(0.2)
                                if Remotes then pcall(function() Remotes.minigameRequest:InvokeServer(target, tRoot.CFrame) end) end
                                local progress = 0
                                local maxAttempts = 120
                                local attempts = 0
                                while progress < 100 and Config.AutoFarm and attempts < maxAttempts do
                                    task.wait(math.random(15,25)/100)
                                    progress = progress + (Config.JumpSize + math.random(-50,50)/100)
                                    if Remotes then pcall(function() Remotes.UpdateProgress:FireServer(math.min(progress, 100)) end) end
                                    attempts = attempts + 1
                                end
                                task.wait(0.3)
                            end)
                            if not ok then warn("[Nebula Hub] Taming error: " .. tostring(err)) end
                            isTaming = false
                        end
                    end
                end
                if Config.AutoEquipBestLasso then AutoEquipBestLasso() end
            end
        end)

        RunService.RenderStepped:Connect(function()
            if lp.Character and lp.Character:FindFirstChild("Humanoid") then
                lp.Character.Humanoid.WalkSpeed = Config.WalkSpeed
            end
        end)

        UserInputService.JumpRequest:Connect(function()
            if Config.InfiniteJump and lp.Character and lp.Character:FindFirstChild("Humanoid") then
                lp.Character.Humanoid:ChangeState("Jumping")
            end
        end)

        if Config.AntiAFK then StartAntiAFK() end
        if Config.AutoRejoin then StartAutoRejoin() end
        if Config.AutoHideName then HideNameConn = RunService.Heartbeat:Connect(UpdateHideName) end
        if Config.FPSBoost then ApplyFPSBoost() end
        espWasEnabled = Config.EnableESP
        if not Config.EnableESP then ClearESP() end

        if Config.EasyTamingMode then ApplyEasyTaming() end

        task.delay(0.5, function() pcall(function() Window:SelectTab(DiscordTab) end) end)

        WindUI:Notify({
            Title = "NEBULA HUB v19.0 LOADED",
            Content = "Capsule title padding fixed!\nLasso tab fully updated.",
            Duration = 8
        })

    else
        createNotif("ERROR", message, Color3.fromRGB(255, 80, 80))
        local orig = InputContainer.Position
        t(IC_Stroke, {0.1}, {Color = Color3.fromRGB(255, 50, 50)})
        for i = 1, 8 do
            InputContainer.Position = orig + UDim2.new(0, math.random(-6, 6), 0, 0)
            task.wait(0.02)
        end
        InputContainer.Position = orig
        t(IC_Stroke, {0.5}, {Color = Color3.fromRGB(60, 50, 90)})
    end
end)

CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local isMin = false
MiniBtn.MouseButton1Click:Connect(function()
    isMin = not isMin
    Content.Visible = not isMin
    t(Main, {0.4}, {Size = isMin and UDim2.new(0, 560, 0, 35) or UDim2.new(0, 560, 0, 360)})
end)

local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true dragStart = input.Position startPos = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

t(Main, {0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out}, {GroupTransparency = 0})
print("[Nebula Hub v19.0] Script Loaded | discord.gg/dyt7dd55Ct")

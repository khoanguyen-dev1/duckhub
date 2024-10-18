local ToggleRaid = Tabs.Raid:AddToggle("Toggle Raid", { Title = "Start/Stop Raid", Default = false })

ToggleRaid:OnChanged(function(Value)
    _G.Auto_Dungeon = Value
    StopTween(_G.Auto_Dungeon)

    if Value then
        _G.Kill_Aura = true -- Tự động kích hoạt Kill Aura khi bắt đầu raid
        spawn(function()
            while _G.Auto_Dungeon do
                local nextIsland = getNextIsland()
                if nextIsland then
                    spawn(topos(nextIsland.CFrame * CFrame.new(0, 60, 0)), 1)

                    -- Dừng lại cho đến khi không còn đảo nào nữa
                    while _G.Auto_Dungeon and getNextIsland() == nextIsland do
                        wait() -- Chờ cho đến khi đảo tiếp theo được xác định
                    end
                else
                    _G.Auto_Dungeon = false -- Dừng nếu không có đảo nào
                end
                wait(1) -- Thời gian chờ trước khi kiểm tra lại
            end
        end)
    else
        _G.Kill_Aura = false -- Tắt Kill Aura khi dừng raid
    end
end)

local ToggleNextIsland = Tabs.Raid:AddToggle("ToggleNextIsland", { Title = "Next Island", Default = false })
ToggleNextIsland:OnChanged(function(Value)
    _G.Auto_Dungeon = Value
    StopTween(_G.Auto_Dungeon)
end)
Options.ToggleNextIsland:SetValue(false)

function IsIslandRaid(cu)
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island " .. cu) then
        local min = 4500
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v.Name == "Island " .. cu and (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < min then
                min = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            end
        end
        for r, v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
            if v.Name == "Island " .. cu and (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= min then
                return v
            end
        end
    end
end

function getNextIsland()
    local TableIslandsRaid = {5, 4, 3, 2, 1}
    for r, v in pairs(TableIslandsRaid) do
        if IsIslandRaid(v) and (IsIslandRaid(v).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4500 then
            return IsIslandRaid(v)
        end
    end
end

local Toggle = Tabs.Raid:AddToggle("Kill Aura", { Title = "Kill Aura", Default = false })
Toggle:OnChanged(function(Value)
    _G.Kill_Aura = Value
end)

spawn(function()
    pcall(function() 
        while wait() do
            if _G.Kill_Aura then
                if game:GetService("Players")["LocalPlayer"].PlayerGui.Main.Timer.Visible then
                    for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                            pcall(function()
                                repeat wait()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    v.Humanoid.Health = 0
                                    v.HumanoidRootPart.CanCollide = false
                                until not _G.Kill_Aura or not v.Parent or v.Humanoid.Health <= 0
                            end)
                        end
                    end
                end
            end
        end
    end)
end)

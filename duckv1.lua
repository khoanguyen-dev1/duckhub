loadstring(game:HttpGet("https://pastefy.app/kTvdratR/raw"))()

_G.NuocLon = Value

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

local function lockOnToHead(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local headPosition = player.Character.Head.Position

        game.Workspace.CurrentCamera.CFrame = CFrame.new(headPosition + Vector3.new(0, 5, 0), headPosition)
    end
end

local function findNearestPlayer()
    local nearestDistance = math.huge
    local nearestPlayer = nil

    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local distance = (player.Character.Head.Position - game.Players.LocalPlayer.Character.Head.Position).magnitude

            if distance < nearestDistance then
                nearestDistance = distance
                nearestPlayer = player
            end
        end
    end

    return nearestPlayer
end

while true do
    local nearestPlayer = findNearestPlayer()

    if nearestPlayer then
        lockOnToHead(nearestPlayer)
    end

    wait(0.1)
end

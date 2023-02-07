local dp = {}
dp.shared = false

function dp.__createsharedclause()
    if (dp.shared) then
        return dp.shared
    else
        local sharedPackagingFolder = Instance.new('Folder', game:GetService('ReplicatedStorage'))
        sharedPackagingFolder.Name = '_middleReplicated'
        
        local toShare = game:GetService('ServerScriptService'):WaitForChild('Middle')._local:GetDescendants()
        for _, __ in pairs(toShare) do
            __.Parent = sharedPackagingFolder
        end
    end
end

function dp.__local()
    if game:GetService('ReplicatedStorage'):FindFirstChild('_middleReplicated') then
        return game:GetService('ReplicatedStorage'):FindFirstChild('_middleReplicated'):GetDescendants()
    end
end

function dp.__server()
    assert(game:GetService('RunService'):IsServer(), 'Middle - Forbidden deeplink access!')
    return game:GetService('ServerScriptService'):WaitForChild('Middle')._server:GetDescendants()
end

return dp
--@walter8129
--[[
    Made for source directory management and controlling of deepfiles.
]]

local RunService = game:GetService('RunService')

local Promise = require(script.Packages.Promise)
local Sock = require(script.Packages.Sock)

local Reporters = {
    Soft = require(script.Reporters.SoftReport),
}

local Middle = {}
Middle.__deeplink = require(script.DeepPackage)
Middle.__accessparry = {}

if (RunService:IsServer()) then
    if not Middle.__deeplink.shared then
        Middle.__deeplink.__createsharedclause()
        print('✅ Replicated Middle')
    end

    local GlobalMiddle = {}
    function GlobalMiddle:LoadPackage(...)
        for _, __ in pairs(Middle.__deeplink.__server()) do
            if __.Name == ... then
                return require(__)
            end
        end
    end
    function GlobalMiddle:LoadCommon(shared)
        for _, __ in pairs(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):GetChildren()) do
            if __.Name == shared:lower() then
                return require(__)
            end
        end
    end
    return GlobalMiddle
else
    local LocalMiddle = {}
    function LocalMiddle:LoadPackage(...)
        for _, __ in pairs(Middle.__deeplink.__local()) do
            if __.Name == ... then
                return require(__)
            end
        end
    end
    function GlobalMiddle:LoadCommon(shared)
        for _, __ in pairs(game:GetService('ReplicatedStorage'):WaitForChild('Packages'):GetChildren()) do
            if __.Name == shared:lower() then
                return require(__)
            end
        end
    end
    return LocalMiddle
end
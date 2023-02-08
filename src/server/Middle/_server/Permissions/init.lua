--@walter8129

local Middle = require(game:GetService('ReplicatedStorage'):WaitForChild('Middle'))
local Promise = Middle:LoadCommon('Promise')

local Permissions = {}
Permissions.type = {
    Group = require(script:WaitForChild('Group')),
    Class = require(script:WaitForChild('Class')),
    Team = require(script:WaitForChild('Team')),
    User = require(script:WaitForChild('User'))
}

--////////////////////////////////////////////
function getSegmentType(segment)
    if Permissions.type[segment:split(':')[1]] then
        return Permissions.type[segment:split(':')[1]]
    end
end

function hasSegmentPermission(user: Player, segment: string, t: { () -> ()})
    if t(user, segment) then
        return true
    end
end

--////////////////////////////////////////////
function Permissions.new(User, Data): thread
    assert(Data, 'You must provide a data parameter to execute permission sets. (missing arg 2)')
    assert(User, 'You must provide a user parameter to execute permission sets. (missing arg 1)')

    if typeof(Data) ~= 'table' then
        Data = { Data }
    end

    return Promise.new(function(resolve)
        for __, PermissionSegment: string | {} in pairs(Data) do
            if typeof(PermissionSegment) == 'table' then
                assert(__ - 1 > 0, 'You cannot issue a subsidiary permission segment without a definer(condition) statement.')
                if hasSegmentPermission(User, Data[__-1], getSegmentType(Data[__-1])) then
                    for ___, subsidiarySegment in pairs(PermissionSegment) do
                        local subsidiaryType = getSegmentType(subsidiarySegment)
                        if hasSegmentPermission(User, subsidiarySegment, subsidiaryType) then
                            resolve(true)
                        end
                    end
                end
            else
                if hasSegmentPermission(User, PermissionSegment, getSegmentType(PermissionSegment)) then
                    resolve(true)
                end
            end
        end
        resolve(false)
    end)
end

return Permissions

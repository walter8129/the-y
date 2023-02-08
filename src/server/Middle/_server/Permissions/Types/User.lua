return function<USER_PERMISSION>(user, segment)
    local _, UserData = segment:split(':')
    if tonumber(UserData) then
        if user.UserId == tonumber(UserData) then
            return true
        end
    else
        if user.Name == UserData then
            return true
        end
    end
end
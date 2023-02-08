return function<TEAM_PERMISSION>(user, segment)
    local _, TeamData = segment:split(':')
    if user.Team.Name == TeamData then
        --//TODO: add abbreviations acceptable!! - love walter
        return true
    end
end
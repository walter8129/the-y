local Pair = {}
Pair.Match = {}
Pair.defaultError = function(p)
    assert(p[1], 'Pair.Match.isMatching - No data in pair index (1)!')
    assert(p[2], 'Pair.Match.isMatching - No data in pair index (2)!')
end

function Pair.Match.isMatching(pair)
    Pair.defaultError(pair)
    if pair[1] == pair[2] then
        return true
    else
        return false
    end
end

function Pair.Match.willMatch(pair, connectArguments)
    Pair.defaultError(pair)
    return pcall(function()
        if pair[1](connectArguments.one) == pair[2](connectArguments.two) then
            return true
        else
            return false
        end
    end)
end

function Pair.Match.has(pair, what: any?)
    Pair.defaultError(pair)
    assert(what, 'Pair.Match.has - No data in what argument; cannot compare!')
    local function goDeep(x)
        for _, __ in pairs(x) do
            if typeof(__) == 'table' then
                goDeep(x)
            else
                if __ == what then
                    return true
                end
            end
        end
    end
    for _, __ in pairs(pair) do
        if typeof(__) == 'table' then
            if goDeep(__) then
                return true
            end
        else
            if __ == what then
                return true
            end
        end
    end
    return false
end

return Pair.Match
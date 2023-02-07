local Sock = {}
Sock.Set = {}

function Sock.Set.indexify(pair, i, v)
    assert(pair[i], 'Sock.Set.indexify - Cannot change index if index does not exist!')
    local cacheValue = pair[i]
    pair[i] = nil
    pair[v] = cacheValue
    return pair
end

function Sock.Set.keyify(pair, i, v)
    assert(pair[i], 'Sock.Set.keyify - Cannot change key if index does not exist!')
    pair[i] = v
    return pair
end

function Sock.Set.newify(pair, i, v)
    assert(not pair[i], 'Sock.Set.newify - Cannot add new data if it already exists; consider using "set"!')
    pair[i] = v
    return pair
end

function Sock.Set.set(pair, i, v)
    pair[i] = v
    return pair
end

return Sock.Set
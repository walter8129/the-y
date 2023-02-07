--@walter8129
local sock = require(script.Parent.Parent.Packages.Sock)
function __executeSoftReport(content)
    local d = sock.Pair.new('soft-report', ('Middle had an error ~ %s'):format(content))
    sock.Pair.Set.indexify(d, 1, 'status')
    sock.Pair.Set.indexify(d, 2, 'content')
    game:GetService('TestService'):Message(d.content)

    return d
end

return setmetatable({}, {
    __call = function(self, ...)
        return __executeSoftReport(...).status
    end
})
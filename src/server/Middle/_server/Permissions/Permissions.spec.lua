--@walter8129

return function()
    local permissions = require(script.Parent)
    describe('permissions', function()
        it('should return a promise', function()
           permissions.new(true, true):catch(function()
                print('Successfully started permissions.')
           end)
        end)
    end)
end
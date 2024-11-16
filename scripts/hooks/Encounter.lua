local Encounter, super = Class(Encounter)

function Encounter:getSoulColor()
	if Game:getFlag("should_doop") then
		return 62/255, 1/255, 65/255
	end
    return Game:getSoulColor()
end

return Encounter
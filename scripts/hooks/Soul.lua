local Soul, super = Class(Soul)

function Soul:init(x, y, color)
	super.init(self, x, y, color)
	if Game:getFlag("should_doop") then
		self:setColor({106/255, 2/255, 112/255})
		self.sprite:setSprite("player/heart_dodge_empty")
	end
end

return Soul
local ActionBox, super = Class(ActionBox)

function ActionBox:init(x, y, index, battler)
    super.init(self, x, y, index, battler)
    
    if self.index == 1 and Game:getFlag("should_doop") then
		self.name_sprite.alpha = 0
		self.head_sprite.alpha = 0
	end
end

function ActionBox:drawActionBox()
	if self.index == 1 and Game:getFlag("should_doop") then
		if Game.battle.current_selecting == self.index then
			Draw.setColor(62/255, 1/255, 65/255)
			love.graphics.setLineWidth(2)
			love.graphics.line(1  , 2, 1,   37)
			love.graphics.line(Game:getConfig("oldUIPositions") and 211 or 212, 2, Game:getConfig("oldUIPositions") and 211 or 212, 37)
			love.graphics.line(0  , 6, 212, 6 )
		end
		
		Draw.setColor(1, 1, 1, 1)
	else
		super.drawActionBox(self)
	end
end

function ActionBox:drawSelectionMatrix()
	if self.index == 1 and Game:getFlag("should_doop") then
		-- Draw the background of the selection matrix
		Draw.setColor(0, 0, 0, 1)
		love.graphics.rectangle("fill", 2, 2, 209, 35)

		if Game.battle.current_selecting == self.index then
			local r,g,b,a = unpack({62/255, 1/255, 65/255, 1})

			for i = 0, 11 do
				local siner = self.selection_siner + (i * (10 * math.pi))

				love.graphics.setLineWidth(2)
				Draw.setColor(r, g, b, a * math.sin(siner / 60))
				if math.cos(siner / 60) < 0 then
					love.graphics.line(1 - (math.sin(siner / 60) * 30) + 30, 0, 1 - (math.sin(siner / 60) * 30) + 30, 37)
					love.graphics.line(211 + (math.sin(siner / 60) * 30) - 30, 0, 211 + (math.sin(siner / 60) * 30) - 30, 37)
				end
			end

			Draw.setColor(1, 1, 1, 1)
		end
	else
		super.drawSelectionMatrix(self)
	end
end

return ActionBox
local DTText, super = Class(Object)

function DTText:init(boss)
    super.init(self, 0, 0)

    self.text = boss
	
	self.sparestar = Assets.getTexture("ui/battle/sparestar")
    self.tiredmark = Assets.getTexture("ui/battle/tiredmark")
end


function DTText:draw()
	-- Name text
	love.graphics.setFont(Assets.getFont("main_mono", 16))
	love.graphics.setColor({0, 0, 0, 1})
    love.graphics.print(self.text, 102, 9)
    love.graphics.print(self.text, 104, 9)
    love.graphics.print(self.text, 102, 8)
    love.graphics.print(self.text, 103, 8)
    love.graphics.print(self.text, 104, 8)
    love.graphics.print(self.text, 102, 10)
    love.graphics.print(self.text, 103, 10)
    love.graphics.print(self.text, 104, 10)
	love.graphics.setColor({1, 1, 1, 1})
    love.graphics.print(self.text, 103, 9)
	
	-- Bars
	love.graphics.setColor({0, 0, 0, 1})
	love.graphics.rectangle("fill", 98, 27, 444, 15)
	love.graphics.setColor({0.5, 0, 0, 1})
	love.graphics.rectangle("fill", 100, 29, 440, 5)
	love.graphics.setColor({1, 80/255, 32/255, 1})
	love.graphics.rectangle("fill", 100, 36, 440, 4)
	if Game.battle.encounter and Game.battle.encounter.boss then
		love.graphics.setColor({76/255, 1, 0, 1})
		love.graphics.rectangle("fill", 100, 29, 440 * (Game.battle.encounter.boss.health/Game.battle.encounter.boss.max_health), 5)
		love.graphics.setColor({1, 1, 0, 1})
		love.graphics.rectangle("fill", 100, 36, 440 * (Game.battle.encounter.boss.mercy/100), 4)
		love.graphics.setColor({1, 1, 1, 1})
		if Game.battle.encounter.boss.tired then
			Draw.draw(self.tiredmark, 495, 9)
		end
		if Game.battle.encounter.boss:canSpare() then
			Draw.draw(self.sparestar, 519, 9)
		end
	else
		love.graphics.setColor({76/255, 1, 0, 1})
		love.graphics.rectangle("fill", 100, 29, 440, 5)
	end

    super.draw(self)
end

return DTText
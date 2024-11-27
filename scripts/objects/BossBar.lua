local BossBar, super = Class(Object)

function BossBar:init(boss)
    super.init(self, 0, 0)

    self.text = boss
	
	self.sparestar = Assets.getTexture("ui/battle/sparestar")
    self.tiredmark = Assets.getTexture("ui/battle/tiredmark")
    self.dizzymark = Assets.getTexture("ui/battle/dizzymark")
    self.ragemark = Assets.getTexture("ui/battle/ragemark")
end

function BossBar:draw()
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
	love.graphics.rectangle("fill", 98, 33, 444, 15)
	love.graphics.setColor({0.5, 0, 0, 1})
	love.graphics.rectangle("fill", 100, 29, 440, 5)
	love.graphics.setColor({1, 80/255, 32/255, 1})
	love.graphics.rectangle("fill", 100, 36, 440, 4)
	if Game.battle.encounter and Game.battle.encounter.boss then
		love.graphics.setColor({76/255, 1, 0, 1})
		love.graphics.rectangle("fill", 100, 29, 440 * (Game.battle.encounter.boss.health/Game.battle.encounter.boss.max_health), 5)
		love.graphics.setColor({1, 1, 0, 1})
		love.graphics.rectangle("fill", 100, 36, 440 * (Game.battle.encounter.boss.mercy/100), 4)
		if Game.battle.encounter.boss.cstat1 then
			love.graphics.setColor(Game.battle.encounter.boss.cback1 or {0.5, 0.5, 0.5, 1})
			love.graphics.rectangle("fill", 100, 42, 440, 4)
			love.graphics.setColor(Game.battle.encounter.boss.cfront1 or {1, 1, 1, 1})
			love.graphics.rectangle("fill", 100, 42, 440 * (Game.battle.encounter.boss.cstat1/Game.battle.encounter.boss.cmax1), 4)
		end
		love.graphics.setColor({1, 1, 1, 1})
		if Game.battle.encounter.boss.tired then
			Draw.draw(self.tiredmark, 495, 9)
		end
		if Game.battle.encounter.boss:canSpare() then
			Draw.draw(self.sparestar, 519, 9)
		end
		if Game.battle.encounter.boss.dizzy then
			Draw.draw(self.dizzymark, 471, 9)
		end
		if Game.battle.encounter.boss.enraged then
			Draw.draw(self.ragemark, 447, 9)
		end
	else
		love.graphics.setColor({76/255, 1, 0, 1})
		love.graphics.rectangle("fill", 100, 29, 440, 5)
	end

    super.draw(self)
end

return BossBar
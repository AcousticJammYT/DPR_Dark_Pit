local Basic, super = Class(Wave)

function Basic:onStart()
	self.timer:script(function(wait)
		-- Spawns the warning and makes it flicker, creating a sound each time it does
		Assets.playSound("mtt_prebomb")
		local bullet = self:spawnBullet("steering_warn", 320, 172)
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		Assets.playSound("mtt_prebomb")
		wait(0.1)
		bullet:remove()
		
		-- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
		self:spawnBullet("steering_wheel", 320, 172)
	end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/steering_wheel")
	
	self.rot_dir = (love.math.random(1,2) == 1 and 1 or -1)

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = 0
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = 0
	
	self.collider = ColliderGroup(self, {
		CircleCollider(self, 50, 50, 23),
		Hitbox(self, 46, 2, 8, 96),
		Hitbox(self, 2, 46, 96, 8),
		-- etc, list can keep going
	})
	
	self.destroy_on_hit = false
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update
	
	if #Game.battle.enemies == 1 then
		self.rotation = self.rotation + DTMULT/30 * self.rot_dir
	end

    super.update(self)
end

return SmallBullet
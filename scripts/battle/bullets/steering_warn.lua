local SmallBullet, super = Class(Bullet)

function SmallBullet:init(x, y)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/steering_warn")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = 0
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = 0
	
	self.collider = nil
	
	self.destroy_on_hit = false
end

function SmallBullet:update()
    -- For more complicated bullet behaviours, code here gets called every update

    super.update(self)
end

return SmallBullet
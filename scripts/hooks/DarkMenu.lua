local DarkMenu, super = Class(DarkMenu)

function DarkMenu:init()
    super.init(self)
    
	self.side_rect_x = 640
    self.side_rect_visible = true
end

function DarkMenu:update()
    super.update(self)
    
	if self.tension_bar then
		if not self.animate_out then
			if self.side_rect_x > 575 or self.tension_bar.x > 615 then
				self.side_rect_x = math.max(self.side_rect_x - 25  * DTMULT, 575)
				self.tension_bar.x = math.max(self.tension_bar.x - 25 * DTMULT, 615)
			end
		else
			if self.side_rect_x < 640 or self.tension_bar.x < 690 then
				self.side_rect_x = math.min(self.side_rect_x + 25 * DTMULT, 640)
				self.tension_bar.x = math.min(self.tension_bar.x + 25 * DTMULT, 690)
			end
		end
	end
end

function DarkMenu:draw()
    if self.side_rect_visible then
        Draw.setColor(0, 0, 0, 0.5)
        love.graphics.rectangle("fill", self.side_rect_x, 50, 60, 140)
    end
    super.draw(self)
end

return DarkMenu

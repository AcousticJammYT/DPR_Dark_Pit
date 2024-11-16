local Player, super = Class(Player)

function Player:init(chara, x, y)
	super.init(self, chara, x, y)
	
	self.doopShader = love.graphics.newShader([[
		vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
			vec4 texColor = Texel(texture, texture_coords);

			// If the alpha is below a threshold (e.g., 0.01), return the original color
			if (texColor.a < 0.01) {
				return texColor * color;
			}

			return vec4(62.0/255.0, 1.0/255.0, 65.0/255.0, 1.0);
		}
	]])
	
	if Game:getFlag("should_doop") then
		doop_fx = ShaderFX(self.doopShader, {})
		self:addFX(doop_fx, "doop_fx")
	end
end

return Player
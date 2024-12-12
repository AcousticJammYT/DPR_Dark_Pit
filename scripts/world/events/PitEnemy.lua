local PitEnemy, super = Class(ChaserEnemy, "pit_enemy")

function PitEnemy:init(data)
    super.init(self, data.properties.actor, data.x, data.y, data.properties)
	
	self.encounter = "battle_" .. Game:getFlag("pit_floorcount", 1)
end

function PitEnemy:onCollide(player)
	if self:isActive() and player:includes(Player) then
		Game.world:startCutscene(function(cutscene)
			self.world.encountering_enemy = true
			self.sprite:setAnimation("hurt")
			self.sprite.aura = false
			Assets.playSound("tensionhorn")
			cutscene:wait(8/30)
			local src = Assets.playSound("tensionhorn")
			src:setPitch(1.1)
			cutscene:wait(12/30)
			self.world.encountering_enemy = false
			cutscene:startEncounter(self.encounter, true, self)
			self:remove()
			cutscene:wait(1/30)
			cutscene:wait(cutscene:walkTo(Game.world.player, "mover", 1, "up"))
			-- 240, 120
			Assets.playSound("impact")
			Game.world:spawnObject(Registry.createEvent("nextfloor", {x=260, y=120, width=120, height=40, properties={}}))
		end)
	end
end

return PitEnemy
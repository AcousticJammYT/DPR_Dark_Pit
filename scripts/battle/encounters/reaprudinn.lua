local Boss, super = Class(Encounter)

function Boss:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Luminous End makes its appearance."

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the boss enemy to the encounter
    self.boss = self:addEnemy("reaprudinn")
	
	-- Since this is a boss encounter, this is the name that will appear on the top.
	self.boss_name = "Rudinn Reaper, The Luminous End"
	
	-- Bosses also get boss bars.
	self.boss_bar = BossBar(self.boss_name)
	Game.battle:addChild(self.boss_bar)
end

return Boss
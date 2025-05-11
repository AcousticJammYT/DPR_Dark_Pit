local Boss, super = Class(Encounter)

function Boss:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* The Warden of the Earth makes its appearance."

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the boss enemy to the encounter
    self.boss = self:addEnemy("grumbolith", 500, 320)
	
	-- Since this is a boss encounter, this is the name that will appear on the top.
	self.boss_name = "Grumbolith, Warden of the Earth"
	
	-- Bosses also get boss bars.
	self.boss_bar = BossBar(self.boss_name)
	Game.battle:addChild(self.boss_bar)
	
	self.xact_name = "Cool"
end

function Boss:onTurnStart()
	if self.boss.cstat1 then
		self.boss.cstat1 = math.max(self.boss.cstat1 - 0.3, 0)
	end
end

return Boss
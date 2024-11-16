local Pirate, super = Class(EnemyBattler)

function Pirate:init()
    super.init(self)

    self.name = "Skelecaptain"
    self:setActor("skelepirate")

    self.max_health = 450
    self.health = 450
    self.attack = 7
    self.defense = 1
    self.money = 200

    self.spare_points = 20

    self.waves = {
        "steering_turn"
    }

    self.dialogue = {
        "Rattle,\nrattle..."
    }

    self.check = {"AT 7 DF 1\n* Captain of the Deadman's Crew.", "Be careful, for the captain plays dirty."}

    self.text = {
        "* Skelepirate's bones rattle in your ear.",
        "* Skelepirate's arm falls off, but they pick it up and reattach it.",
        "* Smells like milk.",
    }
    self.low_health_text = "* Skelepirate's bones are cracked."

    self:registerAct("Clash")
	
	self.cutscene_characters = {}
	self.cutscene_executed = false
end

function Pirate:onAct(battler, name)
    if name == "Clash" then
		self.cutscene_executed = true
		table.insert(self.cutscene_characters, battler.chara.id)
		return "* " .. battler.chara.name .. " prepared to clash..."
	end

	if name == "Standard" then -- X-action
		self.cutscene_executed = true
		table.insert(self.cutscene_characters, battler.chara.id)
		return "* " .. battler.chara.name .. " prepared to clash..."
	end

    return super.onAct(self, battler, name)
end

function Pirate:onTurnStart()
	if self.cutscene_executed then
		print(self.cutscene_characters)
	end
	self.cutscene_characters = {}
	self.cutscene_executed = false
end

return Pirate
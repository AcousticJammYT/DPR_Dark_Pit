local Pirate, super = Class(EnemyBattler)

function Pirate:init()
    super.init(self)

    self.name = "Skelepirate"
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

    self.check = "AT 7 DF 1\n* Dead men tell no tales."

    self.text = {
        "* Skelepirate's bones rattle in your ear.",
        "* Skelepirate's arm falls off, but they pick it up and reattach it.",
        "* Smells like milk.",
    }
    self.low_health_text = "* Skelepirate's bones are cracked."

    self:registerAct("Immitate")
    self:registerAct("Compliment")
end

function Pirate:onAct(battler, name)
    if name == "Compliment" then
		if battler.chara.id == "jamm" then
			self:addMercy(100)
			return {
				"[facec:marcy/smile][voice:marcy]* Marcy really likes your\nbandana!",
				"[face]* Skelepirate seems to really appreciate the compliment."
			}
		end
        self:addMercy(50)
        return {
            "* " .. battler.chara.name .. " compliments the Skelepirate's appearance.",
			"* Skelepirate seems to appreciate the compliment."
        }

    elseif name == "Immitate" then
		self.attack = self.attack + 2
		if battler.chara.id == "jamm" then
			return {
				"[facec:marcy/smile][voice:marcy]* Shiver me timbers!",
				"[face]* Skelepirate doesn't seem to like this.\n* Skelepirate's attack up!"
			}
		end
        return {
            "* " .. battler.chara.name .. " tries to immitate a pirate.",
			"* Skelepirate doesn't seem to like this.\n* Skelepirate's attack up!"
        }

    elseif name == "Standard" then
        self:addMercy(25)
        return "* "..battler.chara:getName().." complimented Skelepirate."
    end

    return super.onAct(self, battler, name)
end

return Pirate
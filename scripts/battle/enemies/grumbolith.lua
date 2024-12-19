local Grumbolith, super = Class(EnemyBattler)

function Grumbolith:init()
    super.init(self)

    -- Enemy name
    self.name = "Grumbolith"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 8000
    self.health = 8000
    -- Enemy attack (determines bullet damage)
    self.attack = 9
    -- Enemy defense (usually 0)
    self.defense = 2
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {"AT 9 DF 2\n* A rock monster of immense power.", "It seems you can't get anywhere without cooling it off first.", "It seems Grumbolith's heat is protecting it..."}

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Grumbolith heats up the battlefield.",
        "* Grumbolith stands perfectly still, almost like a statue.",
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Grumbolith seems to be breaking a sweat."
	
	self.tired_percentage = 0
    self.low_health_percentage = 0.1
	
	self.cstat1 = 0
	self.cmax1 = 1
	self.cback1 = {0, 90/255, 135/255, 1}
	self.cfront1 = {158/255, 223/255, 1, 1}

    self:registerShortAct("Cool", "Make\nCOLD")
	
	self.tags = {"Heat"}
end

function Grumbolith:onAct(battler, name)
    if name == "Cool" then
        self.cstat1 = self.cstat1 + 0.3
		if self.cstat1 > 1 then
			self.cstat1 = 1
			if self.dizzy then
				self:addMercy(9)
			else
				self:addMercy(2)
			end
		end
        return {
            "* " .. battler.chara.name .. " cools Grumbolith down."
        }
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Grumbolith:onShortAct(battler, name)
    if name == "Cool" then
        self.cstat1 = self.cstat1 + 0.3
		if self.cstat1 > 1 then
			self.cstat1 = 1
			if self.dizzy then
				self:addMercy(9)
			else
				self:addMercy(2)
			end
			return {
				"* " .. battler.chara.name .. " overcools Grumbolith."
			}
		end
        return {
            "* " .. battler.chara.name .. " cools Grumbolith down."
        }
    end
end

function Grumbolith:isXActionShort(battler)
    return true
end

function Grumbolith:getShield()
	return (self.cstat1 < 0.4)
end

function Grumbolith:getXAction(battler)
    return "Cool"
end

function Grumbolith:hurt(amount, battler, on_defeat, color, show_status, attacked)
	if self.dizzy then
		amount = amount * 10
	elseif self.cstat1 < 0.4 then
		amount = amount / 10
	end
	amount = math.max(amount, 1)
	super.hurt(self, amount, battler, on_defeat, color, show_status, attacked)
end

return Grumbolith
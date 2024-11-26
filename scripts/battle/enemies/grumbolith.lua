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
    }
    -- Text displayed at the bottom of the screen when the enemy has low health
    self.low_health_text = "* Grumbolith seems to be breaking a sweat."
	
	self.cstat1 = 0
	self.cmax1 = 1
	self.cback1 = {0, 90/255, 135/255, 1}
	self.cfront1 = {158/255, 223/255, 1, 1}

    self:registerAct("Cool", "Make\nCOLD")
	
	self.tags = {"Heat"}
end

function Grumbolith:onAct(battler, name)
    if name == "Cool" then
        self.cstat1 = self.cstat1 + 0.3
		if self.cstat1 > 1 then
			self.cstat1 = 1
			self:addMercy(3)
		end
        return {
            "* " .. battler.chara.name .. " cools Grumbolith down."
        }

    elseif name == "Tell Story" then
        -- Loop through all enemies
        for _, enemy in ipairs(Game.battle.enemies) do
            -- Make the enemy tired
            enemy:setTired(true)
        end
        return "* You and Ralsei told the dummy\na bedtime story.\n* The enemies became [color:blue]TIRED[color:reset]..."

    elseif name == "Standard" then --X-Action
        -- Give the enemy 50% mercy
        self:addMercy(50)
        if battler.chara.id == "ralsei" then
            -- R-Action text
            return "* Ralsei bowed politely.\n* The dummy spiritually bowed\nin return."
        elseif battler.chara.id == "susie" then
            -- S-Action: start a cutscene (see scripts/battle/cutscenes/dummy.lua)
            Game.battle:startActCutscene("dummy", "susie_punch")
            return
        else
            -- Text for any other character (like Noelle)
            return "* "..battler.chara:getName().." straightened the\ndummy's hat."
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Grumbolith:getShield()
	return (self.cstat1 < 0.4)
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
local ReapRudinn, super = Class(EnemyBattler)

function ReapRudinn:init()
    super.init(self)

    -- Enemy name
    self.name = "Rudinn Reaper"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 11000
    self.health = 11000
    -- Enemy attack (determines bullet damage)
    self.attack = 11
    -- Enemy defense (usually 0)
    self.defense = 5
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

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {"AT 11 DF 5\n* Takes broken objects away."}

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Reaper Rudinn is preparing to join its souls.",
    }

    -- Register act called "Smile"
    self:registerAct("Smile")
    -- Register party act with Ralsei called "Tell Story"
    -- (second argument is description, usually empty)
    self:registerAct("Tell Story", "", {"ralsei"})
end

function ReapRudinn:onAct(battler, name)
    if name == "Smile" then
        -- Give the enemy 100% mercy
        self:addMercy(100)
        -- Change this enemy's dialogue for 1 turn
        self.dialogue_override = "... ^^"
        -- Act text (since it's a list, multiple textboxes)
        return {
            "* You smile.[wait:5]\n* The dummy smiles back.",
            "* It seems the dummy just wanted\nto see you happy."
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

function ReapRudinn:hurt(amount, battler, on_defeat, color, show_status, attacked)
	if self.dizzy then
		amount = amount * 10
	end
	amount = math.max(amount, 1)
	super.hurt(self, amount, battler, on_defeat, color, show_status, attacked)
end

return ReapRudinn
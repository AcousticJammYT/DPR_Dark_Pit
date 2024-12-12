return {
	elevator = function(cutscene, event)
		ELEVATOR_TRANSITION = {
            target_floor = 2,
            target_dir = 1,
            target_name = "The Dark Pit",
            target_dest = "The Dark Pit",
			party_data = { {}, {}, {} }
        }
		ELEVATOR_TRANSITION.party_data[1].x =      316
        ELEVATOR_TRANSITION.party_data[1].y =      300
        ELEVATOR_TRANSITION.party_data[1].facing = "up"
        for i, chara in ipairs(Game.world.followers) do
            ELEVATOR_TRANSITION.party_data[i+1].x =      316
            ELEVATOR_TRANSITION.party_data[i+1].y =      300
            ELEVATOR_TRANSITION.party_data[i+1].facing = "up"
        end
		cutscene:after(Game:swapIntoMod("dpr_main", false, "hub_elevator"))
    end,
	
    lock = function(cutscene, event)
		if not Game:getFlag("pit_unlocked") then
			cutscene:text("* The area ahead of you is locked.")
			if Game.inventory:hasItem("pit_key") then
				cutscene:text("* The [color:yellow]Strange Key P[color:white] is reacting to the lock...")
				cutscene:text("* Before you know it, you're unlocking the lock.")
				Game:setFlag("pit_unlocked", true)
				Game.inventory:removeItem("pit_key")
				local shape = Game.world.map:getHitbox("pit_lock")
				shape.collidable = false
				Game.world.map:getTileLayer("LockedPit").visible = false
				Assets.playSound("noise")
			end
		end
    end,
	
    entry = function(cutscene, event)
		local susie = cutscene:getCharacter("susie")
		local jamm = cutscene:getCharacter("jamm")
		local brenda = cutscene:getCharacter("brenda")
		if not Game:getFlag("pit_pre-pit-talk") then
			Game:setFlag("pit_pre-pit-talk", true)
			if susie then
				cutscene:showNametag("Susie")
				cutscene:text("* Woah, that's, uh...", "nervous_side", "susie")
				cutscene:text("* That's a hole at the bottom of the dark world.", "nervous", "susie")
			end
			if jamm then
				cutscene:showNametag("Jamm")
				cutscene:text("* I wonder how far deep this hole goes?", "neutral", "jamm")
				cutscene:text("* I mean... If we fell in...", "nervous_left", "jamm")
				if brenda then
					cutscene:text("* Would we be able to come back up?[react:1]", "worried", "jamm", {reactions = {
						{"There's a bin\nright there...", "right", "bottom", "neutral", "brenda"}
					}})
				else
					cutscene:text("* Would we be able to come back up?", "worried", "jamm")
				end
			end
		end
		
		cutscene:hideNametag()
		cutscene:text("* Will you enter the pit?")
		if cutscene:choicer({"Yes", "No"}) == 1 then
			-- TODO: Code entry to the pit.
			cutscene:detachFollowers()
			cutscene:detachCamera()
			cutscene:setSprite(Game.world.player, "landed_1")
			cutscene:wait(1/10)
			Assets.playSound("jump")
			Game.world.player:setLayer(Game.world.player.layer + 1)
			cutscene:setAnimation(Game.world.player, {"ball", 1/15, true})
			cutscene:wait(cutscene:slideTo(Game.world.player, Game.world.player.x, Game.world.player.y - 80, 0.5, "out-quad"))
			cutscene:wait(cutscene:slideTo(Game.world.player, Game.world.player.x, 760, 0.7, "in-quad"))
			cutscene:wait(cutscene:fadeOut(0.4))
            for i = 0,5 do
                cutscene:playSound("impact", (1 - (i/10)) ^ (4) )
                cutscene:wait(0.2)
            end
			cutscene:loadMap("area_1")
			cutscene:wait(1)
			cutscene:wait(cutscene:fadeIn(0.4))
			Game:setFlag("pit_floorcount", 1)
			Game:setFlag("area_1_discovery", false)
		else
			cutscene:text("* You decide you're not ready for the fall.")
			cutscene:wait(cutscene:walkTo(Game.world.player, Game.world.player.x, Game.world.player.y - 20, 0.5))
		end
    end
}

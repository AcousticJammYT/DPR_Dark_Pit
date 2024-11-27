return {
    discovery = function(cutscene, event)
		if not Game:getFlag("area_1_discovery") then
			local jamm = cutscene:getCharacter("jamm")
			local brenda = cutscene:getCharacter("brenda")
			local hero = cutscene:getCharacter("hero")
			if brenda then
				cutscene:showNametag("Brenda")
				cutscene:text("* What the...?", "shocked", "brenda")
				cutscene:text("* What happened here?", "shocked_b", "brenda")
				if hero and not jamm then
					cutscene:showNametag("Hero")
					cutscene:text("* Something tells me we're about to find out.")
				end
			end
			if jamm then
				cutscene:showNametag("Jamm")
				cutscene:text("* It looks like a massacre took place...", "nervous", "jamm")
				cutscene:text("* What could possibly have done this?", "nervous_left", "jamm")
				if hero then
					cutscene:showNametag("Hero")
					cutscene:text("* Something tells me we're about to find out.")
				end
			end
			
			Game:setFlag("area_1_discovery", true)
			
			cutscene:hideNametag()
		end
    end
}
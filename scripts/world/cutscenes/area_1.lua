return {
    discovery = function(cutscene, event)
		local jamm = cutscene:getCharacter("jamm")
		local brenda = cutscene:getCharacter("brenda")
		local hero = cutscene:getCharacter("hero")
		if brenda then
			cutscene:showNametag("Brenda")
			cutscene:text("* What the...?", "worried", "brenda")
			cutscene:text("* What happened here?", "worried", "brenda")
		end
		if jamm then
			cutscene:showNametag("Jamm")
			cutscene:text("* It looks like a massacre took place...", "neutral", "jamm")
			cutscene:text("* What could possibly have done this?", "neutral", "jamm")
			if hero then
				cutscene:showNametag("Hero")
				cutscene:text("* Something tells me we're about to find out.")
			end
		end
		
		cutscene:hideNametag()
    end
}
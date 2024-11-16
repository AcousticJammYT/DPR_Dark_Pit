return {
    wall = function(cutscene, event)
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
					cutscene:text("* Would we be able to come back up?", "worried", "jamm", {reactions = {
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
		else
			cutscene:text("* You decide you're not ready for the fall.")
		end
    end
}

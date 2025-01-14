return {
    ---@param cutscene WorldCutscene
    main = function(cutscene, map, partyleader)
        if Game:isDessMode() then
            cutscene:showNametag("Dess")
            cutscene:text("* allan please add dialogue", "neutral", "dess")
            cutscene:hideNametag()
        else
            if map == "pre_pit" then
				local hero = cutscene:getCharacter("hero")
				if hero then
					local jamm = cutscene:getCharacter("jamm")
					local susie = cutscene:getCharacter("susie")
					cutscene:textTagged("* So this is what the bottom of a dark world is like...", "neutral_closed", "hero")
					if jamm and not Game:getFlag("dungeonkiller") then
						cutscene:textTagged("* Wait, the bottom???", "nervous", "jamm")
						cutscene:textTagged("* As in, can't go any deeper???", "nervous_left", "jamm")
						cutscene:textTagged("* That can't be right...\n* There's a hole right there.", "worried", "jamm")
						cutscene:textTagged("* So there is...", "really", "hero")
					else
						cutscene:textTagged("* Except there's a hole just ahead...", "really", "hero")
					end
					if susie then
						cutscene:textTagged("* The hell do you think is down there?", "neutral", "susie")
						cutscene:textTagged("* Only one way to find out, I guess...", "neutral_closed", "hero")
					end
				else
					cutscene:text("* (But your voice echoed aimlessly.)")
				end
            else
                cutscene:text("* (But your voice echoed aimlessly.)")
            end
        end
    end,
}
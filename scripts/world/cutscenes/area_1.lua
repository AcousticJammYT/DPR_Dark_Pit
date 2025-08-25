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
					cutscene:text("* Something tells me we're about to find out.", "neutral", "hero")
				end
			end
			if jamm then
				cutscene:showNametag("Jamm")
				cutscene:text("* It looks like a massacre took place...", "nervous", "jamm")
				cutscene:text("* What could possibly have done this?", "nervous_left", "jamm")
				if hero then
					cutscene:showNametag("Hero")
					cutscene:text("* Something tells me we're about to find out.", "neutral", "hero")
				end
			end
			
			Game:setFlag("area_1_discovery", true)
			
			cutscene:hideNametag()
		end
    end,
	
    robot = function(cutscene, event)
		if Game:getFlag("apm_destroyed") then
			cutscene:text("* A pile of scrap metal.")
			return
		end
	
		local jamm = cutscene:getCharacter("jamm")
		cutscene:text("* A discarded robot sits on the floor.")
		
		local choice
		
		if jamm then
			if not Game:getFlag("dungeonkiller") then
				cutscene:showNametag("Jamm")
				cutscene:text("* Hey,[wait:5] I was wondering where this went!", "side_smile", "jamm")
				
				if cutscene:getCharacter("brenda") then
					cutscene:showNametag("Brenda")
					cutscene:text("* Wait,[wait:5] do you know this robot?", "neutral", "brenda")
				end
				
				cutscene:showNametag("Jamm")
				cutscene:text("* This is a robot I built for a science fair project in high school.", "smile", "jamm")
				cutscene:text("* I called it A.P.M.,[wait:5] or \"Autonomous Party Member\".", "side_smile", "jamm")
				
				if cutscene:getCharacter("susie") then
					cutscene:showNametag("Susie")
					cutscene:text("* The hell's this thing supposed to do?", "nervous", "susie")
					cutscene:showNametag("Jamm")
					cutscene:text("* Glad you asked,[wait:5] Susie!", "smile", "jamm")
				end
				
				cutscene:text("* You can easily program A.P.M. to do actions in battle and...", "side_smile", "jamm")
				cutscene:text("* Hey![wait:10]\n* Where the heck are the...", "shocked", "jamm")
				cutscene:text("* Great,[wait:5] just great[wait:10]\n* Most of the code blocks are missing.", "determined", "jamm")
				cutscene:text("* All we have are the \"Simple AI\" pack...", "stern", "jamm")
				
				if cutscene:getCharacter("hero") then
					cutscene:showNametag("Hero")
					cutscene:text("* Code blocks?", "neutral_closed", "hero")
					cutscene:showNametag("Jamm")
					cutscene:text("* They're the programming pieces for A.P.M.'s language.", "worried", "jamm")
					cutscene:text("* Without them,[wait:5] we're limited on what A.P.M. can do.", "worried_down", "jamm")
				else
					cutscene:text("* Without the rest,[wait:5] we're limited on what A.P.M. can do.", "worried_down", "jamm")
				end
				
				if cutscene:getCharacter("susie") then
					cutscene:showNametag("Susie")
					cutscene:text("* Dude,[wait:5] is that all you're worried about?", "small_smile", "susie")
					cutscene:text("* We can find them again,[wait:5] no sweat!", "sincere_smile", "susie")
					cutscene:showNametag("Jamm")
					cutscene:text("* Thanks,[wait:5] Susie.[wait:10]\n* That really means a lot to me.", "relief", "jamm")
				else
					cutscene:text("* If we find any,[wait:5] we should pick them up...", "worried_down", "jamm")
					cutscene:text("* That way,[wait:5] we can make an amazing AI.", "side_smile", "jamm")
					cutscene:text("* And hey,[wait:5] maybe it could have the AI I made for it a while back.", "relief", "jamm")
				end
				
				cutscene:text("* Here,[wait:5] I'll turn it on now.", "side_smile", "jamm")
				cutscene:hideNametag()
				
				choice = 1
			else
				-- TODO: Make Jamm destroy APM in Dungeonkiller.
			end
		else
			cutscene:text("* Will you turn it on?")
			choice = cutscene:choicer("Yes", "No")
		end
		
		if not Game:getFlag("dungeonkiller") then
			if choice == 1 then
				cutscene:text("* Click!")
				
				cutscene:showNametag(jamm and "A.P.M." or "Robot")
				cutscene:text("* INITIALIZING...")
				if jamm then
					cutscene:showNametag("Jamm")
					cutscene:text("* ...Give it a second.[wait:10]\n* I was a terrible programmer back then.", "nervous", "jamm")
					cutscene:showNametag(jamm and "A.P.M." or "Robot")
				end
				cutscene:text("* ...............", nil, nil, {skip = false})
				cutscene:text("* INITIALIZATION COMPLETE.")
				cutscene:text("* BATTERY CHECK:[wait:5] 87%.[wait:10]\n* STATUS CHECK:[wait:5] OK.")
				if jamm then
					cutscene:text("* RAM CHECK:[wait:5] 8 LINES.[react:1]", nil, nil, {reactions={
						{"It's that low!?", 352, 61, "speechless", "jamm"},
					}})
				else
					cutscene:text("* RAM CHECK:[wait:5] 8 LINES.")
				end
				cutscene:text("* I AM THE AUTONOMOUS PARTY MEMBER UNIT (A.P.M.).")
				cutscene:text("* I AM PROGRAMMED TO HELP YOU IN BATTLE HOWEVER YOU WISH.")
				cutscene:text("* PERFORMING PROGRAM RELOAD...")
				if jamm then
					cutscene:showNametag("Jamm")
					cutscene:text("* N-no![wait:10] That'll reset the AI I had!", "shocked", "jamm")
					cutscene:text("* Override code 2487! Abort!", "speechless", "jamm")
					cutscene:showNametag("A.P.M.")
					cutscene:text("* OVERRIDE CODE DENIED.[wait:10]\n* EMERGENCY RESTORE IN EFFECT.")
					cutscene:showNametag("Jamm")
					cutscene:text("* WHY did I add that in!?", "shocked", "jamm")
					cutscene:text("* Damn,[wait:5] nothing we can do then...", "worried_down", "jamm")
					cutscene:showNametag("A.P.M.")
				end
				cutscene:text("* PROGRAM RELOAD SUCCESS.[wait:10]\n* RESULT:[wait:5] NO CODE PRESENT.")
				cutscene:text("* AT ANY TIME,[wait:5] YOU CAN REPROGRAM MY AI FROM THE A.P.M. MENU.")
			else
				cutscene:text("* It stays off...")
			end
		end
    end,
}
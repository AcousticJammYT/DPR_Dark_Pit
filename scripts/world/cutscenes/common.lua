return {
	floor_count = function(cutscene, event)
		cutscene:text("* Floor " .. Game:getFlag("pit_floorcount", 1))
    end,
}

local PartyMember, super = Class(PartyMember)

function PartyMember:getSkills()
	if Game.battle and Game.battle.encounter.boss then
		local color = {1, 1, 1, 1}
		for _,spell in ipairs(self:getSpells()) do
			if spell:hasTag("spare_tired") and spell:isUsable(spell) and spell:getTPCost(spell) <= Game:getTension() then
				local has_tired = false
				for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
					if enemy.tired then
						has_tired = true
						break
					end
				end
				if has_tired then
					color = {0, 178/255, 1, 1}
				end
			end
		end
		local skills = {}
		if self:hasAct() then
			table.insert(skills, {"ACT", "Do all\nsorts of\nthings", nil, function()
				Game.battle:clearMenuItems()
				local enemy = Game.battle.enemies_index[1]
				for _,v in ipairs(enemy.acts) do
					local insert = not v.hidden
					if v.character and Game.battle.party[Game.battle.current_selecting].chara.id ~= v.character then
						insert = false
					end
					if v.party and (#v.party > 0) then
						for _,party_id in ipairs(v.party) do
							if not Game.battle:getPartyIndex(party_id) then
								insert = false
								break
							end
						end
					end
					if insert then
						Game.battle:addMenuItem({
							["name"] = v.name,
							["tp"] = v.tp or 0,
							["description"] = v.description,
							["party"] = v.party,
							["color"] = v.color or {1, 1, 1, 1},
							["highlight"] = v.highlight or enemy,
							["icons"] = v.icons,
							["callback"] = function(menu_item)
								Game.battle:pushAction("ACT", enemy, menu_item)
							end
						})
					end
				end
				Game.battle:setState("MENUSELECT", "ACT")
			end})
		end
		if self:hasSpells() then
			table.insert(skills, {"Magic", "Cast\nSpells", color, function()
				Game.battle:clearMenuItems()

				-- First, register X-Actions as menu items.

				if Game.battle.encounter.default_xactions and self:hasXAct() then
					local spell = {
						["name"] = Game.battle.enemies[1]:getXAction(self.battler),
						["target"] = "xact",
						["id"] = 0,
						["default"] = true,
						["party"] = {},
						["tp"] = 0
					}

					Game.battle:addMenuItem({
						["name"] = self:getXActName() or "X-Action",
						["tp"] = 0,
						["color"] = {self:getXActColor()},
						["data"] = spell,
						["callback"] = function(menu_item)
							Game.battle.selected_xaction = spell
							local xaction = Utils.copy(spell)
							if xaction.default then
								xaction.name = Game.battle.enemies_index[1]:getXAction(Game.battle.party[Game.battle.current_selecting])
							end
							Game.battle:pushAction("XACT", Game.battle.enemies_index[1], xaction)
						end
					})
				end

				for id, action in ipairs(Game.battle.xactions) do
					if action.party == self.id then
						local spell = {
							["name"] = action.name,
							["target"] = "xact",
							["id"] = id,
							["default"] = false,
							["party"] = {},
							["tp"] = action.tp or 0
						}

						Game.battle:addMenuItem({
							["name"] = action.name,
							["tp"] = action.tp or 0,
							["description"] = action.description,
							["color"] = action.color or {1, 1, 1, 1},
							["data"] = spell,
							["callback"] = function(menu_item)
								Game.battle.selected_xaction = spell
								local xaction = Utils.copy(spell)
								if xaction.default then
									xaction.name = Game.battle.enemies_index[1]:getXAction(Game.battle.party[Game.battle.current_selecting])
								end
								Game.battle:pushAction("XACT", Game.battle.enemies_index[1], xaction)
							end
						})
					end
				end

				-- Now, register SPELLs as menu items.
				for _,spell in ipairs(self:getSpells()) do
					local color = spell.color or {1, 1, 1, 1}
					if spell:hasTag("spare_tired") then
						local has_tired = false
						for _,enemy in ipairs(Game.battle:getActiveEnemies()) do
							if enemy.tired then
								has_tired = true
								break
							end
						end
						if has_tired then
							color = {0, 178/255, 1, 1}
						end
					end
					Game.battle:addMenuItem({
						["name"] = spell:getName(),
						["tp"] = spell:getTPCost(self),
						["unusable"] = not spell:isUsable(self),
						["description"] = spell:getBattleDescription(),
						["party"] = spell.party,
						["color"] = color,
						["data"] = spell,
						["callback"] = function(menu_item)
							Game.battle.selected_spell = menu_item

							if not spell.target or spell.target == "none" then
								Game.battle:pushAction("SPELL", nil, menu_item)
							elseif spell.target == "ally" then
								Game.battle:setState("PARTYSELECT", "SPELL")
							elseif spell.target == "enemy" then
								Game.battle:pushAction("SPELL", Game.battle:getActiveEnemies()[1], menu_item)
							elseif spell.target == "party" then
								Game.battle:pushAction("SPELL", Game.battle.party, menu_item)
							elseif spell.target == "enemies" then
								Game.battle:pushAction("SPELL", Game.battle:getActiveEnemies(), menu_item)
							end
						end
					})
				end

				Game.battle:setState("MENUSELECT", "SPELL")
			end})
		end
		if #self.combos > 0 then
			table.insert(skills, {"Combos", "Multi\nParty\nAction", nil, function()
				Game.battle:clearMenuItems()

				-- Now, register SPELLs as menu items.
				for _,combo in ipairs(self:getCombos()) do
					Game.battle:addMenuItem({
						["name"] = combo:getName(),
						["tp"] = combo:getTPCost(self),
						["unusable"] = not combo:isUsable(self),
						["description"] = combo:getBattleDescription(),
						["party"] = combo.party,
						["color"] = {1, 1, 1, 1},
						["data"] = combo,
						["callback"] = function(menu_item)
							Game.battle.selected_combo = menu_item

							if not combo.target or combo.target == "none" then
								Game.battle:pushAction("COMBO", nil, menu_item)
							elseif combo.target == "ally" then
								Game.battle:setState("PARTYSELECT", "COMBO")
							elseif combo.target == "enemy" then
								Game.battle:pushAction("COMBO", Game.battle:getActiveEnemies()[1], menu_item)
							elseif combo.target == "party" then
								Game.battle:pushAction("COMBO", Game.battle.party, menu_item)
							elseif combo.target == "enemies" then
								Game.battle:pushAction("COMBO", Game.battle:getActiveEnemies(), menu_item)
							end
						end
					})
				end

				Game.battle:setState("MENUSELECT", "COMBO")
			end})
		end
		return skills
	else
		return super.getSkills(self)
	end
end

return PartyMember

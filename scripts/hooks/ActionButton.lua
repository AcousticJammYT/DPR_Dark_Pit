---@class ActionButton : Object
---@overload fun(...) : ActionButton
local ActionButton, super = Class(ActionButton)

function ActionButton:select()
	if Game.battle.encounter.boss then
		if Game.battle.encounter:onActionSelect(self.battler, self) then return end
		if Kristal.callEvent(KRISTAL_EVENT.onActionSelect, self.battler, self) then return end
		if self.type == "fight" then
			Game.battle:pushAction("ATTACK", Game.battle.enemies_index[1])
		elseif self.type == "act" then
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
		elseif self.type == "magic" then
			Game.battle:clearMenuItems()

			-- First, register X-Actions as menu items.

			if Game.battle.encounter.default_xactions and self.battler.chara:hasXAct() then
				local spell = {
					["name"] = Game.battle.enemies[1]:getXAction(self.battler),
					["target"] = "xact",
					["id"] = 0,
					["default"] = true,
					["party"] = {},
					["tp"] = 0
				}

				Game.battle:addMenuItem({
					["name"] = Game.battle.encounter.xact_name or (Game.battle.encounter.xact_names and Game.battle.encounter.xact_names[self.battler.chara.id]) or self.battler.chara:getXActName() or "X-Action",
					["tp"] = 0,
					["color"] = {self.battler.chara:getXActColor()},
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
				if action.party == self.battler.chara.id then
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
			for _,spell in ipairs(self.battler.chara:getSpells()) do
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
					["tp"] = spell:getTPCost(self.battler.chara),
					["unusable"] = not spell:isUsable(self.battler.chara),
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
		elseif self.type == "item" then
			Game.battle:clearMenuItems()
			for i,item in ipairs(Game.inventory:getStorage("items")) do
				Game.battle:addMenuItem({
					["name"] = item:getName(),
					["unusable"] = item.usable_in ~= "all" and item.usable_in ~= "battle",
					["description"] = item:getBattleDescription(),
					["data"] = item,
					["callback"] = function(menu_item)
						Game.battle.selected_item = menu_item

						if not item.target or item.target == "none" then
							Game.battle:pushAction("ITEM", nil, menu_item)
						elseif item.target == "ally" then
							Game.battle:setState("PARTYSELECT", "ITEM")
						elseif item.target == "enemy" then
							Game.battle:pushAction("ITEM", Game.battle:getActiveEnemies()[1], menu_item)
						elseif item.target == "party" then
							Game.battle:pushAction("ITEM", Game.battle.party, menu_item)
						elseif item.target == "enemies" then
							Game.battle:pushAction("ITEM", Game.battle:getActiveEnemies(), menu_item)
						end
					end
				})
			end
			if #Game.battle.menu_items > 0 then
				Game.battle:setState("MENUSELECT", "ITEM")
			end
		elseif self.type == "spare" then
			Game.battle:pushAction("SPARE", Game.battle.enemies_index[1])
		elseif self.type == "defend" then
			Game.battle:pushAction("DEFEND", nil, {tp = -16})
		elseif self.type == "skill" then
			Game.battle:clearMenuItems()

			for id, action in ipairs(self.battler.chara:getSkills()) do
				Game.battle:addMenuItem({
					["name"] = action[1],
					["description"] = action[2],
					["color"] = action[3],
					["callback"] = action[4]
				})
			end

			Game.battle:setState("MENUSELECT", "SKILL")
		elseif self.type == "tension" then
			Game.battle:pushAction("TENSION", nil, {tp = -32})
		end
	else
		super.select(self)
	end
end

return ActionButton
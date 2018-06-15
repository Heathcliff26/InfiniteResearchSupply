--control.lua

-- create a list of all Chests
script.on_init(function() global.infiniteResearchContainers={} end)

-- add new Chests to list
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity},
     function(e)
          --this is reaction to our entities being built
         local en=e.created_entity
          --first we check if it's our entity
         if en.name=='infinite-research-container' then
             local uid=en.unit_number --many entities have this field, which is guaranteed to be unique
             global.infiniteResearchContainers[uid]=en --we store the reference to our receivers on per-force basis
         end
     end
 )

-- loop over all Chests and fill them
script.on_event(defines.events.on_tick,function(e)
 --this function is called on each game tick(update of the game state)
 --it will murder the game's fps if done badly

    if not (e.tick%60)==0 then
		return
	end
    for uid,chest in pairs(global.infiniteResearchContainers) do --for each force that has built chests
        if not chest.valid then -- delete chest if not valid
          global.infiniteResearchContainers[uid]=nil
        else
          updateItems(chest)
        end
    end
end)

-- update the item count in the chest
updateItems = function(chest)
  local p1, p2, p3 = false, false, false
  local pm, pp, pht, ps = false, false, false, false
  
  local inv = chest.get_inventory(defines.inventory.chest)
  local items = inv.get_contents()
  
  for item_name, count in pairs(items) do
	if item_name == "science-pack-1" then
		p1 = true
		insertItem(inv, item_name, count)
	elseif item_name == "science-pack-2" then
		p2 = true
		insertItem(inv, item_name, count)
	elseif item_name == "science-pack-3" then
		p3 = true
		insertItem(inv, item_name, count)
	elseif item_name == "military-science-pack" then
		pm = true
		insertItem(inv, item_name, count)
	elseif item_name == "production-science-pack" then
		pp = true
		insertItem(inv, item_name, count)
	elseif item_name == "high-tech-science-pack" then
		pht = true
		insertItem(inv, item_name, count)
	elseif item_name == "space-science-pack" then
		ps = true
		insertItem(inv, item_name, count)
	else
      inv.remove({name=item_name, count=count})
    end
  end
  
	if not p1 then
		insertItem(inv, "science-pack-1", 0)
	elseif not p2 then
		insertItem(inv, "science-pack-2", 0)
	elseif not p3 then
		insertItem(inv, "science-pack-3", 0)
	elseif not pm then
		insertItem(inv, "military-science-pack", 0)
	elseif not pp then
		insertItem(inv, "production-science-pack", 0)
	elseif not pht then
		insertItem(inv, "high-tech-science-pack", 0)
	elseif not ps then
		insertItem(inv, "space-science-pack", 0)
	end
  
 end
 
 insertItem = function(inv, name, count)
	local itemCount = 10
	if count < itemCount then
        local x = itemCount - count
        inv.insert({name=name, count=x})
    end
 end
--item.lua

data:extend(
{
	{
		type = "container",
		name = "infinite-research-container",
		icon = "__base__/graphics/icons/steel-chest.png",
		icon_size = 32,
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "infinite-research-container"},
		max_health = 2000,
		corpse = "small-remnants",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		resistances =
		{
		  {
			type = "fire",
			percent = 90
		  },
		  {
			type = "impact",
			percent = 60
		  }
		},
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fast_replaceable_group = "container",
		inventory_size = 7,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture =
		{
		  filename = "__base__/graphics/entity/steel-chest/steel-chest.png",
		  priority = "extra-high",
		  width = 48,
		  height = 34,
		  shift = {0.1875, 0}
		},
		circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
		circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
		circuit_wire_max_distance = default_circuit_wire_max_distance
	},
	{
		type = "item",
		name = "infinite-research-container",
		icon = "__base__/graphics/icons/steel-chest.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "storage",
		order = "a[items]-c[infinite-research-container]",
		place_result = "infinite-research-container",
		stack_size = 50
	},
	{
    type = "recipe",
    name = "infinite-research-container",
    enabled = true,
    ingredients = {{"iron-plate", 16}},
    result = "infinite-research-container",
	},
}
)

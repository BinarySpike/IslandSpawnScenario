---- start config ----

SCENARIO_NAME = "Island Spawn"
AUTHOR = "BinarySpike"

-- Width of empty space between ores
TRACK_WIDTH = 4

-- Size of initial-ore (only used to calculate SPAWN_SIZE)
ORE_SIZE = 8

-- Size of spawn zone.
SPAWN_SIZE = TRACK_WIDTH+1 + ORE_SIZE

-- Starting value of ore
INITIAL_ORE_VALUE = 200

-- Are the tracks pre-generated?
INFINITE_TRACK = false

-- Do you start the game with Landfill researched? (Useful if ORE_SIZE and INITIAL_ORE_VALUE are low)
START_WITH_LANDFILL_RESEARCHED = false

-- Chance (percent) that an island will spawn
ISLAND_SPAWN_CHANCE = 5

-- Chance island will contain trees


-- Debug mode gives you extra stuff starting out
DEBUG = true



-- This function calculates the cost of a tile based on it's position from the center of the map
-- Below is the default function for reference
--[[
local function costCalc(x, y)
	return INITIAL_ORE_VALUE + (math.sqrt((math.abs(x) * math.abs(y)))*2)
end
]]

function costCalc(x, y)
	--return 1
    return INITIAL_ORE_VALUE + (math.sqrt((math.abs(x) * math.abs(y)))*2)
end
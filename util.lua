require("island_generator")

-- random value
function getRandomIntInclusive(min, max)
    min = math.ceil(min);
    max = math.floor(max);
    return math.floor(math.random() * (max - min + 1)) + min;
end

-- square intersecting
function does_square_intersect(Ax1, Ay1, Ax2, Ay2,  Bx1, By1, Bx2, By2) -- A/B {left, top, right, bottom}
    return Ax1 < Bx2 and Ax2 > Bx1 and Ay1 < By2 and Ay2 > By1
end




--[[-- gets the default settings for a tile, spawn zone, track, or solid water
function get_tile(x, y)
	local output = "water"
	
	-- spawn zone
    if (does_square_intersect(x, y, x, y,  -SPAWN_SIZE, -SPAWN_SIZE, SPAWN_SIZE, SPAWN_SIZE)) then
		output = "grass"
	end
	
	return output
end]]

function get_spawn_tiles(surface, x1, y1, x2, y2)
    tiles = {}
    for x = x1, x2 do
        for y = y1, y2 do
            if (does_square_intersect(x, y, x, y,  -SPAWN_SIZE, -SPAWN_SIZE, SPAWN_SIZE, SPAWN_SIZE)) then
                output = "grass"
                spawn_quadrant_ore(surface, x, y)
            else
                output = "water"
            end
            
            table.insert(tiles, { name = output, position = {x, y}})
        end
    end
    return tiles
end

-- spawns the correct type of ore depending on it's quadrant
function spawn_quadrant_ore(surface, x, y)
	local entityName = nil
	
	if (x >= TRACK_WIDTH and y <= -TRACK_WIDTH) then --top right
		entityName = "iron-ore"
	end
	if (x >= TRACK_WIDTH and y >= TRACK_WIDTH) then --bottom right
		entityName = "stone"
	end
	if (x <= -TRACK_WIDTH and y >= TRACK_WIDTH) then --bottom left
		entityName = "copper-ore"
	end
	if (x <= -TRACK_WIDTH and y <= -TRACK_WIDTH) then --top left
		entityName = "coal"
	end
	
	if entityName ~= nil then
		surface.create_entity({name=entityName, position={x,y}, amount=costCalc(x,y)})
	end
end

function spawn_built_ore(surface, x, y)
    local tile = surface.get_tile(x, y)
    
    if (tile.name ~= "grass") then
        return
    end
    
    spawn_quadrant_ore(surface, x, y)
end

function get_island_tiles(surface, x1, y1, x2, y2)
    tiles = {}
    tiles = generate_island(x1, y1)
    
    return tiles
end

function get_water_tiles(x1, y1, x2, y2)
    tiles = {}
    for x = x1, x2 do
            for y = y1, y2 do
                table.insert(tiles, { name = "water", position = {x, y}})
            end
        end
    return tiles
end

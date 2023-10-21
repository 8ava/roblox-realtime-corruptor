
-- this will use caching to prevent values from changing

local cache = {}


local class = {
	name = 'Freeze Engine';
	description = 'Freezes values in place, and prevents them from being changed.'
}

function class.get(primative)
	local stored = cache[primative]
	
	if stored then
		return stored
	else
		cache[primative] = primative -- yes i know these can overwrite but that makes it more fun! :3
		
		return primative
	end
end


return class

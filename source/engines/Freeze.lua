
-- this will use metatables to prevent values from changing

local class = {
	name = 'Freeze Engine';
	description = 'Freezes values in place, and prevents them from being changed.'
}

function class.get(primative)
	local metadata = getmetatable(primative)
	
	setmetatable(getmetatable(primative), {__newindex = function()
		return
	end,})
	
	
	return primative
end


return class

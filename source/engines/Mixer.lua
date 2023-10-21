
-- this will cache values by type and return a random one from the stored list


local random = _G._rtc_random

local store = {}


local function handle(primative)
	local type_ = type(primative)
	local cache = store[type_]
	
	if cache then
		table.insert(cache, primative)
		
		return cache[random:NextNumber(1, #cache)]
	else
		store[type_] = {}
		
		table.insert(store[type_], primative)
		
		
		return primative
	end
end


local class = {
	name = 'Mixer Engine';
	description = 'Corrupts values by choosing from a list of similar values.'
}

function class.get(primative)
	return handle(primative)
end

return class

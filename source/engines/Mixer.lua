
-- this will cache values by type and return a random one from the stored list

local store = {}


local function handle(primative)
	local type_ = typeof(primative)
	
	if store[type_] then
		table.insert(store[type_], primative)
		
		return store[type_][_G._RTCEnvironment._RANDOM:NextInteger(1, #store[type_])]
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

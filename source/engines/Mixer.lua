
-- this will cache values by type and return a random one from the stored list

local store = {
	Enum = {}
}


local function handle(primative)
	local type_ = typeof(primative)
	
	-- need to handle enums differently
	if type_ == 'EnumItem' then
		if store.Enum[primative.EnumType] then
			table.insert(store.Enum[primative.EnumType], primative)

			return store.Enum[primative.EnumType][_G._rtc_environment._RANDOM:NextInteger(1, #store.Enum[primative.EnumType])]
		else
			store.Enum[primative.EnumType] = {}
			
			table.insert(store.Enum[primative.EnumType], primative)
			
			
			return primative
		end
	end
	
	if type_ == 'function' then
		primative()
	end
	
	
	if store[type_] then
		table.insert(store[type_], primative)
		
		return store[type_][_G._rtc_environment._RANDOM:NextInteger(1, #store[type_])]
	else
		store[type_] = {}
		
		table.insert(store[type_], primative)
		
		
		return primative
	end
end


local class = {
	name = 'Mixer Engine';
	description = 'Corrupts values by swapping them with similar values.';
	
	variables = {}
}

function class.get(primative)
	return handle(primative)
end

return class

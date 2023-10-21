
-- this will cache values by type and return the first one from the stored list
-- very similar to Mixer

local store = {
	Enum = {}
}


local function handle(primative)
	local type_ = type(primative)

	-- need to handle enums differently
	if type_ == 'EnumItem' then
		if store.Enum[primative.EnumType] then
			return store.Enum[primative.EnumType][1]
		else
			store.Enum[primative.EnumType] = {}

			table.insert(store.Enum[primative.EnumType], primative)


			return primative
		end
	end
	
	
	if store[type_] then
		return store[type_][1]
	else
		store[type_] = {}
		
		table.insert(store[type_], primative)
		
		
		return primative
	end
end


local class = {
	name = 'Singularity Engine';
	description = 'Corrupts values by setting every value to the first of its kind.'
}

function class.get(primative)
	return handle(primative)
end

return class

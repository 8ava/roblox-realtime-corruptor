

local environment = nil


local class = {
	name = 'Mixer Engine';
	description = 'Corrupts values by swapping them with similar values.';

	variables = {}
}


local store = {['Enum'] = {}}


local function handle(primative)
	local type_ = typeof(primative)
	
	-- need to handle enums differently
	if type_ == 'EnumItem' then
		if store.Enum[primative.EnumType] then
			table.insert(store.Enum[primative.EnumType], primative)

			return store.Enum[primative.EnumType][environment._random:NextInteger(1, #store.Enum[primative.EnumType])]
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
		
		return store[type_][environment._random:NextInteger(1, #store[type_])]
	else
		store[type_] = {}
		
		table.insert(store[type_], primative)
		
		
		return primative
	end
end



function class.get(primative)
	environment = _G._rtc_environment
	
	return handle(primative)
end


return class

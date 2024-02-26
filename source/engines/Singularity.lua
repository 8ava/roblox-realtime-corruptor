

local environment = nil
local store = {['Enum'] = {}}


local class = {
	name = 'Singularity Engine';
	description = 'Corrupts values by replacing them with the first indexed value.';

	variables = {
		redraw = function() -- functions appear as buttons
			table.clear(store)
		end,
	}
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



function class.get(primative)
	environment = _G._rtc_environment
	
	return handle(primative)
end


return class

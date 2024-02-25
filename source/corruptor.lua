

local environment = nil
local instance_handler = nil


local function get_chance()
	return environment._random:NextInteger(0, environment.corruptorVariables.random_max) >= environment.corruptorVariables.random_min
end


local class = {}

function class.execute()
	for _, a in next, environment.corruptorVariables.filter_desendants_sequence do
		if get_chance() then instance_handler.set(a) end
		
		for _, b in next, a:GetDescendants() do
			if get_chance() then instance_handler.set(b) end
		end
	end
end

function class.init() -- ugh
	environment = _G._rtc_environment
	instance_handler = environment.main.getResource('instance_handler')
	
	environment._random = Random.new(environment.corruptorVariables.random_seed) -- behavior should not be done in main
end


return class

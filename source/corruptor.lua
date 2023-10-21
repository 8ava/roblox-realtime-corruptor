
local instance_handler = require(script.Parent.instance_handler)


local function get_chance()
	return _G._RTCEnvironment._RANDOM:NextInteger(0, _G._RTCEnvironment.vars.random_max) >= _G._RTCEnvironment.vars.random_min
end


local class = {}

function class.execute()
	local environment = _G._RTCEnvironment
	environment._RANDOM = Random.new(environment.vars.random_seed)
	
	for _, a in next, environment.vars.FilterDescendantsSequence do
		if get_chance() then instance_handler.set(a) end
		
		for _, b in next, a:GetDescendants() do
			if get_chance() then instance_handler.set(b) end
		end
	end
end

return class


local instance_handler = require(script.Parent.instance_handler)


local class = {}

function class.execute()
	local environment = _G._RTCEnvironment
	environment._RANDOM = Random.new(environment.vars.random_seed)
	
	for _, a in next, environment.vars.FilterDescendantsSequence do
		instance_handler.set(a, environment.vars.CurrentEngine.get)
		
		for _, b in next, a:GetDescendants() do
			instance_handler.set(b, environment.vars.CurrentEngine.get)
		end
	end
end

return class


local instance_handler = require(script.Parent.instance_handler)


local class = {
	settings = {
		-- random
		random_seed  = 238657902;
		
		random_max = 100;
		random_min = 0;
		
		-- corruptor
		CurrentEngine = nil;
		
		
		FilterDescendantsSequence = {}
	}
}

function class.execute()
	_G._rtc_random = Random.new(class.settings.random_seed)
	
	for _, a in next, class.settings.FilterDescendantsSequence do
		instance_handler.set(a, class.settings.CurrentEngine.get)
		
		for _, b in next, a:GetDescendants() do
			instance_handler.set(b, class.settings.CurrentEngine.get)
		end
	end
end

return class

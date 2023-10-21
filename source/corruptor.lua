
local instance_handler = require(script.Parent.instance_handler)


local class = {
	CurrentEngine = nil;
	FilterDescendantsSequence = {}
}

function class.execute()
	for _, a in next, class.FilterDescendantsSequence do
		instance_handler.set(a, class.CurrentEngine.get)
		
		for _, b in next, a:GetDescendants() do
			instance_handler.set(b, class.CurrentEngine.get)
		end
	end
end

return class

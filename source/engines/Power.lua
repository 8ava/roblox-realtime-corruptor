
-- glorified multiplying

local cache = {}


local class = {
	name = 'Power Engine';
	description = 'Corrupts values by multiplying them by an intensity, and a random offset.';
	
	_flag = 'unstable'; -- gonna implement flags, this will make this enum appear yellow to signify that its unstable
	
	
	variables = { -- this will contain both the initialized values and their default values
		Intensity = 2;
	}
}

function class.get(primative)
	if not primative then
		return
	end
	
	return primative * _G._RTCEnvironment.vars.engine_vars.Intensity * _G._RTCEnvironment._RANDOM:NextNumber(0, 2) -- so that it can vary
end


return class

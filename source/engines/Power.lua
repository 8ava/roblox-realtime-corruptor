
-- glorified multiplying

local cache = {}


local class = {
	name = 'Power Engine';
	description = 'Corrupts values by multiplying them by an intensity, and a random offset.';
	
	_flag = 'unstable'; -- gonna implement flags, this will make this enum appear yellow to signify that its unstable
	
	
	variables = { -- this will contain both the initialized values and their default values
		Intensity = 9,
	}
}

local function rng()
	return _G._RTCEnvironment.vars.engine_vars.Intensity * _G._RTCEnvironment._RANDOM:NextNumber(0, 2)
end

local function mul(a)
	return a * rng()
end

local primativeHandler = {
	['function'] = function(a)
		if _G._RTCEnvironment._RANDOM:NextInteger(0, 1) == 1 then -- idk something more creative than this also im lazy
			a()
		end
	end,
	
	number = mul,
	
	boolean = function()
		return _G._RTCEnvironment._RANDOM:NextInteger(0, 1) == 1
	end,
	
	CFrame = function(a)
		return a * CFrame.fromMatrix(Vector3.new(rng(), rng(), rng()), Vector3.new(rng(), rng(), rng()), Vector3.new(rng(), rng(), rng()))
	end,
	
	Vector3 = mul,
	Vector2 = mul
}

function class.get(primative)
	local type_ = typeof(primative)
	
	if primativeHandler[type_] then
		return primativeHandler[type_](primative)
	else
		return primative -- fallback to prevent lag
	end
end


return class

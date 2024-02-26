

local environment = nil

local cache = {}



local class = {
	name = 'Power Engine';
	description = 'Corrupts values by multiplying them by an intensity, and a random offset.';
	
	_flag = 'unstable'; -- gonna implement flags, this will make this enum appear yellow to signify that its unstable
	
	
	variables = { -- this will contain both the initialized values and their default values
		Intensity = 1,
	}
	
}

local function rng()
	return environment._random:NextNumber(-2, 2) * class.variables.Intensity
end

local function mul(a)
	return a * rng()
end



local primativeHandler = {
	['function'] = function(a)
		if environment._random:NextInteger(0, 1) == 1 then -- idk something more creative than this also im lazy
			a()
		end
	end,
	
	number = mul,
	
	string = function(z)
		local str = ''
		
		for i = 1, #z do
			local a = z:sub(i, i):byte()
			
			str = `{str}{string.char(a + math.floor(rng()))}`
		end
		
		return str
	end,
	
	boolean = function()
		return environment._random:NextInteger(0, 1) == 1
	end,
	
	EnumItem = function(a)
		local enums = a.EnumType:GetEnumItems()
		local current_index = table.find(enums, a)
		
		return enums[(math.round(current_index * rng()) % #enums) + 1]
	end,
	
	
	Color3 = function(a)
		return Color3.new(a.R * rng(), a.G * rng(), a.B * rng())
	end,
	
	Vector3 = mul,
	Vector2 = mul,
	
	NumberRange = function(a)
		return NumberRange.new(a.Max * rng(), a.Min * rng())
	end,
	
	UDim2 = function(a)
		return UDim2.new(a.X.Scale * rng(), a.X.Offset * rng(), a.Y.Scale * rng(), a.Y.Offset * rng())
	end,

	UDim = function(a)
		return UDim.new(a.Scale * rng(), a.Offset * rng())
	end,
	
	
	CFrame = function(a)
		return a * CFrame.fromMatrix(Vector3.new(rng(), rng(), rng()), Vector3.new(rng(), rng(), rng()), Vector3.new(rng(), rng(), rng()))
	end,
}


function class.get(primative)
	environment = _G._rtc_environment
	
	
	local type_ = typeof(primative)
	
	if primativeHandler[type_] then
		return primativeHandler[type_](primative)
	else
		return primative -- fallback
	end
end


return class

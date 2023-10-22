
local method = nil


local primatives = {
	boolean = function(primative)
		primative = method(primative)
	end;

	['function'] = function(primative)
		primative = method(primative)
	end;

	number = function(primative)
		primative = method(primative)
	end;

	EnumItem = function(primative)
		primative = method(primative)
	end;

	CFrame = function(primative)
		primative = method(primative)
	end;

	Vector3 = function(primative)
		primative = method(primative)
	end;

	Vector2 = function(primative)
		primative = method(primative)
	end;

	string = function(primative)
		primative = method(primative)
	end;

	table = function(primative)
		-- ill do this tmrw
		warn('tables not implemented')
	end;
}


local module = {}

function module.set(primative)
	method = _G._RTCEnvironment.vars.CurrentEngine.get


	local type_ = typeof(primative)

	if primatives[type_] then
		local a, message = pcall(primatives[type_], primative) if not a then warn(message) end
	else
		-- later
	end
end


return module



local environment = {
	-- misc uninitialized
	is_native_roblox = nil,
	_random = nil,
	
	
	corruptorVariables = {
		random_seed = 1,
		
		random_max = 999,
		random_min = 888,
		
		
		-- engine
		current_engine = nil,
		
		--misc
		filter_desendants_sequence = {},
		script_recursive_layer_threshold = 9,
	},
	
	
	-- interface
	interface = {
		--idk mirror of corruptorvariables
	}
}

-- init values
environment.is_native_roblox = game["Run Service"]:IsStudio()


-- set up main

local resources = {}


-- resources
if environment.is_native_roblox then
	local src = script.Parent

	for _, a in src:GetDescendants() do
		if a.ClassName == 'ModuleScript' then
			resources[a.Name] = require(a)
		end
	end
end

local function getResource(index)
	if resources[index] then
		return resources[index]
	else
		warn(`[RTC] [Main]: internals attempted to get invalid resource!`)
	end
end



local class = {getResource = getResource}

function class.setEngine(engineIndex)
	environment.corruptorVariables.current_engine = getResource(engineIndex)
	
	--onEngineChanged
	print(`[RTC] [Main]: engine set: '{engineIndex}'`)
end



class.setEngine('Mixer')
environment.corruptorVariables.filter_desendants_sequence = {game.Workspace, game.StarterGui, game.Players, game.ReplicatedStorage, game.SoundService, game.Lighting, game.StarterGui, game.StarterPack, game.StarterPlayer, game.Chat, game.MaterialService}

-- init global
environment.main = class
_G._rtc_environment = environment -- hope this is a pointer


local corruptor = getResource('corruptor')
corruptor.init()

warn(`[RTC] - Real-time corruptor mounted!`)
print(corruptor)

game.UserInputService.InputBegan:Connect(function(a)
	if a.KeyCode == Enum.KeyCode.RightBracket then
		local DIAGNOSTICS_1 = os.clock()
		corruptor.execute()
		print('[RTC] - Corruption exectuted. - '.. tostring(math.ceil((os.clock() - DIAGNOSTICS_1) * 1000)).. 'ms')
	end
end)

-- notes for later


-- script sequence


-- make a very small loading gui becauz we need to visualize http requets
-- make a promise function that retries http requests
-- request each one and assign it to a var

-- ill probably have another script for anything after the loading sequence
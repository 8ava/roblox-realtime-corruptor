
_G._RTCEnvironment = {
	_RANDOM = nil;
	
	vars = {
		-- random
		random_seed  = 238657902;

		random_max = 999;
		random_min = 888;
		
		recursive_layer_threshold = 9;

		-- corruptor
		CurrentEngine = nil;


		FilterDescendantsSequence = {}
	}
}

_G._RTCEnvironment.vars.FilterDescendantsSequence = {game.Workspace, game.StarterGui, game.Players, game.ReplicatedStorage, game.SoundService, game.Lighting, game.StarterGui, game.StarterPack, game.StarterPlayer, game.Chat, game.MaterialService}
_G._RTCEnvironment.vars.CurrentEngine = require(script.Parent:WaitForChild('engines').Mixer)


local corruptor = require(script.Parent:WaitForChild('corruptor'))

while true do
	task.wait(6)
	
	local DIAGNOSTICS_1 = os.clock()
	corruptor.execute()
	print('[RTC] - Corruption exectuted. - '.. tostring(math.ceil((os.clock() - DIAGNOSTICS_1) * 1000)).. 'ms')
end

-- notes for later


-- script sequence


-- make a very small loading gui becauz we need to visualize http requets
-- make a promise function that retries http requests
-- request each one and assign it to a var

-- ill probably have another script for anything after the loading sequence
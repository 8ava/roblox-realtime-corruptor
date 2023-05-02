local config = {
	intensity = 1; -- dont recommend going below 0

	chance_scale = 100;
	chance_window = 16;

	scriptiterations = 224;

	affecthumanoid = true;
	affectcamera = true;
	affectscripts = true;

	fetchrandomids = false;

	allowrainbow = false;
	affectfilters = false;

	rigdestruction = true;
	resizegui = true;

	nosoundspam = true;
}

-- targets -- dont recommend using 'game'
local targets = {game.Workspace; game.Lighting; game.Players; game.ReplicatedStorage; game.ReplicatedFirst; game.SoundService; game.StarterGui; game.StarterPack}

local loads = loadstring(game:HttpGet('https://raw.githubusercontent.com/8ava/roblox-realtime-corruptor/indev/main.lua'))().init(config, targets)

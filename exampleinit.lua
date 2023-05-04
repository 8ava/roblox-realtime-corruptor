
local config = {
	intensity = 1; -- dont recommend going below 0

	chance_scale = 100;
	chance_window = 16;

	scriptiterations = 3;
	affectscripts = true;

	affectcamera = true;
	affectphysics = true;

	allowrainbow = false;
	affectfilters = false;

	rigdestruction = false;
	affecthumanoid = true;

	resizegui = true;

	fetchrandomids = false;

	nosoundspam = true;
}


-- targets -- dont recommend using 'game'
local targets = {game.Workspace; game.Lighting; game.Players; game.ReplicatedStorage; game.ReplicatedFirst; game.SoundService; game.StarterGui; game.StarterPack}


loadstring(game:HttpGet('https://raw.githubusercontent.com/8ava/roblox-realtime-corruptor/indev/main.lua'))().init(config, targets)

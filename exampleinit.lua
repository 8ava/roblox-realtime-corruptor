
local config = {
	intensity = 5; -- dont recommend going below 0

	chance_scale = 100;
	chance_window = 8;

	scriptiterations = 1000;

	affectscripts = true;

	affectcamera = true;
	affectphysics = true;

	allowrainbow = false;
	affectfilters = false;
	resizetransforms = true;

	rigdestruction = false;
	affecthumanoid = true;

	resizegui = true;

	fetchrandomids = false;

	nosoundspam = true;

	-- dont recommend using 'game'
	targets = {game.Workspace; game.Lighting; game.Players; game.ReplicatedStorage; game.ReplicatedFirst; game.SoundService; game.StarterGui; game.StarterPack}
}

loadstring(game:HttpGet('https://raw.githubusercontent.com/8ava/roblox-realtime-corruptor/indev/main.lua'))().init(config)
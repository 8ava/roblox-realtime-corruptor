

local rng = Random.new()

local clamp = math.clamp
local rad = math.rad


local function chance(size, window)
	return rng:NextInteger(0, size) >= (size - window)
end

local function rcolor(scale)
	return Color3.new(rng:NextNumber(0, scale), rng:NextNumber(0, scale), rng:NextNumber(0, scale))
end

local function rvector(scale)
	return Vector3.new(rng:NextNumber(-scale, scale), rng:NextNumber(-scale, scale), rng:NextNumber(-scale, scale))
end

local function rvec2(scale)
	return Vector2.new(rng:NextNumber(-scale, scale), rng:NextNumber(-scale, scale))
end

local function min(a, m)
	return clamp(a, m, 9e9)
end

local function rbool()
	return rng:NextInteger(0, 1) == 1
end

local function rid()
	return "rbxassetid://".. tostring(rng:NextInteger(10265191, 1302651918))
end

local function rcf()
	return CFrame.new(rvector(_G.__corruptsettings.intensity * rng:NextNumber(0.1, 1.1))) * CFrame.fromOrientation(rad(rng:NextNumber(0, _G.__corruptsettings.intensity / 14)), rad(rng:NextNumber(0, _G.__corruptsettings.intensity / 14)), rad(rng:NextNumber(0, _G.__corruptsettings.intensity / 14)))
end

local function renum(topic)
	local pool = topic:GetEnumItems()
	local chosen = pool[rng:NextInteger(1, #pool)]

	return topic[chosen.Name]
end

local function rudim(scale)
	return UDim2.new(rng:NextNumber(0, 1 - (scale / 4)), rng:NextInteger(1, 1000), rng:NextNumber(0, 1 - (scale / 4)), rng:NextInteger(1, 1000))
end


local luatype = nil -- placeholder

local luatypes = {
	boolean = function(a)
		a = rbool()
	end;

	number = function(a)
		a = a + rng:NextInteger(1, _G.__corruptsettings.intensity * 2)
	end;

	["table"] = function(z)
		local iter = 0;

		for _, a in next, z do
			iter = iter + 1
			if iter >= _G.__corruptsettings.scriptiterations then break end

			luatype(a)
		end
	end;
}

local types = {
	ModuleScript = function(a)
		if not _G.__corruptsettings.affectscripts then return end

		coroutine.wrap(function() luatype(require(a)) end)()
	end;

	['Workspace'] = function(a:Workspace)
		if _G.__corruptsettings.affectphysics then
			local i = _G.__corruptsettings.intensity * 2
			a.Gravity = 196.2 + rng:NextNumber(-i, i); i = nil;
			a.GlobalWind = rvector(_G.__corruptsettings.intensity)
		end
	end;

	BoolValue = function(a)
		a.Value = rbool()
	end;

	NumberValue = function(a)
		a.Value = rng:NextNumber(0, math.huge)
	end;

	IntValue = function(a)
		a.Value = rng:NextInteger(0, math.huge)
	end;

	Vector3Value = function(a)
		a.Value = rvector(_G.__corruptsettings.intensity * rng:NextNumber(1, 90))
	end;

	Color3Value = function(a)
		a.Value = rcolor(_G.__corruptsettings.intensity)
	end;

	CFrameValue = function(a)
		a.Value = CFrame.new(rvector(_G.__corruptsettings.intensity * rng:NextNumber(1, 90)))
	end;

	DistortionSoundEffect = function(a)
		a.Level = 1
		a.Priority = -999999999
	end;

	UIAspectRatioConstraint = function(a)
		if not _G.__corruptsettings.resizegui then return end

		a.AspectRatio = rng:NextNumber(0.5, 4 + (_G.__corruptsettings.intensity / 2))
	end;

	CanvasGroup = function(a)
		if not _G.__corruptsettings.resizegui then return end

		a.GroupTransparency = rbool() == true and rng:NextNumber(0.5, 0.8) or 0
		a.GroupColor3 = rbool() == true and rcolor(_G.__corruptsettings.intensity) or Color3.new(1, 1, 1)
		a.Size = rudim(_G.__corruptsettings.intensity)
	end;

	BillboardGui = function(a)
		if not _G.__corruptsettings.resizegui then return end

		a.AlwaysOnTop = rbool()
		a.ExtentsOffset = rvector(_G.__corruptsettings.intensity)
		a.ExtentsOffsetWorldSpace = rvector(_G.__corruptsettings.intensity)
		a.LightInfluence = 0--rng:NextNumber(0, 1);
		a.SizeOffset = rvec2(_G.__corruptsettings.intensity)
		a.StudsOffset = rvector(_G.__corruptsettings.intensity)
		a.Size = rudim(_G.__corruptsettings.intensity)
	end;

	ViewportFrame = function(a)
		if not _G.__corruptsettings.resizegui then return end

		a.Ambient = rcolor(_G.__corruptsettings.intensity)
		a.LightColor = rcolor(_G.__corruptsettings.intensity)
		a.LightDirection = rvector(_G.__corruptsettings.intensity)
	end;

	TextLabel = function(a)
		if not _G.__corruptsettings.resizegui then return end

		a.TextYAlignment = renum(Enum.TextYAlignment.Center.EnumType)
		a.TextXAlignment = renum(Enum.TextXAlignment.Left.EnumType)
		a.TextScaled = rbool()
		a.TextWrapped = rbool()
		a.RichText = rbool()
		a.TextXAlignment = renum(Enum.TextXAlignment.Left.EnumType)
		a.TextYAlignment = renum(Enum.TextYAlignment.Center.EnumType)
		a.Size = rudim(_G.__corruptsettings.intensity)
	end;

	ImageLabel = function(a)
		if not _G.__corruptsettings.resizegui then return end

		a.ResampleMode = renum(Enum.ResamplerMode.Default.EnumType)
		a.ScaleType = renum(Enum.ScaleType.Fit.EnumType)
		a.ImageRectSize = rvec2(_G.__corruptsettings.intensity)
		a.ImageRectOffset = rvec2(_G.__corruptsettings.intensity)
		a.Size = rudim(_G.__corruptsettings.intensity)
	end;

	Texture = function(a)
		a.ZIndex = 1 - (_G.__corruptsettings.intensity * rng:NextNumber(0.1, 1))

		if _G.__corruptsettings.fetchrandomids then
			a.Texture = rid()
		end

		local v = rvector(_G.__corruptsettings.intensity)
		a.OffsetStudsU = v.X
		a.OffsetStudsV = v.Y
		local v2 = rvector(_G.__corruptsettings.intensity)
		a.StudsPerTileU = v2.X
		a.StudsPerTileV = v2.Y

		v = nil;
		v2 = nil;
	end;

	Decal = function(a)
		a.ZIndex = 1 - (_G.__corruptsettings.intensity * rng:NextNumber(0.1, 1))

		if _G.__corruptsettings.allowrainbow then
			a.Color3 = rcolor(1)
		end

		if _G.__corruptsettings.fetchrandomids then
			a.Texture = rid()
		end
	end;


	CompressorSoundEffect = function(a)
		a.Attack = 0;
		a.GainMakeup = 30;
		a.Ratio = 50;
		a.Release = 0;
		a.Priority = -999999998
	end;

	EqualizerSoundEffect = function(a)
		a.LowGain = rng:NextNumber(-30, 10) + _G.__corruptsettings.intensity
		a.HighGain = rng:NextNumber(-30, 10)
		a.MidGain = rng:NextNumber(-30, 10)
	end;

	EchoSoundEffect = function(a)
		a.Delay = rng:NextNumber(0, 1);
		a.DryLevel = 0;
		a.WetLevel = 0;
		a.Feedback = 1
	end;

	PitchShiftSoundEffect = function(a)
		a.Octave = rng:NextNumber(-0.25, 2)
	end;

	ChorusSoundEffect = function(a)
		a.Depth = 1;
		a.Rate = rng:NextNumber(0, 20)
		a.Mix = rbool() == true and 1 or 0.5
	end;

	FlangeSoundEffect = function(a)
		a.Depth = 1;
		a.Rate = rng:NextNumber(0, 20)
		a.Mix = 1
	end;

	TremoloSoundEffect = function(a)
		a.Duty = rng:NextNumber(0, 0.5)
		a.Frequency = 20;
		a.Depth = 1
	end;

	Sound = function(a)
			--[[if _G.__corruptsettings.fetchrandomids then
				a.SoundId = rid()
			end]]

		a.PlaybackSpeed = rng:NextNumber(0.1, (_G.__corruptsettings.intensity + 1) * 1.7)
		a.Volume = rng:NextNumber(0.3, (_G.__corruptsettings.intensity + 1) * 1.7)

		if not _G.__corruptsettings.nosoundspam then
			a.Looped = rbool()
			a.Playing = rbool()
		end

		a.TimePosition = rng:NextNumber(0, 1000) % a.TimeLength
	end;


	PointLight = function(a)
		if _G.__corruptsettings.allowrainbow then
			a.Color = rcolor(1)
			a.Brightness = rng:NextNumber(_G.__corruptsettings.intensity / 6, 5 * _G.__corruptsettings.intensity)
		end

		a.Enabled = rbool()

		a.Shadows = rbool()
		a.Range = rng:NextNumber((_G.__corruptsettings.intensity / 2) + 3, 60 - (_G.__corruptsettings.intensity * 8))
	end;

	SurfaceLight = function(a)
		if _G.__corruptsettings.allowrainbow then
			a.Color = rcolor(1)
			a.Brightness = rng:NextNumber(_G.__corruptsettings.intensity / 6, 5 * _G.__corruptsettings.intensity)
		end

		a.Enabled = rbool()

		a.Shadows = rbool()
		a.Range = rng:NextNumber((_G.__corruptsettings.intensity / 2) + 3, 60 - (_G.__corruptsettings.intensity * 8))
		a.Angle = rng:NextNumber(0, 180)
	end;

	SpotLight = function(a)
		if _G.__corruptsettings.allowrainbow then
			a.Color = rcolor(1)
			a.Brightness = rng:NextNumber(_G.__corruptsettings.intensity / 6, 5 * _G.__corruptsettings.intensity)
		end

		a.Enabled = rbool()

		a.Shadows = rbool()
		a.Range = rng:NextNumber((_G.__corruptsettings.intensity / 2) + 3, 60 - (_G.__corruptsettings.intensity * 8))
		a.Angle = rng:NextNumber(0, 180)
	end;

	SpecialMesh = function(a)
		local c = rcolor(min(_G.__corruptsettings.intensity / 3, 1))

		if _G.__corruptsettings.allowrainbow then
			a.VertexColor = Vector3.new(c.R, c.G, c.B)
		end

		if _G.__corruptsettings.fetchrandomids then
			a.MeshId = rid()
			a.TextureId = rid()
		end

		a.Scale = rvector(1 + (_G.__corruptsettings.intensity * 0.1))
		a.Offset = rvector(1 + (_G.__corruptsettings.intensity * 0.1))

		c = nil;
	end;

	Smoke = function(a)
		a.Size = rng:NextInteger(1, _G.__corruptsettings.intensity * 4)
		a.Opacity = rng:NextInteger(1, _G.__corruptsettings.intensity * 4)
	end;

	Fire = function(a)
		a.Heat = rng:NextInteger(1, _G.__corruptsettings.intensity * 4)
	end;

	ParticleEmitter = function(a)
		a.LightEmission = rng:NextNumber(0, (_G.__corruptsettings.intensity - 1) * 5)
		a.Orientation = renum(Enum.ParticleOrientation.FacingCamera.EnumType)
		a.ZOffset = rng:NextInteger(0, (_G.__corruptsettings.intensity - 1) * 5)
		a.Acceleration = rvector((_G.__corruptsettings.intensity - 1) * 3)
		a.VelocityInheritance = rng:NextNumber(0, (_G.__corruptsettings.intensity - 1) * 3)
	end;

	BlockMesh = function(a)
		a.Offset = rvector(1 + (_G.__corruptsettings.intensity * 0.1))
		a.Scale = rvector(1 + (_G.__corruptsettings.intensity * 0.1))

		local c = rcolor(min(_G.__corruptsettings.intensity / 3, 1))
		if _G.__corruptsettings.allowrainbow then
			a.VertexColor = Vector3.new(c.R, c.G, c.B)
		end

		c = nil;
	end;


	Motor6D = function(a)
		if not _G.__corruptsettings.rigdestruction then return end

		a.C1 = a.C1 * rcf()
		a.C0 = a.C0 * rcf()
		--a.Transform = a.Transform * rcf()
	end;

	Bone = function(a)
		if not _G.__corruptsettings.rigdestruction then return end

		a.Axis = rvector(_G.__corruptsettings.intensity)
		a.SecondaryAxis = rvector(_G.__corruptsettings.intensity)

		a.Transform = rcf()
	end;

	Weld = function(a)
		if not _G.__corruptsettings.rigdestruction then return end

		a.C1 = a.C1 * rcf()
		a.C0 = a.C0 * rcf()
	end;


	CylinderMesh = function(a)
		a.Offset = rvector(1 + (_G.__corruptsettings.intensity * 0.1))
		a.Scale = rvector(1 + (_G.__corruptsettings.intensity * 0.1))

		local c = rcolor(min(_G.__corruptsettings.intensity / 3, 1))
		if _G.__corruptsettings.allowrainbow then
			a.VertexColor = Vector3.new(c.R, c.G, c.B)
		end

		c = nil;
	end;

	Camera = function(a)
		if _G.__corruptsettings.affectcamera then
			a.MaxAxisFieldOfView = rng:NextNumber(70 - (_G.__corruptsettings.intensity * 0.4), 134)
		end

		a.Focus = CFrame.new(rvector(_G.__corruptsettings.intensity))
	end;

	Lighting = function(a)
		if not _G.__corruptsettings.allowrainbow then return end

		a.Ambient = rcolor(1)
		a.OutdoorAmbient = rcolor(1)
		a.ColorShift_Top = rcolor(1)

		a.Brightness = rng:NextNumber(0, 7 * _G.__corruptsettings.intensity)
		a.EnvironmentSpecularScale = rng:NextNumber(0, 1)
		a.EnvironmentDiffuseScale = rng:NextNumber(0, 1)
		a.ShadowSoftness = rng:NextNumber(0, 1)
		a.ExposureCompensation = rng:NextNumber(-_G.__corruptsettings.intensity * 0.3, _G.__corruptsettings.intensity * 0.3)

		a.ClockTime = rng:NextNumber(0, 24)
		a.GeographicLatitude = rng:NextNumber(0, 360)

		a.FogColor = rcolor(1000 * _G.__corruptsettings.intensity)
		a.FogEnd = rng:NextNumber(100, 100000)
		a.FogStart = rng:NextNumber(0, 100000)
	end;


	Part = function(a)
		if (a.AssemblyLinearVelocity.Magnitude > 0) and _G.__corruptsettings.affectphysics then
			a.CustomPhysicalProperties = PhysicalProperties.new(rng:NextNumber(0, 100), rng:NextNumber(0, 2), rng:NextNumber(0, 1))
		end
	end;

	MeshPart = function(a)
		if a.CanCollide == false and rng:NextInteger(1, 222) == 222 then
			a.Size = a.Size + rvector(_G.__corruptsettings.intensity ^ 9)
		end

		if (a.AssemblyLinearVelocity.Magnitude > 0) and _G.__corruptsettings.affectphysics then
			a.CustomPhysicalProperties = PhysicalProperties.new(rng:NextNumber(0, 100), rng:NextNumber(0, 2), rng:NextNumber(0, 1))
		end
	end;

	MaterialVariant = function(a)
		if  _G.__corruptsettings.affectphysics then
			a.CustomPhysicalProperties = PhysicalProperties.new(rng:NextNumber(0, 100), rng:NextNumber(0, 2), rng:NextNumber(0, 1))
		end
	end;


	Humanoid = function(a)
		pcall(function() -- attempt to call a table value
			for _, z in a:GetPlayingAnimationTracks() do -- deprecated
				z:AdjustSpeed(rng:NextNumber(1 - _G.__corruptsettings.intensity * 0.3, (_G.__corruptsettings.intensity + 1)))
			end
		end)

		if not _G.__corruptsettings.affecthumanoid then return end

		local i = _G.__corruptsettings.intensity * 9
		a.JumpPower = 50 + rng:NextNumber(-i , i)
		a.WalkSpeed = 16 + rng:NextNumber(-i , i)

		a.CameraOffset = rvector(_G.__corruptsettings.intensity)
		local i2 = i * 0.3
		a.HipHeight = 2 + rng:NextNumber(-i2 , i2)
		a.AutoRotate = rbool()
		local i3 = i * 5
		a.MaxSlopeAngle = 80 + rng:NextNumber(-i3 , i3)
		a.BreakJointsOnDeath = rbool()

		i = nil;
		i2 = nil;
		i3 = nil;
	end;

	Tween = function(a)
		a.PlaybackState = renum(Enum.PlaybackState.Completed.EnumType)
	end;
}


luatype = function(a)
	local t = type(a)
	if luatypes[t] then
		--print("luatype")
		luatypes[t](a)
	end

	t = nil;
end

local function applytype(a)
	if not chance(_G.__corruptsettings.chance_scale, _G.__corruptsettings.chance_window) then return end

	if types[a.ClassName] then
		types[a.ClassName](a)
	end
end


local corrupt = {};

function corrupt.burst(sequence)
	for _, a in next, sequence do
		applytype(a)

		for _, b in next, a:GetDescendants() do
			--[[coroutine.wrap(function()]] applytype(b) --[[end)()]]
		end
	end
end

function corrupt.single(a)
	applytype(a)
end


local frontend = {}

function frontend.init(config, targets)
	local isinjected = _G.__corruptsettings ~= nil

	_G.__corruptsettings = config;

	if isinjected then
		print('corruptsettings modified. already injected.')
	else
		print('corrupt init')

		game.UserInputService.InputBegan:Connect(function(k) -- temp patch
			if k.KeyCode == Enum.KeyCode.LeftBracket then
				corrupt.burst(targets); warn("corruption burst")
			end
		end)
	end
end


return frontend
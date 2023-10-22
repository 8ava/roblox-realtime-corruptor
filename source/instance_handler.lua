
local script_handler = require(script.Parent.script_handler)
local method = nil


-- instance categories  -- kinda shortcuts so i can save memory
local function instance_value(instance)
	instance.Value = method(instance.Value)
end


local instances = {
	ModuleScript = function(instance) -- idk if this works
		local module = nil
		
		pcall(function()
			module = require(instance)
		end)
		
		
		if module then
			script_handler.set(module)
		end
	end;
	
	Workspace = function(instance)
		instance.Gravity = method(instance.Gravity)
		instance.GlobalWind = method(instance.GlobalWind)
	end;
	
	
	-- Values
	BoolValue = instance_value;
	StringValue = instance_value;
	NumberValue = instance_value;
	IntValue = instance_value;
	Vector3Value = instance_value;
	Color3Value = instance_value;
	CFrameValue = instance_value;
	
	
	-- Audio
	DistortionSoundEffect = function(instance)
		instance.Level = method(instance.Level)
		instance.Priority = method(instance.Priority)
	end;

	CompressorSoundEffect = function(instance)
		instance.Attack = method(instance.Attack)
		instance.GainMakeup = method(instance.GainMakeup)
		instance.Ratio = method(instance.Ratio)
		instance.Release = method(instance.Release)
		instance.Priority = method(instance.Priority)
	end;

	EqualizerSoundEffect = function(instance)
		instance.LowGain = method(instance.LowGain)
		instance.HighGain = method(instance.HighGain)
		instance.MidGain = method(instance.MidGain)
	end;

	EchoSoundEffect = function(instance)
		instance.Delay = method(instance.Delay)
		instance.DryLevel = method(instance.DryLevel)
		instance.WetLevel = method(instance.WetLevel)
		instance.Feedback = method(instance.Feedback)
	end;

	PitchShiftSoundEffect = function(instance)
		instance.Octave = method(instance.Octave)
	end;

	ChorusSoundEffect = function(instance)
		instance.Depth = method(instance.Depth)
		instance.Rate = method(instance.Rate)
		instance.Mix = method(instance.Mix)
	end;

	FlangeSoundEffect = function(instance)
		instance.Depth = method(instance.Depth)
		instance.Rate = method(instance.Rate)
		instance.Mix = method(instance.Mix)
	end;

	TremoloSoundEffect = function(instance)
		instance.Duty = method(instance.Duty)
		instance.Frequency = method(instance.Frequency)
		instance.Depth = method(instance.Depth)
	end;

	Sound = function(instance)
		--instance.SoundId = method(instance.SoundId)
		instance.PlaybackSpeed = method(instance.PlaybackSpeed)
		instance.Volume = method(instance.Volume)
		instance.TimePosition = method(instance.TimePosition)
	end;


	-- GUI
	UIAspectRatioConstraint = function(instance)
		instance.AspectRatio = method(instance.AspectRatio)
	end;

	CanvasGroup = function(instance)
		instance.GroupTransparency = method(instance.GroupTransparency)
		instance.GroupColor3 = method(instance.GroupColor3)
		instance.Size = method(instance.Size)
		instance.Position = method(instance.Position)
		instance.Rotation = method(instance.Rotation)
		instance.ZIndex = method(instance.ZIndex)
	end;

	BillboardGui = function(instance)
		instance.AlwaysOnTop = method(instance.AlwaysOnTop)
		instance.ExtentsOffset = method(instance.ExtentsOffset)
		instance.ExtentsOffsetWorldSpace = method(instance.ExtentsOffsetWorldSpace)
		instance.LightInfluence = method(instance.LightInfluence)
		instance.SizeOffset = method(instance.SizeOffset)
		instance.StudsOffset = method(instance.StudsOffset)
		instance.Size = method(instance.Size)
	end;

	ViewportFrame = function(instance)
		instance.Ambient = method(instance.Ambient)
		instance.LightColor = method(instance.LightColor)
		instance.LightDirection = method(instance.LightDirection)
	end;

	TextLabel = function(instance)
		instance.TextYAlignment = method(instance.TextYAlignment)
		instance.TextXAlignment = method(instance.TextXAlignment)
		instance.TextScaled = method(instance.TextScaled)
		instance.TextWrapped = method(instance.TextWrapped)
		instance.RichText = method(instance.RichText)
		instance.TextXAlignment = method(instance.TextXAlignment)
		instance.TextYAlignment = method(instance.TextYAlignment)
		instance.Size = method(instance.Size)
		instance.Text = method(instance.Text)
	end;

	ImageLabel = function(instance)
		instance.ResampleMode = method(instance.ResampleMode)
		instance.ScaleType = method(instance.ScaleType)
		instance.ImageRectSize = method(instance.ImageRectSize)
		instance.ImageRectOffset = method(instance.ImageRectOffset)
		instance.Size = method(instance.Size)
	end;
	
	
	-- Textures
	Texture = function(instance)
		instance.ZIndex = method(instance.ZIndex)
		instance.Texture = method(instance.Texture)
		
		instance.OffsetStudsU = method(instance.OffsetStudsU)
		instance.OffsetStudsV = method(instance.OffsetStudsV)
		instance.StudsPerTileU = method(instance.StudsPerTileU)
		instance.StudsPerTileV = method(instance.StudsPerTileV)
	end;

	Decal = function(instance)
		instance.ZIndex = method(instance.ZIndex)
		instance.Color3 = method(instance.Color3)
		instance.Texture = method(instance.Texture)
	end;
	
	MaterialVariant = function(instance)
		instance.CustomPhysicalProperties = method(instance.CustomPhysicalProperties)
	end;
	
	
	-- Post Processing
	BlurEffect = function(instance)
		instance.Size = method(instance.Size)
	end;

	ColorCorrectionEffect = function(instance)
		instance.Saturation = method(instance.Saturation)
		instance.Contrast = method(instance.Contrast)
	end;

	BloomEffect = function(instance)
		instance.Size = method(instance.Size)
		instance.Threshold = method(instance.Threshold)
		instance.Intensity = method(instance.Intensity)
	end;

	
	-- Lighting
	Lighting = function(instance)
		instance.Ambient = method(instance.Ambient)
		instance.OutdoorAmbient = method(instance.OutdoorAmbient)
		instance.ColorShift_Top = method(instance.ColorShift_Top)

		instance.Brightness = method(instance.Brightness)
		instance.EnvironmentSpecularScale = method(instance.EnvironmentSpecularScale)
		instance.EnvironmentDiffuseScale = method(instance.EnvironmentDiffuseScale)
		instance.ShadowSoftness = method(instance.ShadowSoftness)
		instance.ExposureCompensation = method(instance.ExposureCompensation)

		instance.ClockTime = method(instance.ClockTime)
		instance.GeographicLatitude = method(instance.GeographicLatitude)

		instance.FogColor = method(instance.FogColor)
		instance.FogEnd = method(instance.FogEnd)
		instance.FogStart = method(instance.FogStart)
	end;
	
	PointLight = function(instance)
		instance.Color = method(instance.Color)
		instance.Brightness = method(instance.Brightness)

		instance.Enabled = method(instance.Enabled)

		instance.Shadows = method(instance.Shadows)
		instance.Range = method(instance.Range)
	end;

	SurfaceLight = function(instance)
		instance.Color = method(instance.Color)
		instance.Brightness = method(instance.Brightness)

		instance.Enabled = method(instance.Enabled)

		instance.Shadows = method(instance.Shadows)
		instance.Range = method(instance.Range)
		instance.Angle = method(instance.FogStart)
	end;

	SpotLight = function(instance)
		instance.Color = method(instance.Color)
		instance.Brightness = method(instance.Brightness)

		instance.Enabled = method(instance.Enabled)

		instance.Shadows = method(instance.Shadows)
		instance.Range = method(instance.Range)
		instance.Angle = method(instance.Angle)
	end;
	
	
	-- Mesh
	SpecialMesh = function(instance)
		instance.VertexColor = method(instance.VertexColor)

		--instance.MeshId = method(instance.MeshId)
		--instance.TextureId = method(instance.TextureId)

		instance.Scale = method(instance.Scale)
		instance.Offset = method(instance.Offset)
	end;
	
	BlockMesh = function(instance)
		instance.VertexColor = method(instance.VertexColor)
		
		instance.Scale = method(instance.Scale)
		instance.Offset = method(instance.Offset)
	end;
	
	CylinderMesh = function(instance)
		instance.VertexColor = method(instance.VertexColor)

		instance.Scale = method(instance.Scale)
		instance.Offset = method(instance.Offset)
	end;
	
	Part = function(instance)
		instance.CustomPhysicalProperties = method(instance.CustomPhysicalProperties)
	end;

	MeshPart = function(instance)
		instance.Size = method(instance.Size)

		instance.CustomPhysicalProperties = method(instance.CustomPhysicalProperties)
	end;
	
	
	-- Bones
	Motor6D = function(instance)
		instance.C1 = method(instance.C1)
		instance.C0 = method(instance.C0)
	end;

	Weld = function(instance)
		instance.C1 = method(instance.C1)
		instance.C0 = method(instance.C0)
	end;
	
	Bone = function(instance)
		instance.Axis = method(instance.Axis)
		instance.SecondaryAxis = method(instance.SecondaryAxis)

		instance.Transform = method(instance.Transform)
	end;
	
	

	--[[Smoke = function(a)
		a.RiseVelocity = rng:NextInteger(1, 25)
		a.TimeScale = rng:NextNumber(0, _G.__corruptsettings.intensity + 1)
		a.Size = rng:NextInteger(1, _G.__corruptsettings.intensity * 4)
		a.Opacity = rng:NextInteger(1, _G.__corruptsettings.intensity * 4)
	end;

	Fire = function(a)
		a.Heat = rng:NextInteger(1, _G.__corruptsettings.intensity * 4)
	end;

	ParticleEmitter = function(a)
		local i = _G.__corruptsettings.intensity * 2.5

		a.Squash = rbool() and n2nseq(rng:NextNumber(-i, i)) or NumberSequence.new(0)
		a.Rotation = n2nran(rng:NextInteger(0, 360))
		a.Lifetime = n2nran(rng:NextInteger(0, 20))
		a.Rate = a.Rate + rng:NextInteger(-i, i); i = nil;
		a.LightEmission = rng:NextNumber(0, (_G.__corruptsettings.intensity - 1) * 5)
		a.Orientation = renum(Enum.ParticleOrientation.FacingCamera.EnumType)
		a.ZOffset = rng:NextInteger(0, (_G.__corruptsettings.intensity - 1) * 5)
		a.Acceleration = rvector((_G.__corruptsettings.intensity - 1) * 3)
		a.VelocityInheritance = rng:NextNumber(0, (_G.__corruptsettings.intensity - 1) * 3)
	end;

	


	


	Camera = function(a)
		if _G.__corruptsettings.affectcamera then
			a.MaxAxisFieldOfView = rng:NextNumber(70 - (_G.__corruptsettings.intensity * 0.4), 134)
		end

		a.Focus = CFrame.new(rvector(_G.__corruptsettings.intensity))
	end;


	Humanoid = function(a)
		pcall(function() -- attempt to call a table value
			for _, z in next, a:GetPlayingAnimationTracks() do -- deprecated
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
	end;]]
}


local module = {}

function module.set(instance)
	method = _G._RTCEnvironment.vars.CurrentEngine.get


	local type_ = instance.ClassName

	if instances[type_] then
		local a, message = pcall(instances[type_], instance) if not a then warn(message) end
	else
		-- later
	end
end


return module

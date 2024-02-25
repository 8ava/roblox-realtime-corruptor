
local script_handler = require(script.Parent.script_handler)
local method = nil


-- instance categories  -- kinda shortcuts so i can save memory
local function instance_value(instance)
	instance.Value = method(instance.Value)
end


local instances = {
	-- Services
	Terrain = function(instance)
		instance.WaterColor = method(instance.WaterColor)
		instance.WaterReflectance = method(instance.WaterReflectance)
		instance.WaterTransparency = method(instance.WaterTransparency)
		instance.WaterWaveSize = method(instance.WaterWaveSize)
		instance.WaterWaveSpeed = method(instance.WaterWaveSpeed)
	end,
	
	['Workspace'] = function(instance)
		instance.Gravity = method(instance.Gravity)
		instance.GlobalWind = method(instance.GlobalWind)
		instance.Retargeting = method(instance.Retargeting)
		
		instance.ModelStreamingMode = method(instance.ModelStreamingMode)
		instance.ClientAnimatorThrottling = method(instance.ClientAnimatorThrottling)
	end,
	
	Players = function(instance)
		instance.UseStrafingAnimations = method(instance.UseStrafingAnimations)
	end,
	
	SoundService = function(instance)
		instance.DistanceFactor = method(instance.DistanceFactor)
		
		instance.DopplerScale = method(instance.DopplerScale)
		instance.RolloffScale = method(instance.RolloffScale)
	end,
	

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
		--instance.Texture = method(instance.Texture)
		
		instance.OffsetStudsU = method(instance.OffsetStudsU)
		instance.OffsetStudsV = method(instance.OffsetStudsV)
		instance.StudsPerTileU = method(instance.StudsPerTileU)
		instance.StudsPerTileV = method(instance.StudsPerTileV)
	end;

	Decal = function(instance)
		instance.ZIndex = method(instance.ZIndex)
		instance.Color3 = method(instance.Color3)
		--instance.Texture = method(instance.Texture)
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
	
	
	-- Particles
	Smoke = function(instance)
		instance.TimeScale = method(instance.TimeScale)
		instance.Size = method(instance.Size)
		instance.Opacity = method(instance.Opacity)
	end;

	Fire = function(instance)
		instance.TimeScale = method(instance.TimeScale)
		instance.Size = method(instance.Size)
		instance.Heat = method(instance.Heat)
	end;

	ParticleEmitter = function(instance)
		instance.Squash = method(instance.Squash)
		instance.Rotation = method(instance.Rotation)
		instance.Lifetime = method(instance.Lifetime)
		instance.Rate = method(instance.Rate)
		instance.LightEmission = method(instance.LightEmission)
		instance.Orientation = method(instance.Orientation)
		instance.ZOffset = method(instance.ZOffset)
		instance.Acceleration = method(instance.Acceleration)
		instance.VelocityInheritance = method(instance.VelocityInheritance)
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
		instance.Angle = method(instance.Angle)
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
		instance.AssemblyLinearVelocity = method(instance.AssemblyLinearVelocity)
		instance.AssemblyAngularVelocity = method(instance.AssemblyAngularVelocity)
		instance.CustomPhysicalProperties = method(instance.CustomPhysicalProperties)
	end;

	MeshPart = function(instance)
		instance.Size = method(instance.Size)
		
		instance.AssemblyLinearVelocity = method(instance.AssemblyLinearVelocity)
		instance.AssemblyAngularVelocity = method(instance.AssemblyAngularVelocity)
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
	
	
	-- Physics
	AlignOrientation = function(instance)
		instance.Mode = method(instance.Mode)
		instance.AlignType = method(instance.AlignType)
		instance.Responsiveness = method(instance.Responsiveness)
		
		instance.PrimaryAxis = method(instance.PrimaryAxis)
		instance.SecondaryAxis = method(instance.SecondaryAxis)
		instance.PrimaryAxisOnly = method(instance.PrimaryAxisOnly)
		
		instance.MaxTorque = method(instance.MaxTorque)
		instance.LookAtPosition = method(instance.LookAtPosition)
		instance.RigidityEnabled = method(instance.RigidityEnabled)
		instance.MaxAngularVelocity = method(instance.MaxAngularVelocity)
		instance.ReactionTorqueEnabled = method(instance.ReactionTorqueEnabled)
	end,
	
	AlignPosition = function(instance)
		instance.Mode = method(instance.Mode)
		instance.Responsiveness = method(instance.Responsiveness)
		
		instance.MaxForce = method(instance.MaxForce)
		instance.MaxVelocity = method(instance.MaxVelocity)
		instance.MaxAxesForce = method(instance.MaxAxesForce)
		
		instance.ForceLimitMode = method(instance.ForceLimitMode)
		instance.ForceRelativeTo = method(instance.ForceRelativeTo)
		
		instance.ApplyAtCenterOfMass = method(instance.ApplyAtCenterOfMass)
		instance.ReactionForceEnabled = method(instance.ReactionForceEnabled)
		instance.RigidityEnabled = method(instance.RigidityEnabled)
	end,
	
	AngularVelocity = function(instance)
		instance.MaxTorque = method(instance.MaxTorque)
		instance.ReactionTorqueEnabled = method(instance.ReactionTorqueEnabled)
		instance.RelativeTo = method(instance.RelativeTo)
	end,
	
	BallSocketConstraint = function(instance)
		instance.Radius = method(instance.Radius)
		
		instance.UpperAngle = method(instance.UpperAngle)
		instance.Restitution = method(instance.Restitution)
		
		instance.TwistLowerAngle = method(instance.TwistLowerAngle)
		instance.TwistUpperAngle = method(instance.TwistUpperAngle)
		
		instance.MaxFrictionTorque = method(instance.MaxFrictionTorque)
		
		instance.LimitsEnabled = method(instance.LimitsEnabled)
		instance.TwistLimitsEnabled = method(instance.TwistLimitsEnabled)
	end,
	
	CylindricalConstraint = function(instance) -- what genius roblox engineer decided to make this have 29 different properties?
		instance.Velocity = method(instance.Velocity)
		instance.Speed = method(instance.Speed)
		instance.Size = method(instance.Size)
		instance.Restitution = method(instance.Restitution)
		
		instance.ActuatorType = method(instance.ActuatorType)
		instance.AngularActuatorType = method(instance.AngularActuatorType)
		
		instance.UpperAngle = method(instance.UpperAngle)
		instance.LowerAngle = method(instance.LowerAngle)
		instance.TargetAngle = method(instance.TargetAngle)
		instance.CurrentAngle = method(instance.CurrentAngle)
		
		instance.LimitsEnabled = method(instance.LimitsEnabled)
		instance.LowerLimit = method(instance.LowerLimit)
		instance.UpperLimit = method(instance.UpperLimit)
		
		instance.AngularSpeed = method(instance.AngularSpeed)
		
		instance.MotorMaxForce = method(instance.MotorMaxForce)
		instance.MotorMaxTorque = method(instance.MotorMaxTorque)
		instance.MotorMaxAcceleration = method(instance.MotorMaxAcceleration)
		instance.MotorMaxAngularAcceleration = method(instance.MotorMaxAngularAcceleration)
		
		instance.ServoMaxForce = method(instance.ServoMaxForce)
		instance.ServoMaxTorque = method(instance.ServoMaxTorque)
		
		instance.AngularRestitution = method(instance.AngularRestitution)
		instance.AngularVelocity = method(instance.AngularVelocity)
		instance.AngularLimitsEnabled = method(instance.AngularLimitsEnabled)
		instance.AngularResponsiveness = method(instance.AngularResponsiveness)
		
		instance.TargetPosition = method(instance.TargetPosition)
		instance.CurrentPosition = method(instance.CurrentPosition)
		instance.InclinationAngle = method(instance.InclinationAngle)
		instance.WorldRotationAxis = method(instance.WorldRotationAxis)
		instance.RotationAxisVisible = method(instance.RotationAxisVisible)
		instance.LinearResponsiveness = method(instance.LinearResponsiveness)
	end,
	
	HingeConstraint = function(instance)
		instance.UpperAngle = method(instance.UpperAngle)
		instance.LowerAngle = method(instance.LowerAngle)
		instance.TargetAngle = method(instance.TargetAngle)
		
		instance.Restitution = method(instance.Restitution)
		instance.Radius = method(instance.Radius)
		instance.LimitsEnabled = method(instance.LimitsEnabled)
		
		instance.AngularSpeed = method(instance.AngularSpeed)
		instance.AngularVelocity = method(instance.AngularVelocity)
		instance.AngularResponsiveness = method(instance.AngularResponsiveness)
		
		instance.MotorMaxTorque = method(instance.MotorMaxTorque)
		instance.ServoMaxTorque = method(instance.ServoMaxTorque)
		instance.MotorMaxAcceleration = method(instance.MotorMaxAcceleration)

		instance.ActuatorType = method(instance.ActuatorType)
	end,
	
	LinearVelocity = function(instance)
		instance.MaxForce = method(instance.MaxForce)
		instance.RelativeTo = method(instance.RelativeTo)
		instance.LineVelocity = method(instance.LineVelocity)
		
		instance.ForceLimitMode = method(instance.ForceLimitMode)
		instance.ForceLimitsEnabled = method(instance.ForceLimitsEnabled)
		instance.VelocityConstraintMode = method(instance.VelocityConstraintMode)
	end,
	
	LineForce = function(instance)
		instance.Magnitude = method(instance.Magnitude)
		instance.MaxForce = method(instance.MaxForce)
		
		instance.InverseSquareLaw = method(instance.InverseSquareLaw)
		instance.ReactionForceEnabled = method(instance.ReactionForceEnabled)
	end,
	
	NoCollisionConstraint = function(instance)
		instance.Enabled = method(instance.Enabled)
	end,
	
	PlaneConstraint = function(instance)
		instance.Enabled = method(instance.Enabled)
	end,
	
	PrismaticConstraint = function(instance)
		instance.Speed = method(instance.Speed)
		instance.Size = method(instance.Size)
		instance.Velocity = method(instance.Velocity)
		instance.Restitution = method(instance.Restitution)
		
		instance.LimitsEnabled = method(instance.LimitsEnabled)
		instance.ActuatorType = method(instance.ActuatorType)
		
		instance.LowerLimit = method(instance.LowerLimit)
		instance.UpperLimit = method(instance.UpperLimit)
		
		instance.MotorMaxForce = method(instance.MotorMaxForce)
		instance.ServoMaxForce = method(instance.ServoMaxForce)
		instance.LinearResponsiveness = method(instance.LinearResponsiveness)
		instance.MotorMaxAcceleration = method(instance.MotorMaxAcceleration)
	end,
	
	RigidConstraint = function(instance)
		instance.Enabled = method(instance.Enabled)
	end,
	
	RodConstraint = function(instance)
		instance.LimitsEnabled = method(instance.LimitsEnabled)
		
		instance.LimitAngle0 = method(instance.LimitAngle0)
		instance.LimitAngle1 = method(instance.LimitAngle1)
	end,
	
	RopeConstraint = function(instance)
		instance.Restitution = method(instance.Restitution)
		
		instance.WinchForce = method(instance.WinchForce)
		instance.WinchTarget = method(instance.WinchTarget)
		instance.WinchEnabled = method(instance.WinchEnabled)
		instance.WinchSpeed = method(instance.WinchSpeed)
		instance.WinchResponsiveness = method(instance.WinchResponsiveness)
	end,
	
	SpringConstraint = function(instance)
		instance.MaxForce = method(instance.MaxForce)
		instance.Damping = method(instance.Damping)
		instance.Stiffness = method(instance.Stiffness)
		
		instance.FreeLength = method(instance.FreeLength)
		instance.LimitsEnabled = method(instance.LimitsEnabled)
	end,
	
	Torque = function(instance)
		instance.RelativeTo = method(instance.RelativeTo)
	end,
	
	TorsionSpringConstraint = function(instance)
		instance.Restitution = method(instance.Restitution)
		instance.Damping = method(instance.Damping)
		instance.Stiffness = method(instance.Stiffness)
		
		instance.MaxTorque = method(instance.MaxTorque)
		instance.MaxAngle = method(instance.MaxAngle)

		instance.LimitsEnabled = method(instance.LimitsEnabled)
	end,
	
	UniversalConstraint = function(instance)
		instance.Restitution = method(instance.Restitution)
		instance.LimitsEnabled = method(instance.LimitsEnabled)
		instance.MaxAngle = method(instance.MaxAngle)
	end,
	
	VectorForce = function(instance)
		instance.RelativeTo = method(instance.RelativeTo)
	end,

	
	-- misc
	ModuleScript = function(instance)
		script_handler.set(require(instance))
	end;

	Camera = function(instance)
		instance.MaxAxisFieldOfView = method(instance.MaxAxisFieldOfView)
		instance.CameraType = method(instance.CameraType)
		instance.Focus = method(instance.Focus)
	end;
	
	Humanoid = function(instance)
		instance.JumpPower = method(instance.JumpPower)
		instance.WalkSpeed = method(instance.WalkSpeed)

		instance.CameraOffset = method(instance.CameraOffset)
		instance.HipHeight = method(instance.HipHeight)
		instance.AutoRotate = method(instance.AutoRotate)
		instance.MaxSlopeAngle = method(instance.MaxSlopeAngle)
		instance.BreakJointsOnDeath = method(instance.BreakJointsOnDeath)
		
		for _, animation in next, instance:GetPlayingAnimationTracks() do
			animation:AdjustSpeed(method(animation.Speed))
		end
	end;
	
	Tool = function(instance)
		instance.ToolTip = method(instance.ToolTip)
		instance.ModelStreamingMode = method(instance.ModelStreamingMode)
		instance.ManualActivationOnly = method(instance.ManualActivationOnly)
	end,

	Tween = function(instance)
		instance.PlaybackState = method(instance.PlaybackState)
	end;
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

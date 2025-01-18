-- I Made This Open Source For People To Learn Off.
if not hookfunction or not newcclosure or not getgc then  -- Checks If The Executor Has The Required Functions For The Script.
	game:GetService("Players").localPlayer:kick("Executor Not Supported"); -- Kicks The Player If Not.
end;

local SilentAim = { -- Settings
	Enabled = false,
	WallCheck = false,
	ShowFov = false,
	Fov = 600,
	HitPart = "Head"
};

-- GUI
local GUIHolder = Instance.new("ScreenGui", game.CoreGui); GUIHolder.ResetOnSpawn = false;
local Frame = Instance.new("Frame", GUIHolder); Frame.Visible = true; Frame.Draggable = true; Frame.Active = true; Frame.BackgroundColor3 = Color3.fromRGB(52, 52, 52); Frame.Size = UDim2.fromOffset(241, 248); Frame.BorderColor3 = Color3.fromRGB(255, 255, 255);
local Frame2 = Instance.new("Frame", Frame); Frame2.BackgroundTransparency = 1; Frame2.Position = UDim2.new(0.288, 0,0.155, 0); Frame2.Size = UDim2.new(0, 100,0, 164);
local UiListLayout = Instance.new("UIListLayout", Frame2); UiListLayout.FillDirection = "Vertical"; UiListLayout.SortOrder = "LayoutOrder"; UiListLayout.Padding = UDim.new(0,5);
local EnableButton = Instance.new("TextButton", Frame2); EnableButton.Text = "Enable"; EnableButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52); EnableButton.BorderColor3 = Color3.fromRGB(255, 255, 255); EnableButton.Font = "Roboto"; EnableButton.TextSize = 17; EnableButton.TextColor3 = Color3.fromRGB(255, 255, 255); EnableButton.TextXAlignment = "Center"; EnableButton.Size = UDim2.new(0, 122,0, 24);
local WallCheckButton = Instance.new("TextButton", Frame2); WallCheckButton.Text = "Wall Check"; WallCheckButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52); WallCheckButton.BorderColor3 = Color3.fromRGB(255, 255, 255); WallCheckButton.Font = "Roboto"; WallCheckButton.TextSize = 17; WallCheckButton.TextColor3 = Color3.fromRGB(255, 255, 255); WallCheckButton.TextXAlignment = "Center"; WallCheckButton.Size = UDim2.new(0, 122,0, 24);
local ShowFovButton = Instance.new("TextButton", Frame2); ShowFovButton.Text = "Show Fov"; ShowFovButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52); ShowFovButton.BorderColor3 = Color3.fromRGB(255, 255, 255); ShowFovButton.Font = "Roboto"; ShowFovButton.TextSize = 17; ShowFovButton.TextColor3 = Color3.fromRGB(255, 255, 255); ShowFovButton.TextXAlignment = "Center"; ShowFovButton.Size = UDim2.new(0, 122,0, 24);
local TextLabel = Instance.new("TextLabel", Frame2); TextLabel.Text = "Fov Size"; TextLabel.BackgroundTransparency = 1; TextLabel.TextXAlignment = "Center"; TextLabel.TextSize = 17; TextLabel.Font = "Roboto"; TextLabel.TextColor3 = Color3.fromRGB(17, 223, 255); TextLabel.Size = UDim2.new(0, 100,0, 17);
local FovSizeText = Instance.new("TextBox", Frame2); FovSizeText.Text = "600"; FovSizeText.BackgroundColor3 = Color3.fromRGB(52, 52, 52); FovSizeText.BorderColor3 = Color3.fromRGB(255, 255, 255); FovSizeText.Font = "Roboto"; FovSizeText.TextSize = 17; FovSizeText.TextColor3 = Color3.fromRGB(255, 255, 255); FovSizeText.TextXAlignment = "Center"; FovSizeText.Size = UDim2.new(0, 122,0, 24); FovSizeText.ClearTextOnFocus = false;
local HitScanButton = Instance.new("TextButton", Frame2); HitScanButton.Text = "HEAD, torso"; HitScanButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52); HitScanButton.BorderColor3 = Color3.fromRGB(255, 255, 255); HitScanButton.Font = "Roboto"; HitScanButton.TextSize = 17; HitScanButton.TextColor3 = Color3.fromRGB(255, 255, 255); HitScanButton.TextXAlignment = "Center"; HitScanButton.Size = UDim2.new(0, 122,0, 24);
local Name = Instance.new("TextLabel", Frame); Name.Text = "DeleteMob | PD Silent Aim"; Name.BackgroundTransparency = 1; Name.TextXAlignment = "Center"; Name.TextSize = 19; Name.Font = "Roboto"; Name.TextColor3 = Color3.fromRGB(17, 223, 255); Name.Size = UDim2.new(0, 200,0, 50); Name.Position = UDim2.new(0.083, 0,-0.056, 0);
local Discord = Instance.new("TextBox", Frame); Discord.Text = "https://discord.gg/FsApQ7YNTq - ClickMe"; Discord.BackgroundTransparency = 1; Discord.BorderColor3 = Color3.fromRGB(255, 255, 255); Discord.Font = "Roboto"; Discord.TextSize = 14; Discord.TextColor3 = Color3.fromRGB(255, 255, 255); Discord.TextXAlignment = "Center"; Discord.Size = UDim2.new(0, 200,0, 23); Discord.Position = UDim2.new(0.083, 0,0.873, 0); Discord.ClearTextOnFocus = false; Discord.TextEditable = false;
EnableButton.MouseButton1Down:Connect(function()
	if SilentAim.Enabled then 
		SilentAim.Enabled = false 
		EnableButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
	else
		SilentAim.Enabled = true 
		EnableButton.BackgroundColor3 = Color3.fromRGB(2, 54, 8);
	end;
end);
WallCheckButton.MouseButton1Down:Connect(function()
	if SilentAim.WallCheck then 
		SilentAim.WallCheck = false 
		WallCheckButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
	else
		SilentAim.WallCheck = true 
		WallCheckButton.BackgroundColor3 = Color3.fromRGB(2, 54, 8);
	end;
end);
ShowFovButton.MouseButton1Down:Connect(function()
	if SilentAim.ShowFov then 
		SilentAim.ShowFov = false 
		ShowFovButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
	else
		SilentAim.ShowFov = true 
		ShowFovButton.BackgroundColor3 = Color3.fromRGB(2, 54, 8);
	end;
end);
HitScanButton.MouseButton1Down:Connect(function()
	if SilentAim.HitPart == "Head" then 
		SilentAim.HitPart = "HumanoidRootPart";
		HitScanButton.Text = "head, TORSO"
	else
		SilentAim.HitPart = "Head";
		HitScanButton.Text = "HEAD, torso"
	end;
end);

local Bullet;
xpcall(function() 
    Bullet = require(game:GetService("ReplicatedStorage").Modules.FPS.Bullet).CreateBullet; -- Getting The Module Were They Create The New Bullets.
end,function() -- If It Errros Then Kick The Player
    game:GetService("Players").localPlayer:kick("Executor Not Supported");
end);

local LocalPlayer      = game:GetService("Players").localPlayer;
local CurrentCamera    = game:GetService("Workspace").CurrentCamera;
local UserInputService = game:GetService("UserInputService");
local RunService       = game:GetService("RunService");

local Functions = { };
do
	function Functions:IsAlive(Player)
		if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 then
			return true; -- Checks If Player Is Alive And Returns True.
		end;
		return false;
	end;

	function Functions:IsVisible(Part, IgnoreList)
		local RayParams = RaycastParams.new(); -- Set Up The Raycast 
		RayParams.FilterType = Enum.RaycastFilterType.Exclude;
		RayParams.FilterDescendantsInstances = (Functions:IsAlive(LocalPlayer) and {IgnoreList, LocalPlayer.Character, CurrentCamera} or {IgnoreList, CurrentCamera}); -- Ignores What Ever Is In This Table
		RayParams.IgnoreWater = true;

		local Direction = (Part.Position - CurrentCamera.CFrame.Position).Unit * 5000; -- The Direction No Way
		local ray = workspace:Raycast(CurrentCamera.CFrame.Position, Direction, RayParams); -- Call The Raycast

		if ray and ray.Instance and ray.Instance:IsDescendantOf(Part.Parent) then -- Check If It Is Returing Something And If It Is The Player If Not Then Return false.
			return true;
		end;

		return false;
	end;

	function Functions:GetClosestToMouse()
		local Closest, Part = SilentAim.Fov, nil; 

		for _,Player in pairs(game:GetService("Players"):GetChildren()) do -- Gets All Of The Players.
			if Player ~= LocalPlayer and Functions:IsAlive(Player) then -- Checks If Player Is Not Local Player And If They Are Alive.
				local HitPart = Player.Character:FindFirstChild(SilentAim.HitPart); -- Gets The Body Part Of The Player.
				if HitPart then
					if SilentAim.WallCheck ~= true or Functions:IsVisible(HitPart) then -- If Wall Check Selected Then It Will Check If The Player Is Visible.
						local ScreenPosition, OnScreen = CurrentCamera:WorldToViewportPoint(HitPart.Position); -- Converts The 3D Postion To 2D.
						local Distance = (UserInputService:GetMouseLocation()- Vector2.new(ScreenPosition.X, ScreenPosition.Y)).Magnitude; -- Gets The Distance Between The Mouse And The Player.
						if OnScreen and Distance < Closest then  -- Checks If The Player Is On The Screen And Is The Closest Part.
							Closest = Distance;
							Part    = HitPart;
						end;
					end;
				end;
			end;
		end;

		return Part; -- Returns The Part.
	end;

	function Functions:Prediction(Part, From, MuzzleVelocity, Drag)
        local Displacement = Part.Position - From; -- The Variables Are Self Expanitory.
        local HorizontalDistance = Vector3.new(Displacement.X, 0, Displacement.Z).Magnitude;

        local DragEffect = Drag * HorizontalDistance / MuzzleVelocity; -- Time = (1 - E^(-Drag * Distance / MuzzleVelocity)) / DragRate.
        local Time = (1 - math.exp(-DragEffect)) / Drag;
    
        if Time <= 0 then -- It Is Not Possible To Hit The Target.
            return vector3.zero;
        end;

		return Part.CFrame.Position + (Part.Velocity * Time); -- Returns The Predicted Position Of The Body Part.
	end;

	function Functions:BulletDrop(From, To, MuzzleVelocity, Drag, Gravity) -- This Will Calculate The Vertical Displacement That Will Be Needed To Be Added To The Players Position.
        local Displacement = To - From;
        local HorizontalDistance = Vector3.new(Displacement.X, 0, Displacement.Z).Magnitude;

        local DragEffect = Drag * HorizontalDistance / MuzzleVelocity;
        local Time = (1 - math.exp(-DragEffect)) / Drag;
    
        if Time <= 0 then
            return vector3.zero;
        end;
    
        local VerticalDisplacement = 0.5 * Gravity * Time^2 -- kinematic Equation.

        return VerticalDisplacement;
	end;
    
    

end;

-- Silent Aim Hook 
local Old; Old = hookfunction(Bullet, newcclosure(function(...) -- Hooks The Function And Uses newcclosure To Stop Some Dectections.
	local Args          = {...}; -- Args That Can Be Modified.
	local Target        = Functions:GetClosestToMouse(); -- Gets The Closest Person To Mouse.

	if Target and not checkcaller() and SilentAim.Enabled then -- Checks If We Have A Target And Silent Aim Is Enabled Aslo checkcaller Is Used To Check If It Is The Executor Calling The Fucntion.
	    
	    local AmmoType      = game:GetService("ReplicatedStorage").AmmoTypes[tostring(Args[7])]; -- Grabs The Ammo Type That The Weapon You Are Using.
	    local Prediction    = Functions:Prediction(Target, Args[5].CFrame.Position, AmmoType:GetAttribute("MuzzleVelocity"), AmmoType:GetAttribute("Drag"));
	    local PredictedDrop = Functions:BulletDrop(Args[5].CFrame.Position, Prediction, AmmoType:GetAttribute("MuzzleVelocity"), AmmoType:GetAttribute("Drag"), AmmoType:GetAttribute("ProjectileDrop"));
            
		Args[5].CFrame = CFrame.new(Args[5].CFrame.Position, Prediction + Vector3.new(0, Tragector, 0)); -- Modify The Arguments. Changes The Barrels CFrame To Be Aiming At The Player.
	end;

	return Old(table.unpack(Args)); -- Returns Modified Arguments.
end)); 

-- FOV
local Fov   = Drawing.new("Circle"); -- Simple Fov;
Fov.Filled    = false;

Fov.Color   = Color3.fromRGB(255, 255 ,255);
Fov.Thickness = 1;
RunService.Heartbeat:Connect(function() -- Loop To Change The Mouse Position And Size.

	if not (FovSizeText.Text == "") then
		SilentAim.Fov = tonumber(FovSizeText.Text);
	end;

	Fov.Visible = SilentAim.Enabled and SilentAim.ShowFov;

	Fov.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y);
	Fov.Radius   = SilentAim.Fov;
end);

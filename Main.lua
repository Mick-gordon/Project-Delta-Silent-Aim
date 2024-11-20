-- I Made This Open Source For People To Learn Off.
if not hookfunction or not newcclosure then  -- Checks If The Executor Has The Required Functions For The Script.
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
	if SilentAim.Enabled then 
		SilentAim.WallCheck = false 
		WallCheckButton.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
	else
		SilentAim.WallCheck = true 
		WallCheckButton.BackgroundColor3 = Color3.fromRGB(2, 54, 8);
	end;
end);
ShowFovButton.MouseButton1Down:Connect(function()
	if SilentAim.ShowFov then 
		SilentAim.WallCheck = false 
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

local Bullet = require(game:GetService("ReplicatedStorage").Modules.FPS.Bullet).CreateBullet;

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
		local RayParams = RaycastParams.new();
		RayParams.FilterType = Enum.RaycastFilterType.Exclude;
		RayParams.FilterDescendantsInstances = {IgnoreList, CurrentCamera};
		RayParams.IgnoreWater = true;

		local Direction = (Part.Position - CurrentCamera.CFrame.Position).Unit * 5000; 
		local ray = workspace:Raycast(CurrentCamera.CFrame.Position, Direction, RayParams);

		if ray and ray.Instance and ray.Instance:IsDescendantOf(Part.Parent) then
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
					if SilentAim.WallCheck ~= true or Functions:IsVisible(HitPart, CurrentCamera) then -- If Wall Check Selected Then It Will Check If The Player Is Visible.
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

	function Functions:Prediction(Part, Muzzlevelosity, Drag)
		local Distance = (CurrentCamera.CFrame.Position - Part.Position).Magnitude; -- Gets The Distance.
		local Time     = Distance / Muzzlevelosity; -- Calcualte How Long It Takes For The Bullet To Arive To The Position.
		local Speed    = Muzzlevelosity - Drag * Muzzlevelosity^2 * Time^2; -- Calulates The Speed With The Drag As Drag Slows Shit Down.
		Time           = Time + (Distance / Speed); -- Final Calculation For The Time.

		return Part.CFrame.Position + (Part.Velocity * Time); -- Returns The Predicted Position Of The Body Part.
	end;

	function Functions:BulletDrop(From, To, MuzzleVelocity, Drag, Drop)
		local Distance = (From - To).Magnitude; 
		local Time     = Distance / MuzzleVelocity;
		local Speed    = MuzzleVelocity - Drag * MuzzleVelocity^2 * Time^2;
		Time           = Time + (Distance / Speed); -- Same Shit As Prediction.
		local vector   = Drop * Time^2; -- Calcualtes The Angle That Needs To Be Added To The Curent Position.

		return vector; -- Returns How Much Will The Gun Be Needed To Hit The Target.
	end;


end;

-- Silent Aim Hook 
local Old; Old = hookfunction(Bullet, newcclosure(function(...) -- Hooks The Function And Uses newcclosure To Stop Some Dectections.
	local Args          = {...}; -- Args That Can Be Modified.
	local Target        = Functions:GetClosestToMouse(); -- Gets The Closest Person To Mouse.
	local AmmoType      = game:GetService("ReplicatedStorage").AmmoTypes[tostring(Args[6])]; -- Grabs The Ammo Type That The Weapon You Are Using.
	local Prediction    = Functions:Prediction(Target, AmmoType:GetAttribute("MuzzleVelocity"), AmmoType:GetAttribute("Drag"));
	local PredictedDrop = Functions:BulletDrop(CurrentCamera.CFrame.Position, Prediction, AmmoType:GetAttribute("MuzzleVelocity"), AmmoType:GetAttribute("Drag"), AmmoType:GetAttribute("ProjectileDrop"));
	if not checkcaller() and Target and SilentAim.Enabled then -- Checks If We Have A Target And Silent Aim Is Enabled Aslo checkcaller Is Used To Check If It Is The Executor Calling The Fucntion.
		Args[9].CFrame = CFrame.new(Args[9].CFrame.Position, Prediction + Vector3.new(0, PredictedDrop, 0)); -- Modify The Arguments. Changes The Barrels CFrame To Be Aiming At The Player.
	end;

	return Old(table.unpack(Args)); -- Returns Modified Arguments.
end)); 

-- FOV
local Fov   = Drawing.new("Circle"); -- Simple Fov;
Fov.Fill    = false;
Fov.Corners = 1000;
Fov.Color   = Color3.fromRGB(255, 255 ,255);
RunService.Heartbeat:Connect(function() -- Loop To Change The Mouse Position And Size.

	if not (FovSizeText.Text == "") then
		SilentAim.Fov = tonumber(FovSizeText.Text);
	end;

	if not SilentAim.Enabled and not SilentAim.ShowFov then 
		Fov.Visible = false; return
	end;

	Fov.Visible = true;

	Fov.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y);
	Fov.Radius   = SilentAim.Fov;
end);

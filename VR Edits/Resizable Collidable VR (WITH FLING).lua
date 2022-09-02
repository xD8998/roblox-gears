--[[ default hats:
https://www.roblox.com/catalog/2493590711/Knights-of-Redcliff-Paladin-Helmet
https://www.roblox.com/catalog/2493718915/The-High-Seas-Beatrix-The-Pirate-Queen-Hat
https://www.roblox.com/catalog/2962661117/Jester-Equinox-Hat

YOU CAN CHANGE THESE HATS IN THE VARIABLES/SETTINGS BELOW (make sure to check their name in your character using dex)

USE THE SIDE BUTTONS ON YOUR VR CONTROLLERS TO FLING WITH EACH HAND

EDIT THE VARIABLES BELOW TO CHANGE WHATEVER YOU WANT!!!

the variable "samenamearms" and "samearmsname" are for hats that have the same accessory name because they look the same

turn headhat on for a hat as a head

credits to Digitality for this edit (rest of the credits are in the script)

join discord.gg/robloxscripts for more cool stuff
]]
local velocity = Vector3.new(0, 30, 0)
local flingvelocity = Vector3.new(50, 0, 50)
local flingrot = Vector3.new(25e25, 25e25, 25e25)
local tweentime = 5
local resize = true
local justgrass = false
local headhat = false
local samenamearms = false
local samearmsname = "Rayo"

local HEADHAT = "MeshPartAccessory"
local RIGHTHANDHATNAME = "PirateCaptain_HatAccessory"
local LEFTHANDHATNAME = "JesterEquinox_HatAccessory"

_G.velocity = velocity
local old = game.Workspace.CurrentCamera.CFrame
local stay = Instance.new("BodyVelocity")
stay.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
stay.P = math.huge
stay.Velocity = Vector3.new(0, 0, 0)
game.Players.LocalPlayer.Character.HumanoidRootPart.Position =
    game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(100000, 100000, 100000)
for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") then
        stay:Clone().Parent = v
        v.Anchored = true
    end
end
local c = game.Players.LocalPlayer.Character
if resize then
    if not justgrass then
        for i, v in pairs(c.Humanoid:GetChildren()) do
            if v:IsA("NumberValue") then
                for i, v1 in pairs(c:GetChildren()) do
                    if v1:FindFirstChild("AvatarPartScaleType", true) then
                        repeat
                            wait()
                        until v1:FindFirstChild("OriginalSize", true)
                        v1:FindFirstChild("OriginalSize", true):Destroy()
                        v:Destroy()
                    end
                end
            end
        end
    else
        for i, v in pairs(c.Humanoid:GetChildren()) do
            if v:IsA("NumberValue") and v.Name ~= "BodyTypeScale" and v.Name ~= "BodyHeightScale" then
                for i, v1 in pairs(c:GetChildren()) do
                    if v1:FindFirstChild("AvatarPartScaleType", true) then
                        repeat
                            wait()
                        until v1:FindFirstChild("OriginalSize", true)
                        v1:FindFirstChild("OriginalSize", true):Destroy()
                        v:Destroy()
                    end
                end
            end
        end
    end
end
if c and c:FindFirstChild("Head") and c:FindFirstChild("Head"):FindFirstChildOfClass("SpecialMesh") then
    c:FindFirstChild("Head"):FindFirstChildOfClass("SpecialMesh"):Destroy()
end
--DROP ALL ACCESSORIES IN R6 AND R15 BY ShownApe#7272
local block = false

local character = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character = nil
game.Players.LocalPlayer.Character = character
wait(game.Players.RespawnTime + 0.05)
game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if v.Name == "Torso" or v.Name == "UpperTorso" then
        v:Destroy()
    end
end

character.HumanoidRootPart:Destroy()

for i, v in pairs(character:GetChildren()) do
    if v:IsA("Accessory") then
        sethiddenproperty(v, "BackendAccoutrementState", 0) --any integer 0-3 works but 4, as 4 is the default state for in character, 0 is for when it has collision in character or other circumstances, 2 is workspace, 1 is unknown if you know or figure out please let me know
    --BackendAccoutrementState is a replicated property similar to NetworkIsSleeping and is further documented in reweld
    end
end

if block == true then
    for i, v in pairs(character:GetDescendants()) do
        if v:IsA("SpecialMesh") then
            v:Destroy()
        end
    end
end
character:FindFirstChild("Body Colors"):Destroy()
for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
    if v:IsA("BasePart") then
        stay:Clone().Parent = v
        v.Anchored = false
    end
end
wait()
game.Workspace.CurrentCamera.CFrame = old
local tweening
coroutine.wrap(
    function()
        tweening = true
        wait(tweentime)
        tweening = false
    end
)()
while tweening do
    for i, v in pairs(c:GetChildren()) do
        if v:IsA("BasePart") then
            v.Velocity = flingvelocity
        end
    end
    game:GetService("RunService").Heartbeat:Wait()
end
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(tweentime, Enum.EasingStyle.Linear)
for i, v in pairs(c:GetDescendants()) do
    if v:IsA("BasePart") then
        tweenService:Create(v, tweenInfo, {CFrame = game.Workspace.CurrentCamera.CFrame}):Play()
    end
end
wait(tweentime)
--Made netless by ShownApe#1111 on discord, credits to sked for making the script originally
--This is R6 only as R15 accessories use meshparts for handles by default now
--Released in https://discord.gg/Hbq3TgAJbB
--Join my server for other releases that arent vr scripts if you'd like https://discord.gg/DcV3Qy3GwE

local options = {}
-- OPTIONS:
options.headscale = 20
-- how big you are in vr, 1 is default, 3 is recommended for max comfort in vr
options.forcebubblechat = true -- decide if to force bubblechat so you can see peoples messages
if samenamearms then
    game.Players.LocalPlayer.Character[samearmsname].Name = samearmsname .. "1"
end
options.headhat = HEADHATNAME -- name of the accessory which you are using as a head
options.righthandhat = RIGHTHANDHATNAME -- name of the accessory which you are using as your right hand
options.lefthandhat = LEFTHANDHATNAME -- name of the accessory which you are using as your left hand
local righthand
local lefthand
if samenamearms then
    righthand = game.Players.LocalPlayer.Character[samearmsname]
    lefthand = game.Players.LocalPlayer.Character[samearmsname .. "1"]
else
    righthand = game.Players.LocalPlayer.Character[options.righthandhat]
    lefthand = game.Players.LocalPlayer.Character[options.lefthandhat]
end

options.righthandrotoffset = Vector3.new(0, 90, 0)
options.lefthandrotoffset = Vector3.new(0, 90, 0)

--

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
--local backpack = plr.Backpack

local VR = game:GetService("VRService")
local input = game:GetService("UserInputService")

local cam = workspace.CurrentCamera

cam.CameraType = "Scriptable"

cam.HeadScale = options.headscale

--game:GetService("StarterGui"):SetCore("VRLaserPointerMode", 0)
game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)

local function createpart(size, name)
    local Part = Instance.new("Part", char)
    Part.CFrame = old
    Part.Size = size
    Part.Transparency = 1
    Part.CanCollide = true
    Part.Anchored = true
    Part.Name = name
    return Part
end

local moveHandL = createpart(Vector3.new(1, 1, 2), "moveRH")
local moveHandR = createpart(Vector3.new(1, 1, 2), "moveLH")
local moveHead = createpart(Vector3.new(1, 1, 1), "moveH")

local handL
local handR
local head
if headhat then
    head = c:FindFirstChild(options.headhat).Handle
else
    head = c:FindFirstChild("Head")
end
head:FindFirstChildOfClass("SpecialMesh"):Destroy()
local R1down = false
local L1down = false
local R2down = false
local L2down = false

local handR = righthand
local handL = lefthand
if handR and handR:FindFirstChild("Handle") and handR:FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh") then
    handR:FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh"):Destroy()
end
if handL and handL:FindFirstChild("Handle") and handL:FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh") then
    handL:FindFirstChild("Handle"):FindFirstChildOfClass("SpecialMesh"):Destroy()
end
head.Transparency = 1
local connected = {}
table.insert(
    connected,
    char.Humanoid.AnimationPlayed:connect(
        function(anim)
            anim:Stop()
        end
    )
)

for i, v in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
    v:AdjustSpeed(0)
end

workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position)

table.insert(
    connected,
    input.UserCFrameChanged:connect(
        function(part, move)
            if part == Enum.UserCFrame.Head then
                --move(head,cam.CFrame*move)
                moveHead.CFrame = cam.CFrame * (CFrame.new(move.p * (cam.HeadScale - 1)) * move)
            elseif part == Enum.UserCFrame.LeftHand then
                --move(handL,cam.CFrame*move)
                moveHandL.CFrame =
                    cam.CFrame *
                    (CFrame.new(move.p * (cam.HeadScale - 1)) * move *
                        CFrame.Angles(
                            math.rad(options.righthandrotoffset.X),
                            math.rad(options.righthandrotoffset.Y),
                            math.rad(options.righthandrotoffset.Z)
                        ))
            elseif part == Enum.UserCFrame.RightHand then
                --move(handR,cam.CFrame*move)
                moveHandR.CFrame =
                    cam.CFrame *
                    (CFrame.new(move.p * (cam.HeadScale - 1)) * move *
                        CFrame.Angles(
                            math.rad(options.righthandrotoffset.X),
                            math.rad(options.righthandrotoffset.Y),
                            math.rad(options.righthandrotoffset.Z)
                        ))
            end
        end
    )
)

head:BreakJoints()
handR.Handle:BreakJoints()
handL.Handle:BreakJoints()

--right
--1
table.insert(
    connected,
    input.InputChanged:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonR1 then
                if key.Position.Z > 0.9 then
                    R1down = true
                else
                    R1down = false
                end
            end
        end
    )
)

table.insert(
    connected,
    input.InputBegan:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonR1 then
                R1down = true
            end
        end
    )
)

table.insert(
    connected,
    input.InputEnded:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonR1 then
                R1down = false
                righthand.Handle.RotVelocity = Vector3.new()
            end
        end
    )
)

table.insert(
    connected,
    game:GetService("RunService").RenderStepped:connect(
        function()
            if R1down then
                cam.CFrame =
                    cam.CFrame:Lerp(
                    cam.CoordinateFrame +
                        (moveHandR.CFrame *
                            CFrame.Angles(
                                -math.rad(options.righthandrotoffset.X),
                                -math.rad(options.righthandrotoffset.Y),
                                math.rad(180 - options.righthandrotoffset.X)
                            )).LookVector *
                            cam.HeadScale /
                            2,
                    0.5
                )
            end
        end
    )
)
--2
righthand.Handle.CanCollide = false
righthand.Handle.Massless = true
table.insert(
    connected,
    input.InputChanged:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonR2 then
                if key.Position.Z > 0.9 then
                    R2down = true
                else
                    R2down = false
                end
            end
        end
    )
)

table.insert(
    connected,
    input.InputBegan:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonR2 then
                R2down = true
                _G.velocity = flingvelocity
            end
        end
    )
)

table.insert(
    connected,
    input.InputEnded:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonR2 then
                R2down = false
                _G.velocity = velocity
                righthand.Handle.Velocity = Vector3.new(0, 0, 0)
                righthand.Handle.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    )
)
table.insert(
    connected,
    game:GetService("RunService").Heartbeat:connect(
        function()
            if R2down then
                righthand.Handle.RotVelocity = flingrot
            end
        end
    )
)
--left
--1
table.insert(
    connected,
    input.InputChanged:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonL1 then
                if key.Position.Z > 0.9 then
                    L1down = true
                else
                    L1down = false
                end
            end
        end
    )
)

table.insert(
    connected,
    input.InputBegan:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonL1 then
                L1down = true
            end
        end
    )
)

table.insert(
    connected,
    input.InputEnded:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonL1 then
                L1down = false
            end
        end
    )
)

table.insert(
    connected,
    game:GetService("RunService").RenderStepped:connect(
        function()
            if L1down then
                cam.CFrame =
                    cam.CFrame:Lerp(
                    cam.CoordinateFrame +
                        (moveHandR.CFrame *
                            CFrame.Angles(
                                -math.rad(options.righthandrotoffset.X),
                                -math.rad(options.righthandrotoffset.Y),
                                math.rad(180 - options.righthandrotoffset.X)
                            )).LookVector *
                            cam.HeadScale /
                            2,
                    0.5
                )
            end
        end
    )
)
--2
lefthand.Handle.CanCollide = false
lefthand.Handle.Massless = true
table.insert(
    connected,
    input.InputChanged:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonL2 then
                if key.Position.Z > 0.9 then
                    L2down = true
                else
                    L2down = false
                end
            end
        end
    )
)

table.insert(
    connected,
    input.InputBegan:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonL2 then
                L2down = true
                _G.velocity = flingvelocity
            end
        end
    )
)

table.insert(
    connected,
    input.InputEnded:connect(
        function(key)
            if key.KeyCode == Enum.KeyCode.ButtonL2 then
                L2down = false
                _G.velocity = velocity
                lefthand.Handle.Velocity = Vector3.new(0, 0, 0)
                lefthand.Handle.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    )
)
table.insert(
    connected,
    game:GetService("RunService").Heartbeat:connect(
        function()
            if L2down then
                lefthand.Handle.RotVelocity = flingrot
            end
        end
    )
)
--INPUTS DONE
local function bubble(plr, msg)
    game:GetService("Chat"):Chat(plr.Character.Head, msg, Enum.ChatColor.White)
end

if options.forcebubblechat == true then
    table.insert(
        connected,
        game.Players.PlayerAdded:connect(
            function(plr)
                table.insert(
                    connected,
                    plr.Chatted:connect(
                        function(msg)
                            game:GetService("Chat"):Chat(plr.Character.Head, msg, Enum.ChatColor.White)
                        end
                    )
                )
            end
        )
    )

    for i, v in pairs(game.Players:GetPlayers()) do
        table.insert(
            connected,
            v.Chatted:connect(
                function(msg)
                    game:GetService("Chat"):Chat(v.Character.Head, msg, Enum.ChatColor.White)
                end
            )
        )
    end
end

table.insert(
    connected,
    game:GetService("RunService").Heartbeat:connect(
        function()
            lefthand.Handle.Velocity = _G.velocity
            lefthand.Handle.CFrame = moveHandL.CFrame
            righthand.Handle.Velocity = _G.velocity
            righthand.Handle.CFrame = moveHandR.CFrame
            head.Velocity = _G.velocity
            head.CFrame = moveHead.CFrame
        end
    )
)
local destroyc
destroyc =
    head.Destroying:connect(
    function()
        for i, v in pairs(connected) do
            v:Disconnect()
            print("Disconnected!")
        end
        print("Disconnected!")
        destroyc:Disconnect()
    end
)

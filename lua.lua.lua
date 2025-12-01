-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
if _G.thing then
  for i, v in pairs(_G.thing) do
    v:Disconnect()
  end
  _G.thing = nil
end
local Player = nil
repeat
  task.wait()
until game.Players.LocalPlayer
Player = game.Players.LocalPlayer
local r1_0 = nil
local Character = nil
local Humanoid = nil
local HRP = nil
local InvisibleVal = false
local taibl = {}
local function randomfunctionidk()
  -- line: [0, 0] id: 1
  Character = Player.Character or Player.CharacterAdded:Wait()
  Humanoid = Character:WaitForChild("Humanoid")
  HRP = Character:WaitForChild("HumanoidRootPart")
  taibl = {}
  for i, v in pairs(Character:GetDescendants()) do
    if v:IsA("BasePart") and v.Transparency == 0 then
      taibl[#taibl + 1] = v
    end
  end
end
local function onSpawn()
  -- line: [0, 0] id: 4
  local GUI = Instance.new("ScreenGui")
  local Button = Instance.new("TextButton")
  Button.Size = UDim2.new(0, 100, 0, 50)
  Button.Position = UDim2.new(0.5, -50, 0.1, 0)
  Button.Text = "Invisible"
  Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
  Button.Parent = GUI
  GUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
  local Dragging = false
  local IPos = nil
  local BPos = nil
  Button.InputBegan:Connect(function(InputKey)
    -- line: [0, 0] id: 8
    if InputKey.UserInputType == Enum.UserInputType.MouseButton1 then
      Dragging = true
      IPos = InputKey.Position
      BPos = Button.Position
    end
  end)
  Button.InputChanged:Connect(function(Input)
    -- line: [0, 0] id: 7
    if Input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
      local fPos = Input.Position - IPos
      Button.Position = UDim2.new(BPos.X.Scale, BPos.X.Offset + fPos.X, BPos.Y.Scale, BPos.Y.Offset + fPos.Y)
    end
  end)
  Button.InputEnded:Connect(function(InputK)
    -- line: [0, 0] id: 6
    if InputK.UserInputType == Enum.UserInputType.MouseButton1 then
      Dragging = false
    end
  end)
  Button.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 5
    InvisibleVal = not InvisibleVal
    for i, v in pairs(taibl) do
      local ival = v.Transparency
      if ival == 0 then
        ival = 0.5 or 0
      else
        goto label_13	-- block#3 is visited secondly
      end
      v.Transparency = ival
    end
  end)
end
randomfunctionidk()
onSpawn()
local funcTable = {
  [1] = Player:GetMouse().KeyDown:Connect(function(KeyInp)
    -- line: [0, 0] id: 3
    if KeyInp == "g" then
      InvisibleVal = not InvisibleVal
      for i, v in pairs(taibl) do
        local inval = v.Transparency
        if inval == 0 then
          inval = 0.5 or 0
        else
          goto label_15	-- block#4 is visited secondly
        end
        v.Transparency = inval
      end
    end
  end),
  [2] = game:GetService("RunService").Heartbeat:Connect(function()
    -- line: [0, 0] id: 9
    if InvisibleVal then
      local HCFrame = HRP.CFrame
      local CamOffset = Humanoid.CameraOffset
      local newHCFrame = HCFrame * CFrame.new(0, -200000, 0)
      HRP.CFrame = newHCFrame
      Humanoid.CameraOffset = newHCFrame:ToObjectSpace(CFrame.new(HCFrame.Position)).Position
      game:GetService("RunService").RenderStepped:Wait()
      HRP.CFrame = HCFrame
      Humanoid.CameraOffset = CamOffset
    end
  end),
}
Player.CharacterAdded:Connect(function()
  -- line: [0, 0] id: 2
  InvisibleVal = false
  randomfunctionidk()
  onSpawn()
end)
_G.thing = funcTable

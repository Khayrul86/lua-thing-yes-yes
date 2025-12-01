-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
if _G.a then
  for r3_0, r4_0 in pairs(_G.a) do
    r4_0:Disconnect()
  end
  _G.a = nil
end
local r0_0 = nil
repeat
  task.wait()
until game.Players.LocalPlayer
r0_0 = game.Players.LocalPlayer
local r1_0 = nil
local r2_0 = nil
local r3_0 = nil
local r4_0 = nil
local r5_0 = false
local r6_0 = {}
local function r7_0()
  -- line: [0, 0] id: 1
  r2_0 = r0_0.Character or r0_0.CharacterAdded:Wait()
  r3_0 = r2_0:WaitForChild("Humanoid")
  r4_0 = r2_0:WaitForChild("HumanoidRootPart")
  r6_0 = {}
  for r3_1, r4_1 in pairs(r2_0:GetDescendants()) do
    if r4_1:IsA("BasePart") and r4_1.Transparency == 0 then
      r6_0[#r6_0 + 1] = r4_1
    end
  end
end
local function r8_0()
  -- line: [0, 0] id: 4
  local r0_4 = Instance.new("ScreenGui")
  local r1_4 = Instance.new("TextButton")
  r1_4.Size = UDim2.new(0, 100, 0, 50)
  r1_4.Position = UDim2.new(0.5, -50, 0.1, 0)
  r1_4.Text = "Invisible"
  r1_4.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
  r1_4.Parent = r0_4
  r0_4.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
  local r2_4 = false
  local r3_4 = nil
  local r4_4 = nil
  r1_4.InputBegan:Connect(function(r0_8)
    -- line: [0, 0] id: 8
    if r0_8.UserInputType == Enum.UserInputType.MouseButton1 then
      r2_4 = true
      r3_4 = r0_8.Position
      r4_4 = r1_4.Position
    end
  end)
  r1_4.InputChanged:Connect(function(r0_7)
    -- line: [0, 0] id: 7
    if r0_7.UserInputType == Enum.UserInputType.MouseMovement and r2_4 then
      local r1_7 = r0_7.Position - r3_4
      r1_4.Position = UDim2.new(r4_4.X.Scale, r4_4.X.Offset + r1_7.X, r4_4.Y.Scale, r4_4.Y.Offset + r1_7.Y)
    end
  end)
  r1_4.InputEnded:Connect(function(r0_6)
    -- line: [0, 0] id: 6
    if r0_6.UserInputType == Enum.UserInputType.MouseButton1 then
      r2_4 = false
    end
  end)
  r1_4.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 5
    r5_0 = not r5_0
    for r3_5, r4_5 in pairs(r6_0) do
      local r5_5 = r4_5.Transparency
      if r5_5 == 0 then
        r5_5 = 0.5 or 0
      else
        goto label_13	-- block#3 is visited secondly
      end
      r4_5.Transparency = r5_5
    end
  end)
end
r7_0()
r8_0()
local r9_0 = {
  [1] = r0_0:GetMouse().KeyDown:Connect(function(r0_3)
    -- line: [0, 0] id: 3
    if r0_3 == "g" then
      r5_0 = not r5_0
      for r4_3, r5_3 in pairs(r6_0) do
        local r6_3 = r5_3.Transparency
        if r6_3 == 0 then
          r6_3 = 0.5 or 0
        else
          goto label_15	-- block#4 is visited secondly
        end
        r5_3.Transparency = r6_3
      end
    end
  end),
  [2] = game:GetService("RunService").Heartbeat:Connect(function()
    -- line: [0, 0] id: 9
    if r5_0 then
      local r0_9 = r4_0.CFrame
      local r1_9 = r3_0.CameraOffset
      local r2_9 = r0_9 * CFrame.new(0, -200000, 0)
      r4_0.CFrame = r2_9
      r3_0.CameraOffset = r2_9:ToObjectSpace(CFrame.new(r0_9.Position)).Position
      game:GetService("RunService").RenderStepped:Wait()
      r4_0.CFrame = r0_9
      r3_0.CameraOffset = r1_9
    end
  end),
}
r0_0.CharacterAdded:Connect(function()
  -- line: [0, 0] id: 2
  r5_0 = false
  r7_0()
  r8_0()
end)
_G.a = r9_0

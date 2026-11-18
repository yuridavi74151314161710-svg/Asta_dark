local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local L = Players.LocalPlayer
local PG = L:WaitForChild("PlayerGui")

if CoreGui:FindFirstChild("AstaHubUI") then CoreGui.AstaHubUI:Destroy() end
if PG:FindFirstChild("AstaHubUI") then PG.AstaHubUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AstaHubUI"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = PG end

local RED = Color3.fromRGB(220, 20, 20)
local BLACK = Color3.fromRGB(0, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)
local GRAY = Color3.fromRGB(160, 160, 160)
local DARK = Color3.fromRGB(12, 12, 12)

local Cfg = { aim=false, autoShoot=false, esp=false, hit=false, spd=false, fly=false, dodge=false, antiAim=false }

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 65, 0, 65)
ToggleBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
ToggleBtn.BackgroundColor3 = BLACK
ToggleBtn.Text = "ASTA"
ToggleBtn.TextColor3 = RED
ToggleBtn.Font = Enum.Font.GothamBlack
ToggleBtn.TextSize = 18
ToggleBtn.Active = true
ToggleBtn.Parent = ScreenGui
local BtnStroke = Instance.new("UIStroke")
BtnStroke.Color = RED
BtnStroke.Thickness = 2
BtnStroke.Parent = ToggleBtn

local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(0, 360, 0, 190)
IntroFrame.Position = UDim2.new(0.5, -180, 0.5, -95)
IntroFrame.BackgroundColor3 = BLACK
IntroFrame.BackgroundTransparency = 1
IntroFrame.Visible = false
IntroFrame.Parent = ScreenGui
local IntroStroke = Instance.new("UIStroke")
IntroStroke.Color = RED
IntroStroke.Thickness = 2
IntroStroke.Transparency = 1
IntroStroke.Parent = IntroFrame

local ProfileImage = Instance.new("ImageLabel")
ProfileImage.Size = UDim2.new(0, 65, 0, 65)
ProfileImage.Position = UDim2.new(0, 18, 0, 15)
ProfileImage.BackgroundTransparency = 1
ProfileImage.ImageTransparency = 1
ProfileImage.Parent = IntroFrame
local ImageCorner = Instance.new("UICorner")
ImageCorner.CornerRadius = UDim.new(1, 0)
ImageCorner.Parent = ProfileImage
local ImageStroke = Instance.new("UIStroke")
ImageStroke.Color = RED
ImageStroke.Thickness = 2
ImageStroke.Transparency = 1
ImageStroke.Parent = ProfileImage

local UsernameLabel = Instance.new("TextLabel")
UsernameLabel.Size = UDim2.new(0, 245, 0, 35)
UsernameLabel.Position = UDim2.new(0, 95, 0, 25)
UsernameLabel.BackgroundTransparency = 1
UsernameLabel.Text = "@" .. L.Name
UsernameLabel.TextColor3 = WHITE
UsernameLabel.Font = Enum.Font.GothamBlack
UsernameLabel.TextSize = 19
UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
UsernameLabel.TextTransparency = 1
UsernameLabel.Parent = IntroFrame

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0, 245, 0, 25)
WelcomeLabel.Position = UDim2.new(0, 95, 0, 57)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "BEM-VINDO AO ASTA HUB"
WelcomeLabel.TextColor3 = RED
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextSize = 12
WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
WelcomeLabel.TextTransparency = 1
WelcomeLabel.Parent = IntroFrame

local IntroTitle = Instance.new("TextLabel")
IntroTitle.Size = UDim2.new(1, 0, 0, 35)
IntroTitle.Position = UDim2.new(0, 0, 0, 100)
IntroTitle.BackgroundTransparency = 1
IntroTitle.Text = "ASTA HUB // GOD MODE"
IntroTitle.TextColor3 = RED
IntroTitle.Font = Enum.Font.GothamBlack
IntroTitle.TextSize = 21
IntroTitle.TextTransparency = 1
IntroTitle.Parent = IntroFrame

local IntroQuote = Instance.new("TextLabel")
IntroQuote.Size = UDim2.new(0.9, 0, 0, 30)
IntroQuote.Position = UDim2.new(0.05, 0, 0, 145)
IntroQuote.BackgroundTransparency = 1
IntroQuote.Text = '"Invencível, intocável, imparável."'
IntroQuote.TextColor3 = WHITE
IntroQuote.Font = Enum.Font.GothamBold
IntroQuote.TextSize = 15
IntroQuote.TextTransparency = 1
IntroQuote.Parent = IntroFrame

task.spawn(function()
    local success, image = pcall(function()
        return Players:GetUserThumbnailAsync(L.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    end)
    if success and image then ProfileImage.Image = image end
end)

local MainMenu = Instance.new("Frame")
MainMenu.Size = UDim2.new(0, 440, 0, 290)
MainMenu.Position = UDim2.new(0.5, -220, 0.5, -145)
MainMenu.BackgroundColor3 = BLACK
MainMenu.Visible = false
MainMenu.Active = true
MainMenu.Parent = ScreenGui
local MenuStroke = Instance.new("UIStroke")
MenuStroke.Color = RED
MenuStroke.Thickness = 2
MenuStroke.Parent = MainMenu

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = DARK
TopBar.BorderSizePixel = 0
TopBar.Active = true
TopBar.Parent = MainMenu

local MenuTitle = Instance.new("TextLabel")
MenuTitle.Size = UDim2.new(0.8, 0, 1, 0)
MenuTitle.Position = UDim2.new(0.04, 0, 0, 0)
MenuTitle.BackgroundTransparency = 1
MenuTitle.Text = "ASTA HUB - GOD MODE"
MenuTitle.TextColor3 = RED
MenuTitle.Font = Enum.Font.GothamBlack
MenuTitle.TextSize = 16
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 38, 0, 38)
CloseBtn.Position = UDim2.new(1, -38, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = RED
CloseBtn.Font = Enum.Font.GothamBlack
CloseBtn.TextSize = 18
CloseBtn.Active = true
CloseBtn.Parent = TopBar

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -60)
Content.Position = UDim2.new(0, 10, 0, 48)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 2
Content.ScrollBarImageColor3 = RED
Content.CanvasSize = UDim2.new(0, 0, 0, 0)
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.Parent = MainMenu

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 8)
Layout.Parent = Contentlocal function MakeToggle(name, key)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = DARK
    btn.Text = "  [OFF] " .. name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = GRAY
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Active = true
    btn.Parent = Content

    btn.MouseButton1Click:Connect(function()
        Cfg[key] = not Cfg[key]
        if Cfg[key] then
            btn.Text = "  [ON] " .. name
            btn.TextColor3 = RED
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        else
            btn.Text = "  [OFF] " .. name
            btn.TextColor3 = GRAY
            btn.BackgroundColor3 = DARK
        end
    end)
end

MakeToggle("Aimbot (Trava na Cabeça)", "aim")
MakeToggle("Auto-Shoot (Atirar Sozinho)", "autoShoot")
MakeToggle("Bullet Dodger (Desviar de Balas)", "dodge")
MakeToggle("Anti-Aim (Girar o Corpo)", "antiAim")
MakeToggle("ESP Box (Ver Inimigos)", "esp")
MakeToggle("Hitbox Expander (Hitbox Gigante)", "hit")
MakeToggle("Velocidade (Speed)", "spd")
MakeToggle("Voar (Fly)", "fly")

local introPlayed = false
local isAnimating = false

local function playIntroAndOpen()
    if isAnimating then return end
    isAnimating = true

    if not introPlayed then
        introPlayed = true
        IntroFrame.Visible = true
        local fadeIn = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(IntroFrame, fadeIn, {BackgroundTransparency = 0}):Play()
        TweenService:Create(IntroStroke, fadeIn, {Transparency = 0}):Play()
        TweenService:Create(ProfileImage, fadeIn, {ImageTransparency = 0}):Play()
        TweenService:Create(ImageStroke, fadeIn, {Transparency = 0}):Play()
        TweenService:Create(UsernameLabel, fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(WelcomeLabel, fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(IntroTitle, fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(IntroQuote, fadeIn, {TextTransparency = 0}):Play()
        
        -- AUMENTEI O TEMPO DA INTRO AQUI PARA 3 SEGUNDOS
        task.wait(3.0)
        
        local fadeOut = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        TweenService:Create(IntroFrame, fadeOut, {BackgroundTransparency = 1}):Play()
        TweenService:Create(IntroStroke, fadeOut, {Transparency = 1}):Play()
        TweenService:Create(ProfileImage, fadeOut, {ImageTransparency = 1}):Play()
        TweenService:Create(ImageStroke, fadeOut, {Transparency = 1}):Play()
        TweenService:Create(UsernameLabel, fadeOut, {TextTransparency = 1}):Play()
        TweenService:Create(WelcomeLabel, fadeOut, {TextTransparency = 1}):Play()
        TweenService:Create(IntroTitle, fadeOut, {TextTransparency = 1}):Play()
        TweenService:Create(IntroQuote, fadeOut, {TextTransparency = 1}):Play()
        task.wait(0.4)
        IntroFrame.Visible = false
    end

    MainMenu.Visible = not MainMenu.Visible
    isAnimating = false
end

ToggleBtn.MouseButton1Click:Connect(playIntroAndOpen)
CloseBtn.MouseButton1Click:Connect(function() MainMenu.Visible = false end)

local Cam = WS.CurrentCamera
WS:GetPropertyChangedSignal("CurrentCamera"):Connect(function() Cam = WS.CurrentCamera end)

-- Lógica do Aimbot 100% e Auto-Shoot
RS.RenderStepped:Connect(function()
    local hum = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
    if (Cfg.aim or Cfg.autoShoot) and hum and hum.Health > 0 then
        local best, bd = nil, 300
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= L and p.Character then
                local h = p.Character:FindFirstChild("Head")
                local phum = p.Character:FindFirstChildOfClass("Humanoid")
                if h and phum and phum.Health > 0 then
                    local sp, on = Cam:WorldToViewportPoint(h.Position)
                    if on then
                        local ct = Vector2.new(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2)
                        local d = (Vector2.new(sp.X, sp.Y) - ct).Magnitude
                        if d < bd then bd = d; best = h end
                    end
                end
            end
        end
        if best then
            if Cfg.aim then
                local cc = Cam.CFrame
                Cam.CFrame = cc:Lerp(CFrame.new(cc.Position, best.Position), 0.5)
            end
            if Cfg.autoShoot then
                local vu = game:GetService("VirtualUser")
                if vu then
                    pcall(function()
                        vu:CaptureController()
                        vu:ClickButton1(Vector2.new(0, 0))
                    end)
                end
            end
        end
    end
end)

-- Lógica de Anti-Aim, Desviar de Balas, Speed e Fly
RS.Heartbeat:Connect(function()
    local char = L.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    
    if hum and hrp then
        if Cfg.spd then hum.WalkSpeed = 60 elseif hum.WalkSpeed ~= 16 and not Cfg.fly then hum.WalkSpeed = 16 end
        
        if Cfg.fly then
            local d = Vector3.new()
            if UIS:IsKeyDown(Enum.KeyCode.W) then d += Cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then d -= Cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then d -= Cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then d += Cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then d += Vector3.new(0, 1, 0) end
            hrp.Velocity = d.Magnitude > 0 and d.Unit * 50 or Vector3.new()
        end

        if Cfg.antiAim then
            hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(180), 0)
        end

        if Cfg.dodge then
            for _, obj in pairs(WS:GetChildren()) do
                if obj:IsA("BasePart") and not obj:IsDescendantOf(char) then
                    local vel = obj.Velocity or obj.AssemblyLinearVelocity
                    if vel.Magnitude > 50 then
                        local dist = (hrp.Position - obj.Position).Magnitude
                        if dist < 20 then
                            local dir = (hrp.Position - obj.Position).Unit
                            hrp.Velocity = dir * 100 
                        end
                    end
                end
            end
        end
    end
end)

-- Lógica do Hitbox e ESP
task.spawn(function()
    while task.wait(0.5) do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= L and p.Character then
                if Cfg.hit then
                    for _, obj in pairs(p.Character:GetChildren()) do
                        if obj:IsA("BasePart") then obj.Size = Vector3.new(25, 25, 25) obj.Transparency = 0.5 end
                    end
                end
                local esp = p.Character:FindFirstChild("GunESP")
                if Cfg.esp and not esp then
                    local h = Instance.new("Highlight")
                    h.Name = "GunESP"
                    h.FillColor = RED
                    h.OutlineColor = WHITE
                    h.Adornee = p.Character
                    h.Parent = p.Character
                elseif not Cfg.esp and esp then
                    esp:Destroy()
                end
            end
        end
    end
end)

-- Arrastar Menu
local drag, ds, dp
TopBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        drag = true; ds = i.Position; dp = MainMenu.Position
    end
end)
TopBar.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        drag = false
    end
end)
UIS.InputChanged:Connect(function(i)
    if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local d = i.Position - ds
        MainMenu.Position = UDim2.new(dp.X.Scale, dp.X.Offset + d.X, dp.Y.Scale, dp.Y.Offset + d.Y)
    end
end)

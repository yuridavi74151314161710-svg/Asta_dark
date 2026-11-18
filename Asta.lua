-- =====================================================
-- ASTA HUB V3 - PARTE 1/5
-- =====================================================
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

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
local GREEN = Color3.fromRGB(0, 200, 0)
local BLACK = Color3.fromRGB(0, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)
local GRAY = Color3.fromRGB(160, 160, 160)
local DARK = Color3.fromRGB(12, 12, 12)
local DARK2 = Color3.fromRGB(25, 25, 25)

local Cfg = {
    aim=false, autoShoot=false, fov=150, hit=false, hitSize=25,
    esp=false, chams=false, tracers=false, fullbright=false,
    spd=false, fly=false, jmp=false, nc=false, dodge=false, antiAim=false,
    gravity=false, antiAfk=true, tp=false
}

local Orig = {
    WalkSpeed = 16, JumpPower = 50, Gravity = WS.Gravity,
    Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime
}

-- BOTÃO FLUTUANTE
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
BtnStroke.Parent = ToggleBtn-- =====================================================
-- ASTA HUB V3 - PARTE 2/5 (INTRO)
-- =====================================================
local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(0, 360, 0, 190)
IntroFrame.Position = UDim2.new(0.5, -180, 0.5, -95)
IntroFrame.BackgroundColor3 = BLACK
IntroFrame.BackgroundTransparency = 1
IntroFrame.Visible = false
IntroFrame.ClipsDescendants = true
IntroFrame.Parent = ScreenGui
local IntroStroke = Instance.new("UIStroke")
IntroStroke.Color = RED
IntroStroke.Thickness = 2
IntroStroke.Transparency = 1
IntroStroke.Parent = IntroFrame

-- FOTO DE FUNDO DO ASTA
local IntroBg = Instance.new("ImageLabel")
IntroBg.Size = UDim2.new(1, 0, 1, 0)
IntroBg.BackgroundTransparency = 1
IntroBg.Image = "rbxassetid://9030081191"
IntroBg.ImageTransparency = 1
IntroBg.ScaleType = Enum.ScaleType.Crop
IntroBg.ZIndex = 0
IntroBg.Parent = IntroFrame

-- FOTO DE PERFIL DO JOGADOR
local ProfileImage = Instance.new("ImageLabel")
ProfileImage.Size = UDim2.new(0, 65, 0, 65)
ProfileImage.Position = UDim2.new(0, 18, 0, 15)
ProfileImage.BackgroundTransparency = 1
ProfileImage.ImageTransparency = 1
ProfileImage.ZIndex = 2
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
UsernameLabel.ZIndex = 2
UsernameLabel.Parent = IntroFrame

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0, 245, 0, 25)
WelcomeLabel.Position = UDim2.new(0, 95, 0, 57)
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Text = "BEM-VINDO AO ASTA HUB V3"
WelcomeLabel.TextColor3 = RED
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.TextSize = 12
WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
WelcomeLabel.TextTransparency = 1
WelcomeLabel.ZIndex = 2
WelcomeLabel.Parent = IntroFrame

local IntroTitle = Instance.new("TextLabel")
IntroTitle.Size = UDim2.new(1, 0, 0, 35)
IntroTitle.Position = UDim2.new(0, 0, 0, 100)
IntroTitle.BackgroundTransparency = 1
IntroTitle.Text = "ASTA HUB // PROFISSIONAL"
IntroTitle.TextColor3 = RED
IntroTitle.Font = Enum.Font.GothamBlack
IntroTitle.TextSize = 21
IntroTitle.TextTransparency = 1
IntroTitle.ZIndex = 2
IntroTitle.Parent = IntroFrame

local IntroQuote = Instance.new("TextLabel")
IntroQuote.Size = UDim2.new(0.9, 0, 0, 30)
IntroQuote.Position = UDim2.new(0.05, 0, 0, 145)
IntroQuote.BackgroundTransparency = 1
IntroQuote.Text = '"A supremacia começa agora."'
IntroQuote.TextColor3 = WHITE
IntroQuote.Font = Enum.Font.GothamBold
IntroQuote.TextSize = 15
IntroQuote.TextTransparency = 1
IntroQuote.ZIndex = 2
IntroQuote.Parent = IntroFrame

task.spawn(function()
    local success, image = pcall(function()
        return Players:GetUserThumbnailAsync(L.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    end)
    if success and image then ProfileImage.Image = image end
end)
-- =====================================================
-- ASTA HUB V3 - PARTE 3/5 (MENU)
-- =====================================================
local MainMenu = Instance.new("Frame")
MainMenu.Size = UDim2.new(0, 480, 0, 320)
MainMenu.Position = UDim2.new(0.5, -240, 0.5, -160)
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
MenuTitle.Text = "ASTA HUB - V3 PRO"
MenuTitle.TextColor3 = RED
MenuTitle.Font = Enum.Font.GothamBlack
MenuTitle.TextSize = 16
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.Parent = TopBar

-- BOTÃO X VERDE
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 38, 0, 38)
CloseBtn.Position = UDim2.new(1, -38, 0, 0)
CloseBtn.BackgroundColor3 = GREEN
CloseBtn.Text = "X"
CloseBtn.TextColor3 = WHITE
CloseBtn.Font = Enum.Font.GothamBlack
CloseBtn.TextSize = 18
CloseBtn.Active = true
CloseBtn.Parent = TopBar
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- BARRA DE ABAS
local TabBar = Instance.new("ScrollingFrame")
TabBar.Size = UDim2.new(1, 0, 0, 40)
TabBar.Position = UDim2.new(0, 0, 0, 38)
TabBar.BackgroundColor3 = DARK2
TabBar.BorderSizePixel = 0
TabBar.ScrollBarThickness = 0
TabBar.ScrollingDirection = Enum.ScrollingDirection.X
TabBar.CanvasSize = UDim2.new(0, 0, 0, 0)
TabBar.AutomaticCanvasSize = Enum.AutomaticSize.X
TabBar.Parent = MainMenu
local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 4)
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabLayout.Parent = TabBar
local TabPad = Instance.new("UIPadding")
TabPad.PaddingLeft = UDim.new(0, 8)
TabPad.Parent = TabBar

local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, 0, 1, -78)
Content.Position = UDim2.new(0, 0, 0, 78)
Content.BackgroundTransparency = 1
Content.ClipsDescendants = true
Content.Parent = MainMenu
-- =====================================================
-- ASTA HUB V3 - PARTE 4/5 (ABAS E CONTROLES)
-- =====================================================
local Tabs = {}

local function MakeTab(name)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 90, 0, 28)
    btn.BackgroundColor3 = DARK2
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.TextColor3 = GRAY
    btn.Active = true
    btn.Parent = TabBar
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn

    local page = Instance.new("ScrollingFrame")
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = RED
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = Content

    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 10)
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)
    pad.Parent = page

    local list = Instance.new("UIListLayout")
    list.Padding = UDim.new(0, 6)
    list.Parent = page

    local obj = { b = btn, p = page }
    table.insert(Tabs, obj)

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            if t == obj then
                t.p.Visible = true
                TweenService:Create(t.b, TweenInfo.new(0.15), { BackgroundColor3 = RED, TextColor3 = WHITE }):Play()
            else
                t.p.Visible = false
                TweenService:Create(t.b, TweenInfo.new(0.15), { BackgroundColor3 = DARK2, TextColor3 = GRAY }):Play()
            end
        end
    end)
    return page
end

local pCombat = MakeTab("Combat")
local pVisual = MakeTab("Visual")
local pMove = MakeTab("Movement")
local pMisc = MakeTab("Misc")

Tabs[1].p.Visible = true
Tabs[1].b.BackgroundColor3 = RED
Tabs[1].b.TextColor3 = WHITE

local function AddToggle(parent, name, key)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = DARK2
    btn.Text = "  [OFF] " .. name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 13
    btn.TextColor3 = GRAY
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Active = true
    btn.Parent = parent
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn

    btn.MouseButton1Click:Connect(function()
        Cfg[key] = not Cfg[key]
        if Cfg[key] then
            btn.Text = "  [ON] " .. name
            btn.TextColor3 = RED
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        else
            btn.Text = "  [OFF] " .. name
            btn.TextColor3 = GRAY
            btn.BackgroundColor3 = DARK2
        end
    end)
end

local function AddSlider(parent, name, key, min, max, default)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 55)
    f.BackgroundColor3 = DARK2
    f.Parent = parent
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = f

    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, -60, 0, 20)
    l.Position = UDim2.new(0, 10, 0, 5)
    l.BackgroundTransparency = 1
    l.Text = name
    l.Font = Enum.Font.GothamMedium
    l.TextSize = 12
    l.TextColor3 = WHITE
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = f

    local v = Instance.new("TextLabel")
    v.Size = UDim2.new(0, 50, 0, 20)
    v.Position = UDim2.new(1, -60, 0, 5)
    v.BackgroundTransparency = 1
    v.Text = tostring(default)
    v.Font = Enum.Font.GothamBold
    v.TextSize = 12
    v.TextColor3 = RED
    v.TextXAlignment = Enum.TextXAlignment.Right
    v.Parent = f
    Cfg[key] = default

    local b = Instance.new("Frame")
    b.Size = UDim2.new(1, -20, 0, 8)
    b.Position = UDim2.new(0, 10, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.Parent = f
    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 4)
    bc.Parent = b

    local fi = Instance.new("Frame")
    fi.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    fi.BackgroundColor3 = RED
    fi.Parent = b
    local fic = Instance.new("UICorner")
    fic.CornerRadius = UDim.new(0, 4)
    fic.Parent = fi

    local bt = Instance.new("TextButton")
    bt.Size = UDim2.new(1, 20, 1, 20)
    bt.Position = UDim2.new(0, -10, 0, -10)
    bt.BackgroundTransparency = 1
    bt.Text = ""
    bt.Active = true
    bt.Parent = b

    local drag = false
    bt.MouseButton1Down:Connect(function() drag = true end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local pos = math.clamp((i.Position.X - b.AbsolutePosition.X) / b.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (max - min) * pos + 0.5)
            fi.Size = UDim2.new(pos, 0, 1, 0)
            v.Text = tostring(val)
            Cfg[key] = val
        end
    end)
end

-- COMBAT
AddToggle(pCombat, "Aimbot (Trava Cabeça)", "aim")
AddToggle(pCombat, "Auto-Shoot (Atirar Auto)", "autoShoot")
AddToggle(pCombat, "Bullet Dodger (Desviar)", "dodge")
AddToggle(pCombat, "Anti-Aim (Girar)", "antiAim")
AddToggle(pCombat, "Hitbox Expander", "hit")
AddSlider(pCombat, "Hitbox Tamanho", "hitSize", 5, 50, 25)
AddSlider(pCombat, "Aimbot FOV", "fov", 50, 500, 150)

-- VISUAL
AddToggle(pVisual, "ESP Box (Ver Inimigos)", "esp")
AddToggle(pVisual, "Chams (Brilho)", "chams")
AddToggle(pVisual, "Tracers (Linha)", "tracers")
AddToggle(pVisual, "Fullbright (Claridade)", "fullbright")

-- MOVEMENT
AddToggle(pMove, "Velocidade (Speed)", "spd")
AddToggle(pMove, "Voar (Fly)", "fly")
AddToggle(pMove, "Infinite Jump", "jmp")
AddToggle(pMove, "Noclip", "nc")
AddToggle(pMove, "Gravity Control", "gravity")

-- MISC
AddToggle(pMisc, "Anti-AFK", "antiAfk")
AddToggle(pMisc, "Click TP", "tp")
-- =====================================================
-- ASTA HUB V3 - PARTE 5/5 (LÓGICA FINAL)
-- =====================================================
local introPlayed = false
local isAnimating = false
local autoOpened = false

local function playIntroAndOpen()
    if isAnimating then return end
    isAnimating = true

    if not introPlayed then
        introPlayed = true
        IntroFrame.Visible = true
        local fadeIn = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(IntroFrame, fadeIn, {BackgroundTransparency = 0}):Play()
        TweenService:Create(IntroStroke, fadeIn, {Transparency = 0}):Play()
        TweenService:Create(IntroBg, fadeIn, {ImageTransparency = 0.4}):Play()
        TweenService:Create(ProfileImage, fadeIn, {ImageTransparency = 0}):Play()
        TweenService:Create(ImageStroke, fadeIn, {Transparency = 0}):Play()
        TweenService:Create(UsernameLabel, fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(WelcomeLabel, fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(IntroTitle, fadeIn, {TextTransparency = 0}):Play()
        TweenService:Create(IntroQuote, fadeIn, {TextTransparency = 0}):Play()

        task.wait(3.0)

        local fadeOut = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
        TweenService:Create(IntroFrame, fadeOut, {BackgroundTransparency = 1}):Play()
        TweenService:Create(IntroStroke, fadeOut, {Transparency = 1}):Play()
        TweenService:Create(IntroBg, fadeOut, {ImageTransparency = 1}):Play()
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

-- ABRE AUTOMATICAMENTE NA PRIMEIRA VEZ
task.delay(0.5, function()
    if not autoOpened then
        autoOpened = true
        playIntroAndOpen()
    end
end)

ToggleBtn.MouseButton1Click:Connect(function()
    if introPlayed then
        MainMenu.Visible = not MainMenu.Visible
    else
        playIntroAndOpen()
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainMenu.Visible = false
end)

-- LÓGICA DOS CHEATS
local Cam = WS.CurrentCamera
WS:GetPropertyChangedSignal("CurrentCamera"):Connect(function() Cam = WS.CurrentCamera end)

RS.RenderStepped:Connect(function()
    local hum = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
    if (Cfg.aim or Cfg.autoShoot) and hum and hum.Health > 0 then
        local best, bd = nil, Cfg.fov
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
            if Cfg.autoShoot and VirtualUser then
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton1(Vector2.new(0, 0))
                end)
            end
        end
    end
end)

RS.Heartbeat:Connect(function()
    local char = L.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    if hum and hrp then
        if Cfg.spd then hum.WalkSpeed = 60
        elseif not Cfg.fly then hum.WalkSpeed = Orig.WalkSpeed end

        if Cfg.jmp then hum.JumpPower = 100
        else hum.JumpPower = Orig.JumpPower end

        if Cfg.fly then
            local d = Vector3.new()
            if UIS:IsKeyDown(Enum.KeyCode.W) then d += Cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then d -= Cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then d -= Cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then d += Cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then d += Vector3.new(0, 1, 0) end
            hrp.Velocity = d.Magnitude > 0 and d.Unit * 50 or Vector3.new()
        end

        if Cfg.nc then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
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
                        if dist < 20 then hrp.Velocity = (hrp.Position - obj.Position).Unit * 100 end
                    end
                end
            end
        end

        if Cfg.gravity then WS.Gravity = 196
        else WS.Gravity = Orig.Gravity end

        if Cfg.fullbright then
            Lighting.Brightness = 3
            Lighting.ClockTime = 14
        else
            Lighting.Brightness = Orig.Brightness
            Lighting.ClockTime = Orig.ClockTime
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if Cfg.jmp then
        local hum = L.Character and L.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= L and p.Character then
                if Cfg.hit then
                    for _, obj in pairs(p.Character:GetChildren()) do
                        if obj:IsA("BasePart") then
                            obj.Size = Vector3.new(Cfg.hitSize, Cfg.hitSize, Cfg.hitSize)
                            obj.Transparency = 0.5
                        end
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

task.spawn(function()
    while task.wait(60) do
        if Cfg.antiAfk and VirtualUser then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new(0, 0))
            end)
        end
    end
end)

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
-- =====================================================
-- ASTA HUB V3 - PARTE 6/6 (PAINEL + EXTRAS)
-- Responsável APENAS pelo painel, animações e funções extras
-- =====================================================

-- =====================================================
-- 6.1 ANIMAÇÕES DO PAINEL
-- =====================================================
local menuOpen = false

local function animateOpen()
    if menuOpen then return end
    menuOpen = true
    MainMenu.Visible = true
    MainMenu.Size = UDim2.new(0, 0, 0, 0)
    MainMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainMenu.BackgroundTransparency = 1
    MenuStroke.Transparency = 1

    local info = TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    TweenService:Create(MainMenu, info, {
        Size = UDim2.new(0, 480, 0, 320),
        Position = UDim2.new(0.5, -240, 0.5, -160),
        BackgroundTransparency = 0
    }):Play()
    TweenService:Create(MenuStroke, TweenInfo.new(0.35), { Transparency = 0 }):Play()

    for i, t in ipairs(Tabs) do
        t.b.BackgroundTransparency = 1
        task.delay(i * 0.04, function()
            TweenService:Create(t.b, TweenInfo.new(0.2), { BackgroundTransparency = 0 }):Play()
        end)
    end
end

local function animateClose()
    if not menuOpen then return end
    menuOpen = false
    local info = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(MainMenu, info, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundTransparency = 1
    }):Play()
    TweenService:Create(MenuStroke, TweenInfo.new(0.25), { Transparency = 1 }):Play()
    task.delay(0.25, function()
        if not menuOpen then MainMenu.Visible = false end
    end)
end

local function toggleMenu()
    if menuOpen then animateClose() else animateOpen() end
end

-- Exporta para a Parte 5 usar
_G.AstaOpen = animateOpen
_G.AstaClose = animateClose
_G.AstaToggle = toggleMenu

-- Pulso no botão flutuante (só quando o menu está fechado)
task.spawn(function()
    while task.wait(2) do
        if not menuOpen then
            TweenService:Create(ToggleBtn, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 70, 0, 70)
            }):Play()
            task.wait(0.4)
            TweenService:Create(ToggleBtn, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 65, 0, 65)
            }):Play()
        end
    end
end)

-- Brilho na borda do botão quando fechado
task.spawn(function()
    while task.wait(0.1) do
        if not menuOpen then
            local t = tick() % 2
            local alpha = math.abs(math.sin(t * math.pi))
            BtnStroke.Color = RED:Lerp(WHITE, alpha * 0.5)
        else
            BtnStroke.Color = RED
        end
    end
end)

-- =====================================================
-- 6.2 FUNÇÕES EXTRAS (configs)
-- =====================================================
Cfg.tpToPlayer = false
Cfg.autoParry = false
Cfg.autoSkill = false
Cfg.autoFarm = false
Cfg.autoCollect = false
Cfg.infStamina = false
Cfg.antiVoid = false
Cfg.antiRagdoll = false
Cfg.lowGraphics = false
Cfg.waterWalk = false

AddToggle(pCombat, "Auto Parry (Auto Defesa)", "autoParry")
AddToggle(pCombat, "Auto Skill (Auto Habilidade)", "autoSkill")
AddToggle(pCombat, "Anti-Ragdoll", "antiRagdoll")

AddToggle(pMove, "Water Walk (Andar na Água)", "waterWalk")
AddToggle(pMove, "Anti-Void (Anti Queda)", "antiVoid")
AddToggle(pMove, "Inf-Stamina (Stamina Infinita)", "infStamina")

AddToggle(pMisc, "Auto Farm (Farm Automático)", "autoFarm")
AddToggle(pMisc, "Auto Collect (Coletar Auto)", "autoCollect")
AddToggle(pMisc, "Low Graphics (Gráficos Baixos)", "lowGraphics")
AddToggle(pMisc, "TP to Player (Teleportar)", "tpToPlayer")

-- =====================================================
-- 6.3 LÓGICA DAS FUNÇÕES EXTRAS
-- =====================================================
local savedParticles = {}

RS.Heartbeat:Connect(function()
    local char = L.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not (hum and hrp) then return end

    -- Anti-Void
    if Cfg.antiVoid and hrp.Position.Y < -50 then
        hrp.CFrame = CFrame.new(0, 50, 0)
    end

    -- Water Walk (aplica uma vez por parte)
    if Cfg.waterWalk then
        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") and not p:GetAttribute("AstaWater") then
                p:SetAttribute("AstaWater", true)
                p.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0.01, 0.01, 1, 1)
            end
        end
    end

    -- Inf-Stamina (busca valores comuns)
    if Cfg.infStamina then
        pcall(function()
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("NumberValue") and (v.Name:lower():find("stamina") or v.Name:lower():find("energy")) then
                    v.Value = 9999
                end
            end
        end)
    end

    -- Anti-Ragdoll
    if Cfg.antiRagdoll then
        pcall(function()
            hum:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
        end)
    end

    -- Low Graphics (salva e restaura)
    if Cfg.lowGraphics then
        if not Lighting:GetAttribute("AstaLowGfx") then
            Lighting:SetAttribute("AstaLowGfx", true)
            savedParticles = {}
            Lighting.GlobalShadows = false
            for _, v in pairs(WS:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") then
                    table.insert(savedParticles, { obj = v, enabled = v.Enabled })
                    v.Enabled = false
                end
            end
        end
    elseif Lighting:GetAttribute("AstaLowGfx") then
        Lighting:SetAttribute("AstaLowGfx", false)
        Lighting.GlobalShadows = true
        for _, item in pairs(savedParticles) do
            if item.obj and item.obj.Parent then
                item.obj.Enabled = item.enabled
            end
        end
        savedParticles = {}
    end

    -- TP to Player
    if Cfg.tpToPlayer then
        local nearest, dist = nil, math.huge
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= L and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local d = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if d < dist then dist = d; nearest = p end
            end
        end
        if nearest then
            hrp.CFrame = nearest.Character.HumanoidRootPart.CFrame + Vector3.new(3, 0, 0)
        end
    end
end)

-- Auto Parry
RS.Heartbeat:Connect(function()
    if not Cfg.autoParry then return end
    local char = L.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= L and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
            if d < 15 then
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new(0, 0))
                end)
                break
            end
        end
    end
end)

-- Auto Skill
task.spawn(function()
    while task.wait(1.5) do
        if Cfg.autoSkill then
            for _, key in pairs({Enum.KeyCode.Q, Enum.KeyCode.E, Enum.KeyCode.R, Enum.KeyCode.F}) do
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton1(Vector2.new(0, 0))
                end)
                task.wait(0.2)
            end
        end
    end
end)

-- Auto Farm
RS.Heartbeat:Connect(function()
    if not Cfg.autoFarm then return end
    local char = L.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local nearest, dist = nil, 30
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= L and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local d = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
            if d < dist then dist = d; nearest = p end
        end
    end
    if nearest then
        hrp.CFrame = CFrame.new(hrp.Position, nearest.Character.HumanoidRootPart.Position)
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(0, 0))
        end)
    end
end)

-- Auto Collect
task.spawn(function()
    while task.wait(0.5) do
        if Cfg.autoCollect then
            local char = L.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                for _, obj in pairs(WS:GetDescendants()) do
                    if obj:IsA("BasePart") then
                        local n = obj.Name:lower()
                        if n:find("fruit") or n:find("item") then
                            local d = (obj.Position - hrp.Position).Magnitude
                            if d < 50 then
                                hrp.CFrame = CFrame.new(obj.Position)
                            end
                        end
                    end
                end
            end
        end
    end
end)

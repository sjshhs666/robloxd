local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/9kn-1/LocalredzzUi/refs/heads/main/Redz.txt"))()

local Window = OrionLib:MakeWindow({
    Name = "飞天剑云，此脚本完全免费",
    SubTitle = "FTJY"
})

local MainTab = Window:MakeTab({
    Title = "主要",
    Icon = "rbxassetid://4483345998" 
})

local GBTab = Window:MakeTab({
    Title = "gb",
    Icon = "rbxassetid://4483345998"
})

local NinjaTab = Window:MakeTab({
    Title = "忍者传奇",
    Icon = "rbxassetid://4483345998"
})

local SettingsTab = Window:MakeTab({
    Title = "设置",
    Icon = "settings"
})

local HelpTab = Window:MakeTab({
    Title = "帮助",
    Icon = "rbxassetid://4483345998"
})

local NineNightTab = Window:MakeTab({
    Title = "99夜",
    Icon = "rbxassetid://4483345998"
})

-- 发送加载完成通知
game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "飞天剑云脚本",
    Text = "加载完成",
    Icon = "rbxassetid://14250466898",
    Duration = 10
})

-- ================================
-- 忍者传奇功能变量
-- ================================
local autoswing = false
local autosell = false
local autobuyranks = false
local autobuybelts = false
local autobuyskills = false
local autobuy = false

-- 忍者传奇功能实现
spawn(function()
    while true do
        if autoswing then
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("ninjitsuGain") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    break
                end
            end
            local A_1 = "swingKatana"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1)
        end
        wait()
    end
end)

spawn(function()
    while true do
        if autosell then
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            wait(0.1)
        else
            wait(1)
        end
    end
end)

spawn(function()
    while true do
        if autobuyranks then
            local deku1 = "buyRank"
            for i = 1, 5 do
                game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(deku1, "Rank " .. i)
            end
            wait(0.1)
        else
            wait(1)
        end
    end
end)

spawn(function()
    while true do
        if autobuybelts then
            local A_1 = "buyAllBelts"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        else
            wait(1)
        end
    end
end)

spawn(function()
    while true do
        if autobuyskills then
            local A_1 = "buyAllSkills"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        else
            wait(1)
        end
    end
end)

spawn(function()
    while true do
        if autobuy then
            local A_1 = "buyAllSwords"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        else
            wait(1)
        end
    end
end)

-- 解锁所有岛屿功能
local function unlockAllIslands()
    for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v,0)
        firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v,1)
    end
    OrionLib:MakeNotification({
        Name = "解锁完成",
        Content = "所有岛屿已解锁",
        Time = 3
    })
end

-- 解锁所有元素功能
local function unlockAllElements()
    local Elements = {}
    for i,v in pairs(game:GetService("ReplicatedStorage").Elements:GetChildren()) do
        table.insert(Elements,v.Name)
    end
    
    for i,v in pairs(Elements) do
        game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer(v)
    end
    OrionLib:MakeNotification({
        Name = "解锁完成",
        Content = "所有元素已解锁",
        Time = 3
    })
end

-- ================================
-- 原有GB功能变量
-- ================================
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local debugMode = false
local keepBackpackEnabled = false
local backpackConnection = nil
local characterAddedConnection = nil
local espEnabled = false
local playerHighlights = {}
local isActive = false
local currentTarget = nil
local floatOffset = 0
local lastSwitch = 0
local heartbeatConnection = nil
local isAnimLooping = false
local animLoopConnection = nil
local currentTracks = {}
local isAutoDigging = false
local digConnection = nil
local isSpeedActive = false
local DEFAULT_SPEED = 16
local noFallDamageActive = false
local fallDamageConnection = nil
local killAuraActive = false
local attackBarrels = false
local autoRotateEnabled = false
local killAuraConnection = nil
local isBayonetKillAuraActive = false
local bayonetAttackBarrels = false
local bayonetAutoRotateEnabled = false
local bayonetKillAuraConnection = nil
local isKillingBots = false
local autoRotateBots = false
local killBotsConnection = nil
local isAutoAttacking = false
local attackLoopConnection = nil
local isAxeStunActive = false
local axeStunConnection = nil
local isComboActive = false
local comboConnection = nil
local AutorepairT = false
local RepairOthersT = false
local autorepairConnection = nil
local repairing = false
local repairConnection
local autoLogEnabled = false
local autoLogConnection = nil
local autoInteractEnabled = false
local autoInteractConnection = nil
local noSlowActive = false
local walkSpeedConnection = nil
local characterAddedConnection2 = nil
local isKaubCollecting = false
local kaubConnection = nil
local activePrompts = {}
local isSpeedUpActive = false
local animationConnection = nil
local animatorConnection = nil

-- ================================
-- 原有GB功能实现
-- ================================

-- 保持物品栏功能
local function toggleKeepBackpack()
    keepBackpackEnabled = not keepBackpackEnabled
    
    if keepBackpackEnabled then
        if player.PlayerGui:FindFirstChild("BackpackGui") then
            player.PlayerGui.BackpackGui.Enabled = true
            backpackConnection = player.PlayerGui.BackpackGui:GetPropertyChangedSignal("Enabled"):Connect(function()
                player.PlayerGui.BackpackGui.Enabled = true
            end)
            characterAddedConnection = player.CharacterAdded:Connect(function()
                task.wait(1)
                if player.PlayerGui:FindFirstChild("BackpackGui") then
                    player.PlayerGui.BackpackGui.Enabled = true
                end
            end)
            OrionLib:MakeNotification({
                Name = "保持物品栏已启用",
                Content = "物品栏将始终保持打开状态",
                Time = 3
            })
        end
    else
        if backpackConnection then
            backpackConnection:Disconnect()
            backpackConnection = nil
        end
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        OrionLib:MakeNotification({
            Name = "保持物品栏已禁用",
            Content = "物品栏恢复正常状态",
            Time = 3
        })
    end
end

-- 解锁武器功能
local function unlockWeapons()
    local hiddenAchievements = player:FindFirstChild("HiddenAchievements")
    
    if hiddenAchievements then
        local leRevenant = hiddenAchievements:FindFirstChild("LeRevenant")
        if leRevenant and leRevenant:IsA("BoolValue") then
            leRevenant.Value = true
        end
        
        local untouchable = hiddenAchievements:FindFirstChild("Untouchable")
        if untouchable and untouchable:IsA("BoolValue") then
            untouchable.Value = true
        end
    end
    OrionLib:MakeNotification({
        Name = "武器已解锁",
        Content = "隐藏武器已解锁",
        Time = 3
    })
end

-- 玩家透视功能
local function getTeamColor(player)
    if player.Team then
        return player.Team.TeamColor.Color
    else
        return Color3.fromRGB(255, 255, 255)
    end
end

local function createPlayerESP(player)
    if not player.Character then return end
    if playerHighlights[player] then
        playerHighlights[player]:Destroy()
        playerHighlights[player] = nil
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = player.Name .. "ESP"
    highlight.FillColor = getTeamColor(player)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = player.Character

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "PlayerNameTag"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = player.Character:WaitForChild("Head") or player.Character:WaitForChild("HumanoidRootPart")
    billboard.Parent = player.Character
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Text = player.Name .. (player.Team and " ("..player.Team.Name..")" or "")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = getTeamColor(player)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 14
    nameLabel.TextStrokeTransparency = 0.5
    nameLabel.Parent = billboard
    
    playerHighlights[player] = highlight
end

local function removePlayerESP(player)
    if playerHighlights[player] then
        playerHighlights[player]:Destroy()
        playerHighlights[player] = nil
    end
    
    if player.Character then
        local nameTag = player.Character:FindFirstChild("PlayerNameTag")
        if nameTag then
            nameTag:Destroy()
        end
    end
end

local function updateAllPlayerESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if espEnabled then
            createPlayerESP(player)
        else
            removePlayerESP(player)
        end
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        if espEnabled then
            espEnabled = false
            updateAllPlayerESP()
        end
        
        if espEnabled then
            createPlayerESP(player)
        end
    end)
    
    player.CharacterRemoving:Connect(function()
        removePlayerESP(player)
    end)
    
    local success, err = pcall(function()
        player:GetPropertyChangedSignal("Team"):Connect(function()
            if espEnabled and player.Character then
                createPlayerESP(player)
            end
        end)
    end)
end

for _, player in ipairs(Players:GetPlayers()) do
    onPlayerAdded(player)
end

Players.PlayerAdded:Connect(onPlayerAdded)

local function toggleESP()
    espEnabled = not espEnabled
    updateAllPlayerESP()
    OrionLib:MakeNotification({
        Name = "玩家透视 " .. (espEnabled and "已启用" or "已禁用"),
        Content = espEnabled and "所有玩家已高亮显示" or "玩家高亮已关闭",
        Time = 3
    })
end

-- 传送功能
local function teleportToLeipzig()
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local targetCFrame = CFrame.new(
                -588.658203, 10.9199705, -109.468513,
                0.258864343, 0, -0.965913713,
                0, 1, 0,
                0.965913713, 0, 0.258864343
            )
            humanoidRootPart.CFrame = targetCFrame
            OrionLib:MakeNotification({
                Name = "传送成功",
                Content = "已传送到莱比锡",
                Time = 3
            })
        end
    end
end

-- 无敌飞雷神功能
local SAFE_DISTANCE = 3
local FLOAT_HEIGHT = 3
local FLOAT_SPEED = 15
local COOLDOWN = 0.6

local function getValidTargets()
    local targets = {}
    local me = game:GetService("Players").LocalPlayer
    
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= me and 
           player.Character and
           player.Character:FindFirstChild("HumanoidRootPart") and
           (not me.Team or not player.Team or player.Team ~= me.Team) then
            table.insert(targets, player)
        end
    end
    
    return targets
end

local function godTeleport()
    local me = game:GetService("Players").LocalPlayer
    if not me.Character then return end
    local myRoot = me.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end
    
    local targets = getValidTargets()
    if #targets == 0 then
        return
    end
    
    if tick() - lastSwitch >= COOLDOWN then
        currentTarget = targets[math.random(1, #targets)]
        lastSwitch = tick()
        floatOffset = 0
    end
    
    if currentTarget and currentTarget.Character then
        local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot then
            floatOffset = math.sin(tick() * FLOAT_SPEED) * FLOAT_HEIGHT
            
            local backVector = targetRoot.CFrame.LookVector * -SAFE_DISTANCE
            local floatVector = Vector3.new(0, floatOffset, 0)
            myRoot.CFrame = CFrame.new(
                targetRoot.Position + backVector + floatVector,
                targetRoot.Position + floatVector
            )
        end
    end
end

local function stopTeleport()
    isActive = false
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end
    currentTarget = nil
end

local function toggleGodTeleport()
    isActive = not isActive
    
    if isActive then
        currentTarget = nil
        lastSwitch = 0
        
        heartbeatConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if isActive then
                godTeleport()
            end
        end)
        OrionLib:MakeNotification({
            Name = "无敌飞雷神已启用",
            Content = "正在自动传送攻击敌人",
            Time = 3
        })
    else
        stopTeleport()
        OrionLib:MakeNotification({
            Name = "无敌飞雷神已禁用",
            Content = "传送功能已关闭",
            Time = 3
        })
    end
end

-- ================================
-- 创建UI元素
-- ================================

-- 99夜标签页 - 手动加载
NineNightTab:AddSection("99夜森林功能")

NineNightTab:AddParagraph("说明", "点击下方按钮加载99夜森林脚本")

NineNightTab:AddButton({
    Name = "加载99夜脚本",
    Description = "手动加载99夜森林功能",
    Callback = function()
        local success, error = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/sjshhs666/robloxd/e4d17b9237583569caf3b8601bc3921224b4cfc9/99%E5%A4%9C"))()
        end)
        
        if success then
            OrionLib:MakeNotification({
                Name = "加载成功",
                Content = "99夜森林功能已加载",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "加载失败",
                Content = "错误: " .. tostring(error),
                Time = 5
            })
        end
    end
})

-- 忍者传奇标签页
NinjaTab:AddSection("自动功能")

NinjaTab:AddToggle({
    Name = "自动挥舞",
    Description = "自动挥舞武器",
    Default = false,
    Callback = function(value)
        autoswing = value
        OrionLib:MakeNotification({
            Name = "自动挥舞 " .. (value and "已启用" or "已禁用"),
            Content = value and "正在自动挥舞武器" or "自动挥舞已停止",
            Time = 3
        })
    end
})

NinjaTab:AddToggle({
    Name = "自动售卖",
    Description = "自动售卖物品",
    Default = false,
    Callback = function(value)
        autosell = value
        OrionLib:MakeNotification({
            Name = "自动售卖 " .. (value and "已启用" or "已禁用"),
            Content = value and "正在自动售卖物品" or "自动售卖已停止",
            Time = 3
        })
    end
})

NinjaTab:AddToggle({
    Name = "自动购买排名",
    Description = "自动购买所有排名",
    Default = false,
    Callback = function(value)
        autobuyranks = value
        OrionLib:MakeNotification({
            Name = "自动购买排名 " .. (value and "已启用" or "已禁用"),
            Content = value and "正在自动购买排名" or "自动购买排名已停止",
            Time = 3
        })
    end
})

NinjaTab:AddToggle({
    Name = "自动购买腰带",
    Description = "自动购买所有腰带",
    Default = false,
    Callback = function(value)
        autobuybelts = value
        OrionLib:MakeNotification({
            Name = "自动购买腰带 " .. (value and "已启用" or "已禁用"),
            Content = value and "正在自动购买腰带" or "自动购买腰带已停止",
            Time = 3
        })
    end
})

NinjaTab:AddToggle({
    Name = "自动购买技能",
    Description = "自动购买所有技能",
    Default = false,
    Callback = function(value)
        autobuyskills = value
        OrionLib:MakeNotification({
            Name = "自动购买技能 " .. (value and "已启用" or "已禁用"),
            Content = value and "正在自动购买技能" or "自动购买技能已停止",
            Time = 3
        })
    end
})

NinjaTab:AddToggle({
    Name = "自动购买剑",
    Description = "自动购买所有剑",
    Default = false,
    Callback = function(value)
        autobuy = value
        OrionLib:MakeNotification({
            Name = "自动购买剑 " .. (value and "已启用" or "已禁用"),
            Content = value and "正在自动购买剑" or "自动购买剑已停止",
            Time = 3
        })
    end
})

NinjaTab:AddSection("一键解锁")

NinjaTab:AddButton({
    Name = "解锁所有岛屿",
    Description = "一键解锁所有岛屿",
    Callback = unlockAllIslands
})

NinjaTab:AddButton({
    Name = "解锁所有元素",
    Description = "一键解锁所有元素",
    Callback = unlockAllElements
})

-- 原有GB标签页
GBTab:AddSection("基础功能")

GBTab:AddToggle({
    Name = "保持物品栏",
    Description = "物品栏始终保持打开状态",
    Default = false,
    Callback = toggleKeepBackpack
})

GBTab:AddButton({
    Name = "解锁武器",
    Description = "解锁隐藏武器",
    Callback = unlockWeapons
})

GBTab:AddToggle({
    Name = "玩家透视",
    Description = "显示所有玩家位置和队伍",
    Default = false,
    Callback = toggleESP
})

GBTab:AddButton({
    Name = "传送到莱比锡",
    Description = "快速传送到莱比锡位置",
    Callback = teleportToLeipzig
})

GBTab:AddSection("战斗功能")

GBTab:AddToggle({
    Name = "无敌飞雷神",
    Description = "自动传送攻击敌人",
    Default = false,
    Callback = toggleGodTeleport
})

-- 其他原有GB功能UI元素...
-- 这里省略了其他原有UI元素的创建代码

local NoclipEnabled = false
local NoclipConnection = nil

local function NoclipLoop()
    if NoclipConnection then
        NoclipConnection:Disconnect()
    end
    
    NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
        if NoclipEnabled and game.Players.LocalPlayer.Character then
            for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide then
                    child.CanCollide = false
                end
            end
        end
    end)
end

MainTab:AddSection("移动功能")

MainTab:AddToggle({
    Name = "穿墙模式",
    Description = "允许穿过墙壁和物体",
    Default = false,
    Callback = function(value)
        NoclipEnabled = value
        
        if value then
            NoclipLoop()
            OrionLib:MakeNotification({
                Name = "穿墙模式已启用",
                Content = "可以穿过墙壁和物体",
                Time = 3
            })
        else
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end
            OrionLib:MakeNotification({
                Name = "穿墙模式已禁用",
                Content = "碰撞检测恢复正常",
                Time = 3
            })
        end
    end
})

local InfiniteJumpEnabled = false
local JumpConnection = nil
MainTab:AddToggle({
    Name = "无限跳跃",
    Description = "在空中也能无限跳跃",
    Default = false,
    Callback = function(value)
        InfiniteJumpEnabled = value
        
        if value then
            -- 启用无限跳跃
            if JumpConnection then
                JumpConnection:Disconnect()
            end
            
            JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if InfiniteJumpEnabled and game.Players.LocalPlayer.Character then
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState("Jumping")
                    end
                end
            end)
            
            OrionLib:MakeNotification({
                Name = "无限跳跃已启用",
                Content = "可以无限跳跃",
                Time = 3
            })
        else
            -- 禁用无限跳跃
            if JumpConnection then
                JumpConnection:Disconnect()
                JumpConnection = nil
            end
            
            OrionLib:MakeNotification({
                Name = "无限跳跃已禁用",
                Content = "跳跃功能恢复正常",
                Time = 3
            })
        end
    end
})

-- 设置标签页
SettingsTab:AddSection("配置")

SettingsTab:AddSlider({
    Name = "UI透明度",
    Description = "调整界面透明度",
    MinValue = 0,
    MaxValue = 100,
    Default = 50,
    Callback = function(value)
        OrionLib:MakeNotification({
            Name = "透明度已设置",
            Content = "UI透明度: " .. tostring(value),
            Time = 2
        })
    end
})

-- 在脚本开头添加变量声明
local SpinEnabled = false
local SpinConnection = nil
local SpinSpeed = 5  -- 默认旋转速度

-- 旋转功能实现
local function EnableSpin()
    if SpinConnection then
        SpinConnection:Disconnect()
    end
    
    SpinConnection = game:GetService("RunService").RenderStepped:Connect(function()
        if SpinEnabled and game.Players.LocalPlayer.Character then
            local rootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                -- 应用旋转
                rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, math.rad(SpinSpeed), 0)
            end
        end
    end)
end

-- 在移动功能部分添加旋转功能
MainTab:AddSection("移动功能")

MainTab:AddToggle({
    Name = "穿墙模式",
    Description = "允许穿过墙壁和物体",
    Default = false,
    Callback = function(value)
        NoclipEnabled = value
        
        if value then
            NoclipLoop()
            OrionLib:MakeNotification({
                Name = "穿墙模式已启用",
                Content = "可以穿过墙壁和物体",
                Time = 3
            })
        else
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end
            OrionLib:MakeNotification({
                Name = "穿墙模式已禁用",
                Content = "碰撞检测恢复正常",
                Time = 3
            })
        end
    end
})

MainTab:AddToggle({
    Name = "角色旋转",
    Description = "让你的角色持续旋转",
    Default = false,
    Callback = function(value)
        SpinEnabled = value
        
        if value then
            EnableSpin()
            OrionLib:MakeNotification({
                Name = "角色旋转已启用",
                Content = "角色开始旋转，速度: " .. tostring(SpinSpeed),
                Time = 3
            })
        else
            if SpinConnection then
                SpinConnection:Disconnect()
                SpinConnection = nil
            end
            OrionLib:MakeNotification({
                Name = "角色旋转已禁用",
                Content = "角色停止旋转",
                Time = 3
            })
        end
    end
})

MainTab:AddSlider({
    Name = "旋转速度",
    Description = "调整角色旋转的速度",
    MinValue = 1,
    MaxValue = 50,
    Default = 5,
    Callback = function(value)
        SpinSpeed = value
        if SpinEnabled then
            -- 如果旋转已启用，重新启用以应用新速度
            EnableSpin()
        end
        OrionLib:MakeNotification({
            Name = "旋转速度已设置",
            Content = "当前旋转速度: " .. tostring(value),
            Time = 2
        })
    end
})

local JumpHeightEnabled = false
local JumpHeight = 50  -- 默认跳跃高度
local OriginalJumpPower = 50  -- 保存原始跳跃高度

local function ApplyJumpHeight()
    if game.Players.LocalPlayer.Character then
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if JumpHeightEnabled then
                humanoid.JumpPower = JumpHeight
            else
                humanoid.JumpPower = OriginalJumpPower
            end
        end
    end
end

MainTab:AddSection("移动功能")

MainTab:AddToggle({
    Name = "穿墙模式",
    Description = "允许穿过墙壁和物体",
    Default = false,
    Callback = function(value)
        NoclipEnabled = value
        
        if value then
            NoclipLoop()
            OrionLib:MakeNotification({
                Name = "穿墙模式已启用",
                Content = "可以穿过墙壁和物体",
                Time = 3
            })
        else
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end
            OrionLib:MakeNotification({
                Name = "穿墙模式已禁用",
                Content = "碰撞检测恢复正常",
                Time = 3
            })
        end
    end
})

MainTab:AddToggle({
    Name = "自定义跳跃高度",
    Description = "启用自定义跳跃高度",
    Default = false,
    Callback = function(value)
        JumpHeightEnabled = value
        ApplyJumpHeight()
        
        OrionLib:MakeNotification({
            Name = "自定义跳跃高度 " .. (value and "已启用" or "已禁用"),
            Content = value and "跳跃高度: " .. tostring(JumpHeight) or "跳跃高度恢复正常",
            Time = 3
        })
    end
})

MainTab:AddSlider({
    Name = "跳跃高度",
    Description = "调整角色的跳跃高度",
    MinValue = 10,
    MaxValue = 200,
    Default = 50,
    Callback = function(value)
        JumpHeight = value
        if JumpHeightEnabled then
            ApplyJumpHeight()
        end
        OrionLib:MakeNotification({
            Name = "跳跃高度已设置",
            Content = "当前跳跃高度: " .. tostring(value),
            Time = 2
        })
    end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1) -- 等待角色完全加载
    
    local humanoid = character:WaitForChild("Humanoid")
    OriginalJumpPower = humanoid.JumpPower
    
    if NoclipEnabled then
        NoclipLoop()
    end
    
    if SpinEnabled then
        EnableSpin()
    end
    
    if JumpHeightEnabled then
        ApplyJumpHeight()
    end
end)

task.spawn(function()
    wait(2) -- 等待游戏加载
    if game.Players.LocalPlayer.Character then
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            OriginalJumpPower = humanoid.JumpPower
        end
    end
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    wait(1) -- 等待角色完全加载
    
    if NoclipEnabled then
        NoclipLoop()
    end
    
    if SpinEnabled then
        EnableSpin()
    end
end)
HelpTab:AddParagraph("飞雷神功能提示", "如果你发现自己被传送到其他玩家身后，请检查是否开启了gb标签页中的飞雷神功能。\n\n如需关闭此功能：\n1. 打开上方的'gb'标签页\n2. 在'战斗功能'部分\n3. 关闭'无敌飞雷神'开关")

HelpTab:AddButton({
    Name = "立即关闭飞雷神",
    Description = "快速停止自动传送",
    Callback = function()
        isActive = false
        if heartbeatConnection then
            heartbeatConnection:Disconnect()
            heartbeatConnection = nil
        end
        OrionLib:MakeNotification({
            Name = "已关闭",
            Content = "飞雷神功能已停止",
            Time = 3
        })
    end
})

HelpTab:AddParagraph("功能说明", "飞雷神功能会自动传送到敌人身后进行攻击，如果不需要此功能请确保保持关闭状态。")

OrionLib:MakeNotification({
    Name = "飞天剑云加载完成",
    Content = "GB脚本和忍者传奇功能已就绪",
    Time = 3
})

-- 初始化UI
OrionLib:Init()

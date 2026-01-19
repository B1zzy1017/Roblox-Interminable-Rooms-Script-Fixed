-- Client-side entity announcer (exploit)
-- Skips announcing certain object names (spam control)

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local player = Players.LocalPlayer
local EntitiesFolder = workspace:WaitForChild("Entities")

-- Names to ignore
local IGNORE_NAMES = {
	-- Previous entries
	["Noah"] = true,
	["John"] = true,

	["A-1"] = true,
	["A-80"] = true,
	["A-120 Minion"] = true,
	["A-150"] = true,
	["A-244"] = true,
	["A-245"] = true,
	["A-246"] = true,
	["A-247"] = true,
	["A-248"] = true,
	["A-258"] = true,
	["A-278"] = true,
	["A-300"] = true,
	["X-247"] = true,
	["X-244"] = true,
	["X-246"] = true,
	["X-248"] = true,
	["X-258"] = true,
	["X-278"] = true,
	["X-300"] = true,
	["XX-150"] = true,
	["XX-244"] = true,
	["XX-258"] = true,
	["XX-300"] = true,
	["cursedA300"] = true,
	["scamy-120"] = true,
	["scary-150"] = true,
	["scary-245"] = true,
	["scary-300"] = true,

	["E-1"] = true,
	["XE-1"] = true,
	["XXE-1"] = true,
	["DG-1"] = true,
	["CHA-1"] = true,
	["BM-1"] = true,
	["E-42LEFT"] = true,
	["E-42RIGHT"] = true,
	["E-42"] = true,
	["scare-42LEFT"] = true,
	["scare-42RIGHT"] = true,
	["scare-42"] = true,
	["V-5"] = true,
	["XV-5"] = true,
	["XXV-5"] = true,
	["scarv-5"] = true,
	["ULB-278"] = true,
	["TLAB-278"] = true,
	["XTLAB-278"] = true,
	["G-GLITCH"] = true,

	["billy"] = true,
	["purplebilly"] = true,
	["sadbilly"] = true,
	["bullybilly"] = true,
	["BilleBobb"] = true,
	["BluehBobb"] = true,
	["TabbleBobb"] = true,
	["ay eight ee"] = true,
	["ay two hundred and fifty eight"] = true,

	["Dog"] = true,
	["MonsterE"] = true,
	["Bob"] = true,
	["BLOODCONE-6"] = true,
	["BLOODCONE-7"] = true,
	["TEETHMINI"] = true,
	["Xoah"] = true,
	["X-120 Minion"] = true,
	["X-150"] = true,
	["BLUE-244"] = true,
	["XBLUE-244"] = true,
	["TABLE-244"] = true,
	["XTABLE-244"] = true,
	["EVIL-244"] = true,
	["bubugugup"] = true,

	-- Latest additions
	["tinytimbstony"] = true,
	["radioactiverunnersremington"] = true,
	["BIGBOOTSBOWEN"] = true,
	["BLUEBOOTSBOWEN"] = true,
	["retrorocketsrobert"] = true,
	["diggindockersdean"] = true,
	["drillinderbiesdaniel"] = true,
	["pickinpumaspaul"] = true,
	["chasincleatscharles"] = true,
	["bombasticbootsbrooke"] = true,
	["nuclearnikesnathan"] = true,
	["DNC-1"] = true,
	["PH-1"] = true,
	["JOLLY-1"] = true,
	["XE-42"] = true,
	["rEtro-42"] = true,
	["E-50"] = true,
	["BE-50"] = true,
	["TE-50"] = true,
	["E-80"] = true,
	["XE-80"] = true,
	["ERM-120"] = true,
	["E-246"] = true,
	["XE-246"] = true,
	["E-300"] = true,
	["XE-300"] = true,
	["XXE-300"] = true,
	["Vifo"] = true,
	["XVifo"] = true,
	["XXVifo"] = true,
	["Bifo"] = true,
	["V-86"] = true,
	["XV-86"] = true,
	["A-300-86"] = true,
	["V-99"] = true,
	["V-160"] = true,
	["V-200"] = true,
	["XV-200"] = true,
	["V-256-A"] = true,
	["VWM-345"] = true
}

local tracked = {}

-- Chat sender (new + legacy chat)
local function say(msg)
	if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
		local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
		if channel then
			channel:SendAsync(msg)
		end
	else
		player:Chat(msg)
	end
end

-- Initial scan
for _, entity in ipairs(EntitiesFolder:GetChildren()) do
	tracked[entity] = true
end

-- Spawn detection
EntitiesFolder.ChildAdded:Connect(function(entity)
	if tracked[entity] then return end
	tracked[entity] = true

	if IGNORE_NAMES[entity.Name] then return end
	say(entity.Name .. " spawned")
end)

-- Despawn detection
EntitiesFolder.ChildRemoved:Connect(function(entity)
	if not tracked[entity] then return end
	tracked[entity] = nil

	if IGNORE_NAMES[entity.Name] then return end
	say(entity.Name .. " despawned")
end)

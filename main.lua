local frame = CreateFrame("FRAME", "AB_LOCKED"); --Dummy frame for etrace
frame:RegisterEvent("BAG_UPDATE"); --Defined events to track
local function eventHandler(self, event, ...) --Functions to run when event
 saveKey();
end
frame:SetScript("OnEvent", eventHandler);

if KeystoneDB == nil or KeystoneDB == 0 then --First time setup of SavedVariable
	KeystoneDB = KeystoneDB or {};
end

local ResetTime = KeystoneDB['Resetdate']; --Get epoch timestamp for saved reset
local CurrentServerTime = GetServerTime(); --Get current epoch time
local TimeToNextReset = GetQuestResetTime() + GetServerTime(); --Get epoch timestamp for next reset

if ResetTime == TimeToNextReset then --Check if saved timestamp is same same as current
	
else
	KeystoneDB = {}; --Else reset the saved data
	KeystoneDB["Resetdate"] = TimeToNextReset; --Save epoch timestamp for next reset
end

function saveKey()

	--implement check if nil then end
	local KeystoneLevel = C_MythicPlus.GetOwnedKeystoneLevel();
	local Keystone = C_ChallengeMode.GetMapUIInfo(C_MythicPlus.GetOwnedKeystoneChallengeMapID());
	local PlayerName = UnitName("player");

	--Save data to SavedVariables
	KeystoneDB[PlayerName] = {};
	KeystoneDB[PlayerName].Keystone = Keystone;
	KeystoneDB[PlayerName].KeystoneLevel = KeystoneLevel;

end

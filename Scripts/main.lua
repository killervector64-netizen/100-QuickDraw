-- Experimental Quick Draw 100% attempt for ACS Mobile
-- Based on tefeink style idea
-- WARNING: This may not work. The 95% multiplier is often hardcoded.

print("[QuickDraw100] Mod loaded - attempting to force 100% quality...")

local function trySetFu100()
    local success = false

    -- Try common paths (these may or may not exist on mobile)
    pcall(function()
        local mgr = CS.XiaWorld.GlobleDataMgr.Instance
        if mgr then
            -- Attempt to set all known Fu values to 1.0
            if mgr.FuSaves then
                for k, v in pairs(mgr.FuSaves) do
                    mgr.FuSaves[k] = 1.0
                end
                success = true
                print("[QuickDraw100] FuSaves set to 1.0")
            end
        end
    end)

    pcall(function()
        -- Alternative path some versions use
        local data = CS.XiaWorld.GameMain.Instance
        if data then
            print("[QuickDraw100] GameMain found")
        end
    end)

    if not success then
        print("[QuickDraw100] Could not find Fu data. Mod likely ineffective on this version.")
        print("[QuickDraw100] Recommendation: Use PC version for this feature.")
    end
end

-- Run after a short delay to let game systems initialize
CS.XiaWorld.GameEvent.RegisterEvent(CS.XiaWorld.g_emEvent.GameStart, function()
    trySetFu100()
end)

-- Also try on load
trySetFu100()

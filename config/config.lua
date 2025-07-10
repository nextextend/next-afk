return {
    afkZone = 0.3,              -- Radius (in meters) around the player where movement resets AFK timer
    afkMinutes = 0.5,           -- Total allowed AFK time in minutes

    preAfkPercent = 20,         -- Percentage of total AFK time to wait silently (no countdown shown)
                                -- For example, 90 means 90% of afkMinutes will pass before countdown starts

    countdownPercent = 10,      -- Percentage of total AFK time when countdown is visible and ticking down
                                -- Usually 100 - preAfkPercent (should add up to 100)

    afkCommand = 'stopafk';     -- Command name to disable the AFK timer while the countdown is active.
                                -- Set this to a string (e.g. 'stopafk') to enable the command with that name.
                                -- Set it to false or nil to disable the command entirely.
};
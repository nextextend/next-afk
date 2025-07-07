return {
    afkZone = 0.6,              -- Radius (in meters) around the player where movement resets AFK timer
    afkMinutes = 10,            -- Total allowed AFK time in minutes

    preAfkPercent = 90,         -- Percentage of total AFK time to wait silently (no countdown shown)
                                -- For example, 90 means 90% of afkMinutes will pass before countdown starts

    countdownPercent = 10       -- Percentage of total AFK time when countdown is visible and ticking down
                                -- Usually 100 - preAfkPercent (should add up to 100)
};
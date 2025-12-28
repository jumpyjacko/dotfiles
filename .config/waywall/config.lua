-- ======== WAYWALL GENERIC CONFIG ========

-- ==== LOOKS ====
local bg_col = "#000000"
local primary_col = "#ffffff"

local ninbot_anchor = "topright" -- topleft, top, topright, left, right, bottomleft, bottomright
local ninbot_opacity = 1         -- 0 to 1


-- ==== MIRRORS ====
local e_count = { enabled = true, x = 1500, y = 400, size = 6, colorkey = true }
local thin_pie = { enabled = true, x = 1490, y = 645, size = 5, colorkey = true } -- Turning off colorkeying also maintains the original pie chart's dimensions and shows the percentages
local thin_percent = { enabled = true, x = 1520, y = 1050, size = 6 }
local tall_pie = { enabled = true, x = 1490, y = 645, size = 5, colorkey = true }
local tall_percent = { enabled = true, x = 1520, y = 1050, size = 6 }

local stretched_measure = true



-- ==== KEYBINDS ====
-- resolution change actions
local thin = { key = "*-X", f3_safe = false }
local wide = { key = "*-G", f3_safe = false }
local tall = { key = "*-D", f3_safe = true }

-- startup actions
local launch_paceman_key = "Shift-P"
local toggle_fullscreen_key = "Shift-O"

-- during game actions
local toggle_ninbot_key = "*-apostrophe"
local toggle_remaps_key = "F8"


-- ==== MISC ====
local remaps_text_config = { text = "rebinds off", x = 1570, y = 1400, size = 2 }
local res_1440 = true
local sens_change = { enabled = true, normal = 1.33895881, tall = 0.09032536 } -- make sure raw input is off



















-- ======== EXPORT ========
return {
    bg_col = bg_col,
    primary_col = primary_col,
    ninbot_anchor = ninbot_anchor,
    ninbot_opacity = ninbot_opacity,
    res_1440 = res_1440,

    e_count = e_count,
    thin_pie = thin_pie,
    thin_percent = thin_percent,
    tall_pie = tall_pie,
    tall_percent = tall_percent,

    stretched_measure = stretched_measure,

    thin = thin,
    wide = wide,
    tall = tall,
    launch_paceman_key = launch_paceman_key,
    toggle_fullscreen_key = toggle_fullscreen_key,
    toggle_ninbot_key = toggle_ninbot_key,
    toggle_remaps_key = toggle_remaps_key,

    remaps_text_config = remaps_text_config,
    sens_change = sens_change,
}

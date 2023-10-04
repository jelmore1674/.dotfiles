local wezterm = require("wezterm")

wezterm.on('format-window-title', function()
	return "WezTermScratchPad"
end)

-- This table will hold the configuration.
local config = {}
local home = os.getenv("HOME") or os.getenv("HOMEPATH")
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
math.randomseed(os.time())
local ran = 3

config.term = "xterm-256color"
config.font_size = 18.0
config.enable_tab_bar = false
config.window_decorations = "TITLE|RESIZE"
config.colors = {
	cursor_bg = "#c7c7c7",
}
-- config.color_scheme = "iTerm2 Default"
config.background = {
	{
		source = {
			File = home .. "/.config/wezterm/background" .. ran .. ".png"
		},
		hsb = {
			hue = 0.99,
			saturation = 0.94,
			brightness = 0.1
		},
		horizontal_align = "Center",
		opacity = 0.76
	}
}

config.text_background_opacity = 0.7




-- and finally, return the configuration to wezterm
return config

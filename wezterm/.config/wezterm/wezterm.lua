-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This table will hold the configuration.
local config = {}
local home = os.getenv("HOME") or os.getenv("HOMEPATH")
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.term = "xterm-256color"
config.font_size = 18.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.colors = {
	cursor_bg = "#c7c7c7",
}
config.color_scheme = "iTerm2 Default"
config.window_background_image = home .. "/.config/wezterm/background.png"
config.window_background_opacity = 0.76
config.window_background_image_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 0.1,
}

config.text_background_opacity = 0.6

-- and finally, return the configuration to wezterm
return config

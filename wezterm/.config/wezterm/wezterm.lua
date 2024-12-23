-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local cache_dir = os.getenv("HOME") .. "/.cache/wezterm/"
local window_size_cache_path = cache_dir .. "window_size_cache.txt"
-- This table will hold the configuration.
local config = {}
local home = os.getenv("HOME") or os.getenv("HOMEPATH")
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("gui-startup", function()
	os.execute("mkdir " .. cache_dir)

	local window_size_cache_file = io.open(window_size_cache_path, "r")
	if window_size_cache_file ~= nil then
		_, _, width, height = string.find(window_size_cache_file:read(), "(%d+),(%d+)")
		mux.spawn_window({ width = tonumber(width), height = tonumber(height) })
		window_size_cache_file:close()
	else
		local tab, pane, window = mux.spawn_window({})
		window:gui_window():maximize()
	end
end)

-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "tokyonight"
-- config.color_scheme = "Moonfly (Gogh)"
-- config.color_scheme = home .. "/.config/wezterm/colors/moonfly.toml"
config.term = "xterm-256color"

config.font_size = 18.0
config.font = wezterm.font("JetBrains Mono")
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.colors = {
	cursor_bg = "#c7c7c7",
}

config.macos_window_background_blur = 40
-- config.color_scheme = "iTerm2 Default"
config.background = {
	{
		source = {
			File = home .. "/.config/wezterm/background.png",
		},
		hsb = {
			hue = 0.99,
			saturation = 0.94,
			brightness = 0.04,
		},
		horizontal_align = "Center",
		opacity = 1,
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- config.text_background_opacity = 0.7

-- and finally, return the configuration to wezterm
return config

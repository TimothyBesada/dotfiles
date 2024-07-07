-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
-- Font configuration
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 19

-- Window configuration
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.60
config.macos_window_background_blur = 100
config.window_padding = {
	bottom = 0,
	top = 12,
	left = 0,
	right = 0,
}

-- Key configuration
config.use_dead_keys = false
config.use_ime = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true


-- Return the configuration to wezterm
return config

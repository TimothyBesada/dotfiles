-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- -- Color scheme configuration
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#1E1E2E",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#706b4e",
-- 	selection_fg = "#f3d9c4",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }
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
	top = 10,
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

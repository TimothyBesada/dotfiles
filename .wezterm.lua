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
config.window_background_opacity = 0.98
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

config.adjust_window_size_when_changing_font_size = false

-- Function for zen mode
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = false
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- Return the configuration to wezterm
return config

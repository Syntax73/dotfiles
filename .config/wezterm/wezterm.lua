local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	font_size = 11,
	font = wezterm.font('JetBrainsMono Nerd Font'),
	default_cursor_style = "BlinkingBar",
	color_scheme = "Tokyo Night",
	window_decorations = "RESIZE",
	window_background_opacity = 0.9
}

return config

local wezterm = require("wezterm")

return {
	window_background_opacity = 0.70,
	macos_window_background_blur = 80,
	color_scheme = "Catppuccin Mocha",
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
}

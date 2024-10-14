local wezterm = require 'wezterm'
local b = require("utils.background")
local h = require("utils.helpers")
local assets = wezterm.config_dir .. "/assets"
local config = wezterm.config_builder()

return {
	-- color_scheme = 'terminal.sexy',
	color_scheme = 'Catppuccin Mocha',
	local fancy = false

	colors = {
		background = "#15141C"
	},

    enable_tab_bar = false,
    font_size = 13.0,
	-- font = wezterm.font('JetBrainsMono Nerd Font'),
	font = wezterm.font('JetBrains Mono'),
	line_height = 1.5,

	macos_window_background_blur = 30,
	window_background_opacity = 0.92,
	window_decorations = 'RESIZE',
	window_close_confirmation = "NeverPrompt",

	enable_scroll_bar = true,
	scrollback_lines = 10000,

	

	keys = {
		{
			key = 'f',
			mods = 'CMD|SHIFT',
			action = wezterm.action.ToggleFullScreen,
		},
	},

	mouse_bindings = {
	  -- Ctrl-click will open the link under the mouse cursor
	  {
	    event = { Up = { streak = 1, button = 'Left' } },
	    mods = 'CMD',
	    action = wezterm.action.OpenLinkAtMouseCursor,
	  },
	},
}

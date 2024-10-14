local wezterm = require 'wezterm'
local b = require("utils.background")
local h = require("utils.helpers")
local assets = wezterm.config_dir .. "/assets"
local config = wezterm.config_builder()

local fancy = true

config.color_scheme = 'Catppuccin Mocha'

config.colors = {
	background = "#15141C"
}

config.enable_tab_bar = false
config.font_size = 13.0
config.font = wezterm.font('JetBrains Mono')
config.line_height = 1.5

config.macos_window_background_blur = 30
config.window_background_opacity = 0.92
config.window_decorations = 'RESIZE'
config.window_close_confirmation = "NeverPrompt"

config.enable_scroll_bar = true
config.scrollback_lines = 10000

if fancy then
	config.background = {
		b.get_background(),
		b.get_animation(assets .. "/blob_blue.gif"),
	}
end


config.keys = {
	{
		key = 'f',
		mods = 'CMD|SHIFT',
		action = wezterm.action.ToggleFullScreen,
	},
}

config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
	event = { Up = { streak = 1, button = 'Left' } },
	mods = 'CMD',
	action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config

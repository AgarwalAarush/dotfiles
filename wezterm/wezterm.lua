local wezterm = require 'wezterm'
local b = require("utils.background")
local h = require("utils.helpers")
local assets = wezterm.config_dir .. "/assets"
local config = wezterm.config_builder()

local fancy = true
config.color_scheme = 'Catppuccin Latte'

config.colors = {
	background = "#FFF",
	tab_bar = {
		background = "#FFF",
	}
}

config.use_fancy_tab_bar = false

config.enable_tab_bar = false

config.font_size = 13.0
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.line_height = 1.5

config.macos_window_background_blur = 30
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.window_close_confirmation = "NeverPrompt"

config.enable_scroll_bar = true
config.scrollback_lines = 10000


config.leader = { key = 'Space', mods = 'CMD|SHIFT', timeout_milliseconds = 1000 }

config.keys = {
	{
		key = 'f',
		mods = 'LEADER',
		action = wezterm.action.ToggleFullScreen,
	},
    {
        key = 'd',
        mods = 'LEADER',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        key = 'z',
        mods = 'LEADER',
        action = wezterm.action.TogglePaneZoomState,
    },
    {
        key = 'v',
        mods = 'LEADER',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
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

config.ssh_domains = {
    {
        name = 'cmu_server',
        remote_address = 'unix.andrew.cmu.edu',
        username = 'aarusha',
    },
}

return config

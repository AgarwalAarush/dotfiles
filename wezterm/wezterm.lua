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
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.line_height = 1.5

config.window_padding = {
        left = 30,
        right = 10,
        top = 20,
        bottom = 10,
}

config.macos_window_background_blur = 50
config.window_background_opacity = 0.92
config.window_decorations = 'RESIZE'
config.window_close_confirmation = "NeverPrompt"

config.enable_scroll_bar = true
config.scrollback_lines = 10000

if fancy then
	config.background = {
        -- b.get_wallpaper(assets .. "/cosmic.jpg"),
        b.get_background();
		-- b.get_animation(assets .. "/blob_blue.gif"),
        b.get_animation(assets .. "/ai-speech.gif"),
	}
end

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

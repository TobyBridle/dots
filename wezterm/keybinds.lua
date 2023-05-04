local wezterm = require 'wezterm'

local function send_hash(window, pane)
	window:perform_action(wezterm.action.SendKey({ key = "#", mods = "" }), pane)
end

wezterm.on("SendKeyHash", function(window, pane)
	send_hash(window, pane)
end)

local M = {
	keys = {
    {
      mods = 'ALT',
      key = '[',
      action = wezterm.action.PromptInputLine {
        description = wezterm.format {
          { Attribute =  { Intensity = 'Bold' } },
          { Foreground = { AnsiColor = 'White' } },
          { Background = { AnsiColor = 'Fuchsia' } },
          { Text = "Enter new name for workspace" }
        },
        action = wezterm.action_callback(function(window, _, line)
          if line then
            wezterm.mux.rename_workspace(window:active_workspace(), line)
          end
      end)
    }
    },
    {
      mods = 'ALT',
      key = ']',
      action = wezterm.action.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" }
    },
    {
      mods = 'ALT',
      key = [[']],
      action = wezterm.action.SwitchToWorkspace
    },
    {
			mods = "ALT",
			key = [[\]],
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = [[|]],
			action = wezterm.action.SplitPane({
				top_level = true,
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			mods = "ALT",
			key = [[-]],
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		{
			mods = "ALT|SHIFT",
			key = [[_]],
			action = wezterm.action.SplitPane({
				top_level = true,
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "Q",
			mods = "ALT",
			action = wezterm.action({ CloseCurrentTab = { confirm = false } }),
		},
		{ key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "z", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
		{ key = "F11", mods = "", action = wezterm.action.ToggleFullScreen },
		{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
		{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
		{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
		{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },

		{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

		-- { key = "[", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		-- { key = "]", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		-- { key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
		-- { key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
		-- { key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },
		-- { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		-- { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "3", mods = "ALT", action = wezterm.action.EmitEvent("SendKeyHash") },
	},
}

return M

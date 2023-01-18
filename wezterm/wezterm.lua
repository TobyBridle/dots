local wezterm = require("wezterm")
-- local is_dark = wezterm.gui.get_appearance():find("Dark")
local is_dark = true

local function send_hash(window, pane)
	window:perform_action(wezterm.action.SendKey({ key = "#", mods = "" }), pane)
end

wezterm.on("SendKeyHash", function(window, pane)
	send_hash(window, pane)
end)

-- local function is_vi_process(pane)
-- 	return pane:get_foreground_process_name():find("n?vim") ~= nil
-- end
--
-- local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
-- 	if is_vi_process(pane) then
-- 		window:perform_action(wezterm.action.SendKey({ key = vim_direction, mods = "ALT" }), pane)
-- 	else
-- 		window:perform_action(wezterm.action.ActivatePaneDirection(pane_direction), pane)
-- 	end
-- end
--
-- wezterm.on("ActivatePaneDirection-right", function(window, pane)
-- 	conditional_activate_pane(window, pane, "Right", "l")
-- end)
-- wezterm.on("ActivatePaneDirection-left", function(window, pane)
-- 	conditional_activate_pane(window, pane, "Left", "h")
-- end)
-- wezterm.on("ActivatePaneDirection-up", function(window, pane)
-- 	conditional_activate_pane(window, pane, "Up", "k")
-- end)
-- wezterm.on("ActivatePaneDirection-down", function(window, pane)
-- 	conditional_activate_pane(window, pane, "Down", "j")
-- end)

local colorscheme = {
	foreground = "#D9E0EE",
	background = "#1A1826",

	cursor_bg = "#ABE9B3",
	cursor_fg = "#161320",

	selection_fg = "#C9CBFF",
	selection_bg = "#161320",

	split = "#1E1D2F",

	ansi = {
		"#45475a",
		"#f38ba8",
		"#a6e3a1",
		"#f9e2af",
		"#89b4fa",
		"#f5c2e7",
		"#94e2d5",
		"#bac2de",
	},
	brights = {
		"#585b70",
		"#f38ba8",
		"#a6e3a1",
		"#f9e2af",
		"#89b4fa",
		"#f5c2e7",
		"#94e2d5",
		"#a6adc8",
	},
}

colorscheme.tab_bar = {
	background = colorscheme.background,
	active_tab = {
		bg_color = colorscheme.background,
		fg_color = colorscheme.cursor_bg,
		intensity = "Bold",
		underline = "None",
		italic = false,
		strikethrough = false,
	},
	inactive_tab = {
		bg_color = colorscheme.background,
		fg_color = colorscheme.foreground,
	},
}
-- local catppuccin = {
-- 	dark = {
-- 		rosewater = "#F5E0DC",
-- 		flamingo = "#F2CDCD",
-- 		pink = "#F5C2E7",
-- 		mauve = "#CBA6F7",
-- 		red = "#F38BA8",
-- 		maroon = "#EBA0AC",
-- 		peach = "#FAB387",
-- 		yellow = "#F9E2AF",
-- 		green = "#A6E3A1",
-- 		teal = "#94E2D5",
-- 		sky = "#89DCEB",
-- 		sapphire = "#74C7EC",
-- 		blue = "#89B4FA",
-- 		lavender = "#B4BEFE",
--
-- 		text = "#CDD6F4",
-- 		subtext1 = "#BAC2DE",
-- 		subtext0 = "#A6ADC8",
-- 		overlay2 = "#9399B2",
-- 		overlay1 = "#7F849C",
-- 		overlay0 = "#6C7086",
-- 		surface2 = "#585B70",
-- 		surface1 = "#45475A",
-- 		surface0 = "#313244",
--
-- 		base = "#1E1E2E",
-- 		mantle = "#181825",
-- 		crust = "#11111B",
-- 	},
-- 	light = {
-- 		rosewater = "#dc8a78",
-- 		flamingo = "#DD7878",
-- 		pink = "#ea76cb",
-- 		mauve = "#8839EF",
-- 		red = "#D20F39",
-- 		maroon = "#E64553",
-- 		peach = "#FE640B",
-- 		yellow = "#df8e1d",
-- 		green = "#40A02B",
-- 		teal = "#179299",
-- 		sky = "#04A5E5",
-- 		sapphire = "#209FB5",
-- 		blue = "#1e66f5",
-- 		lavender = "#7287FD",
--
-- 		text = "#4C4F69",
-- 		subtext1 = "#5C5F77",
-- 		subtext0 = "#6C6F85",
-- 		overlay2 = "#7C7F93",
-- 		overlay1 = "#8C8FA1",
-- 		overlay0 = "#9CA0B0",
-- 		surface2 = "#ACB0BE",
-- 		surface1 = "#BCC0CC",
-- 		surface0 = "#CCD0DA",
--
-- 		base = "#FFFFFF",
-- 		mantle = "#E6E9EF",
-- 		crust = "#DCE0E8",
-- 	},
-- }

local function get_process(tab)
	local process_icons = {
		["docker"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["docker-compose"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["nvim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.custom_vim },
		},
		["vim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.dev_vim },
		},
		["node"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = wezterm.nerdfonts.mdi_hexagon },
		},
		["zsh"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_terminal },
		},
		["bash"] = {
			{ Foreground = { Color = colors.subtext0 } },
			{ Text = wezterm.nerdfonts.cod_terminal_bash },
		},
		["paru"] = {
			{ Foreground = { Color = colors.lavender } },
			{ Text = wezterm.nerdfonts.linux_archlinux },
		},
		["htop"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_chart_donut_variant },
		},
		["cargo"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_rust },
		},
		["go"] = {
			{ Foreground = { Color = colors.sapphire } },
			{ Text = wezterm.nerdfonts.mdi_language_go },
		},
		["lazydocker"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.linux_docker },
		},
		["git"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lazygit"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = wezterm.nerdfonts.dev_git },
		},
		["lua"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = wezterm.nerdfonts.seti_lua },
		},
		["wget"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_arrow_down_box },
		},
		["curl"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = wezterm.nerdfonts.mdi_flattr },
		},
		["gh"] = {
			{ Foreground = { Color = colors.mauve } },
			{ Text = wezterm.nerdfonts.dev_github_badge },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = colors.sky } }, { Text = string.format("[%s]", process_name) } }
	)
end

local function get_current_working_dir(tab)
	local current_dir = tab.active_pane.current_working_dir
	local HOME_DIR = string.format("file://%s", os.getenv("HOME"))

	return current_dir == HOME_DIR and "  ~"
		or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on("format-tab-title", function(tab)
	return wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = string.format(" %s  ", tab.tab_index + 1) },
		"ResetAttributes",
		{ Text = get_process(tab) },
		{ Text = " " },
		{ Text = get_current_working_dir(tab) },
		{ Foreground = { Color = colors.base } },
		{ Text = "  ▕" },
	})
end)

wezterm.on("update-right-status", function(window)
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.strftime(" %A, %d %B %Y %I:%M %p ") },
	}))
end)

return {
	font = wezterm.font_with_fallback({
		"MesloLGMDZ Nerd Font Mono",
		"Apple Color Emoji",
	}),
	font_size = 11.5,
	max_fps = 120,
	enable_wayland = false,
	pane_focus_follows_mouse = false,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = 1.225,
	window_decorations = "RESIZE",
	audible_bell = "Disabled",
	window_padding = {
		left = 60,
		right = 60,
		top = 60,
		bottom = 60,
	},
	initial_cols = 110,
	initial_rows = 25,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = is_dark and 0.85 or 0.95,
	},
	enable_scroll_bar = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = true,
	window_background_opacity = 1.0,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = true,
	disable_default_key_bindings = false,
	front_end = "WebGpu",
	colors = colorscheme,
	keys = {
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
			key = "n",
			mods = "ALT",
			action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
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

		{ key = "[", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "]", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "{", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "}", mods = "SHIFT|ALT", action = wezterm.action.MoveTabRelative(1) },
		{ key = "v", mods = "ALT", action = wezterm.action.ActivateCopyMode },
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },
		{ key = "3", mods = "ALT", action = wezterm.action.EmitEvent("SendKeyHash") },
	},
	-- enable_kitty_keyboard = true,
	send_composed_key_when_left_alt_is_pressed = true,
	dpi = 144.0,
	hyperlink_rules = {
		{
			regex = "\\b\\w+://[\\w.-]+:[0-9]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
			format = "$0",
		},
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = "mailto:$0",
		},
		{
			regex = [[\bfile://\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = "$0",
		},
		{
			regex = [[\b[tT](\d+)\b]],
			format = "https://example.com/tasks/?t=$1",
		},
	},
}

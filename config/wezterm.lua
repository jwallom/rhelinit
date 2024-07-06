-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- How many lines of scrollback you want to retain per tab
config.scrollback_lines = 5000

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Frappe"

-- Set the font I want
config.font = wezterm.font("DejaVuSansM Nerd Font Mono")
config.warn_about_missing_glyphs = false

-- and finally, return the configuration to wezterm
return config

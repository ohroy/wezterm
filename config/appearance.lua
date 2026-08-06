local wezterm = require("wezterm")
local gpu_adapters = require("utils.gpu_adapter")
local colors = require("colors.custom")

return {
   -- animation_fps = 60,
   max_fps = 240,
   -- WebGpu和 OpenGl， WebGpu更好，但是再windows上不支持亚克力。
   -- front_end = "WebGpu",
   -- 是否使用独显
   -- webgpu_power_preference = "HighPerformance",
   -- webgpu_preferred_adapter = gpu_adapters:pick_best(),

   color_scheme = "Catppuccin Mocha",
   window_background_opacity = 0.7,
   window_decorations = "RESIZE",
   win32_system_backdrop = "Acrylic",
   show_new_tab_button_in_tab_bar = true,
   -- scrollbar
   -- enable_scroll_bar = true,

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = true,
   tab_max_width = 25,
   show_tab_index_in_tab_bar = true,
   switch_to_last_active_tab_when_closing_tab = true,
   -- window
   window_padding = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10,
   },
   initial_rows = 40,
   initial_cols = 180,
   window_close_confirmation = "NeverPrompt",
   window_frame = {
      --active_titlebar_bg = "#090909",
      -- font = fonts.font,
      -- font_size = fonts.font_size,
   },
   inactive_pane_hsb = {
      saturation = 0.9,
      brightness = 0.65,
   },
}

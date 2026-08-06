local wezterm = require("wezterm")

function strip_home_name(text)
   clean_text = text:gsub("/home/roy", "~")
   return clean_text
end

wezterm.on("gui-startup", function(cmd)
   local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
   local gui_window = window:gui_window()

   -- 获取主屏幕的信息
   local screens = wezterm.gui.screens()
   local active_screen = screens.active or screens.main or screens.videomode

   if active_screen then
      -- 获取当前窗口的实际像素宽高
      local dimensions = gui_window:get_dimensions()
      local win_width = dimensions.pixel_width
      local win_height = dimensions.pixel_height

      -- 计算居中的坐标 (X, Y)
      local screen_width = active_screen.width
      local screen_height = active_screen.height
      local x = (screen_width - win_width) / 2
      local y = (screen_height - win_height) / 2

      -- 将窗口移动到正中间
      gui_window:set_position(x, y)
   end
end)

wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
   local zoomed = ""
   if tab.active_pane.is_zoomed then
      zoomed = "[Z] "
   end

   local index = ""
   if #tabs > 1 then
      index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
   end

   local clean_title = strip_home_name(tab.active_pane.title)
   return zoomed .. index .. clean_title
end)

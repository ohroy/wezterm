local wezterm = require('wezterm')
wezterm.on('gui-startup', function(cmd) -- set startup Window position
   local tab, pane, window = wezterm.mux.spawn_window(cmd or
      {
         position = {
            x = 400,
            y = 400,
            origin = 'ActiveScreen'
         }
      }
   )
end)

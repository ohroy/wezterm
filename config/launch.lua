local platform = require("utils.platform")()

local options = {
   launch_menu = {},
}

if platform.is_win then
   options.default_domain = "WSL:Ubuntu"
   -- 空数组 default_prog 会让 SpawnCommand 取不到 executable name 而 panic
   -- （config.rs:1479 expect("executable name")），导致分屏/新建 pane 闪退。
   -- WSL domain 使用自己的 shell，不受此项影响。
   options.default_prog = { "pwsh", "-NoLogo" }
   -- options.default_cwd = "~"
   options.launch_menu = {
      -- 显式指定 domain：省略时 SpawnCommand 默认用 CurrentPaneDomain，
      -- 而默认 pane 在 WSL 中，会导致 Windows 侧的 pwsh 找不到。
      { label = "wsl", domain = { DomainName = "WSL:Ubuntu" } },
      { label = "pwsh", args = { "pwsh", "-NoLogo" }, domain = { DomainName = "local" } },
   }
elseif platform.is_mac then
   options.default_prog = { "zsh", "-l" }
   options.launch_menu = {
      { label = "Bash", args = { "bash", "-l" } },
      { label = "Fish", args = { "/opt/homebrew/bin/fish", "-l" } },
      { label = "Nushell", args = { "/opt/homebrew/bin/nu", "-l" } },
      { label = "Zsh", args = { "zsh", "-l" } },
   }
elseif platform.is_linux then
   options.default_prog = { "fish", "-l" }
   options.launch_menu = {
      { label = "Bash", args = { "bash", "-l" } },
      { label = "Fish", args = { "fish", "-l" } },
      { label = "Zsh", args = { "zsh", "-l" } },
   }
end

return options

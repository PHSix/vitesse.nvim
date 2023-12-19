-- https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/theme.lua#L394

return function(_)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups

  c:group("AlphaButton", groups.Normal)
  c:group("AlphaButtons", groups.AlphaButton)
  c:group("AlphaShortcut", colors.orange)
  c:group("AlphaHeader", colors.primary)
  c:group("AlphaFooter", colors.blue)
end

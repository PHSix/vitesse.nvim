return function(opts, value)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups
  local normal = value.normal

  c:group("NoiceCmdlineIcon", colors.yellow)
  c:group("NoiceCmdlinePopup", colors.yellow)
  c:group("NoiceCmdlinePopupBorder", colors.yellow)
  c:group("NoiceLspProgressTitle", colors.activeForeground)
  c:group("NoiceLspProgressSpinner", colors.primary)
  c:group("NoiceLspProgressClient", colors.primary)
  c:group("NoiceFormatProgressTodo", colors.activeForeground)
  c:group("NoiceMini", colors.baseForeground)
  c:group("NoiceVirtualText", groups.Search)

  if not opts.transparent_float_background then
    c:group("NoiceMini", colors.baseForeground, normal.float_bg)
  end
end

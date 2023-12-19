-- NOTE: non tested
return function(_, value)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local styles = c.styles
  local normal = value.normal

  c:group("TabLine", colors.secondaryForeground, colors.black1, styles.NONE, colors.secondaryForeground)
  c:group("TabLineFill", colors.secondaryForeground, colors.black1)
  c:group("TabLineSel", colors.yellow, normal.bg)
  c:group("TabLineSeparatorSel", colors.cyan, colors.none)
end

return function(_)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups

  c:group("NeogitDiffAdd", groups.DiffAdd)
  c:group("NeogitDiffAddHighlight", groups.NeogitDiffAdd, colors.green)
  c:group("NeogitDiffDelete", groups.DiffDelete)
  c:group("NeogitDiffDeleteHighlight", groups.NeogitDiffDelete, colors.red)
  c:group("NeogitDiffContextHighlight", colors.baseForeground, colors.black1)

  c:group("NeogitHunkHeader", groups.Normal)
  c:group("NeogitHunkHeaderHighlight", groups.Normal)

  c:group("NeogitCommandText", groups.Normal)
  c:group("NeogitCommandTimeText", groups.Normal)
  c:group("NeogitCommandCodeNormal", groups.Normal)
  c:group("NeogitCommandCodeError", groups.Error)
end

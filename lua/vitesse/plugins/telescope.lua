return function(opts, value)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups
  local link = require("vitesse.utils").highlight_link
  local normal = value.normal

  c:group("TelescopeMatching", colors.orange, groups.Special, groups.Special, groups.Special)
  c:group("TelescopeBorder", groups.FloatBorder) -- float border not quite dark enough, maybe that needs to change?
  c:link("TelescopePromptBorder", groups.TelescopeBorder) -- active border lighter for clarity
  c:group("TelescopeTitle", groups.Normal) -- separate them from the border a little, but not make them pop
  c:group("TelescopePromptPrefix", groups.Normal) -- default is groups.Identifier
  c:link("TelescopeSelection", groups.CursorLine)
  c:group("TelescopeSelectionCaret", colors.cyan)

  if not opts.transparent_float_background then
    link("TelescopeNormal", "NormalFloat")
    c:group("TelescopeBorder", colors.none, colors.none)
    c:group("TelescopeSelection", colors.none, colors.activeBackground)
    if opts.telescope_border_follow_float_background then
      c:group("TelescopeBorder", normal.float_bg, normal.float_bg)
    end
  end
end

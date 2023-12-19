return function(_)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups

  c:group("NeoTreeFloatBorder", groups.FloatBorder)
  c:group("NeoTreeTitleBar", colors.baseBackground, colors.lowBorder)

  c:group("NeoTreeNormal", groups.Normal)
  c:group("NeoTreeNormalNC", groups.NormalNC)
  c:group("NeoTreeDimText", colors.secondaryForeground)

  c:group("NeoTreeFileIcon", groups.NeoTreeNormal)
  c:group("NeoTreeFileName", groups.NeoTreeNormal)
  c:group("NeoTreeFileNameNC", groups.NeoTreeNormalNC)
  c:group("NeoTreeDirectoryIcon", groups.Folder)
  c:group("NeoTreeDirectoryName", groups.NeoTreeFileName)
  c:group("NeoTreeDirectoryNameNC", groups.NeoTreeFileNameNC)
  c:group("NeoTreeDotfile", colors.comment)

  c:link("NeoTreeGitAdded", groups.DiffAdd)
  c:group("NeoTreeGitConflict", groups.Warn)
  c:link("NeoTreeGitDeleted", groups.DiffDelete)
  c:group("NeoTreeGitIgnored", groups.Ignore)
  c:link("NeoTreeGitModified", groups.DiffChange)
  c:group("NeoTreeGitUntracked", colors.cyan)
end

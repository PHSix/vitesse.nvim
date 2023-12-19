local c = require("vitesse.colorbuddy-like")
local colors = c.colors
local groups = c.groups
local styles = c.styles

c:group("NvimTreeFolderIcon", groups.Folder)
c:group("NvimTreeRootFolder", groups.FolderRoot)
c:group("NvimTreeImageFile", colors.orange)
c:group("NvimTreeSpecialFile", colors.orange, colors.none, styles.bold + styles.underline)

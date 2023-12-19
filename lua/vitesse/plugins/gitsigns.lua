-- automatically extend `diffview` by source code already

local c = require("vitesse.colorbuddy-like")
local groups = c.groups

c:group("GitSignsAdd", groups.DiffAdd)
c:group("GitSignsChange", groups.DiffChange)
c:group("GitSignsDelete", groups.DiffDelete)

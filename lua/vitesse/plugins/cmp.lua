local colors = require("colorbuddy.init").colors
local Group = require("colorbuddy.init").Group
local styles = require("colorbuddy.init").styles

Group.new("CmpItemKind", colors.green)
Group.new("CmpItemMenu", colors.secondaryForeground)
-- Group.new('CmpItemAbbr', colors.secondaryForeground, colors.none, styles.none)
-- Group.new('CmpItemAbbrMatch', colors.secondaryForeground, colors.none, styles.none)
Group.new('CmpItemAbbrMatch', colors.blue, colors.none, styles.none)
Group.new("CmpItemAbbrDeprecated", colors.secondaryForeground, colors.none, styles.strikethrough)
Group.new("CmpItemKindText", colors.white, colors.none, styles.none)
Group.new("CmpItemKindMethod", colors.green, colors.none, styles.none)
Group.new("CmpItemKindFunction", colors.blue, colors.none, styles.none)
Group.new("CmpItemKindConstructor", colors.orange, colors.none, styles.none)
Group.new("CmpItemKindField", colors.yellow, colors.none, styles.none)
Group.new("CmpItemKindVariable", colors.orange, colors.none, styles.none)
Group.new("CmpitemKindClass", colors.yellow, colors.none, styles.none)
Group.new("CmpItemKindInterface", colors.yellow, colors.none, styles.none)
Group.new("CmpItemKindModule", colors.green, colors.none, styles.none)
Group.new("CmpItemKindProperty", colors.green, colors.none, styles.none)
Group.new("CmpItemKindUnit", colors.orange, colors.none, styles.none)
Group.new("CmpItemKindValue", colors.cyan, colors.none, styles.none)
Group.new("CmpItemKindEnum", colors.yellow, colors.none, styles.none)
Group.new("CmpItemKindKeyword", colors.green, colors.none, styles.none)
Group.new("CmpItemKindSnippet", colors.magenta, colors.none, styles.none)
Group.new("CmpItemKindColor", colors.magenta, colors.none, styles.none)
Group.new("CmpItemKindFile", colors.purple6, colors.none, styles.none)
Group.new("CmpItemKindReference", colors.purple6, colors.none, styles.none)
Group.new("CmpItemKindFolder", colors.purple6, colors.none, styles.none)
Group.new("CmpItemKindEnumMember", colors.cyan, colors.none, styles.none)
Group.new("CmpItemKindConstant", colors.cyan, colors.none, styles.none)
Group.new("CmpItemKindStruct", colors.yellow, colors.none, styles.none)
Group.new("CmpItemKindEvent", colors.orange, colors.none, styles.none)
Group.new("CmpItemKindOperator", colors.cyan, colors.none, styles.none)
Group.new("CmpItemKindTypeParameter", colors.orange, colors.none, styles.none)

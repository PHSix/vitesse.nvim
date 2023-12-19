local c = require("vitesse.colorbuddy-like")
local colors = c.colors
local groups = c.groups
local styles = c.styles

c:group("SagaBorder", groups.FloatBorder)
c:group("CodeActionText", colors.yellow)
c:group("FinderSelection", colors.primary, colors.none, styles.bold)
c:group("RenameNormal", colors.variable)
c:link("DiagnosticErrorBorder", groups.Error)
c:link("DiagnosticWarnBorder", groups.Warn)
c:link("DiagnosticHintBorder", groups.Hint)
c:link("DiagnosticInfoBorder", groups.Info)
c:link("SagaWinbarSep", groups.Normal)

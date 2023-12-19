return function(_)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups
  local styles = c.styles
  local link = require("vitesse.utils").highlight_link

  c:group("@tag", colors.green)
  c:group("@tag.attribute", colors.property)
  c:group("@tag.delimiter", colors.punctuation)

  c:group("@none", colors.none)
  c:link("@comment", groups.Comment)
  c:link("@error", groups.Error)
  c:link("@preproc", groups.PreProc)
  c:link("@define", groups.Define)
  c:link("@operator", groups.Operator)

  c:group("@punctuation", colors.punctuation)
  c:link("@punctuation.delimiter", groups.Delimiter)
  c:group("@punctuation.bracket", colors.cyan)
  c:link("@punctuation.special", groups.Builtin)

  c:link("@string", groups.String)
  c:link("@string.regex", groups.Regex)
  c:link("@string.escape", groups.String)
  c:link("@string.special", groups.Special)

  c:link("@character", groups.Character)
  c:link("@character.special", groups.Special)

  c:link("@boolean", groups.Builtin)
  c:link("@number", groups.Number)
  c:link("@float", groups.Float)

  c:link("@function", groups.Function)
  c:link("@function.call", groups.Function)
  c:link("@function.builtin", groups.Function)
  c:link("@function.macro", groups.Macro)

  c:link("@method", groups.Function)
  c:link("@method.call", groups.Function)

  c:link("@constructor", groups.Function)

  link("@parameter", "@variable")

  c:link("@keyword", groups.Keyword)
  c:link("@keyword.function", groups.Operator)
  c:link("@keyword.operator", groups.Operator)
  c:link("@keyword.coroutine", groups.Operator)

  c:link("@conditional", groups.Conditional)
  c:link("@repeat", groups.Repeat)
  c:link("@debug", groups.Debug)
  c:link("@label", groups.Label)
  link("@include", "@keyword")
  c:link("@exception", groups.Exception)

  c:link("@type", groups.Type)
  c:link("@type.builtin", groups.Type)
  c:link("@type.qualifier", groups.Builtin)
  c:link("@type.definition", groups.Type)
  link("@type.javascript", "@variable")

  c:link("@storageclass", groups.Keyword)
  c:link("@attribute", groups.Function)
  link("@field", "@property")
  c:link("@property", groups.Property)

  c:group("@variable", colors.variable)
  c:link("@variable.builtin", groups.Variable)

  c:link("@constant", groups.Constant)
  c:link("@constant.builtin", groups.Constant)
  c:link("@constant.macro", groups.Constant)

  c:link("@namespace", groups.Namespace)
  c:link("@symbol", groups.Identifier)

  c:link("@text", groups.Normal)
  c:group("@text.strong", colors.baseForeground, colors.none, styles.bold)
  c:group("@text.emphasis", colors.white, colors.none, styles.bold)
  c:link("@text.underline", groups.Underlined)
  c:link("@text.strike", groups.Strikethrough)
  c:link("@text.title", groups.Title)
  c:link("@text.literal", groups.String)
  c:link("@text.uri", groups.Underlined)
  c:link("@text.math", groups.Special)
  c:link("@text.environment", groups.Macro)
  c:link("@text.environment.name", groups.Type)
  c:link("@text.reference", groups.String)
  c:link("@text.todo", groups.Todo)
  c:group("@text.note", colors.cyan)
  c:link("@text.warning", groups.Warn)
  c:group("@text.danger", groups.Error)

  -- filetypes

  -- tsx
  c:group("@constructor.tsx", colors.property)

  -- ecosystems

  -- treesitter-context
  c:link("TreesitterContext", groups.CursorLine)
end

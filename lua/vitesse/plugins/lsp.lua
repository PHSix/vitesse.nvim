return function(opts)
  local diagnostic_virtual_text_background = opts.diagnostic_virtual_text_background
  local c = require("vitesse.colorbuddy-like")

  local colors = c.colors
  local groups = c.groups
  local styles = c.styles
  local link = require("vitesse.utils").highlight_link

  -- diagnostics
  c:group("DiagnosticError", colors.Error)
  c:group("DiagnosticWarn", colors.Warn)
  c:group("DiagnosticInfo", colors.Info)
  c:group("DiagnosticHint", colors.Hint)
  -- NOTE: `styles.strikethrough` not working
  c:group("DiagnosticDeprecated", groups.Comment, colors.none, styles.italic)
  c:group("DiagnosticUnderlineError", colors.none, colors.none, styles.underline)
  c:group("DiagnosticUnderlineWarn", colors.none, colors.none, styles.underline)
  c:group("DiagnosticUnderlineInfo", colors.none, colors.none, styles.underline)
  c:group("DiagnosticUnderlineHint", colors.none, colors.none, styles.underline)

  c:link("DiagnosticVirtualTextError", groups.DiagnosticError)
  c:link("DiagnosticVirtualTextWarn", groups.DiagnosticWarn)
  c:link("DiagnosticVirtualTextInfo", groups.DiagnosticInfo)
  c:link("DiagnosticVirtualTextHint", groups.DiagnosticHint)
  if diagnostic_virtual_text_background then
    -- NOTE:dark caller
    c:group("DiagnosticVirtualTextError", groups.DiagnosticVirtualTextError, colors.Error)
    c:group("DiagnosticVirtualTextWarn", groups.DiagnosticVirtualTextWarn, colors.Warn)
    c:group("DiagnosticVirtualTextInfo", groups.DiagnosticVirtualTextInfo, colors.Info)
    c:group("DiagnosticVirtualTextHint", groups.DiagnosticVirtualTextHint, colors.Hint)
  end

  c:link("DiagnosticTextWarn", groups.Warn)

  -- lsp
  c:group("LspReferenceRead", colors.none, colors.none, styles.underline)
  c:link("LspReferenceText", groups.LspReferenceRead)
  c:group("LspReferenceWrite", colors.none, colors.none, styles.underline)
  c:group("LspFloatWinBorder", colors.primary)
  c:group("LspLinesDiagBorder", colors.primary)
  c:group("LspCodeLens", groups.Comment) -- lsp hint text, cmp
  c:group("LspInfoBorder", groups.FloatBorder)

  -- lsp semantic tokens
  link("@lsp.type.comment", "@comment")
  link("@lsp.type.enum", "@type")
  link("@lsp.type.macro", "@constant")
  link("@lsp.type.parameter", "@parameter")
  link("@lsp.type.variable", "@variable")
  link("@lsp.type.namespace", "@namespace")
  link("@lsp.type.property", "@property")
  link("@lsp.type.type", "@type")
  link("@lsp.type.operator", "@operator")
  link("@lsp.type.escapeSequence", "@string.escape")
  link("@lsp.type.formatSpecifier", "@punctuation.special")
  link("@lsp.type.selfKeyword", "@variable.builtin")
  link("@lsp.typemod.enum.defaultLibrary", "@type.builtin")
  link("@lsp.typemod.enumMember.defaultLibrary", "@constant.builtin")
  link("@lsp.typemod.function.defaultLibrary", "@function.builtin")
end

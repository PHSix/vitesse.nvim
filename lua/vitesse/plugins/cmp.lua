return function(opts)
  local c = require("vitesse.colorbuddy-like")
  local colors = c.colors
  local groups = c.groups
  local styles = c.styles
  local link = require("vitesse.utils").highlight_link

  c:color("codeium", "#09B6A2")

  c:group("CmpItemKind", colors.green)
  c:group("CmpItemMenu", colors.secondaryForeground)
  -- c:group('CmpItemAbbr', colors.secondaryForeground, colors.none, styles.none)
  -- c:group('CmpItemAbbrMatch', colors.secondaryForeground, colors.none, styles.none)
  c:group("CmpItemAbbrMatch", colors.blue, colors.none, styles.none)
  c:group("CmpItemAbbrMatchFuzzy", groups.CmpItemAbbrMatch)
  c:group("CmpItemAbbrDeprecated", groups.DiagnosticDeprecated, colors.none, styles.strikethrough)
  c:group("CmpItemKindModule", colors.green, colors.none, styles.none)
  c:group("CmpItemKindUnit", colors.orange, colors.none, styles.none)
  c:group("CmpItemKindValue", colors.cyan, colors.none, styles.none)
  c:group("CmpItemKindEnum", colors.yellow, colors.none, styles.none)
  c:group("CmpItemKindSnippet", colors.magenta, colors.none, styles.none)
  c:group("CmpItemKindColor", colors.magenta, colors.none, styles.none)
  c:group("CmpItemKindFile", colors.purple6, colors.none, styles.none)
  c:group("CmpItemKindFolder", colors.purple6, colors.none, styles.none)
  c:group("CmpItemKindStruct", colors.yellow, colors.none, styles.none)
  c:group("CmpItemKindEvent", colors.orange, colors.none, styles.none)
  c:group("CmpItemKindCodeium", colors.codeium, colors.none, styles.none)
  c:group("CmpItemKindDefault", colors.blue, colors.none, styles.none)

  link("CmpItemKindText", "@text")
  link("CmpItemKindMethod", "@method")
  link("CmpItemKindFunction", "@function")
  link("CmpItemKindConstructor", "@constructor")
  link("CmpItemKindField", "@field")
  link("CmpItemKindVariable", "@variable")
  link("CmpitemKindClass", "@class")
  link("CmpItemKindInterface", "@interface")
  link("CmpItemKindProperty", "@property")
  link("CmpItemKindKeyword", "@keyword")
  link("CmpItemKindReference", "@text.reference")
  link("CmpItemKindEnumMember", "@type")
  link("CmpItemKindConstant", "@constant")
  link("CmpItemKindOperator", "@operator")
  link("CmpItemKindTypeParameter", "@type")

  if opts.cmp_cmdline_disable_search_highlight_group then
    local group = vim.api.nvim_create_augroup("vitesse_cmp_cmdline_disable_search_highlight_group", { clear = true })

    vim.api.nvim_create_autocmd("CmdlineEnter", {
      pattern = "*",
      group = group,
      callback = function()
        c:group("Search", colors.none, colors.none, styles.none)
      end,
    })

    vim.api.nvim_create_autocmd("CmdlineLeave", {
      pattern = "*",
      group = group,
      callback = function()
        -- init.lua
        c:group("Search", colors.yellow, colors.none, styles.reverse)
      end,
    })
  end
end

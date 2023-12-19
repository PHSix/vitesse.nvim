local vitesse_colors = require("vitesse.palette").colors
local vitesse_themes = require("vitesse.palette").themes

local cmd = vim.cmd
local fn = vim.fn

-- merged opts, defaults <- user_opts
local opts = {}
local defaults = {
  comment_italics = true,
  transparent_background = true,
  transparent_float_background = true,
  reverse_visual = false,
  dim_nc = false,
  cmp_cmdline_disable_search_highlight_group = false,
  telescope_border_follow_float_background = false,
  diagnostic_virtual_text_background = false,
  colors = {}, -- override `vitesse_colors`
  themes = {}, -- override `vitesse_themes`
}

local M = {}

function M.setup(user_opts)
  user_opts = user_opts or {}
  opts = vim.tbl_extend("force", defaults, user_opts)
  vitesse_colors = vim.tbl_extend("force", vitesse_colors, opts.colors)
  vitesse_themes = vim.tbl_extend("force", vitesse_themes, opts.themes)
end

function M.load()
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if fn.exists("syntax_on") then
    cmd("syntax reset")
  end

  vim.g.colors_name = "vitesse"
  local c = require("vitesse.colorbuddy-like")

  local colors = c.colors
  local groups = c.groups
  local styles = c.styles

  c:color("bg", vitesse_themes.background)

  c:color("black", vitesse_colors.black)
  c:color("black1", vitesse_colors.black1)
  c:color("black2", vitesse_colors.black2)
  c:color("black3", vitesse_colors.black3)
  c:color("white3", vitesse_colors.white3)
  c:color("white2", vitesse_colors.white2)
  c:color("white1", vitesse_colors.white1)
  c:color("white", vitesse_colors.white)
  c:color("purple6", vitesse_colors.purple6)

  c:color("primary", vitesse_themes.primary)

  c:color("baseForeground", vitesse_themes.foreground)
  c:color("activeForeground", vitesse_themes.activeForeground)
  c:color("secondaryForeground", vitesse_themes.secondaryForeground)
  c:color("ignored", vitesse_themes.ignored)
  c:color("border", vitesse_themes.border)

  c:color("baseBackground", vitesse_themes.background)
  c:color("activeBackground", vitesse_themes.activeBackground)

  c:color("lowBackground", vitesse_themes.lowBackground)
  c:color("lowActiveBackground", vitesse_themes.lowActiveBackground)
  c:color("lowBorder", vitesse_themes.lowBorder)

  c:color("comment", vitesse_themes.comment)
  c:color("string", vitesse_themes.string)
  c:color("variable", vitesse_themes.variable)
  c:color("keyword", vitesse_themes.keyword)
  c:color("number", vitesse_themes.number)
  c:color("boolean", vitesse_themes.boolean)
  c:color("operator", vitesse_themes.operator)
  c:color("func", vitesse_themes.func)
  c:color("constant", vitesse_themes.constant)
  c:color("class", vitesse_themes.class)
  c:color("interface", vitesse_themes.interface)
  c:color("type", vitesse_themes.type)
  c:color("builtin", vitesse_themes.builtin)
  c:color("property", vitesse_themes.property)
  c:color("namespace", vitesse_themes.namespace)
  c:color("punctuation", vitesse_themes.punctuation)
  c:color("decorator", vitesse_themes.decorator)
  c:color("regex", vitesse_themes.regex)

  c:group("Comment", colors.comment, colors.none, opts.comment_italics and styles.italic or styles.NONE)
  c:group("String", colors.string)
  c:group("Variable", colors.variable)
  c:group("Keyword", colors.keyword)
  c:group("Number", colors.number)
  c:group("Boolean", colors.boolean)
  c:group("Operator", colors.operator)
  c:group("Function", colors.func)
  c:group("Constant", colors.constant)
  c:group("Class", colors.class)
  c:group("Interface", colors.interface)
  c:group("Type", colors.type)
  c:group("Builtin", colors.builtin)
  c:group("Property", colors.property)
  c:group("Namespace", colors.namespace)
  c:group("Punctuation", colors.punctuation)
  c:group("Decorator", colors.decorator)
  c:group("Regex", colors.regex)

  c:color("green", vitesse_themes.green)
  c:color("cyan", vitesse_themes.cyan)
  c:color("blue", vitesse_themes.blue)
  c:color("red", vitesse_themes.red)
  c:color("orange", vitesse_themes.orange)
  c:color("yellow", vitesse_themes.yellow)
  c:color("magenta", vitesse_themes.magenta)

  c:color("Error", vitesse_themes.red)
  c:color("Warn", vitesse_themes.yellow)
  c:color("Info", vitesse_themes.blue)
  c:color("Hint", vitesse_themes.cyan)

  c:group("Error", colors.Error)
  c:group("Warn", colors.Warn)
  c:group("Info", colors.Info)
  c:group("Hint", colors.Hint)

  local normal = {
    fg = colors.baseForeground,
    bg = colors.baseBackground,
    nc_fg = colors.baseForeground,
    float_bg = colors.lowActiveBackground,
  }

  if opts.transparent_background then
    normal.bg = colors.none
  end
  if opts.transparent_float_background then
    normal.float_bg = colors.none
  end
  if opts.dim_nc then
    normal.nc_fg = colors.secondaryForeground
  end
  c:group("Normal", normal.fg, normal.bg)
  -- normal non-current text, means non-focus window text
  c:group("NormalNC", normal.nc_fg, normal.bg)

  -- pum (popup menu) float
  c:group("Pmenu", groups.Normal, normal.float_bg) -- popup menu normal item
  c:group("PmenuSel", colors.activeBackground, normal.fg, styles.reverse) -- selected item
  c:group("PmenuSbar", colors.black1, colors.none, styles.reverse)
  c:group("PmenuThumb", colors.black2, colors.none, styles.reverse)

  -- be nice for this float border to be cyan if active
  c:group("FloatBorder", colors.lowBorder)

  c:group("LineNr", colors.ignored, colors.none, styles.NONE)
  c:group("CursorLine", colors.none, colors.lowActiveBackground, styles.NONE)
  c:group("CursorLineNr", colors.activeForeground, colors.none, styles.NONE)
  c:group("Cursor", colors.black3, colors.secondaryForeground, styles.NONE)
  c:link("lCursor", groups.Cursor)
  c:link("TermCursor", groups.Cursor)
  c:group("TermCursorNC", colors.black3, colors.activeBackground)

  c:link("Identifier", groups.Property)

  -- any statement, conditional, repeat (for, do while), label, operator
  c:group("Statement", colors.green)
  c:group("PreProc", colors.red) -- was orange
  c:group("Special", colors.property) -- was red
  c:group("SpecialKey", colors.property)
  c:group("Underlined", colors.red)
  c:group("Strikethrough", colors.activeBackground, colors.none, styles.strikethrough)
  c:group("Ignore", groups.Comment)
  c:group("Todo", colors.blue)

  c:link("Include", groups.PreProc)
  c:link("Macro", groups.PreProc)
  c:link("Delimiter", groups.Special)
  c:link("Repeat", groups.Statement)
  c:link("Conditional", groups.Statement)
  c:link("Define", groups.PreProc)
  c:link("Character", groups.Constant)
  c:link("Float", groups.Constant)
  c:link("Debug", groups.Special)
  c:link("Label", groups.Statement)
  c:link("Exception", groups.Statement)
  c:link("StorageClass", groups.Type)

  c:link("SpecialChar", groups.Special)
  c:group("SpecialKey", colors.black3, colors.black1, styles.bold)
  c:link("String", groups.String)
  c:group("NonText", colors.black3, colors.none, styles.bold)
  c:group("StatusLine", colors.lowBackground, colors.black1, styles.reverse)
  c:group("StatusLineNC", colors.lowActiveBackground, colors.black1, styles.reverse)
  c:group("Visual", colors.none, colors.black3, opts.reverse_visual and styles.reverse or styles.none)
  c:group("Directory", colors.blue)
  c:group("ErrorMsg", colors.red, colors.none, styles.reverse)

  c:group("IncSearch", colors.orange, colors.none, styles.standout)
  c:group("Search", colors.yellow, colors.none, styles.reverse)

  c:group("MoreMsg", colors.blue, colors.none, styles.NONE)
  c:group("ModeMsg", colors.blue, colors.none, styles.NONE)
  c:group("Question", colors.cyan, colors.none, styles.bold)
  c:group("VertSplit", colors.black3, colors.none, styles.NONE)
  c:group("Title", colors.orange, colors.none, styles.bold)
  c:group("VisualNOS", colors.none, colors.black1, styles.reverse)
  c:group("WarningMsg", groups.Warn)
  c:group("WildMenu", colors.baseForeground, colors.black1, styles.reverse)
  c:group("Folded", colors.secondaryForeground, colors.black1, styles.bold, colors.black3)
  c:group("FoldColumn", colors.secondaryForeground, colors.black1)

  c:group("SignColumn", colors.secondaryForeground, colors.none, styles.NONE)
  c:group("Conceal", colors.blue, colors.none, styles.NONE)

  c:group("SpellBad", colors.none, colors.none, styles.undercurl, colors.red)
  c:group("SpellCap", colors.none, colors.none, styles.undercurl, colors.purple6)
  c:group("SpellRare", colors.none, colors.none, styles.undercurl, colors.cyan)
  c:group("SpellLocal", colors.none, colors.none, styles.undercurl, colors.yellow)

  c:group("MatchParen", colors.red, colors.activeBackground, styles.bold)

  -- vim highlighting
  c:link("vimVar", groups.Identifier)
  c:link("vimFunc", groups.Identifier)
  c:link("vimUserFunc", groups.Identifier)
  c:link("helpSpecial", groups.Special)
  c:link("vimSet", groups.Normal)
  c:link("vimSetEqual", groups.Normal)
  c:group("vimCommentString", colors.purple6)
  c:group("vimCommand", colors.yellow)
  c:group("vimCmdSep", colors.blue, colors.NONE, styles.bold)
  c:group("helpExample", colors.baseForeground)
  c:group("helpOption", colors.cyan)
  c:group("helpNote", colors.magenta)
  c:group("helpVim", colors.magenta)
  c:group("helpHyperTextJump", colors.blue, colors.NONE, styles.underline)
  c:group("helpHyperTextEntry", colors.green)
  c:group("vimIsCommand", colors.black3)
  c:group("vimSynMtchOpt", colors.yellow)
  c:group("vimSynType", colors.cyan)
  c:group("vimHiLink", colors.blue)
  c:group("vimGroup", colors.blue, colors.NONE, styles.underline)

  -- diff
  c:group("DiffAdd", colors.green, colors.none, styles.bold, colors.green)
  c:group("DiffChange", colors.orange, colors.none, styles.bold, colors.orange)
  c:group("DiffDelete", colors.red, colors.none, styles.bold, colors.red)
  c:group("DiffText", colors.blue, colors.none, styles.bold, colors.blue)

  -- alias ui
  c:group("Folder", colors.orange)
  c:group("FolderRoot", colors.blue)

  -- -- plugins

  -- treesitter, important
  require("vitesse.plugins.treesitter")(opts)
  -- lsp
  require("vitesse.plugins.lsp")(opts)
  -- neomake
  -- require("vitesse.plugins.neomake")
  -- gitgutter
  require("vitesse.plugins.gitgutter")
  -- gitsigns
  require("vitesse.plugins.gitsigns")
  -- cmp
  require("vitesse.plugins.cmp")(opts)
  -- lspsaga
  require("vitesse.plugins.lspsaga")
  -- telescope
  require("vitesse.plugins.telescope")(opts, { normal = normal })
  -- neogit
  -- require("vitesse.plugins.neogit")(opts)
  -- Primeagen/harpoon
  -- require("vitesse.plugins.harpoon")
  -- nvim-tree/nvim-tree.lua
  -- require("vitesse.plugins.nvim-tree")
  -- phaazon/hop.nvim
  -- require("vitesse.plugins.hop")
  -- j-hui/fidget
  require("vitesse.plugins.fidget")
  -- lukas-reineke/indent-blankline.nvim
  -- require("vitesse.plugins.indent-blankline")
  -- folke/which-key.nvim
  -- require("vitesse.plugins.which-key")
  -- folke/noice.nvim
  -- require("vitesse.plugins.noice")(opts, { normal = normal })
  -- neo-tree
  require("vitesse.plugins.neo-tree")(opts)
  -- alpha
  -- require("vitesse.plugins.alpha")(opts)
  -- echasnovski/mini.indentscope
  require("vitesse.plugins.mini-indentscope")(opts)
  -- vim-illuminate
  -- require("vitesse.plugins.illuminate")(opts)
  -- seblj/nvim-tabline
  -- require("vitesse.plugins.tabline")(opts, { normal = normal })

  c:bootstrap()
  return M
end

return M

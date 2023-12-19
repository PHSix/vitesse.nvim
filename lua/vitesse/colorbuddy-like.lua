---@class ColorBuddyLike
---@field colors table<string, string>
---@field groups table<string, string[]>
---@field links table<string, any>
---@field s table<'blod'>
local M = {
  styles = {
    bold = "bold",
    underline = "underline",
    undercurl = "undercurl",
    strikethrough = "strikethrough",
    reverse = "reverse",
    inverse = "inverse",
    italic = "italic",
    standout = "standout",
    nocombine = "nocombine",
    NONE = "NONE",
  },
}

---@return ColorBuddyLike
function M.new()
  return setmetatable({
    colors = {
      none = "none",
      gray0 = "gray0",
      gray1 = "gray1",
      gray2 = "gray2",
      gray3 = "gray3",
      gray4 = "gray4",
      gray5 = "gray5",
      gray6 = "gray6",
      gray7 = "gray7",
    },
    groups = setmetatable({
      store = {},
    }, {
      __index = function(t, k)
        if t.store[k] ~= nil then
          return t.store[k]
        end

        return { group_name = k }
      end,
      __newindex = function(t, k, v)
        if type(v) == "table" then
          v.group_name = k
        end
        t.store[k] = v
      end,
    }),
    links = {},
  }, { __index = M })
end

---create a color map
---@param self ColorBuddyLike
---@param name string
---@param value string
function M:color(name, value)
  self.colors[name] = value
end

function M:group(name, ...)
  local info = { ... }
  for key, value in ipairs(info) do
    if type(value) == "table" then
      info[key] = value[key]
    end
  end
  self.groups[name] = info
end

function M:link(from, to)
  self.links[from] = to
end

function M:bootstrap()
  local cmds = {}
  for group_name, group in pairs(self.groups.store) do
    local guifg, guibg, gui = group[1], group[2], group[3]
    local cmd = string.format("hi %s ", group_name)

    if guifg ~= nil then
      cmd = cmd .. string.format("guifg=%s ", guifg)
    end

    if guibg ~= nil then
      cmd = cmd .. string.format("guibg=%s ", guibg)
    end

    if gui ~= nil then
      cmd = cmd .. string.format("gui=%s ", gui)
    end

    table.insert(cmds, cmd)
  end

  for link_name, group in pairs(self.links) do
    local cmd = string.format("hi link %s %s", link_name, group.group_name)
    table.insert(cmds, cmd)
  end

  for _, cmd in ipairs(cmds) do
    vim.cmd(cmd)
  end
end

return M.new()

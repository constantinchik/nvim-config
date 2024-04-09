local M = {
  commands = {},
}

M.icons_func = function(config, node, state)
  local highlights = require("neo-tree.ui.highlights")
  local icon = config.default or " "
  local padding = config.padding or " "
  local highlight = config.highlight or highlights.FILE_ICON

  if node.type == "directory" then
    highlight = highlights.DIRECTORY_ICON
    if node:is_expanded() then
      icon = config.folder_open or "-"
    else
      icon = config.folder_closed or "+"
    end
  elseif node.type == "file" then
    local success, web_devicons = pcall(require, "nvim-web-devicons")
    if vim.endswith(node.name, ".module.ts") then
      icon = ""
      -- highlight = "#f38ba8"
      highlight = "NeoTreeGitUnstaged"
    elseif vim.endswith(node.name, ".component.ts") then
      icon = ""
      -- highlight = "#89b4fa"
      highlight = "NeoTreeFileIcon"
    elseif vim.endswith(node.name, ".service.ts") then
      icon = ""
      -- highlight = "#f9e2af"
      highlight = "NeoTreeModified"
    elseif vim.endswith(node.name, ".resolver.ts") then
      icon = ""
      -- highlight = "#A6E3A1"
      highlight = "NeoTreeGitStaged"
    elseif success then
      local devicon, hl = web_devicons.get_icon(node.name, node.ext)
      icon = devicon or icon
      highlight = hl or highlight
    end
  end
  return {
    text = icon .. padding,
    highlight = highlight,
  }
end

M.commands.system_open = function(state)
  local node = state.tree:get_node()
  local path = node:get_id()
  -- macOs: open file in default application in the background.
  vim.fn.jobstart({ "xdg-open", "-g", path }, { detach = true })
  -- Linux: open file in default application
  vim.fn.jobstart({ "xdg-open", path }, { detach = true })
end

M.commands.diff_files = function(state)
  local node = state.tree:get_node()
  local log = require("neo-tree.log")
  state.clipboard = state.clipboard or {}
  if diff_Node and diff_Node ~= tostring(node.id) then
    local current_Diff = node.id
    require("neo-tree.utils").open_file(state, diff_Node, open)
    vim.cmd("vert diffs " .. current_Diff)
    log.info("Diffing " .. diff_Name .. " against " .. node.name)
    diff_Node = nil
    current_Diff = nil
    state.clipboard = {}
    require("neo-tree.ui.renderer").redraw(state)
  else
    local existing = state.clipboard[node.id]
    if existing and existing.action == "diff" then
      state.clipboard[node.id] = nil
      diff_Node = nil
      require("neo-tree.ui.renderer").redraw(state)
    else
      state.clipboard[node.id] = { action = "diff", node = node }
      diff_Name = state.clipboard[node.id].node.name
      diff_Node = tostring(state.clipboard[node.id].node.id)
      log.info("Diff source file " .. diff_Name)
      require("neo-tree.ui.renderer").redraw(state)
    end
  end
end

M.commands.show_git_diff = function(state)
  -- some variables. use any if you want
  local node = state.tree:get_node()
  -- local abs_path = node.path
  -- local rel_path = vim.fn.fnamemodify(abs_path, ":~:.")
  -- local file_name = node.name
  local is_file = node.type == "file"

  if not is_file then
    vim.notify("Diff only for files", vim.log.levels.ERROR)
    return
  end

  -- Open the file in the current window
  local cc = require("neo-tree.sources.common.commands")
  cc.open(state, function()
    -- Do nothing for dirs
  end)

  if vim.fn.exists(":Gvdiffsplit") == 2 then
    -- Try execute fugitive diffthis on the current file
    vim.cmd([[Gvdiffsplit]])
    require("neo-tree.command").execute({ action = "close" })
  elseif vim.fn.exists(":Gitsigns") == 2 then
    -- Try execute Gitsigns diffthis on the current file
    vim.cmd("lua require('gitsigns').diffthis()") -- BUG: This works bad
  else
    vim.notify("Neither Fugitive nor Gitsigns are installed. Diff is not supported.", vim.log.levels.ERROR)
  end
end

M.commands.git_unstage_all = function(state)
  if vim.fn.exists(":Git") == 2 then
    vim.cmd("Git reset")
  end
end

return M

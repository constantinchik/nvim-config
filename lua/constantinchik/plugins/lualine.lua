return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- Load helpers
    local copilot_status = require("constantinchik.helpers.copilot").get_status

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          copilot_status,
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
      extensions = { "neo-tree", "fugitive", "fzf", "lazy", "mason", "nvim-dap-ui" },
    })
    -- Set lualine to show statusline in full width
    vim.o.laststatus = 3
  end,
}

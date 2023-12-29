vim.opt.termguicolors = true

return {
  "akinsho/bufferline.nvim",
  after = "catppuccin",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
    { "<Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<S-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  },
  opts = {
    options = {
      mode = "tabs",
      diagnostics = "nvim_lsp",
      separator_style = "thick",
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true, -- use a "true" to enable the default, or set your own character
        },
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          separator = true, -- use a "true" to enable the default, or set your own character
        },
      },
      -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
    },
  },
}

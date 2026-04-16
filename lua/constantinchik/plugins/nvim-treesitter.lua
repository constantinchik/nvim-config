return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Ensure parsers are installed
    local parsers = {
      "json",
      "javascript",
      "typescript",
      "angular",
      "yaml",
      "html",
      "css",
      "scss",
      "markdown",
      "markdown_inline",
      "svelte",
      "tsx",
      "vim",
      "dockerfile",
      "gitignore",
      "lua",
      "rust",
      "vimdoc",
      "query",
      "c",
    }

    local installed = require("nvim-treesitter").get_installed()
    local to_install = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end

    -- Enable treesitter-based highlighting and indentation
    vim.treesitter.start = vim.treesitter.start or function() end
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}

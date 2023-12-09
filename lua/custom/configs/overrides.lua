local M = {}

M.treesitter = {
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "scss",
    "markdown",
    "markdown_inline",
    "svelte",
    "vim",
    "dockerfile",
    "gitignore",
    "c",
    "lua",
    "rust",
    "vimdoc",
    "query",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

M.mason = {
  ensure_installed = {
    -- python stuff
    "python-lsp-server",
    "pyright",
    "isort",
    "black",
    "pylint",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "eslint_d",
    "tailwindcss-language-server",
    "svelte-language-server",
    "angular-language-server",
    "stylelint-lsp",
    "eslint-lsp",
    "stylelint",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust stuff
    "rust-analyzer",

    -- sql stuff
    "sqlls",
  },
  ui = {
    icons = {
      -- package_installed = "✓",
      -- package_pending = "➜",
      -- package_uninstalled = "✗",
    },
  },
}

M.nvimtree = {
  view = {
    width = 50,
  },

  git = {
    enable = true,
    ignore = false,
  },

  actions = {
    open_file = {
      resize_window = false,
    },
  },

  renderer = {
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },

  filters = {
    custom = { ".DS_Store" },
  },
}

M.telescope = {
  defaults = {
    prompt_prefix = "   ",
  },
}

M.telescope_undo = {
  extensions = {
    undo = {
      side_by_side = true,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
    },
  },
}

return M

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
          package_installed = "󰄳 ", -- "✓"
          package_pending = " ", -- "➜"
          package_uninstalled = " ✗", -- " 󰚌"
        },
        keymaps = {
          toggle_server_expand = "<CR>",
          install_server = "i",
          update_server = "u",
          check_server_version = "c",
          update_all_servers = "U",
          check_outdated_servers = "C",
          uninstall_server = "X",
          cancel_installation = "<C-c>",
        },
      },
      max_concurrent_installers = 10,
    })

    mason.setup({
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
    })

    mason_lspconfig.setup({
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })
  end,
}

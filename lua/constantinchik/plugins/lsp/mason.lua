return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

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

    mason_lspconfig.setup({
      ensure_installed = {
        "pylsp",
        "pyright",
        "lua_ls",
        "cssls",
        "html",
        "tsserver",
        "tailwindcss",
        "svelte",
        "angularls",
        "stylelint_lsp",
        "eslint",
        "emmet_ls",
        "clangd",
        "rust_analyzer",
        "sqlls",
        "bashls",
        "ruby_lsp",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- python stuff
        "isort",
        "black",
        "pylint",
        "debugpy",

        -- lua stuff
        "stylua",

        -- web dev stuff
        "prettier",
        "eslint_d",
        "stylelint",
        "js-debug-adapter",
        "chrome-debug-adapter",

        -- c/cpp stuff
        "clang-format",

        -- scripting stuff
        "bash-debug-adapter",
      },
    })
  end,
}

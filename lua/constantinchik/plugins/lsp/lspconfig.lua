return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "LSP declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "LSP definition"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "LSP hover"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "LSP implementation"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "LSP signature help"
      keymap.set("n", "<leader>ls", function()
        vim.lsp.buf.signature_help()
      end, opts)

      opts.desc = "LSP code action"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "LSP references"
      keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      -- Different from chad's config
      opts.desc = "LSP definition type"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "LSP rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

      -- Add round border to diagnostic popup
      vim.diagnostic.config({
        float = { border = "rounded" },
      })
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰠠 ",
      Info = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Configure servers:
    local servers = {
      html = {},
      ts_ls = {},
      cssls = {},
      tailwindcss = {},
      svelte = require("constantinchik.plugins.lsp.settings.svelte"),
      emmet_ls = {
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      },
      pyright = {},
      lua_ls = require("constantinchik.plugins.lsp.settings.lua"),
      angularls = require("constantinchik.plugins.lsp.settings.angular"),
    }
    for server, config in pairs(servers) do
      if config.on_attach then
        config.on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          config.on_attach(client, bufnr)
        end
      else
        config.on_attach = on_attach
      end
      config.capabilities = capabilities
      lspconfig[server].setup(config)
    end
  end,
}

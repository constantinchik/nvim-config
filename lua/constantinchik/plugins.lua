return {

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        variant = 'moon',
        disable_italics = true,
        disable_background = true,
      })
      vim.cmd('colorscheme rose-pine')
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  'nvim-treesitter/playground',
  'theprimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive',

  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      --- Uncomment these if you want to manage LSP servers from neovim
      -- {'williamboman/mason.nvim'},
      -- {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  },

  'ThePrimeagen/vim-be-good',
  {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
          local nvimtree = require("nvim-tree")

          -- recommended settings from nvim-tree documentation
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1

          -- change color for arrows in tree to light blue
          vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
          vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

          -- configure nvim-tree
          nvimtree.setup({
              view = {
                  width = 50,
                  relativenumber = true,
              },
              -- change folder arrow icons
              renderer = {
                  indent_markers = {
                      enable = true,
                  },
                  icons = {
                      glyphs = {
                          folder = {
                              --arrow_closed = "", -- arrow when folder is closed
                              --arrow_open = "", -- arrow when folder is open
                          },
                      },
                  },
              },
              -- disable window_picker for
              -- explorer to work well with
              -- window splits
              actions = {
                  open_file = {
                      window_picker = {
                          enable = false,
                      },
                  },
              },
              filters = {
                  custom = { ".DS_Store" },
              },
              git = {
                  ignore = false,
              },
          })

          -- set keymaps
          local keymap = vim.keymap -- for conciseness

          keymap.set("n", "<leader>pv", "<cmd>NvimTreeFindFile<CR>", { desc = "Open file explorer on current file" })
          keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
          keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
          keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
          keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
      end,
  }

}

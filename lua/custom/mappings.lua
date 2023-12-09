---@type MappingsTable
local M = {}

M.disabled = {
  -- n = {
  --   -- Disable horizontal terminal. Use tmux instead
  --   ["<leader>h"] = "",
  -- },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.copilot = {
  i = {
    ["<C-y>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>hm"] = {
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      "Mark file with Harpoon",
    },
    ["<leader>hn"] = {
      "<cmd>lua require('harpoon.ui').nav_next()<cr>",
      "Go to next Harpoon mark",
    },
    ["<leader>hp"] = {
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      "Go to previous Harpoon mark",
    },
    ["<leader>hr"] = {
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      "toggle harpoon quick menu",
    },
  },
}
M.telescope_undo = {
  plugin = true,
  n = {
    ["<leader>u"] = {
      "<cmd> Telescope undo <CR>",
      "Undo history",
    },
  },
}

M.usermappings = {
  n = {
    ["J"] = { "mzJ`z", "join lines" },
    ["<C-d>"] = { "<C-d>zz", "scroll down" },
    ["<C-u>"] = { "<C-u>zz", "scroll up" },
    ["n"] = { "nzzzv", "focus on the center of the screen when searching" },
    ["N"] = { "Nzzzv", "focus on the center of the screen when searching" },
    ["<C-k>"] = { "<cmd>cnext<CR>zz", "" },
    ["<C-j>"] = { "<cmd>cprev<CR>zz", "" },
    ["<leader>k"] = { "<cmd>lnext<CR>zz" },
    ["<leader>j"] = { "<cmd>lprev<CR>zz" },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },
    ["<leader><leader>"] = {
      function()
        vim.cmd "so"
      end,
      "source file",
    },
  },
  x = {
    ["<leader>p"] = { [["_dP]] },
    ["<leader>y"] = { [["+y]] },
    ["<leader>d"] = { [["_d]] },
  },
  v = {
    J = { ":m '>+1<CR>gv=gv", "move line down" },
    K = { ":m '<-2<CR>gv=gv", "move line up" },
    ["<leader>y"] = { [["+y]] },
    ["<leader>d"] = { [["_d]] },
  },
}

return M

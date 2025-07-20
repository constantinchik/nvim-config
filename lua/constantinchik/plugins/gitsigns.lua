return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function()
        -- Setup keybindings
        vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage hunk" })
        vim.keymap.set("n", "<leader>gb", function()
          gitsigns.blame_line({ full = true })
        end, { desc = "Git blame line" })
        vim.keymap.set(
          "n",
          "<leader>gB",
          "<cmd>Gitsigns toggle_current_line_blame<CR>",
          { desc = "Toggle git blame line" }
        )
        vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Diff git changes" })
        vim.keymap.set("n", "<leader>gD", function()
          gitsigns.diffthis("~")
        end, { desc = "Diff git changes with ~" })
        vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
        vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
      end,
    })
  end,
}

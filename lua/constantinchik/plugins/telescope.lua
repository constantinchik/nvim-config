return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  -- or                            , branch = '0.1.x',
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find all files" })
    vim.keymap.set("n", "<leader>pf", builtin.git_files, { desc = "Fuzzy find files that are not ignored by git" })
    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end,
}

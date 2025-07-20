return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local keymap = vim.keymap

    -- Telescope integration for harpoon
    local function toggle_telescope(harpoon_files)
      local conf = require("telescope.config").values
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    -- Harpoon2 keymaps
    keymap.set("n", "<leader>hm", function() harpoon:list():add() end, { desc = "Mark file with harpoon" })
    keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon with telescope" })
    
    -- Quick navigation to specific files with asdf
    keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, { desc = "Go to harpoon file 1" })
    keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, { desc = "Go to harpoon file 2" })
    keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, { desc = "Go to harpoon file 3" })
    keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, { desc = "Go to harpoon file 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Go to previous harpoon mark" })
    keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Go to next harpoon mark" })
  end,
}

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-tree/nvim-web-devicons",
    "debugloop/telescope-undo.nvim",
    "folke/todo-comments.nvim",
    "tomasky/bookmarks.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    -- General configuration
    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.65,
            results_width = 0.35,
          },
          vertical = {
            mirror = false,
          },
          width = 0.95,
          height = 0.90,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          local parent = vim.fn.fnamemodify(path, ":h:t")
          if parent == "." or parent == "" then
            return tail
          else
            return parent .. "/" .. tail
          end
        end,
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        undo = {
          -- side_by_side = true,
          -- layout_strategy = "vertical",
          -- layout_config = {
          --   preview_height = 0.8,
          -- },
        },
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end,
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
              results_width = 0.5,
            },
          },
          results_title = "Live Grep Results",
          entry_maker = function(entry)
            local entry_display = require("telescope.pickers.entry_display")
            local devicons = require("nvim-web-devicons")

            local filename_width = 15

            local line_displayer = entry_display.create({
              separator = " ",
              items = {
                { width = 2 }, -- icon
                { width = filename_width },
                { width = 1 },
                { remaining = true },
              },
            })

            local filename, lnum, col, text = string.match(entry, "(.-):(.-):(.-):(.*)")
            if not filename then
              return nil
            end

            local tail = require("telescope.utils").path_tail(filename)
            local filename_without_ext = vim.fn.fnamemodify(tail, ":r")

            -- Crop filename to show ending if too long
            if #filename_without_ext > filename_width then
              filename_without_ext = "…" .. string.sub(filename_without_ext, -(filename_width - 1))
            end

            local icon, icon_hl = devicons.get_icon(tail, vim.fn.fnamemodify(tail, ":e"), { default = true })

            return {
              value = entry,
              ordinal = filename .. " " .. text,
              display = function()
                return line_displayer({
                  { icon or "", icon_hl or "DevIconDefault" },
                  { filename_without_ext, "Normal" },
                  { "|", "TelescopeResultsComment" },
                  { text:gsub("^%s+", ""), "TelescopeMatching" },
                })
              end,
              filename = filename,
              lnum = tonumber(lnum),
              col = tonumber(col),
              text = text,
            }
          end,
        },
      },
    })

    -- Load extensions
    telescope.load_extension("fzf")
    telescope.load_extension("undo")
    telescope.load_extension("bookmarks")

    -- Customize the appearance of telescope
    require("constantinchik.helpers.telescope").customize()

    -- Setup keymaps
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    vim.keymap.set(
      "n",
      "<leader>fa",
      "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
      { desc = "Find all" }
    )
    vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Find using grep" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
    vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Find old files" })
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
    vim.keymap.set(
      "n",
      "<leader>fz",
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      { desc = "Find in current buffer" }
    )
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor" })
    -- Git
    vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Find Git commits" })
    vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Find Git status" })
    -- Bookmarks
    -- vim.keymap.set("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Find bookmarks" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope bookmarks list<CR>", { desc = "Find bookmarks" })
    -- Harpoon
    vim.keymap.set("n", "<leader>fj", "<cmd>Telescope harpoon marks<CR>", { desc = "Find harpoon files" })
    -- Undo
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Find undo history" })

    -- Auto-open telescope when nvim starts in a directory
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if arg == "" or (vim.fn.isdirectory(arg) == 1) then
          vim.schedule(function()
            require("telescope.builtin").find_files()
          end)
        end
      end,
    })
  end,
}

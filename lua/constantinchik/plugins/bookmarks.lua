return {
  "tomasky/bookmarks.nvim",
  after = "telescope.nvim",
  event = "VimEnter",
  config = function()
    require("bookmarks").setup({
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
      keywords = {
        ["@t"] = " ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = " ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = "󰎚 ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function()
        local bm = require("bookmarks")
        local map = vim.keymap.set

        map("n", "mm", bm.bookmark_toggle, { desc = "Add or remove bookmark at current line" })
        map("n", "mi", bm.bookmark_ann, { desc = "Add or edit mark annotation at current line" })
        map("n", "mc", function()
          local filepath = vim.fn.expand('%:p')
          local config = require("bookmarks.config").config
          local marks = config.cache.data[filepath]
          
          if marks then
            local lines_to_remove = {}
            -- Collect unlabeled bookmarks (those without annotations)
            for line, mark_data in pairs(marks) do
              if type(mark_data) == "table" and not mark_data.a then
                table.insert(lines_to_remove, tonumber(line))
              end
            end
            
            -- Remove unlabeled bookmarks
            for _, line_num in ipairs(lines_to_remove) do
              vim.api.nvim_win_set_cursor(0, {line_num, 0})
              bm.bookmark_toggle()
            end
          end
        end, { desc = "Clean unlabeled bookmarks in buffer" })
        map("n", "mn", bm.bookmark_next, { desc = "Jump to next mark in local buffer" })
        map("n", "mp", bm.bookmark_prev, { desc = "Jump to previous mark in local buffer" })
        map("n", "]b", bm.bookmark_next, { desc = "Jump to next bookmark in file" })
        map("n", "[b", bm.bookmark_prev, { desc = "Jump to previous bookmark in file" })
        map("n", "ml", bm.bookmark_list, { desc = "Show marked file list in quickfix window" })
        -- map("n", "mx", bm.bookmark_clear_all, { desc = "removes all bookmarks" })
      end,
    })
  end,
}

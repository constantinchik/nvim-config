return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false, -- disable built-in keymapping
        debounde = 100, -- ms
        keymap = {
          accept = "<C-y>",
          accept_word = false,
          accept_line = "<C-i>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filtetypes = {
        -- here we can disable Copilot for certain filetypes
        -- e.g. yaml = false,
      },
    })

    -- hide copilot suggestions when cmp menu is open
    -- to prevent odd behavior/garbled up suggestions
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if cmp_status_ok then
      cmp.event:on("menu_opened", function()
        vim.b.copilot_suggestion_hidden = true
      end)

      cmp.event:on("menu_closed", function()
        vim.b.copilot_suggestion_hidden = false
      end)
    end

    -- disable copilot if we are in a private project
    -- if not enable_ai() then
    --   vim.cmd("Copilot disable")
    -- end
  end,
}

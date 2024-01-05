return {
  "joeveiga/ng.nvim",
  config = function()
    local opts = { noremap = true, silent = true }
    local ng = require("ng")
    opts.desc = "Angular Go to template"
    vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, opts)
    opts.desc = "Angular Go to component"
    vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, opts)
    opts.desc = "Angular Template TCB"
    vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, opts)
  end,
}

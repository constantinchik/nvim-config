vim.opt.termguicolors = true

return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
        options = {
            mode = "tabs",
            separator_style = "slant",
            hover = {
                enabled = true,
                delay = 200,
                reveal = { 'close' }
            },
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    separator = true -- use a "true" to enable the default, or set your own character
                }
            },
            highlights = {
                fill = {
                    bg = {
                        attribute = "fg",
                        highlight = "Pmenu"
                    }
                }
            }
        }
    },
}

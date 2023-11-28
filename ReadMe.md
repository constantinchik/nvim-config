# NVIM configuration by constantinchik

This repository contains the neo-vim configuration for PDE environment of [@constantinchik](https://github.com/constantinchik).

The initial configuration was done by following the [YouTube guide](https://youtu.be/w7i4amO_zaE) by [@theprimeagen](https://github.com/ThePrimeagen).

The following configuration was done by following the advices by [Josean Martinez](https://github.com/josean-dev) and [his config](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim).

## Installation

First you need to install nvim. Follow [this guide](https://github.com/neovim/neovim/wiki/Installing-Neovim) to do this.

To install the configuration, clone the repository into the `~/.config/nvim` folder and run `nvim` to install the plugins:

```bash
git clone https://github.com/constantinchik/nvim-config.git ~/.config/nvim
```

After this config will be applied to your nvim instance.
To activate Copilot use the following command:

```bash
:Copilot setup
```

## Explanation

The configuration is split into multiple files, each of which is responsible for a specific part of the configuration.
The main file is `init.vim`, which is the entry point for the configuration.

> **_NOTE:_** for more info about the files expected by neovim - run neovim and execute `:h rtp`.

This config file is being used with [neovim](https://github.com/neovim/neovim) version 0.10.0.

### Options

the `options.lua` file contains the options for the editor.

### Remaps

All remaps could be found in the `remap.lua` file. The following remaps are currently configured:

- `␣pv` - project view - opens the file explorer
- `J` in visual mode will move the selected lines down
- `K` in visual mode will move the selected lines up
- `J` in normal mode will move the current line down but will remain focus on the same place
- `Ctrl+d` in normal mode will move the current line down but will remain focus on the same place
- `Ctrl-u` in normal mode will move the current line up but will remain focus on the same place
- `n` and `N` in search mode will navigate to next and previous search results accordingly but remain focus on the center of the screen
- `␣p` - will paste the content but will remain it in the buffer if you are doing that on the visual selected text (instead of yanking the visually selected text)
- `␣y` - will open the system clipboard registry and you can copy there
- `␣d` - deleting to void register
- `Ctrl+f` - switch project via tmux (TODO: Does not work now)
- `␣f` - format
- `␣s` - start replacing the word under the cursor
- `␣x` - create executable from script

### Plugins

For package management this config uses [lazy](https://github.com/folke/lazy.nvim).

Currently the following plugins are installed:

- [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding with the next key bindings:
  - `␣pf` - finds the files in the current project (non git ignored).
  - `␣fa` - finds all the files in the current project.
  - `␣fr` - finds recent files in the current project.
  - `␣ff` - find using grep.
  - `␣fc` - find string under cursor.
- [rose-pine](https://github.com/rose-pine/neovim) color scheme.
  - Added function ColorMyPencils() to use this theme as well as ignore the background color of the terminal, to allow transparent terminals be transparent.
- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting.
- [treesitter playground](https://github.com/nvim-treesitter/playground)
- [harpoon](https://github.com/ThePrimeagen/harpoon) for quick navigation between files
  - `␣hm` - add file to harpoon
  - `␣hn` - go to next harpoon file
  - `␣hp` - go to previous harpoon file
  - `Ctrl+h` - open harpoon menu
- [undotree](https://github.com/mbbill/undotree) for undo history
  - `␣u` - open undo tree
- [fugitive](https://github.com/tpope/vim-fugitive) for git integration
  - `␣gs` - open git status
  - `␣gc` - open git commit
  - `␣gb` - open git blame
  - `␣gd` - open git diff
- [Mason](https://github.com/williamboman/mason-lspconfig.nvim) for LSP support (run `:Mason` to install the requires LSP or formatter)
- [LSP-zero](https://github.com/VonHeikemen/lsp-zero.nvim) for LSP integration
  - `Ctrl+p` - go to previous autocompletion
  - `Ctrl+n` - go to next autocompletion
  - `Ctrl+y` - accept autocompletion
  - `Ctrl+␣` - start autocompletion
  - `␣gd` - go to definition
  - `K` or `␣h` - hover
  - `␣vws` - show workspace symbols
  - `␣vd` or `␣w` - show workspace diagnostics
  - `[d` - go to next diagnostic
  - `]d` - go to previous diagnostic
  - `␣vca` or `␣a` - code action
  - `␣vrr` or `␣gr` - show references
  - `␣vrn` or `␣rn` - rename symbol
  - `Ctrl+h` or `␣s` - show signature help
  - TODO: review the rest of the key bindings:
  - `␣gi` - go to implementation
  - `␣f` - format
  - `␣d` - show diagnostics
  - `␣e` - show diagnostics in the current line
  - `␣q` - show quickfix
  - `␣t` - show type definition
  - `␣x` - show workspace diagnostics in the current line
  - `␣z` - show LSP saga actions
- [dressing](https://github.com/stevearc/dressing.nvim) to have a nice prompt UI
- [conform](https://github.com/stevearc/conform.nvim) for easy file formattins
  - `␣mp` - format file
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) foe easy file linting
  - `␣l` - lint file
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for snippets:
  - `Ctrl+k` - previous suggestion
  - `Ctrl+j` - next suggestion
  - `Ctrl+b` - prev page
  - `Ctrl+f` - next page
  - `Ctrl+a` - open autosuggestion menu
  - `Ctrl+e` - close completion menu
  - `TAB` - confirm first suggestion
  - `Enter` - confirm selected suggestion
- [alpha-nvim](https://github.com/goolord/alpha-nvim) for launch screen
- [auto-session](https://github.com/goolord/alpha-nvim) for session management
  - `␣wr` - restore last session
  - `␣ws` - save session
- [bufferline](https://github.com/akinsho/bufferline.nvim) for tabs inside of editor
  // TODO: add key bindings
- [colorizer](https://github.com/NvChad/nvim-colorizer.lua) for colorizing the color codes
- [comment](https://github.com/terrortylor/nvim-comment) for commenting
  - `gcc` - comment line
  - `gc` - comment selection
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git integration
- [lualine](https://github.com/nvim-lualine/lualine.nvim) for status line
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for auto pairs of brackets
- [nvim-surround](https://github.com/kylechui/nvim-surround) for surrounding the text with brackets
  // TODO: add key bindings
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) for icons in the file
- [vim-maximizer](https://github.com/szw/vim-maximizer) for maximizing the window
  - `␣sm` - minimize/maximize window
- [which-key](https://github.com/folke/which-key.nvim) for showing the key bindings while you type them

# TIPS to remember

- `Ctrl+v` - vertical edit mode. CONFLICTS WITH SYSTEM PASTE ON WINDOWS

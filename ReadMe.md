# NVIM configuration by constantinchik

This repository contains the neo-vim configuration for PDE environment of [@constantinchik](https://github.com/constantinchik).
The initial configuration was done by following the [YouTube guide](https://youtu.be/w7i4amO_zaE) by [@theprimeagen](https://github.com/ThePrimeagen).

## Explanation

The configuration is split into multiple files, each of which is responsible for a specific part of the configuration.
The main file is `init.vim`, which is the entry point for the configuration.

> **_NOTE:_** for more info about the files expected by neovim - run neovim and execute `:h rtp`.

### What was done:
- Installed [neovim](https://github.com/neovim/neovim)
- Installed [packer](https://github.com/wbthomason/packer.nvim)
- Created the `remap.lua` file that configured the following remaps:
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
- Added [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding with the next key bindings:
  - `␣pf` - project files - finds the files in the current project.
  - `Ctrl+p` - find git files in the current project
  - `␣ps` - project search - finds the text in the current project using Grep.
- Added [rose-pine](https://github.com/rose-pine/neovim) color scheme.
  - Added function ColorMyPencils() to use this theme as well as ignore the background color of the terminal, to allow transparent terminals be transparent.
- Added [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting.
  - Added [treesitter playground](https://github.com/nvim-treesitter/playground)
- Added [harpoon](https://github.com/ThePrimeagen/harpoon) for quick navigation between files
  - `␣a` - add file to harpoon
  - `Ctrl+e` - open harpoon menu
  - `Ctrl+h` - navigate to first harpoon file
  - `Ctrl+t` - navigate to second harpoon file
  - `Ctrl+n` - navigate to third harpoon file
  - `Ctrl+s` - navigate to forth harpoon file
- Added [undotree](https://github.com/mbbill/undotree) for undo history
  - `␣u` - open undo tree
- Added [fugitive](https://github.com/tpope/vim-fugitive) for git integration
  - `␣gs` - open git status
  - `␣gc` - open git commit
  - `␣gb` - open git blame
  - `␣gd` - open git diff
- Added [Mason](https://github.com/williamboman/mason-lspconfig.nvim) for LSP support (run `:Mason` to install the requires LSP or formatter)
- Added [LSP-zero](https://github.com/VonHeikemen/lsp-zero.nvim) for LSP integration
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
- Configured the default sets of vim in `set.lua`


# TIPS to remember

- `Ctrl+v` - vertical edit mode. CONFLICTS WITH SYSTEM PASTE ON WINDOWS

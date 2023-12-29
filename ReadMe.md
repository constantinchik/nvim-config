# NVIM configuration by constantinchik

This repository contains the neo-vim configuration for PDE environment of [@constantinchik](https://github.com/constantinchik).

The initial configuration was done by following the [YouTube guide](https://youtu.be/w7i4amO_zaE) by [@theprimeagen](https://github.com/ThePrimeagen).

The following configuration was done by following the advices by [Josean Martinez](https://github.com/josean-dev) and [his config](https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim).

# Installation

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

# Explanation

The configuration is split into multiple files, each of which is responsible for a specific part of the configuration.
The main file is `init.vim`, which is the entry point for the configuration.

> **_NOTE:_** for more info about the files expected by neovim - run neovim and execute `:h rtp`.

This config file is being used with [neovim](https://github.com/neovim/neovim) version 0.10.0.

## Options

the `options.lua` file contains the options for the editor.

## Remaps

All remaps could be found in the `remap.lua` file. The following remaps are currently configured:

| Command     | Description                                                                                                                                               |
| ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `J`         | in visual mode will move the selected lines down                                                                                                          |
| `K`         | in visual mode will move the selected lines up                                                                                                            |
| `J`         | in normal mode will move the current line down but will remain focus on the same place                                                                    |
| `Ctrl+d`    | in normal mode will move the current line down but will remain focus on the same place                                                                    |
| `Ctrl-u`    | in normal mode will move the current line up but will remain focus on the same place                                                                      |
| `n` and `N` | in search mode will navigate to next and previous search results accordingly but remain focus on the center of the screen                                 |
| `␣p`        | will paste the content but will remain it in the buffer if you are doing that on the visual selected text (instead of yanking the visually selected text) |
| `␣y`        | will open the system clipboard registry and you can copy there                                                                                            |
| `␣d`        | deleting to void register                                                                                                                                 |
| `␣s`        | start replacing the word under the cursor                                                                                                                 |
| `Ctrl-k`    | next quickfix                                                                                                                                             |
| `Ctrl-j`    | prev quickfix                                                                                                                                             |
| `␣␣`        | source current file                                                                                                                                       |

## Plugins

For package management this config uses [lazy](https://github.com/folke/lazy.nvim).

Currently the following plugins are installed:

### [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding with the next key bindings:

| Command           | Description                                 |
| ----------------- | ------------------------------------------- |
| **Files**         |                                             |
| `␣ff`             | Find files                                  |
| `␣fa`             | Finds all the files in the current project. |
| `␣fw`             | Find using grep.                            |
| `␣fb`             | Find buffers.                               |
| `␣fh`             | Find help tags.                             |
| `␣fo`             | Find old files.                             |
| `␣fz`             | Find in current buffer.                     |
| `␣fs`             | Find string under cursor.                   |
| **LSP**           |                                             |
| `gd`              | LSP definition                              |
| `gi`              | LSP implementation                          |
| `gr`              | LSP references                              |
| `gt`              | LSP type                                    |
| `␣D`              | Buffer diagnostics                          |
| **Git**           |                                             |
| `␣cm`             | Find Git commits.                           |
| `␣gt`             | Find Git status                             |
| **Bookmarks**     |                                             |
| `␣ma`             | Find bookmarks                              |
| **Undo**          |                                             |
| `␣u`              | Undo history                                |
| **Notifications** |                                             |
| `␣fn`             | Find all notifications                      |

### [catppuccin](https://github.com/catppuccin/nvim) color scheme.

Disabled italics for theme. Added transparent background.

### [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting.

### [harpoon](https://github.com/ThePrimeagen/harpoon) for quick navigation between files

| Command | Description                 |
| ------- | --------------------------- |
| `␣hm`   | add file to harpoon         |
| `␣hn`   | go to next harpoon file     |
| `␣hp`   | go to previous harpoon file |
| `␣hr`   | open harpoon menu           |

### [fugitive](https://github.com/tpope/vim-fugitive) for git integration

| Command | Description     |
| ------- | --------------- |
| `␣gs`   | open git status |

### [Mason](https://github.com/williamboman/mason-lspconfig.nvim) for LSP support (run `:Mason` to install the requires LSP or formatter)

### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) LSP

| Command | Description                          |
| ------- | ------------------------------------ |
| `gD`    | Go to declarations                   |
| `gd`    | Go to definitions                    |
| `gi`    | See all implementations in telescope |
| `gr`    | See all references in telescope      |
| `gt`    | Go to type definition                |
| `K`     | Hover                                |
| `␣rn`   | Rename                               |
| `␣ls`   | Signature help                       |
| `␣ca`   | Code action                          |
| `␣D`    | Show file diagnostics                |
| `␣d`    | Show line diagnostics                |
| `[d`    | Go to next diagnostic                |
| `]d`    | Go to previous diagnostic            |
| `␣rs`   | Restart LSP                          |

### [dressing](https://github.com/stevearc/dressing.nvim) to have a nice prompt UI

### [none-ls](https://github.com/nvimtools/none-ls.nvim) for linting and formatting

| Command | Description               |
| ------- | ------------------------- |
| `␣mp`   | Format file (Make pretty) |

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Lost of different snippets and completion sources.

| Command  | Description                 |
| -------- | --------------------------- |
| `Ctrl+p` | previous suggestion         |
| `Ctrl+n` | next suggestion             |
| `Ctrl+b` | prev page                   |
| `Ctrl+f` | next page                   |
| `Ctrl+a` | open autosuggestion menu    |
| `Ctrl+e` | close completion menu       |
| `TAB`    | confirm first suggestion    |
| `Enter`  | confirm selected suggestion |

### [auto-session](https://github.com/rmagatti/auto-session) for session management

| Command | Description          |
| ------- | -------------------- |
| `␣wr`   | restore last session |
| `␣ws`   | save session         |

### [bufferline](https://github.com/akinsho/bufferline.nvim) for tabs inside of editor

### [colorizer](https://github.com/NvChad/nvim-colorizer.lua) for colorizing the color codes

### [comment](https://github.com/numToStr/Comment.nvim) for commenting

| Command | Description       |
| ------- | ----------------- |
| `gcc`   | comment line      |
| `gc`    | comment selection |

### [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git integration

| Command | Description                  |
| ------- | ---------------------------- |
| `gh`    | Stage hunk                   |
| `gu`    | Undo stage hunk              |
| `gb`    | Toggle blame on current line |
| `gd`    | Diff current file            |

### [lualine](https://github.com/nvim-lualine/lualine.nvim) for status line

### [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) for file tree

| Command  | Description      |
| -------- | ---------------- |
| `␣e`     | Focus nvim-tree  |
| `Ctrl-n` | Toggle nvim-tree |

### [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) for icons in the file

### [vim-maximizer](https://github.com/szw/vim-maximizer) for maximizing the window

| Command | Description              |
| ------- | ------------------------ |
| `␣sm`   | minimize/maximize window |

### [which-key](https://github.com/folke/which-key.nvim) for showing the key bindings while you type them

### [nvim-notify](https://github.com/rcarriga/nvim-notify) for beautiful notifications

| Command | Description               |
| ------- | ------------------------- |
| `␣ds`   | Dismiss all notifications |
| `␣fn`   | Find all notifications    |

### [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) for beautiful indent lines

### [copilot](https://github.com/github/copilot.vim) for AI suggestions

| Command  | Description               |
| -------- | ------------------------- |
| `Ctrl-y` | Accept Copilot suggestion |

### [dashboard](https://github.com/nvimdev/dashboard-nvim) for initial screen

### [vim-be-good](https://github.com/ThePrimeagen/vim-be-good) for training vim skills

# TIPS to remember

- `Ctrl+v` | vertical edit mode. CONFLICTS WITH SYSTEM PASTE ON WINDOWS

// TODO: Undo does not work properly
// TODO: Treesitter angular
// TODO: Replace bufferline with tabufline
// TODO: Setup comments better (leader + /)
// TODO: Auto-session does not work
// TODO: Move some of the CHAD remaps
// TODO: Neotree vs nvim tree
// TODO: Copilot does not seem to work...
// TODO: Learn fugitive to not use git cli outside of nvim
// Fidget mb? https://github.com/j-hui/fidget.nvim
// Noice for notifications? https://github.com/folke/noice.nvim
// Neotest for unit testing? https://github.com/nvim-neotest/neotest

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

In order to make treesitter work with angular - you need to have tree-sitter-cli installed globaly on your machine. Do do that run the following command:

```bash
pnpm install -g tree-sitter-cli
```

In order to see the [images](https://github.com/3rd/image.nvim) in your terminal you need to use the kitty terminal and have the [imagemagick installed](https://github.com/3rd/image.nvim#installing-imagemagick):

```bash
brew install imagemagick # Use your package manager for this command
```

If you have this problem "image.nvim: magick rock not found" - try rebuilding the package using this command inside neovim:

```
:Lazy build luarocks.nvim
```

or try installing magick via:

```bash
luarocks --lua-version=5.1 install magick
```

as per [this comment](https://github.com/3rd/image.nvim/issues/91#issuecomment-2065165485)

# Explanation

The configuration is split into multiple files, each of which is responsible for a specific part of the configuration.
The main file is `init.vim`, which is the entry point for the configuration.

> **_NOTE:_** for more info about the files expected by neovim - run neovim and execute `:h rtp`.

This config file is being used with [neovim](https://github.com/neovim/neovim) version 0.10.0.

## Options

the `options.lua` file contains the options for the editor.

## Remaps

All remaps could be found in the `remap.lua` file. The following remaps are currently configured:

| Command                    | Description                                                                                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `J`                        | in visual mode will move the selected lines down                                                                                                          |
| `K`                        | in visual mode will move the selected lines up                                                                                                            |
| `J`                        | in normal mode will join lines but will remain focus on the same place                                                                                    |
| `Ctrl-d`                   | in normal mode will move the current line down but will remain focus on the same place                                                                    |
| `Ctrl-u`                   | in normal mode will move the current line up but will remain focus on the same place                                                                      |
| `n` and `N`                | in search mode will navigate to next and previous search results accordingly but remain focus on the center of the screen                                 |
| `␣p`                       | will paste the content but will remain it in the buffer if you are doing that on the visual selected text (instead of yanking the visually selected text) |
| `␣p`                       | will paste from system clipboard in normal mode                                                                                                           |
| `␣y`                       | will open the system clipboard registry and you can copy there                                                                                            |
| `␣d`                       | deleting to void register                                                                                                                                 |
| `␣s`                       | start replacing the word under the cursor                                                                                                                 |
| `Ctrl-k`                   | next quickfix                                                                                                                                             |
| `Ctrl-j`                   | prev quickfix                                                                                                                                             |
| `␣␣`                       | source current file                                                                                                                                       |
| `␣v`                       | vertical split                                                                                                                                            |
| `␣s`                       | horizontal split                                                                                                                                          |
| `␣+`                       | increment a number under cursor (same as Ctrl+a)                                                                                                          |
| `␣-`                       | decrement a number under cursor (same as Ctrl+x)                                                                                                          |
| Navigation in insert mode  |                                                                                                                                                           |
| `Ctrl-b`                   | beginning of line                                                                                                                                         |
| `Ctrl-e`                   | end of line                                                                                                                                               |
| `Ctrl-h`                   | left                                                                                                                                                      |
| `Ctrl-l`                   | right                                                                                                                                                     |
| `Ctrl-j`                   | down                                                                                                                                                      |
| `Ctrl-k`                   | up                                                                                                                                                        |
| Navigation between windows |                                                                                                                                                           |
| `Ctrl-h`                   | left                                                                                                                                                      |
| `Ctrl-l`                   | right                                                                                                                                                     |
| `Ctrl-j`                   | down                                                                                                                                                      |
| `Ctrl-k`                   | up                                                                                                                                                        |
| `␣s`                       | split horizontaly                                                                                                                                         |
| `␣v`                       | split vertically                                                                                                                                          |
| Other from Chad            |                                                                                                                                                           |
| `Esc`                      | clear highlights                                                                                                                                          |
| `Ctrl-s`                   | save file                                                                                                                                                 |

## Plugins

For package management this config uses [lazy](https://github.com/folke/lazy.nvim).

Currently the following plugins are installed:

### [telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding with the next key bindings:

| Command   | Description                                 |
| --------- | ------------------------------------------- |
| **Files** |                                             |
| `␣ff`     | Find files                                  |
| `␣fa`     | Finds all the files in the current project. |
| `␣fw`     | Find using grep.                            |
| `␣fb`     | Find buffers.                               |
| `␣fh`     | Find help tags.                             |
| `␣fo`     | Find old files.                             |
| `␣fz`     | Find in current buffer.                     |
| `␣fs`     | Find string under cursor.                   |
| `␣ft`     | Find TODOs                                  |
| `␣fb`     | Find bookmarks                              |
| `␣fj`     | Find Harpoon files                          |
| `␣u`      | Undo history                                |
| `␣fn`     | Find all notifications                      |
| **LSP**   |                                             |
| `gd`      | LSP definition                              |
| `gi`      | LSP implementation                          |
| `gr`      | LSP references                              |
| `gt`      | LSP type                                    |
| `␣D`      | Buffer diagnostics                          |
| **Git**   |                                             |
| `␣gc`     | Find Git commits.                           |
| `␣gt`     | Find Git status                             |

### [telescope-undo](https://github.com/debugloop/telescope-undo.nvim) for undo tree inside telescope

| Command inside telescope | Description                      |
| ------------------------ | -------------------------------- |
| `Enter` or `Ctrl-y`      | yank additions in current change |
| `Shift-Enter`            | yank deletions in current change |
| `Ctrl-Enter` or `Ctrl-r` | restore to this point            |

### [catppuccin](https://github.com/catppuccin/nvim) color scheme.

Disabled italics for theme. Added transparent background.

### [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting.

### [harpoon](https://github.com/ThePrimeagen/harpoon) for quick navigation between files

| Command | Description                     |
| ------- | ------------------------------- |
| `␣hm`   | add file to harpoon             |
| `␣hn`   | go to next harpoon file         |
| `␣hp`   | go to previous harpoon file     |
| `␣hh`   | open harpoon menu               |
| `␣fj`   | open harpoon files in telescope |

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

### [conform](https://github.com/stevearc/conform.nvim) for formatting

| Command | Description   |
| ------- | ------------- |
| `␣bf`   | Format buffer |

### [nvim-lint](https://github.com/mfussenegger/nvim-lint) for linting

| Command | Description |
| ------- | ----------- |
| `␣ll`   | Lint file   |

### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Lost of different snippets and completion sources.

| Command  | Description                 |
| -------- | --------------------------- |
| `Ctrl-p` | previous suggestion         |
| `Ctrl-n` | next suggestion             |
| `Ctrl-b` | prev page                   |
| `Ctrl-f` | next page                   |
| `Ctrl-a` | open autosuggestion menu    |
| `Ctrl-e` | close completion menu       |
| `TAB`    | confirm first suggestion    |
| `Enter`  | confirm selected suggestion |

### [auto-session](https://github.com/rmagatti/auto-session) for session management

Please note that auto-session will not load the last session automatically when running `nvim`,
this command will run neovim and show you the dashboard. You need to manually save and restore
sessions.

| Command | Description          |
| ------- | -------------------- |
| `␣wr`   | restore last session |
| `␣ws`   | save session         |

### [bufferline](https://github.com/akinsho/bufferline.nvim) for tabs inside of editor

| Command           | Description                 |
| ----------------- | --------------------------- |
| `␣bn`             | Open new tab                |
| `␣bp`             | Toggle pin buffer           |
| `␣bP`             | Delete non-pinned buffers   |
| `␣bo`             | Delete other buffers        |
| `␣br`             | Delete buffers to the right |
| `␣bl`             | Delete buffers to the left  |
| `Shift+h` or `[b` | Previous buffer             |
| `Shift+l` or `]b` | Next buffer                 |
| `␣x`              | Close current buffer        |

### [colorizer](https://github.com/NvChad/nvim-colorizer.lua) for colorizing the color codes

### [comment](https://github.com/numToStr/Comment.nvim) for commenting

| Command | Description                  |
| ------- | ---------------------------- |
| `gcc`   | comment toggle current line  |
| `gbc`   | comment toggle current block |
| `␣/`    | comment selection            |

### [gitsigns](https://github.com/lewis6991/gitsigns.nvim) for git integration

| Command | Description                  |
| ------- | ---------------------------- |
| `␣gh`   | Stage hunk                   |
| `␣gu`   | Undo stage hunk              |
| `␣gb`   | Blame current line           |
| `␣gB`   | Toggle blame on current line |
| `␣gd`   | Diff current file            |
| `␣gD`   | Diff current file with ~     |
| `[h`    | Prev hunk                    |
| `]h`    | Next hunk                    |

### [lualine](https://github.com/nvim-lualine/lualine.nvim) for status line

Lualine is being setup to take full widht of the line in the bottom of your screen.
If you do not like it or prefer to have it only for the currently focused window then just comment out the vim.o.laststatus = 3 in lualine config file.

### [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) for file tree

The plugin is currently disabled in favor of neo-tree.

| Command  | Description      |
| -------- | ---------------- |
| `␣e`     | Focus nvim-tree  |
| `Ctrl-e` | Toggle nvim-tree |

### [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) for file tree

| Command         | Description                |
| --------------- | -------------------------- |
| `␣e`            | Focus nvim-tree            |
| `␣fe`           | Focus nvim-tree files      |
| `␣be`           | Focus nvim-tree buffers    |
| `␣ge`           | Focus nvim-tree git status |
| `Ctrl-n`        | Toggle nvim-tree           |
| **Window mode** |                            |
| `D`             | Toggle diff selection      |

### [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) for icons in the file

### [vim-maximizer](https://github.com/szw/vim-maximizer) for maximizing the window

| Command | Description              |
| ------- | ------------------------ |
| `␣mx`   | minimize/maximize window |

### [which-key](https://github.com/folke/which-key.nvim) for showing the key bindings while you type them

### [noice](https://github.com/folke/noice.nvim) for beautiful UI for messages cmdline and popupmenu

### [nvim-notify](https://github.com/rcarriga/nvim-notify) for beautiful notifications

This extension is a part of noice, and has some keymaps configured:

| Command | Description               |
| ------- | ------------------------- |
| `␣nd`   | Dismiss all notifications |
| `␣fn`   | Find all notifications    |

### [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) for beautiful indent lines

### [copilot lua](https://github.com/zbirenbaum/copilot.lua) for AI suggestions

| Command  | Description                             |
| -------- | --------------------------------------- |
| `Ctrl-y` | Accept Copilot suggestion               |
| `Ctrl-t` | Accept first line of Copilot suggestion |
| `Ctrl-l` | Next suggestion                         |
| `Ctrl-h` | Previous suggestion                     |
| `Ctrl-]` | Dismiss suggestion                      |

If you want to disable copilot by default - use

### [dashboard](https://github.com/nvimdev/dashboard-nvim) for initial screen

### [vim-be-good](https://github.com/ThePrimeagen/vim-be-good) for training vim skills

### [dap](https://github.com/mfussenegger/nvim-dap) for debugging

| Command | Description                       |
| ------- | --------------------------------- |
| `␣db`   | Toggle breakpoint on current line |
| `␣dr`   | Run or continue the debugger      |

### [dap-ui](https://github.com/rcarriga/nvim-dap-ui) UI for debugging

### [todo-comments](https://github.com/folke/todo-comments.nvim) for TODO comments

| Command | Description           |
| ------- | --------------------- |
| `]t`    | Next todo comment     |
| `[t`    | Previous todo comment |

### [surround](https://github.com/kylechui/nvim-surround) For easy surrounding

| Old text                    | Command   | New text                |
| --------------------------- | --------- | ----------------------- |
| surr\*ound_words            | ysiw)     | (surround_words)        |
| \*make strings              | ys$"      | "make strings"          |
| [delete ar*ound me!]        | ds]       | delete around me!       |
| `remove <b>HTML t\*ags</b>` | dst       | remove HTML tags        |
| 'change quot\*es'           | cs'"      | "change quotes"         |
| `<b>or tag\* types</b>`     | csth1<CR> | `<h1>or tag types</h1>` |
| delete(functi\*on calls)    | dsf       | function calls          |

### [image](https://github.com/3rd/image.nvim) To preview images in kitty terminal

### [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) To preview markdown files

| Command | Description           |
| ------- | --------------------- |
| `␣mp`   | Preview Markdown file |

### [lazygit](https://github.com/kdheepak/lazygit.nvim) To work with git in the lazygit UI

| Command | Description   |
| ------- | ------------- |
| `␣lg`   | Open lazy git |

### [gen.nvim](https://github.com/David-Kunz/gen.nvim) To have local AI suggestions

| Command  | Description       |
| -------- | ----------------- |
| `␣ai`    | Open AI Menu      |
| `Ctrl-r` | Reload suggestion |

### [bookmarks.nvim](https://github.com/tomasky/bookmarks.nvim) Bookmarks

| Command | Description                                 |
| ------- | ------------------------------------------- |
| `␣mm`   | Add or remove bookmark at current line      |
| `␣mi`   | Add or edit mark annotation at current line |
| `␣mc`   | Clean all marks in local buffer             |
| `␣mn`   | Jump to next mark in local buffer           |
| `␣mp`   | Jump to previous mark in local buffer       |

### [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) EditorConfig support

Automatically applies project-specific indentation and formatting settings from `.editorconfig` files.

# TIPS to remember

- `Ctrl-v` | vertical edit mode. CONFLICTS WITH SYSTEM PASTE ON WINDOWS
- In telescope you can use tab to select multiple files and `Ctrl-q` to create a quickfix list out of them.
- Do not forget to find TODOs using ` ft`
- Use DAP for debugging
- To debug and see where the keybinding (repam) used run `:imap <C-l>` for vim and `:nmap <leader>db`

# TODO:

- Neotree bug when switching to git view on a specific file
- Copilot still shows with cmp
- Checkhealth and add it to the readme.
- Quickfix is not modifiable by default and requires `:set ma` to be able to delete items.
- Autosession does not work well with neo-tree.
- Bufferline slant still looks odd...
- Mb add Trouble for quick diagnostics in whole project?
- Configure Git diff `Gvdiffsplit` to show the complete file

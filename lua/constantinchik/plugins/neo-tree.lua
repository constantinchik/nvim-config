return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      config = function()
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
          source_selector = {
            winbar = true, -- toggle to show selector on winbar
            statusline = false, -- toggle to show selector on statusline
            show_scrolled_off_parent_node = false, -- boolean
            sources = { -- table
              {
                source = "filesystem", -- string
                display_name = " 󰉓 Files ", -- string | nil
              },
              {
                source = "buffers", -- string
                display_name = " 󰈚 Buffers ", -- string | nil
              },
              {
                source = "git_status", -- string
                display_name = " 󰊢 Git ", -- string | nil
              },
            },
            content_layout = "start", -- string
            tabs_layout = "equal", -- string
            truncation_character = "…", -- string
            tabs_min_width = nil, -- int | nil
            tabs_max_width = nil, -- int | nil
            padding = 0, -- int | { left: int, right: int }
            separator = { left = "▏", right = "▕" }, -- string | { left: string, right: string, override: string | nil }
            separator_active = nil, -- string | { left: string, right: string, override: string | nil } | nil
            show_separator_on_edge = false, -- boolean
            highlight_tab = "NeoTreeTabInactive", -- string
            highlight_tab_active = "NeoTreeTabActive", -- string
            highlight_background = "NeoTreeTabInactive", -- string
            highlight_separator = "NeoTreeTabSeparatorInactive", -- string
            highlight_separator_active = "NeoTreeTabSeparatorActive", -- string
          },
          hide_root_node = true,
          close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          enable_normal_mode_for_inputs = false, -- Enable normal mode for input dialogs.
          open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
          sort_case_insensitive = false, -- used when sorting files and directories in the tree
          sort_function = nil, -- use a custom function for sorting files and directories in the tree
          -- sort_function = function (a,b)
          --       if a.type == b.type then
          --           return a.path > b.path
          --       else
          --           return a.type > b.type
          --       end
          --   end , -- this sorts files and directories descendantly
          default_component_configs = {
            container = {
              enable_character_fade = true,
            },
            indent = {
              indent_size = 2,
              padding = 1, -- extra padding on left hand side
              -- indent guides
              with_markers = true,
              indent_marker = "│",
              last_indent_marker = "└",
              highlight = "NeoTreeIndentMarker",
              -- expander config, needed for nesting files
              with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
              expander_collapsed = "",
              expander_expanded = "",
              expander_highlight = "NeoTreeExpander",
            },
            icon = {
              folder_closed = "",
              folder_open = "",
              folder_empty = "",
              -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
              -- then these will never be used.
              default = "*",
              highlight = "NeoTreeFileIcon",
            },
            modified = {
              symbol = "[+]",
              highlight = "NeoTreeModified",
            },
            name = {
              trailing_slash = false,
              use_git_status_colors = true,
              highlight = "NeoTreeFileName",
            },
            git_status = {
              symbols = {
                -- Change type
                added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = "✖", -- this can only be used in the git_status source
                renamed = "󰁕", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored = "",
                unstaged = "󰄱",
                staged = "",
                conflict = "",
              },
            },
            -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
            file_size = {
              enabled = true,
              required_width = 64, -- min width of window required to show this column
            },
            type = {
              enabled = true,
              required_width = 122, -- min width of window required to show this column
            },
            last_modified = {
              enabled = true,
              required_width = 88, -- min width of window required to show this column
            },
            created = {
              enabled = true,
              required_width = 110, -- min width of window required to show this column
            },
            symlink_target = {
              enabled = false,
            },
          },
          -- A list of functions, each representing a global custom command
          -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
          -- see `:h neo-tree-custom-commands-global`
          commands = {
            diff_files = function(state)
              local node = state.tree:get_node()
              local log = require("neo-tree.log")
              state.clipboard = state.clipboard or {}
              if diff_Node and diff_Node ~= tostring(node.id) then
                local current_Diff = node.id
                require("neo-tree.utils").open_file(state, diff_Node, open)
                vim.cmd("vert diffs " .. current_Diff)
                log.info("Diffing " .. diff_Name .. " against " .. node.name)
                diff_Node = nil
                current_Diff = nil
                state.clipboard = {}
                require("neo-tree.ui.renderer").redraw(state)
              else
                local existing = state.clipboard[node.id]
                if existing and existing.action == "diff" then
                  state.clipboard[node.id] = nil
                  diff_Node = nil
                  require("neo-tree.ui.renderer").redraw(state)
                else
                  state.clipboard[node.id] = { action = "diff", node = node }
                  diff_Name = state.clipboard[node.id].node.name
                  diff_Node = tostring(state.clipboard[node.id].node.id)
                  log.info("Diff source file " .. diff_Name)
                  require("neo-tree.ui.renderer").redraw(state)
                end
              end
            end,
            show_git_diff = function(state)
              local node = state.tree:get_node()
              local is_file = node.type == "file"

              if not is_file then
                vim.notify("Diff only for files", vim.log.levels.ERROR)
                return
              end

              -- Open the file in the current window
              local cc = require("neo-tree.sources.common.commands")
              cc.open_tabnew(state, function()
                -- Do nothing for dirs
              end)

              if vim.fn.exists(":Gitsigns") == 2 then
                -- Try execute Gitsigns diffthis on the current file
                vim.cmd("lua require('gitsigns').diffthis()")
              elseif vim.fn.exists(":Gvdiffsplit") == 2 then
                -- Try execute fugitive diffthis on the current file
                vim.cmd(":Gvdiffsplit!<CR>")
              else
                vim.notify("Neither Fugitive nor Gitsigns are installed. Diff is not supported.", vim.log.levels.ERROR)
              end
            end,
          },
          window = {
            position = "left",
            width = 50,
            mapping_options = {
              noremap = true,
              nowait = true,
            },
            mappings = {
              ["<space>"] = "noop", -- Disable default toggle node
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["<esc>"] = "cancel", -- close preview or floating neo-tree window
              ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
              -- Read `# Preview Mode` for more information
              ["l"] = "focus_preview",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
              -- ["S"] = "split_with_window_picker",
              -- ["s"] = "vsplit_with_window_picker",
              ["t"] = "open_tabnew",
              -- ["<cr>"] = "open_drop",
              -- ["t"] = "open_tab_drop",
              ["w"] = "open_with_window_picker",
              --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
              ["C"] = "close_node",
              -- ['C'] = 'close_all_subnodes',
              ["z"] = "close_all_nodes",
              --["Z"] = "expand_all_nodes",
              ["a"] = {
                "add",
                -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                  show_path = "none", -- "none", "relative", "absolute"
                },
              },
              ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
              ["d"] = "delete",
              ["r"] = "rename",
              ["y"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
              -- ["c"] = {
              --  "copy",
              --  config = {
              --    show_path = "none" -- "none", "relative", "absolute"
              --  }
              --}
              ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
              ["q"] = "close_window",
              ["R"] = "refresh",
              ["?"] = "show_help",
              ["<"] = "prev_source",
              [">"] = "next_source",
              ["i"] = "show_file_details",
            },
          },
          nesting_rules = {},
          filesystem = {
            filtered_items = {
              visible = false, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = false,
              hide_gitignored = false,
              hide_hidden = true, -- only works on Windows for hidden files/directories
              hide_by_name = {
                "node_modules",
                ".angular",
              },
              hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
              },
              always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
              },
              never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                ".DS_Store",
                --"thumbs.db"
              },
              never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
              },
            },
            follow_current_file = {
              enabled = false, -- This will find and focus the file in the active buffer every time
              --               -- the current file is changed while the tree is open.
              leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = false, -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
              mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                -- ["D"] = "fuzzy_finder_directory",
                ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"] = "fuzzy_sorter_directory",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
                ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["og"] = { "order_by_git_status", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
                ["D"] = { "diff_files" },
                ["ga"] = "git_add_file",
                ["gu"] = "git_unstage_file",
                ["gr"] = "git_revert_file",
              },
              fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "move_cursor_down",
                ["<C-n>"] = "move_cursor_down",
                ["<up>"] = "move_cursor_up",
                ["<C-p>"] = "move_cursor_up",
              },
            },

            commands = {}, -- Add a custom command or override a global one using the same function name
          },
          buffers = {
            follow_current_file = {
              enabled = true, -- This will find and focus the file in the active buffer every time
              --              -- the current file is changed while the tree is open.
              leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = true, -- when true, empty folders will be grouped together
            show_unloaded = true,
            window = {
              mappings = {
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
              },
            },
          },
          git_status = {
            window = {
              mappings = {
                ["A"] = "git_add_all",
                ["a"] = "git_add_file",
                ["U"] = "git_unstage_all", -- Does not work...
                ["u"] = "git_unstage_file",
                ["r"] = "git_revert_file",
                ["c"] = "git_commit",
                ["p"] = "git_push",
                ["gg"] = "git_commit_and_push",
                ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
                ["oc"] = { "order_by_created", nowait = false },
                ["od"] = { "order_by_diagnostics", nowait = false },
                ["om"] = { "order_by_modified", nowait = false },
                ["on"] = { "order_by_name", nowait = false },
                ["os"] = { "order_by_size", nowait = false },
                ["ot"] = { "order_by_type", nowait = false },
                ["D"] = { "show_git_diff" },
                ["<2-LeftMouse>"] = "show_git_diff",
                ["<cr>"] = "show_git_diff",
              },
            },
          },
        })

        -- Add key bindings
        vim.keymap.set("n", "<C-n>", "<cmd>Neotree last focus toggle<CR>", {
          desc = "Toggle neo-tree",
        })
        vim.keymap.set("n", "<leader>fe", "<cmd>Neotree filesystem focus reveal<CR>", {
          desc = "Explorer NeoTree (root dir)",
        })
        vim.keymap.set("n", "<leader>e", "<cmd>Neotree last focus reveal<CR>", {
          desc = "Focus on NeoTree",
          remap = true,
        })
        vim.keymap.set("n", "<leader>ge", "<cmd>Neotree git_status focus reveal<CR>", {
          desc = "Git status explorer",
        })
        vim.keymap.set("n", "<leader>be", "<cmd>Neotree buffers focus reveal<CR>", {
          desc = "Buffer explorer",
        })
      end,
    },
  },
}

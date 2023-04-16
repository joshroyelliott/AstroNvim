-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- markdown viewer
    ["<leader>vm"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown preview" },
    -- openscad viewer
    ["<leader>vo"] = {
      "<cmd>w<cr> :call system('/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD --colorscheme AstroNvim '.expand('%:p') . ' 2> /dev/null &')<cr>",
      desc = "Open OpenSCAD",
    },
    -- todo-comments navigation
    ["]t"] = {
      function() require("todo-comments").jump_next() end,
      desc = "Next todo comment",
    },
    ["[t"] = {
      function() require("todo-comments").jump_prev() end,
      desc = "Previous todo comment",
    },
    -- zen-mode
    ["<leader>uz"] = {
      function()
        require("zen-mode").toggle {
          window = {
            width = 0.85, -- width will be 85% of the editor width
          },
          plugins = {
            tmux = {
              enabled = true, -- disable tmux status line
            },
          },
        }
      end,
      desc = "Toggle zen-mode",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

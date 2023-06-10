return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   opts = {
  --     handlers = {
  --       python = function(source_name)
  --         local dap = require "dap"
  --         dap.adapters.python = {
  --           type = "executable",
  --           command = "/usr/bin/python3",
  --           args = {
  --             "-m",
  --             "debugpy.adapter",
  --           },
  --         }
  --
  --         dap.configurations.python = {
  --           {
  --             type = "python",
  --             request = "launch",
  --             name = "Launch file",
  --             program = "${file}", -- This configuration will launch the current file if used.
  --           },
  --         }
  --       end,
  --     },
  --   },
  -- },

  -- zk-nvim note taking
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup {
        -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope" or "fzf"
        picker = "telescope",

        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      }
    end,
  },

  -- movement
  {
    "ggandor/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
    end,
    dependencies = {
      "tpope/vim-repeat",
    },
  },

  -- tpope staples
  { "tpope/vim-unimpaired", event = "User AstroFile" },
  { "tpope/vim-surround", event = "User AstroFile" },
  { "tpope/vim-repeat", event = "User AstroFile" },

  -- markdown previewer
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- zk-nvim note taking
  {
    "mickael-menu/zk-nvim",
    event = "BufRead",
    config = function() require("zk").setup() end,
  },

  -- chat-gpt
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "pass chatgpt",
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- movement
  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
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
  { "tpope/vim-surround",   event = "User AstroFile" },
  { "tpope/vim-repeat",     event = "User AstroFile" },

  -- markdown previewer
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}

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

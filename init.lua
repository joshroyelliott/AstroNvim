return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 5000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    require("nvim-treesitter.configs").setup {
      -- ...
      highlight = {
        -- ...
        additional_vim_regex_highlighting = { "markdown" },
      },
    }
    -- Add the key mappings only for Markdown files in a zk notebook.
    if require("zk.util").notebook_root(vim.fn.expand "%:p") ~= nil then
      local function map(...) vim.api.nvim_buf_set_keymap(0, ...) end
      local opts = { noremap = true, silent = false }

      -- Open the link under the caret.
      map("n", "<CR>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)

      -- Create a new note after asking for its title.
      -- This overrides the global `<leader>zn` mapping to create the note in the same directory as the current buffer.
      map("n", "<leader>zn", "<Cmd>ZkNew { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", opts)
      -- Create a new note in the same directory as the current buffer, using the current selection for title.
      map("v", "<leader>znt", ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", opts)
      -- Create a new note in the same directory as the current buffer, using the current selection for note content and asking for its title.
      map(
        "v",
        "<leader>znc",
        ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
        opts
      )

      -- Open notes linking to the current buffer.
      map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>", opts)
      -- Alternative for backlinks using pure LSP and showing the source context.
      --map('n', '<leader>zb', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
      -- Open notes linked by the current buffer.
      map("n", "<leader>zl", "<Cmd>ZkLinks<CR>", opts)

      -- Preview a linked note.
      map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
      -- Open the code actions for a visual selection.
      map("v", "<leader>za", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
    end
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

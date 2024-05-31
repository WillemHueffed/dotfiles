local cmp = require "cmp"

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        --rust
        "rust-analyzer",
        -- Below is all Python
        "debugpy",
        "mypy",
        "ruff-lsp",
        "black",
        "pyright",
        --c++
        "clangd",
        "clang-format",
        "codelldb",
        --js
        "typescript-language-server",
        "eslint-lsp",
        "eslint_d",
        "js-debug-adapter",
        "prettier",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
      require "custom.configs.dap"
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    --This may cause issues -> each language should maybe require its own config?
    ft = {"python", "c", "cpp", "javascript", "typescript", "typescriptreact"},
    opts = function()
      return require "custom.configs.none-ls"
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    case_sensitive = false,
    vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)'),
    vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)'),
    vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)'),
  },
  {
    'chipsenkbeil/distant.nvim', 
    branch = 'v0.3',
    lazy = false,
    config = function()
        require('distant'):setup()
    end
  },
}
return plugins

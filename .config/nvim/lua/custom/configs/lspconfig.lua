local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local function oranize_imports()
  local params= {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_commands(params)
end

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilites = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}

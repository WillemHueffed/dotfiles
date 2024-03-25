local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local opts = {
  sources = {
    --js
    require("none-ls.diagnostics.eslint_d"),
    null_ls.builtins.formatting.prettier,
    --c/c++
    null_ls.builtins.formatting.clang_format,
    --python
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = function()
      local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
      return { "--python-executable", virtual .. "/bin/python3" }
      end,
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts

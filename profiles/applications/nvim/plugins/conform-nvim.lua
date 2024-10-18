local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "gofmt", "goimports" },
    nix = { "nixfmt" }
    
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

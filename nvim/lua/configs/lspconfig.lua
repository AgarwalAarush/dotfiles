local on_attach = require("configs.lsp.lspconfig").on_attach
local on_init = require("configs.lsp.lspconfig").on_init
local capabilities = require("configs.lsp.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "texlab" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.vtsls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
    "-nocudalib"
  }
}

-- python
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = "/Users/aarushagarwal/miniconda3/envs/MachineLearning/bin/python3",
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
        stubPath = "/Users/aarushagarwal/miniconda3/envs/MachineLearning/lib/python3.8/site-packages",
        reportUnknownType = "none",
        reportUnknownCallType = "none",
        reportUnknownLambdaType = "none",
        reportUnknownVariableType = "none",
        reportUnknownArgumentType = "none",
        reportUnknownParameterType = "none",
        reportGeneralTypeIssues = "none",
        reportOptionalSubscript = "none",
        reportOptionalMemberAccess = "none"
      },
    },
  },
}

return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "tsserver",
        "yamlls",
        "jsonls",
      },
    })

    local lspconfig = require("lspconfig")

    local function get_python_path()
      local handle = io.popen("which python")
      local python_path = handle:read("*a"):gsub("%s+", "") -- Remove any whitespace
      handle:close()
      return python_path
    end

    -- Configure pyright to use the dynamically determined Python interpreter
    lspconfig.pyright.setup({
      settings = {
        python = {
          pythonPath = get_python_path(),
        },
      },
      on_attach = function(client, bufnr)
        local function buf_set_option(...)
          vim.api.nvim_buf_set_option(bufnr, ...)
        end
        buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Optionally, set the Python path dynamically here again if needed
        client.config.settings.python.pythonPath = get_python_path()
        -- print(get_python_path())
        client.notify("workspace/didChangeConfiguration")
      end,
    })
  end,
}

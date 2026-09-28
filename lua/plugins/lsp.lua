return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "basedpyright", "ruff" },
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configuração global aplicada a todos os servers (Nvim 0.11+)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Configs específicas por server (opcional, sobrescreve/estende)
      vim.lsp.config("basedpyright", {})
      vim.lsp.config("ruff", {})

      -- Ativa os servers
      vim.lsp.enable({ "basedpyright", "ruff" })

      -- Keybindings ao ativar LSP num buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        end,
      })
    end,
  }

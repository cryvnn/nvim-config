return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "lua-language-server",
          "rust-analyzer",
          "pyright",
          "typescript-language-server",
          "css-lsp",
          "tailwindcss-language-server",
          "stylua",
          "shellcheck",
          "shfmt",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            hint = { enable = true, paramType = true, setType = false },
            format = { enable = false },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("pyright", {})

      vim.lsp.config("ts_ls", {
        root_markers = { ".git" },
        single_file_support = false,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayFunctionParameterTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })

      vim.lsp.config("cssls", {})
      vim.lsp.config("html", {})
      vim.lsp.config("tailwindcss", { root_markers = { ".git" } })
    end,
  },
}


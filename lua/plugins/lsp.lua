return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function()
          vim.lsp.start({
            name = "rust_analyzer",
            cmd = { "rust-analyzer" },
            root_dir = vim.fs.root(0, { "Cargo.toml", ".git" }),
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function()
          vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = vim.fs.root(0, { ".git", ".luarc.json" }),
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
          vim.lsp.start({
            name = "pyright",
            cmd = { "pyright-langserver", "--stdio" },
            root_dir = vim.fs.root(0, { ".git", "pyproject.toml" }),
          })
        end,
      })
    end,
  },
}

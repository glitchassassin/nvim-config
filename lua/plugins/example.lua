-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- change pyright config
  {
    "neovim/nvim-lspconfig",
    -- opts will be merged with the parent spec
    opts = {
      servers = { pyright = { settings = { python = { analysis = { typeCheckingMode = "off" } } } } },
    },
  },
  {
    "davidmh/mdx.nvim",
    config = true,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}

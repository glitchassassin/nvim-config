return {
  {
    "paulbkim-dev/vim-herdr-navigation",
    cond = function()
      return vim.env.HERDR_PANE_ID ~= nil and vim.env.HERDR_PANE_ID ~= ""
    end,
    event = "VeryLazy",
    config = function(plugin)
      -- Apply these mappings after LazyVim's window navigation mappings.
      vim.schedule(function()
        dofile(plugin.dir .. "/editor/nvim.lua")
      end)
    end,
  },
}

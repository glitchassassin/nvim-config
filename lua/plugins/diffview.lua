return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewFocusFiles", "DiffviewToggleFiles", "DiffviewRefresh" },
    keys = {
      { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gV", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview Repository History" },
    },
    opts = {
      -- Show deletions on the old side in red and dim empty diff filler lines.
      enhanced_diff_hl = true,
    },
  },
}

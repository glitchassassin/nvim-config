return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({
        "css",
        "graphql",
        "handlebars",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "less",
        "markdown",
        "markdown.mdx",
        "scss",
        "typescript",
        "typescriptreact",
        "vue",
        "yaml",
      }) do
        opts.formatters_by_ft[ft] = { "prettier", "oxfmt", stop_after_first = true }
      end

      -- The installed Oxfmt does not support Astro; leave LSP formatting as a fallback.
      opts.formatters_by_ft.astro = { "prettier" }

      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = opts.formatters.oxfmt or {}
      opts.formatters.oxfmt.prepend_args = function(_, ctx)
        -- Project formatter settings and EditorConfig take precedence over these defaults.
        if
          vim.fs.root(ctx.dirname, {
            ".oxfmtrc.json",
            ".oxfmtrc.jsonc",
            "oxfmt.config.ts",
            "oxfmt.config.mts",
            "vite.config.js",
            "vite.config.mjs",
            "vite.config.ts",
            "vite.config.cjs",
            "vite.config.mts",
            "vite.config.cts",
            ".editorconfig",
          })
        then
          return {}
        end

        return { "--config", vim.fn.stdpath("config") .. "/formatters/oxfmt.json" }
      end
    end,
  },
}

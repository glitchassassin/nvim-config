return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local oxfmt_configs = {
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
      }

      opts.formatters_by_ft = opts.formatters_by_ft or {}
      for _, ft in ipairs({
        "astro",
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

      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = opts.formatters.oxfmt or {}
      opts.formatters.oxfmt.condition = function(_, ctx)
        -- Astro needs project configuration; let Oxfmt report unsupported or invalid settings.
        return vim.bo[ctx.buf].filetype ~= "astro" or vim.fs.root(ctx.dirname, oxfmt_configs) ~= nil
      end
      opts.formatters.oxfmt.prepend_args = function(_, ctx)
        -- Project formatter settings and EditorConfig take precedence over these defaults.
        if vim.fs.root(ctx.dirname, oxfmt_configs) or vim.fs.root(ctx.dirname, ".editorconfig") then
          return {}
        end

        return { "--config", vim.fn.stdpath("config") .. "/formatters/oxfmt.json" }
      end
    end,
  },
}

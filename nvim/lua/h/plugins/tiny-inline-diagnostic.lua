return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,

    opts = {
      -- Style preset
      preset = "simple",

      -- Transparency
      transparent_bg = false,
      transparent_cursorline = true,

      -- Highlight groups
      hi = {
        error = "DiagnosticError",
        warn  = "DiagnosticWarn",
        info  = "DiagnosticInfo",
        hint  = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "Normal",
      },

      -- Disable for certain filetypes if needed
      disabled_ft = {},

      options = {
        show_source = {
          enabled = false,
          if_many = false,
        },

        show_code = true,
        use_icons_from_diagnostic = false,
        set_arrow_to_diag_color = false,

        throttle = 20,
        softwrap = 30,

        add_messages = {
          messages = true,
          display_count = false,
          use_max_severity = false,
          show_multiple_glyphs = true,
        },

        multilines = {
          enabled = false,
        },

        show_all_diags_on_cursorline = false,
        show_diags_only_under_cursor = false,

        show_related = {
          enabled = true,
          max_count = 3,
        },

        enable_on_insert = false,
        enable_on_select = false,

        overflow = {
          mode = "wrap",
          padding = 0,
        },

        virt_texts = {
          priority = 2048,
        },

        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.INFO,
          vim.diagnostic.severity.HINT,
        },
      },
    },

    config = function(_, opts)
      -- Setup plugin
      require("tiny-inline-diagnostic").setup(opts)

      -- Disable Neovim default virtual text diagnostics
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}

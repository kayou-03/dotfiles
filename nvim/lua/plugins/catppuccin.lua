return {
   -- 1. On installe et configure Catppuccin
   {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = {
         transparent_background = true,
         integrations = {
            mason = true,
            nvimtree = true,
            netrw = true,
            snacks = true,
            neotree = true,
            treesitter = true,
            native_lsp = {
               enabled = true,
               underlines = {
                  errors = { "undercurl" },
                  hints = { "undercurl" },
                  warnings = { "undercurl" },
                  information = { "undercurl" },
               },
            },
         },
         float = {
            transparent = true,
            solid = true,
         },
      },
   },

   {
      "LazyVim/LazyVim",
      opts = {
         colorscheme = "catppuccin",
      },
   },
}

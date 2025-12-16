return {
   "stevearc/conform.nvim",
   opts = {
      -- 1. On dit QUEL formateur utiliser pour QUEL langage
      formatters_by_ft = {
         json = { "prettier" },
         jsonc = { "prettier" }, -- Important pour les JSON avec commentaires (ex: tsconfig.json)
         javascript = { "prettier" },
         typescript = { "prettier" },
         html = { "prettier" },
         css = { "prettier" },
         lua = { "stylua" },
         sh = { "shfmt" },
      },

      -- 2. On configure les arguments (TES 3 ESPACES)
      formatters = {
         prettier = {
            prepend_args = { "--tab-width", "3" },
         },
         stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "3" },
         },
         shfmt = {
            prepend_args = { "-i", "3" },
         },
      },
   },
}

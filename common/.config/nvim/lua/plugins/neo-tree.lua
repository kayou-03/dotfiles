return {
   "nvim-neo-tree/neo-tree.nvim",
   opts = {
      close_if_last_window = true,
      filesystem = {
         filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
         },
      },
      default_component_configs = {
         git_status = {
            symbols = {
               -- Tu peux changer les icones ici si tu veux
               ignored = "", -- Change l'icone si tu veux (optionnel)
            },
         },
      },
   },
}

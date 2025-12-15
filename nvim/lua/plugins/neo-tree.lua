return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Affiche tout par défaut
        hide_dotfiles = false,
        hide_gitignored = false, -- C'EST LA LIGNE CLÉ : Ne cache pas les fichiers gitignore
      },
    },
    -- Optionnel : Pour être sûr que le statut Git n'écrase pas tes couleurs
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

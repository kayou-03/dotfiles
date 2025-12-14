-- ~/.config/nvim/lua/user/plugins/latex.lua

return {
  "lervag/vimtex",
  -- Lazy-load le plugin pour les fichiers .tex
  ft = { "tex", "bib" }, 

  -- 'init' s'exécute AVANT le chargement du plugin.
  -- C'est l'endroit idéal pour définir les variables globales (g:)
  init = function()
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'

    -- Optionnel : désactive le popup de vimtex au démarrage
    vim.g.vimtex_startup_info = 0 
  end
}

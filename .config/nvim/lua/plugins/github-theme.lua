  -- Github theme
  return { 
    'projekt0n/github-nvim-theme', 
    name = 'github-theme',

    -- Function call to set theme
    config = function()
      vim.cmd.colorscheme "github_dark_default"
  }

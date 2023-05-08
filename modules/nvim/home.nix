{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-markdown
      auto-pairs
      vim-gitgutter
      nerdcommenter
      vim-fugitive
      neovim-sensible
      vim-css-color
      vim-airline
      vim-airline-themes
      nvim-lspconfig
      nvim-treesitter
      nvim-cmp
      editorconfig-vim
      neoformat
      NeoSolarized
      indent-blankline-nvim
      nerdtree
    ];
    extraConfig = ''
      syntax enable
      let g:airline_theme="solarized"
      let mapleader=","
      highlight colorcolumn ctermbg=36
    '';
  };
}

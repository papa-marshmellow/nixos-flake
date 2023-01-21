{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
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
      nvim-autopairs
      indent-blankline-nvim
      # YouCompleteMe
    ];
    extraConfig = ''
      let g:airline_theme="solarized"
      let mapleader=","
      highlight colorcolumn ctermbg=36
    '';
  };
}

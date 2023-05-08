{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      hashicorp.terraform
      dbaeumer.vscode-eslint
      github.vscode-pull-request-github
      esbenp.prettier-vscode
      ms-vscode-remote.remote-ssh
      redhat.vscode-yaml
      vscodevim.vim
      jdinhlife.gruvbox
      zhuangtongfa.material-theme
      ms-azuretools.vscode-docker
      eamodio.gitlens
      bbenoise.nix
    ];
    userSettings = {
      "files.autoSave" = "off";
      "editor.tabSize" = 2;
      "editor.insertSpaces" = true;
      "editor.detectIndentation" = true;
      "editor.fontFamily": "FiraCode Nerd Font Mono",
      "editor.fontLigatures": true,
      "
    };
  };
}

{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
    shellAliases = {
      "cls" = "clear";
      "home" = "cd ~ && clear";
      ".." = "cd ..";
      "..." = "cd ../..";
      "find" = "fd";
      "ls" = "eza";
      "ll" = "eza -l";
      "la" = "eza -la";
      "grep" = "rg";
    };
  };
}
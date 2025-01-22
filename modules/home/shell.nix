{ ... }:
{
  home.shellAliases = {
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
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    # Type `z <pat>` to cd to some directory
    zoxide.enable = true;

    # Better shell prompt!
    starship = {
      enable = true;
      settings = {
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
      };
    };
  };
}

{ ... }:
{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = {
    git = {
      enable = true;
      userName = "logan thompson";
      userEmail = "logan.t2020@tutanota.com";
      ignores = [ "*~" "*.swp" ];
      aliases = {
        ci = "commit";
      };
      extraConfig = {
        init.defaultBranch = "master";
      };
    };
    lazygit.enable = true;
    gh.enable = true;
  };

}

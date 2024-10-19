{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "lowgain";
    userEmail = "logan.t2020@tutanota.com";
  };

  # Enable github cli
  programs.gh.enable = true;

}
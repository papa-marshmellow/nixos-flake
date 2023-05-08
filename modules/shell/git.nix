{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "lowgain";
    userEmail = "logan.t2020@tutanota.com";
  };

  # Enable github cli
  programs.gh.enable = true;

  # Enable the ssh key agent on boot
  programs.ssh.startAgent = true;
}

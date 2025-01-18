{ pkgs, ... }:
{
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    # Unix tools
    fd
    sd
    tree
    killall
    tldr
    ffmpeg_6
    neofetch
    cmatrix
    cbonsai

    # Compression
    p7zip
    zip
    unzip
    unrar

    # Networking Tools
    traceroute
    nmap
    speedtest-cli

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    # Better `cat`
    bat.enable = true;
    # Type `<ctrl> + r` to fuzzy search your shell history
    fzf.enable = true;
    jq.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;
    htop.enable = true;
    # Tmate terminal sharing.
    tmate = {
      enable = true;
      #host = ""; #In case you wish to use a server other than tmate.io 
    };
    ranger.enable = true;
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    ripgrep.enable = true;
  };
}

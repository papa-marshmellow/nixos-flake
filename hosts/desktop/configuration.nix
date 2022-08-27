{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
  };

  networking = {
    hostName = "fridge";
    firewall = {
      enable = true;
      allowedTCPPorts = [  ];
      allowedUDPPorts = [  ];
    wireless.iwd.enable = true;
    };
  };

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable Qemu/KVM
  virtualisation.libvirtd.enable = true;

  # Enable steam
  programs.steam.enable = true;

  # Enable Gamemode
  programs.gamemode.enable = true;

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  programs = {

    # Enable the ssh key agent on boot
    ssh.startAgent = true;

  };
}

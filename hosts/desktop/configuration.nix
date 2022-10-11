{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "quiet" "splash" ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };

  networking = {
    hostName = "fridge";
    firewall = {
      enable = true;
      allowedTCPPorts = [  ];
      allowedUDPPorts = [  ];
    };
    wireless.iwd.enable = true;
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

  # Enable the ssh key agent on boot
  programs.ssh.startAgent = true;

  # Enable i2c
  hardware.i2c.enable = true;

  # Enable MYSQL
  services.mysql.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];

}

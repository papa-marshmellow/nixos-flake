{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking = {
    hostName = "frying-pan";
    wireless.iwd.enable = true;
    wg-quick.interfaces = {
      mom-house = {
        address = [ "10.13.13.3/24" ];
        dns = [ "10.13.13.1" ];
        privateKeyFile = "/etc/wireguard/mom-house/private.key";
        listenPort = [ 51820 ];
        peers = [
          {
            publicKey = "29Sy3/sbHuBiI8xDSzRmwN0RTMjb9DsfeHwO4NNb5lY=";
            presharedKeyFile = "/etc/wireguard/mom-house/preshared.key";
            allowedIPs = [ "0.0.0.0/0" "::/0" ];
            endpoint = "joneserconvention.com:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Set lid switch action
  services.logind.lidSwitch = "ignore";

  # Enable trackpad
  services.xserver.libinput.enable = true;

  # Enable the ssh key agent on boot
  programs.ssh.startAgent = true;

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable Qemu/KVM
  virtualisation.libvirtd.enable = true;

  # Enable phone mounting
  services.gvfs.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}

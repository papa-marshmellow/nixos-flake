# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/bf3c70eb-fd1f-4aa5-bc0f-5bf28b3d0b42";
      fsType = "btrfs";
      options = [ "subvol=@" "compression=zstd" "noatime" "autodefrag" "ssd" "ssd_spread" "clear_cache" ];
    };

  boot.initrd.luks.devices."luks-cd3b4a0d-82e8-4b81-aab5-b053e11aaf37".device = "/dev/disk/by-uuid/cd3b4a0d-82e8-4b81-aab5-b053e11aaf37";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/53D4-F7E8";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/28df2420-b83a-4fc4-bce2-8c9406e8d8a4"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault false;
  networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

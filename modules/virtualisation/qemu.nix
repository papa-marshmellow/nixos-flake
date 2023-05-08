{ config, pkgs, user, ... }:

{                                             # Add libvirtd and kvm to userGroups

  users.groups.libvirtd.members = [ "root" "${user}" ];

  virtualisation = {
    libvirtd = {
      enable = true;
#      qemu = {
#        verbatimConfig = ''
#         nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
#        '';
#      };
    };
    spiceUSBRedirection.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      qemu
      OVMF
      gvfs
    ];
  };

  services.gvfs.enable = true;

}
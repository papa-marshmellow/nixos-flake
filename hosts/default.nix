{ lib, inputs, nixpkgs, home-manager, user, nur, ... }:

let

  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;

in
{

  desktop = lib.nixosSystem {
    inherit system;
    modules = [
      nur.nixosModules.nur
      hyprland.nixosModules.default
      ./configuration.nix
      ./desktop
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit user;
            host = {
              hostName = "desktop";
              mainMonitor = "DP-0";
              secondMonitor = "HDMI-A-1";
            };
          };            
          users.${user} = {
            imports = [
              ./home.nix
              ./desktop/home.nix
            ];
          };
        };
      }
    ];
  };

  laptop = lib.nixosSystem {
    inherit system;
    modules = [
      nur.nixosModules.nur
      hyprland.nixosModules.default
      ./configuration.nix
      ./laptop
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit user;
            host = {
              hostName = "laptop";
              mainMonitor = "eDP-1";
            };
          };            
          users.${user} = {
            imports = [
              ./home.nix
              ./laptop/home.nix
            ];
          };
        };
      }
    ];
  };

  vm = lib.nixosSystem {
    inherit system;
    modules = [
      nur.nixosModules.nur
      hyprland.nixosModules.default
      ./configuration.nix
      ./vm
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit user;
            host = {
              hostName = "vm";
              mainMonitor = "VIRTUAL-1";
            };
          };            
          users.${user} = {
            imports = [
              ./home.nix
              ./vm/home.nix
            ];
          };
        };
      }
    ];
  };

}
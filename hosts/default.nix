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
      ./configuration.nix
      ./desktop
      nur.nixosModules.nur
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
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
      ./configuration.nix
      ./laptop
      nur.nixosModules.nur
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
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
      ./configuration.nix
      ./vm
      nur.nixosModules.nur
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
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
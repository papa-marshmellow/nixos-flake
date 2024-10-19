{ lib, inputs, nixpkgs, nixos-wsl, home-manager, user, ... }:

let

  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
  };

in {
  wsl = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system user;
    };
    modules = [
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit user;
          };
          users.${user} = {
            imports = [
              ./home.nix
            ];
          };
        };
      }
      ./configuration.nix
      ./wsl/configuration.nix
    ];
  };
}

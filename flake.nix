{
  description = "Logans personal flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

  };

  outputs = { self, nixpkgs, home-manager, nur, ... }:

  let

    user = "lowgain";

  in {

    nixosConfigurations = (
      import ./hosts {
        inherit (nixpkgs) lib;
        inherit inputs nixpkgs home-manager user nur;
      }
    );

  };
}

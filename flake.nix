{
  description = "Logans personal flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

  };

  outputs = inputs @ { self, nixpkgs, home-manager, nur, ... }:

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

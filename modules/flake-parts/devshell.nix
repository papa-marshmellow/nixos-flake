{
  perSystem = { pkgs, ... }: {
    devShells = {
      default = pkgs.mkShell {
        name = "nixos-unified-template-shell";
        meta.description = "Shell environment for modifying this Nix configuration";
        packages = with pkgs; [
          just
          nixd
        ];
      };
      node = pkgs.mkShell {
        name = "node-shell";
        meta.description = "Shell environment for working with node projects";
        packages = with pkgs; [
          nodejs
          nodePackages.npm
          yo
        ];
      };
    };
  };
}

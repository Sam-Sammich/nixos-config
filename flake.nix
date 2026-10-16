{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:nix-community/nix-wrapper-modules";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, wrappers, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        
      ];
    };
    packages.x86_64-linux.niri = wrappers.wrappers.niri.wrap (
      {pkg, wlib, lib, ...}: {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        import = [ ./niri.nix ];
      }
    );
  };
}

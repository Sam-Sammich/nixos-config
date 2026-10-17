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
        {
          _module.args = {
            inherit self;
          };
        }
      ];
    };
    packages.x86_64-linux = {
      niri = wrappers.wrappers.niri.wrap (
        {pkg, wlib, lib, ...}: {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          imports = [ ./niri.nix ];
        }
      );
      helix = (nixpkgs.legacyPackages.x86_64-linux.callPackage ./helix.nix { });
    };
  };
}

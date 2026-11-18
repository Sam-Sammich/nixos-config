{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:nix-community/nix-wrapper-modules";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";
    walls = {
      url = "github:Sam-Sammich/walls";
      flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, wrappers, walls, ... }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
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
          pkgs = pkgs;
          imports = [ ./niri.nix ];
        }
      );
      helix = (nixpkgs.legacyPackages.x86_64-linux.callPackage ./helix.nix { });
      noctalia-wrapped = wrappers.wrappers.noctalia.wrap {
        inherit pkgs;
        settings = {
          wallpaper = {
            enabled = true;
            directory = "${walls}";
          };
        };
      };
    };
  };
}

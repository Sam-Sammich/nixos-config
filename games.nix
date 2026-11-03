{ pkgs, lib, ...}:
{
  programs.steam = {
    enable = true;
    extest.enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  environment.systemPackages = [
    pkgs.prismlauncher
    pkgs.mangohud
  ];
}

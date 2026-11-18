{ config, pkgs, self, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./games.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users."sammy" = {
    isNormalUser = true;
    description = "Sammy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;
  
  programs.niri.enable =  true;
  programs.niri.package = self.packages.x86_64-linux.niri;
  services.displayManager.ly.enable = true;
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "20";
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    bibata-cursors
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    bat
    kitty
    rofi
    mpv
    man-pages
    lazygit
    qbittorrent
    podman-compose
    xwayland-satellite
    self.packages.x86_64-linux.helix
    thunar
    lumafly
    wl-clipboard
    grim
    slurp
    devenv
    fastfetch
    godot
  ];

  programs.direnv.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/sammy/configuration";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;
  virtualisation.podman = {
    enable = true;
  };

  system.stateVersion = "26.05"; # Did you read the comment?

}

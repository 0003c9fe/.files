# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "europa";
  services.sshd.enable = true;
  services.openssh.permitRootLogin = "yes";

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget vim roboto-mono
  ];

  # Allow packages with unfree licenses to be installed.
  nixpkgs.config.allowUnfree = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    libinput.enable = true; # Enable touchpad support.
    displayManager.defaultSession = "none+i3";
    displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "jack";
      extraConfig = ''
        [greeter]
        show-password-label = true
        password-label-text = Password:
        show-input-cursor = false
        password-alignment = left
        [greeter-theme]
        font = "RobotoMono"
        font-size = 1em
        font-weight = bold
        font-style = normal
        text-color = "#f1efee"
        error-color = "f22c40"
        background-image = ""
        background-color = "#1b1918"
        window-color = "#1b1918"
        border-color = "#1b1918"
        border-width = 0px
        layout-space = 15
        password-color = "#f1efee"
        password-background-color = "#1b1918"
        password-border-color = "#1b1918"
        password-border-width = 0px
      '';
    };   
    windowManager = {
      i3.enable = true;
    };
  };
  hardware.opengl.driSupport32Bit = true; # 32-bit support.


  # Create user account
  users.users.jack = {
    isNormalUser = true;
    home = "/home/jack";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Automatic upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "unstable"; # Did you read the comment?

}


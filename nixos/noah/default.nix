{pkgs, ...}: {
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../common/core
    ../common/optional
  ];

  users.users.haam = {
    isNormalUser = true;
    createHome = true;
    home = "/home/haam";
    initialPassword = "221";
    description = "Hamza zarrouk";
    extraGroups = ["wheel" "networkmanager"];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.11";
}

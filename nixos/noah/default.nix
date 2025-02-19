{pkgs,inputs, ...}: {
  imports = [
    # If you want to use modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    ../common/core
    ../common/optional
    ./imper.nix

    inputs.disko.nixosModules.disko
    (import ../common/disko/btrfs-disk.nix
    {
        disk = "/dev/nvme0n1";
        withSwap = true;
        swapSize = 8;
    })

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

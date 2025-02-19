# Core functionality for every nixos host
{vars, ...}: {
  # Database for aiding terminal-based programs
  environment.enableAllTerminfo = true;
  # Enable firmware with a license allowing redistribution
  hardware.enableRedistributableFirmware = true;

  # ========== Nix Helper ==========

  # Provide better build output and will also handle garbage collection in place of standard nix gc (garbace collection)

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 20d --keep 20";
    flake = "/home/user/${vars.spec.home}/nix-config";
  };
}

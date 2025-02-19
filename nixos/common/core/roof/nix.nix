{
  inputs,
  lib,
  ...
}: {
  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: {flake = value;}) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    enable = true;
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-substituters = ["http://cache.nixos.org"];
      substituters = ["http://cache.nixos.org"];
      auto-optimise-store = true;
      cores = 0;
      max-jobs = 1;
      sandbox = false;
    };
    #package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
    gc.automatic = true;
    nixPath = ["nixpkgs=${inputs.stable}"];
  };
}

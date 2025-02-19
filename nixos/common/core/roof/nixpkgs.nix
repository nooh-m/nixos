{inputs, ...}: {
  nixpkgs = {
    config.allowUnfree = true;
    system = "x86_64-linux";
    # You can add overlays here
    overlays = [
      #outputs.overlays.additions
      #outputs.overlays.modifications
      #outputs.overlays.unstable-packages
      inputs.sddm-sugar-candy-nix.overlays.default
    ];
  };
}

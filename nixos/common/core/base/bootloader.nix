{inputs, ...}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 10;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        backgroundColor = "#7EBAE4";
        configurationLimit = 10;
        configurationName = "Stable";
        default = "saved";
        fontSize = 16;
        theme = inputs.nixos-grub-themes.packages.x86_64-linux.nixos.overrideAttrs {installPhase = "cp -r customize/lenovo $out";};
      };
    };
  };
}

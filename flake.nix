{
  description = "Nixos Configuration";

  inputs = {
    # Specs And Variables
    vars.url = "github:nooh-m/variables";

    # Stable Nixpkgs
    stable.follows = "vars/stable"; # Use the same nixpkgs as vars repo

    # Stable Nixpkgs
    nixos-grub-themes = {
      url = "github:jeslie0/nixos-grub-themes";
      inputs.nixpkgs.follows = "stable";
    };
    fonts = {
      url = "github:Selynaia/font-derivations";
      inputs.nixpkgs.follows = "stable";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "stable";
    };

    impermanence = {
       url = "github:nix-community/impermanence";
    };

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "stable";
    };

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "stable";
    };
  };

  outputs = {
    self,
    stable,
    vars,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    nixosConfigurations = {
      laptop = stable.lib.nixosSystem {
        specialArgs = {inherit inputs outputs vars;};
        modules = [
          inputs.impermanence.nixosModules.impermanence
          ./nixos/${vars.spec.username}
        ];
      };
    };
  };
}

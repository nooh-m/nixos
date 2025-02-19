{
  inputs,
  lib,
  pkgs,
  ...
}: let
  fonts = pkgs.stdenv.mkDerivation rec {
    name = "base-fonts";
    src = pkgs.fetchzip {
        url = "https://github.com/Selynaia/fonts/archive/refs/heads/master.zip";
        hash = "sha256-EqrfGcwH8P5tCV0w82GX58pJohXemQrQIR2kjRlxnUY=";
        stripRoot = false;
    };

  # If needed, specify the sourceRoot to point to the correct directory
    dontConfigure = true;
    dontBuild = true;
    doCheck = false;

    installPhase = ''
      mkdir -p $out/share/fonts
      mkdir -p $out/share/fonts/${name}
      cp -r "${src}/fonts-master/base-fonts/ttf" "$out/share/fonts/${name}"
    '';
  };
in {
  fonts = {
    enableGhostscriptFonts = false;
    packages = [fonts];
    fontDir = {enable = true;};
    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["SF Mono"];
        sansSerif = ["SF Pro"];
        serif = ["New York"];
      };
      antialias = true;
      enable = true;
    };
  };
}

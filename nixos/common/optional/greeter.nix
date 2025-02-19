{inputs, ...}: {
  imports = [
    inputs.sddm-sugar-candy-nix.nixosModules.default
  ];
  services = {
    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "weston";
        };
        sugarCandyNix = {
          enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
          settings = {
            DimBackgroundImage = 0.0;
            ScaleImageCropped = true;
            ScreenWidth = 1920;
            ScreenHeight = 1080;
            FullBlur = false;
            PartialBlur = false;
            BlurRadius = 100;
            HaveFormBackground = false;
            FormPosition = "center";
            BackgroundImageHAlignment = "center";
            BackgroundImageVAlignment = "center";
            MainColor = "white";
            AccentColor = "#7aa2f7";
            BackgroundColor = "#1a1b26";
            OverrideLoginButtonTextColor = "";
            InterfaceShadowSize = 6;
            InterfaceShadowOpacity = 0.6;
            RoundCorners = 20;
            ScreenPadding = 0;
            Font = "Noto Sans";
            FontSize = "";
            ForceRightToLeft = false;
            ForceLastUser = true;
            ForcePasswordFocus = true;
            ForceHideCompletePassword = false;
            ForceHideVirtualKeyboardButton = false;
            ForceHideSystemButtons = false;
            Locale = "";
            HourFormat = "HH:mm";
            DateFormat = "dddd, d of MMMM";
            HeaderText = "Welcome!";
          };
        };
      };
    };
  };
}

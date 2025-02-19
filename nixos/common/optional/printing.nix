{pkgs, ...}: {
  services = {
    printing = {
      enable = true;
      startWhenNeeded = true;
      drivers = with pkgs; [
        gutenprint
        gutenprintBin
        hplip
        hplipWithPlugin
        postscript-lexmark
        samsung-unified-linux-driver
        splix
        brlaser
        brgenml1lpr
        cnijfilter2
      ];
    };
    avahi = {
      enable = true;
      nssmdns = true;
      # for a WiFi printer
      openFirewall = true;
    };
  };
}

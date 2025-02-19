{pkgs, ...}: {
  console = {
    colors = [
      "1A1B26"
      "16161E"
      "2F3549"
      "444B6A"
      "787C99"
      "A9B1D6"
      "CBCCD1"
      "D5D6DB"
      "C0CAF5"
      "A9B1D6"
      "0DB9D7"
      "9ECE6A"
      "B4F9F8"
      "2AC3DE"
      "BB9AF7"
      "F7768E"
    ];
    earlySetup = false;
    enable = true;
    font = "Lat2-Terminus16";
    keyMap = "us";
    packages = [pkgs.terminus_font];
  };
}

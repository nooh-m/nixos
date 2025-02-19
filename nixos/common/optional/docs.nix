{
  documentation = {
    enable = true;
    dev.enable = true;
    doc.enable = false;
    info.enable = true;
    nixos.enable = true;
    man = {
      enable = true;
      generateCaches = true;
      man-db.enable = false;
      mandoc = {
        enable = true;
        manPath = ["share/man"];
      };
    };
  };
}

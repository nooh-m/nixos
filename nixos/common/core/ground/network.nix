{vars, ...}: {
  networking = {
    networkmanager.enable = true;
    hostName = "${vars.spec.hostName}";
    nameservers = ["1.1.1.3" "1.0.0.3"];
    networkmanager.dns = "none";
  };
}

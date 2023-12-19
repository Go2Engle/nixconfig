{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    localsend
  ];
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 53317 ]; # 53317 is for LocalSend
      allowedUDPPortRanges = [
         { from = 53315; to = 53318; }
       ];
    };
  };

}
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openlens
  ];
}
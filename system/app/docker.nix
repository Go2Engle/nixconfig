{ config, pkgs, ... }:

{

  # Enable docker
  virtualisation.docker.enable = true;
  users.extraUsers.cengle.extraGroups = [ "docker" ];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };


}

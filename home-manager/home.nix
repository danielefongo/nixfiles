{ config, pkgs, username, homeDir, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  home.packages = [];

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}

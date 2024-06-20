{ pkgs, home, ... }:

{
  home.packages = [
    pkgs.i3
    pkgs.i3lock-fancy-rapid
  ];
}

{ pkgs, dots, ... }: {
  imports = [
    ../modules/alacritty.nix
    ../modules/core.nix
    ../modules/desktop.nix
    ../modules/dev.nix
    ../modules/dunst.nix
    ../modules/git.nix
    ../modules/i3.nix
    ../modules/picom.nix
    ../modules/polybar.nix
    ../modules/rofi.nix
    ../modules/neovim.nix
    ../modules/zsh.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
  home.file = { "dotfiles/dots".source = dots; };
}

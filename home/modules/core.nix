{ pkgs, ... }: {
  home.packages = with pkgs; [
    autojump
    bat
    file
    fzf
    gnumake
    jq
    killall
    ncdu
    ripgrep
    tldr
    tree
    unzip
  ];
}

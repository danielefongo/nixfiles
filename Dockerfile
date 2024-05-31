FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S sudo --noconfirm

# env
ENV USER=user
ENV HOME=/home/user

# create user
RUN useradd -m -d $HOME $USER \
  && chown -R "$USER:$USER" $HOME \
  && echo "$USER:pass" | chpasswd \
  && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER user

# install nix
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
ENV PATH="$PATH:$HOME/.nix-profile/bin"

# install home-manager
RUN nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
RUN nix-channel --update
RUN nix-shell '<home-manager>' -A install

# workdir
WORKDIR /home/user/dotfiles

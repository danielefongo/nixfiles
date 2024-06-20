FROM archlinux:latest

RUN pacman -Syu --noconfirm
RUN pacman -S sudo --noconfirm

# env
ENV USER=danielefongo
ENV HOME=/home/danielefongo

# create user
RUN useradd -m -d $HOME $USER \
  && chown -R "$USER:$USER" $HOME \
  && echo "$USER:pass" | chpasswd \
  && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER user

# install nix + home-manager
COPY setup .
RUN bash setup

# binary env
ENV PATH="$PATH:$HOME/.nix-profile/bin"

# workdir
WORKDIR /home/user/dotfiles

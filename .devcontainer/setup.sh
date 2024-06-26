## update and install some things we should probably have
apt-get update
apt-get install -y \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  zsh \
  vim \
  build-essential \
  openssl \
  libssl-dev \
  pkg-config \
  libudev-dev

## Install rustup and common components
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# rustup component add rustfmt
# rustup component add rustfmt --toolchain nightly
# rustup component add clippy 
# rustup component add clippy --toolchain nightly

# cargo install cargo-expand
# cargo install cargo-edit

## setup and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -R /root/.oh-my-zsh /home/$USERNAME
cp /root/.zshrc /home/$USERNAME
sed -i -e "s/\/root\/.oh-my-zsh/\/home\/$USERNAME\/.oh-my-zsh/g" /home/$USERNAME/.zshrc
chown -R $USER_UID:$USER_GID /home/$USERNAME/.oh-my-zsh /home/$USERNAME/.zshrc

## install firacode
sudo add-apt-repository universe
sudo apt-get install fonts-firacode
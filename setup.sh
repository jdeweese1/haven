#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jdeweese1/haven/main/setup.sh)"
sudo yum install -y  python3.11 git make jq zsh
python3 -m ensurepip
python3 -m pip install --user ansible
git clone https://github.com/jdeweese1/dotfiles
cd dotfiles && make dotfiles
curl -fsSL https://tailscale.com/install.sh | sh
usermod --shell /bin/zsh ec2-user

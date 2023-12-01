#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jdeweese1/haven/main/setup.sh)"
sudo yum install -y  python3.11 git make jq zsh
python3 -m ensurepip
python3 -m pip install --user ansible
git clone https://github.com/jdeweese1/dotfiles
(cd dotfiles && make dotfiles)
curl -fsSL https://tailscale.com/install.sh | sh
sudo usermod --shell /bin/zsh ec2-user
sh <(curl -L https://nixos.org/nix/install) --daemon
pipx install  csvtool
pip install pipenv
git clone https://github.com/jdeweese1/exam-template

sudo tailscale up
key_base_name=~/.ssh/$(date +"%Y-%m-%d")_ed25519
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
echo "YOU NEED TO ssh-add ~/.ur-priv-key-file"
git clone https://github.com/jdeweese1/haven

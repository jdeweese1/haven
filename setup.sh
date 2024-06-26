#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jdeweese1/haven/main/setup.sh)"
echo "enter the email of ur github: "
read email
sudo yum install -y  python3.11 git make jq zsh
python3 -m ensurepip
python3 -m pip install --upgrade pip
python3 -m pip install --user ansible

git clone https://github.com/jdeweese1/dotfiles
(cd dotfiles && make dotfiles)
curl -fsSL https://tailscale.com/install.sh | sh
sudo usermod --shell /bin/zsh ec2-user &

sh <(curl -L https://nixos.org/nix/install) --daemon &
pip3 install pipx pipenv &

wait
pipx install  csvtool
git clone https://github.com/jdeweese1/exam-template

sudo tailscale up
key_base_name=~/.ssh/$(date +"%Y-%m-%d")_ed25519
ssh-keygen -t ed25519 -C "$email" -f $key_base_name -q -N ""
eval `$(ssh-agent -s)`
ssh-add $key_base_name
echo "You should add the following to ur github:"
cat $key_base_name.pub
git clone https://github.com/jdeweese1/haven

#curl -fsSL https://code-server.dev/install.sh | sh
#sudo systemctl enable --now code-server@$USER

mkdir -p ~/.config
docker run -it --name code-server -p 127.0.0.1:8080:8080 \
  -v "$HOME/.local:/home/coder/.local" \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  --network host \
  codercom/code-server:latest



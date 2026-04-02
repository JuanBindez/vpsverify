# 1. Conectar na VPS
ssh seu_usuario@[IP DA VPS]

# 2. Instalar Docker (os comandos que você mostrou)
sudo apt update && sudo apt upgrade -y
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo docker --version  # Verificar Docker

# 3. Instalar Docker Compose (adicional)
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version  # Verificar Docker Compose

# 4. Adicionar seu usuário ao grupo docker (opcional - evita usar sudo)
sudo usermod -aG docker $USER
newgrp docker  # Ou saia e entre novamente na VPS

# 5. Clonar e rodar sua aplicação
git clone https://github.com/SEU_USUARIO/minha-app-flask.git
cd minha-app-flask
docker-compose up -d --build

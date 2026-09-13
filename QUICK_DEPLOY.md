# 🚀 Deploy Rápido do JARVIS

## Opção Mais Simples: Railway.app

### 1. Criar conta no Railway.app
- Acesse: https://railway.app
- Crie conta com GitHub
- Ganhe $5 de crédito grátis

### 2. Criar novo projeto
- Clique em "New Project"
- Selecione "Deploy from GitHub repo"
- Conecte seu repositório JARVIS

### 3. Adicionar serviços
No projeto Railway:
- **PostgreSQL**: Clique em "New Service" → "PostgreSQL"
- **Redis**: Clique em "New Service" → "Redis"

### 4. Configurar variáveis de ambiente
- Vá em "Variables"
- Adicione as variáveis do `.env.example`
- Railway fornece automaticamente:
  - `DATABASE_URL` (do PostgreSQL)
  - `REDIS_URL` (do Redis)

### 5. Deploy
- Clique em "Generate Domain"
- Clique em "Deploy"

### 6. Acessar o sistema
- Railway fornecerá uma URL como: `https://jarvis-production.up.railway.app`
- Adicione `/api/docs` para ver a documentação Swagger

## Opção Econômica: DigitalOcean ($6/mês)

### 1. Criar conta DigitalOcean
- Acesse: https://digitalocean.com
- Ganhe $200 de crédito para novos usuários

### 2. Criar Droplet
- Clique em "Create" → "Droplets"
- Escolha "Ubuntu 22.04 LTS"
- Plano: "Basic" ($6/mês)
- Região: São Paulo (mais rápido para Brasil)

### 3. Acessar o servidor
```bash
# Usar o IP fornecido pelo DigitalOcean
ssh root@seu-ip

# Ou usar o console web do DigitalOcean
```

### 4. Instalar dependências
```bash
apt update && apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

### 5. Configurar JARVIS
```bash
# Clonar repositório
git clone seu-repositório
cd jarvis

# Configurar ambiente
cp .env.example .env
nano .env  # editar com suas configurações

# Iniciar
docker-compose up -d
```

### 6. Configurar domínio (opcional)
- Compre domínio ou use subdomínio gratuito
- Configure DNS para apontar para o IP do droplet
- Configure Nginx como proxy reverso

## 🎯 Minha Recomendação

**Para começar agora**: Railway.app
- Mais simples
- Suporta PostgreSQL e Redis
- Deploy automático via GitHub
- Previsível mensalmente

**Para produção séria**: DigitalOcean VPS
- Mais controle
- Melhor performance
- Preço fixo baixo
- Suporta todas as funcionalidades do JARVIS

## ⚡ Comandos Úteis

### Railway.app
```bash
# Instalar CLI
npm install -g @railway/cli

# Login
railway login

# Deploy
railway up

# Ver logs
railway logs
```

### DigitalOcean
```bash
# Ver status dos containers
docker-compose ps

# Ver logs
docker-compose logs -f

# Reiniciar serviços
docker-compose restart

# Atualizar código
git pull
docker-compose down
docker-compose up -d --build
```

## 🔧 Solução de Problemas

### Railway.app
- **Erro de conexão com banco**: Verifique se o PostgreSQL está rodando
- **Timeout**: Aumente o timeout no railway.toml
- **Variáveis de ambiente**: Verifique se todas estão configuradas

### DigitalOcean
- **Porta 3000 bloqueada**: Configure Nginx como proxy
- **Memória insuficiente**: Faça upgrade do droplet
- **SSL expirado**: Renove certificado Let's Encrypt

## 📞 Suporte

Se precisar de ajuda com deploy:
- Railway.app: https://docs.railway.app
- DigitalOcean: https://docs.digitalocean.com
- Comunidade JARVIS: Ver documentação no repositório
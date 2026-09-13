# 🚀 Guia de Deploy do JARVIS

## 🎯 Opção Recomendada: Railway.app

### Por que Railway.app?
- ✅ Suporta PostgreSQL e Redis nativamente
- ✅ Deploy automático via GitHub
- ✅ Interface simples e intuitiva
- ✅ Preço acessível ($5-20/mês)
- ✅ Ideal para aplicações Node.js complexas

### Passo a Passo:

#### 1. Preparar o Repositório
```bash
# Adicionar arquivo railway.toml na raiz do projeto
touch railway.toml
```

#### 2. Configurar railway.toml
```toml
[build]
builder = "NIXPACKS"

[deploy]
healthcheckPath = "/api/health"
healthcheckTimeout = 300
restartPolicyType = "ON_FAILURE"
restartPolicyMaxRetries = 10
```

#### 3. Criar conta no Railway.app
- Acesse: https://railway.app
- Crie conta com GitHub
- Ganhe $5 de crédito grátis

#### 4. Criar projeto
- Clique em "New Project"
- Selecione "Deploy from GitHub repo"
- Conecte seu repositório JARVIS

#### 5. Adicionar serviços
No projeto Railway:
- **PostgreSQL**: "New Service" → "PostgreSQL"
- **Redis**: "New Service" → "Redis"

#### 6. Configurar variáveis
Vá em "Variables" e adicione:
```
JWT_SECRET=seu-secret-aqui
NODE_ENV=production
PORT=3000
```
Railway fornece automaticamente:
- `DATABASE_URL` (do PostgreSQL)
- `REDIS_URL` (do Redis)

#### 7. Deploy
- Clique em "Generate Domain"
- Clique em "Deploy"

#### 8. Acessar
- URL: `https://seu-projeto.up.railway.app`
- API Docs: `https://seu-projeto.up.railway.app/api/docs`

---

## 💰 Opção Econômica: DigitalOcean ($6/mês)

### Por que DigitalOcean?
- ✅ Preço fixo baixo ($6/mês)
- ✅ Controle total do servidor
- ✅ Suporta todas as funcionalidades do JARVIS
- ✅ Playwright funciona perfeitamente
- ✅ Escalabilidade total

### Passo a Passo:

#### 1. Criar Droplet
- Acesse: https://cloud.digitalocean.com
- "Create" → "Droplets"
- Ubuntu 22.04 LTS
- Basic plan ($6/mês)
- Região: São Paulo

#### 2. Acessar o servidor
```bash
# SSH para o servidor (usando o IP fornecido)
ssh root@seu-ip

# Ou use o console web do DigitalOcean
```

#### 3. Instalar dependências
```bash
apt update && apt upgrade -y
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

#### 4. Clonar e configurar
```bash
# Clonar repositório
git clone seu-repositório
cd jarvis

# Configurar ambiente
cp .env.example .env
nano .env  # editar configurações

# Iniciar serviços
docker-compose up -d
```

#### 5. Acessar
- IP do droplet: `http://seu-ip:3000`
- API Docs: `http://seu-ip:3000/api/docs`

---

## 🏢 Opção Profissional: Render.com

### Por que Render?
- ✅ PostgreSQL nativo
- ✅ Redis disponível
- ✅ SSL automático
- ✅ Escalabilidade automática
- ✅ Serviços de background workers

### Passo a Passo:

#### 1. Criar conta
- Acesse: https://render.com
- Crie conta com GitHub

#### 2. Criar PostgreSQL
- "New" → "PostgreSQL"
- Configure e crie

#### 3. Criar Redis
- "New" → "Redis"
- Configure e crie

#### 4. Criar Web Service
- "New" → "Web Service"
- Conecte seu repositório JARVIS
- Configure:
  - Build Command: `npm run build`
  - Start Command: `npm run start:prod`
  - Environment Variables: Adicione todas do .env.example

#### 5. Deploy
- Render fará deploy automático
- Aguarde o build e deployment

---

## 🎯 Comparação

| Provider | Preço | Facilidade | Funcionalidades | Recomendado Para |
|----------|-------|------------|----------------|------------------|
| Railway.app | $5-20/mês | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | Início/Testes |
| DigitalOcean | $6/mês | ⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Produção |
| Render.com | $7-25/mês | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | Produção Profissional |
| AWS | $50+/mês | ⭐⭐ | ⭐⭐⭐⭐⭐ | Escala Empresarial |

---

## ⚡ Deploy Rápido (Escolha Railway)

### 1. Preparar repositório
```bash
# Adicionar railway.toml na raiz
[build]
builder = "NIXPACKS"

[deploy]
healthcheckPath = "/api/health"
```

### 2. Conectar GitHub
- Vá em railway.app
- New Project → Deploy from GitHub
- Conecte seu repositório

### 3. Adicionar serviços
- PostgreSQL (New Service)
- Redis (New Service)

### 4. Configurar variáveis
- JWT_SECRET
- NODE_ENV=production

### 5. Deploy
- Clique em "Deploy"

### 6. Pronto!
- Sistema disponível em: `https://seu-projeto.up.railway.app`

---

## 🔧 Troubleshooting

### Railway.app
- **Build falha**: Verifique package.json e dependências
- **Timeout**: Aumente healthcheckTimeout
- **Banco erro**: Verifique DATABASE_URL

### DigitalOcean
- **Porta bloqueada**: Use Nginx como proxy
- **Memória erro**: Faça upgrade do droplet
- **Docker erro**: Verifique docker-compose.yml

### Render.com
- **Worker timeout**: Aumente timeout nas configurações
- **Build lento**: Otimize build process
- **Variable error**: Verifique todas as variáveis

---

## 📞 Suporte

- **Railway**: https://docs.railway.app
- **DigitalOcean**: https://docs.digitalocean.com
- **Render**: https://render.com/docs
- **JARVIS Docs**: Ver documentação no repositório

---

**Recomendação Final**: Comece com Railway.app para testar, depois migre para DigitalOcean para produção séria!
# 🚀 Setup JARVIS no Railway.app

## ✅ Status Atual
Você já tem:
- ✅ PostgreSQL criado no Railway.app
- ✅ Projeto JARVIS completo + Health Check endpoint

## 📋 Próximos Passos

### 1. Adicionar Redis ao Projeto Railway
No seu projeto Railway:
- Clique em "New Service"
- Selecione "Redis"
- Clique em "Add Redis"

### 2. Adicionar o Serviço JARVIS
No seu projeto Railway:
- Clique em "New Service"
- Selecione "Deploy from GitHub repo"
- Conecte seu repositório JARVIS
- Configure:
  - **Root Directory**: `./`
  - **Build Command**: `npm install && npm run build`
  - **Start Command**: `npm run start:prod`

### 3. Configurar Variáveis de Ambiente
No serviço JARVIS, vá em "Variables" e adicione:

```
JWT_SECRET=jarvis-super-secret-key-production-2024
NODE_ENV=production
PORT=3000
BCRYPT_ROUNDS=10
THROTTLE_TTL=60
THROTTLE_LIMIT=100
SANDBOX_BUDGET_LIMIT=1000.00
SANDBOX_ENABLED=true
```

**IMPORTANTE**: O Railway fornece automaticamente:
- `DATABASE_URL` (do seu PostgreSQL)
- `REDIS_URL` (do seu Redis)

### 4. Rodar Migrations do Banco de Dados
No serviço PostgreSQL, vá em "Console" e execute:

```bash
# Instalar Prisma localmente
npm install -g prisma

# Ou execute diretamente no console do Railway
npx prisma db push
```

### 5. Deploy
- Clique em "Generate Domain"
- Clique em "Deploy"

### 6. Acessar o Sistema
- URL fornecida pelo Railway
- API Docs: `sua-url.railway.app/api/docs`
- Health Check: `sua-url.railway.app/api/health`

## 🎯 Resumo Rápido

1. ✅ PostgreSQL já criado
2. ⏳ Adicionar Redis service
3. ⏳ Adicionar JARVIS service (GitHub deploy)
4. ⏳ Configurar variáveis de ambiente
5. ⏳ Rodar `npx prisma db push` no console PostgreSQL
6. ⏳ Deploy do projeto

## 💡 Dicas

- **Health Check**: O endpoint `/api/health` já foi adicionado
- **Migrations**: Use `npx prisma db push` no console do PostgreSQL
- **Variáveis**: Use o `DATABASE_URL` e `REDIS_URL` fornecidos pelo Railway
- **Build**: O Railway vai instalar dependências e buildar automaticamente
# 🚀 Deploy Automático - Copiar e Colar

## 📋 CÓPIE E COLE ESTES COMANDOS NO RAILWAY

### PASSO 1: Adicionar Redis (1 clique)
No Railway.app:
1. Clique em **"New Service"** (ícone +)
2. Clique em **"Database"**
3. Clique em **"Redis"**
4. Clique em **"Add Redis"**

---

### PASSO 2: Adicionar JARVIS (2 cliques)
No Railway.app:
1. Clique em **"New Service"** (ícone +)
2. Clique em **"Deploy from GitHub repo"**
3. Selecione seu repositório JARVIS
4. Configure:
   - **Root Directory**: `./`
   - **Build Command**: `npm install && npm run build`
   - **Start Command**: `npm run start:prod`
5. Clique em **"Add Service"**

---

### PASSO 3: Variáveis (Copiar e Colar)
No serviço JARVIS → aba **"Variables"** → **"New Variable"**

Copie cada linha abaixo e cole como variável separada:

```
JWT_SECRET=jarvis-super-secret-production-key-2024-secure
NODE_ENV=production
PORT=3000
BCRYPT_ROUNDS=10
THROTTLE_TTL=60
THROTTLE_LIMIT=100
SANDBOX_BUDGET_LIMIT=1000.00
SANDBOX_ENABLED=true
```

---

### PASSO 4: Migrations (1 comando)
No serviço PostgreSQL → aba **"Console"** → copie e cole:

```bash
npx prisma db push
```

---

### PASSO 5: Health Check (1 clique)
No serviço JARVIS → aba **"Settings"**:
- **Health Check Path**: `/api/health`
- **Health Check Timeout**: `300`
- Clique em **"Save"**

---

### PASSO 6: Deploy (1 clique)
No serviço JARVIS:
- Clique em **"Generate Domain"**
- Aguarde 5-10 minutos
- Status deve ficar **"Active"**

---

### PASSO 7: Acessar (3 links)
Seu sistema estará em:
- **API**: `https://seu-dominio.up.railway.app`
- **Docs**: `https://seu-dominio.up.railway.app/api/docs`
- **Health**: `https://seu-dominio.up.railway.app/api/health`

---

## ⚡ RESUMO - Apenas 7 Passos Simples

1. ✅ Clique: New Service → Redis
2. ✅ Clique: New Service → Deploy from GitHub
3. ✅ Cole: 8 variáveis de ambiente
4. ✅ Cole: `npx prisma db push` no console
5. ✅ Clique: Configure health check
6. ✅ Clique: Generate Domain
7. ✅ Aguarde 5-10 minutos

---

## 🎯 TOTAL TEMPO: 10-15 minutos

Cada passo leva menos de 2 minutos!

---

## 💡 DICA: Use o Plano Gratuito Primeiro

O Railway oferece $5 de crédito grátis, suficiente para testar completamente o JARVIS!

---

**É só isso! 7 passos simples e seu JARVIS estará no ar!** 🚀
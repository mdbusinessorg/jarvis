# 🚀 Passo a Passo Completo - Deploy JARVIS no Railway.app

## 📋 Pré-requisitos
- ✅ Conta no Railway.app (já criada)
- ✅ PostgreSQL já criado no Railway
- ✅ Repositório JARVIS no GitHub
- ✅ Railway CLI instalado (opcional)

## 🎯 PASSO 1: Adicionar Redis ao Projeto

1. **Acesse seu projeto Railway**
   - Vá para: https://railway.app/project/seu-projeto-id
   - Você já está na página do projeto

2. **Adicionar Redis**
   - Clique no botão **"New Service"** (ícone +)
   - Selecione **"Database"**
   - Escolha **"Redis"**
   - Clique em **"Add Redis"**

3. **Verificar Redis**
   - Aguarde o Redis ser criado (leva 1-2 minutos)
   - Verifique se está com status "Running"

## 🎯 PASSO 2: Adicionar Serviço JARVIS

1. **Adicionar novo serviço**
   - Clique em **"New Service"** novamente
   - Selecione **"Deploy from GitHub repo"**

2. **Conectar repositório**
   - Selecione seu repositório JARVIS do GitHub
   - Se for a primeira vez, Railway pedirá permissão do GitHub
   - Autorize o Railway a acessar seu repositório

3. **Configurar o serviço**
   - **Root Directory**: Deixe como `./` (raiz do projeto)
   - **Build Command**: `npm install && npm run build`
   - **Start Command**: `npm run start:prod`
   - Clique em **"Add Service"**

## 🎯 PASSO 3: Configurar Variáveis de Ambiente

1. **Acessar variáveis do serviço JARVIS**
   - Clique no serviço JARVIS que acabou de criar
   - Vá na aba **"Variables"**

2. **Adicionar variáveis manuais**
   Clique em **"New Variable"** e adicione:

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

3. **Variáveis automáticas do Railway**
   O Railway já fornece automaticamente:
   - `DATABASE_URL` (do seu PostgreSQL)
   - `REDIS_URL` (do seu Redis)

   **NÃO** adicione estas variáveis manualmente!

## 🎯 PASSO 4: Rodar Migrations do Banco de Dados

1. **Acessar o PostgreSQL**
   - Clique no serviço PostgreSQL
   - Vá na aba **"Console"**

2. **Rodar migrations**
   No console do PostgreSQL, execute:

   ```bash
   # Instalar Prisma localmente
   npm install -g prisma

   # Rodar migrations
   npx prisma db push
   ```

   Alternativa mais simples:
   ```bash
   # Diretamente no console
   npx prisma db push
   ```

3. **Verificar tabelas**
   - Vá na aba **"Data"** do PostgreSQL
   - Você deve ver as tabelas criadas (users, permissions, tasks, etc.)

## 🎯 PASSO 5: Configurar Health Check

1. **Acessar configurações do serviço JARVIS**
   - Clique no serviço JARVIS
   - Vá na aba **"Settings"**

2. **Configurar health check**
   - **Health Check Path**: `/api/health`
   - **Health Check Timeout**: `300` (5 minutos)
   - Clique em **"Save"**

## 🎯 PASSO 6: Deploy do Projeto

1. **Iniciar deploy**
   - No serviço JARVIS, clique em **"Generate Domain"**
   - Railway vai gerar um domínio automaticamente

2. **Aguardar build**
   - O Railway vai automaticamente:
     - Instalar dependências (`npm install`)
     - Buildar o projeto (`npm run build`)
     - Iniciar o servidor (`npm run start:prod`)

3. **Monitorar deploy**
   - Vá na aba **"Deployments"**
   - Aguarde o status mudar para "Active"
   - Isso pode levar 5-10 minutos na primeira vez

## 🎯 PASSO 7: Acessar o Sistema

1. **Encontrar sua URL**
   - No serviço JARVIS, clique em **"Generate Domain"**
   - Railway vai mostrar algo como: `https://jarvis-production.up.railway.app`

2. **Testar endpoints**
   - **API Principal**: `https://seu-dominio.up.railway.app`
   - **API Docs**: `https://seu-dominio.up.railway.app/api/docs`
   - **Health Check**: `https://seu-dominio.up.railway.app/api/health`

3. **Testar health check**
   - Acesse: `https://seu-dominio.up.railway.app/api/health`
   - Deve retornar: `{"status":"ok","timestamp":"...","service":"JARVIS","version":"1.1.0"}`

## 🎯 PASSO 8: Testar Funcionalidades

1. **Criar usuário**
   - Acesse: `https://seu-dominio.up.railway.app/api/docs`
   - Use o endpoint `POST /api/auth/register`
   - Crie um usuário de teste

2. **Fazer login**
   - Use o endpoint `POST /api/auth/login`
   - Receba o token JWT

3. **Testar comandos de voz**
   - Use o endpoint `POST /api/voice/command`
   - Envie: `{"command": "JARVIS, status do sistema"}`

## 🔧 Troubleshooting

### Erro: Build falha
**Solução:**
- Verifique o log na aba "Deployments"
- Verifique se todas as dependências estão no package.json
- Tente rodar localmente: `npm install && npm run build`

### Erro: Conexão com banco falha
**Solução:**
- Verifique se PostgreSQL está "Running"
- Verifique se `DATABASE_URL` está nas variáveis
- Confirme que rodou `npx prisma db push`

### Erro: Redis connection error
**Solução:**
- Verifique se Redis está "Running"
- Verifique se `REDIS_URL` está nas variáveis
- Confirme que o Redis foi adicionado ao projeto

### Erro: Health check failing
**Solução:**
- Verifique se a porta está correta (3000)
- Confirme que o endpoint `/api/health` existe
- Aumente o timeout nas configurações

### Erro: Serviço não responde
**Solução:**
- Verifique os logs na aba "Deployments"
- Confirme que o status é "Active"
- Tente fazer redeploy clicando em "Redeploy"

## 📊 Monitoramento

### Ver Logs
- Vá na aba **"Deployments"**
- Clique no deployment mais recente
- Clique em **"View Logs"**

### Ver Métricas
- Vá na aba **"Metrics"**
- Monitore CPU, memória, e rede

### Ver Variáveis
- Vá na aba **"Variables"**
- Confirme todas as variáveis estão configuradas

## 💰 Custos

### Plano Gratuito
- **PostgreSQL**: Gratuito (com limites)
- **Redis**: Gratuito (com limites)
- **JARVIS Service**: Gratuito (com sleep)

### Limitações do Plano Gratuito
- Serviços entram em "sleep" após 30 minutos de inatividade
- Acordar o serviço leva 1-2 minutos
- CPU e memória limitadas

### Plano Pago (Recomendado para Produção)
- **Starter**: $5/mês (sem sleep)
- **Standard**: $20/mês (melhor performance)
- **Premium**: $40/mês (máxima performance)

## 🚀 Deploy Automático (Opcional)

### Setup Automático com Railway CLI

```bash
# Instalar Railway CLI
npm install -g @railway/cli

# Login
railway login

# Inicializar projeto (se ainda não criou)
railway init

# Adicionar PostgreSQL
railway add postgresql

# Adicionar Redis
railway add redis

# Deploy
railway up

# Ver logs
railway logs

# Abrir dashboard
railway open
```

## 🎉 Checklist Final

Antes de considerar o deploy completo:

- [ ] PostgreSQL criado e rodando
- [ ] Redis criado e rodando
- [ ] Serviço JARVIS criado
- [ ] Variáveis de ambiente configuradas
- [ ] Migrations rodadas (`npx prisma db push`)
- [ ] Health check configurado
- [ ] Deploy bem-sucedido (status "Active")
- [ ] URL gerada e acessível
- [ ] Health check respondendo
- [ ] API acessível
- [ ] Swagger docs funcionando
- [ ] Teste de usuário criado
- [ ] Login funcionando
- [ ] Comandos de voz testados

## 📞 Suporte

Se encontrar problemas:
- **Documentação Railway**: https://docs.railway.app
- **Status do Railway**: https://status.railway.app
- **Documentação JARVIS**: Ver arquivos no repositório

## 🎯 Próximos Passos Após Deploy

1. **Configurar domínio personalizado** (opcional)
2. **Configurar SSL** (já vem automaticamente)
3. **Monitorar logs regularmente**
4. **Configurar backup automático**
5. **Testar todas as funcionalidades**
6. **Configurar monitoramento externo**

---

**Seu JARVIS estará rodando no Railway após seguir estes passos!** 🚀
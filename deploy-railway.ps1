# Script PowerShell para Deploy Automático do JARVIS no Railway.app
# Execute este script no PowerShell como Administrador

Write-Host "🚀 DEPLOY AUTOMÁTICO JARVIS - RAILWAY.APP" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

# PASSO 1: Instalar Railway CLI
Write-Host "`n[1/7] Instalando Railway CLI..." -ForegroundColor Yellow
npm install -g @railway/cli

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao instalar Railway CLI" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Railway CLI instalado com sucesso" -ForegroundColor Green

# PASSO 2: Login no Railway
Write-Host "`n[2/7] Login no Railway.app..." -ForegroundColor Yellow
railway login

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao fazer login no Railway" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Login realizado com sucesso" -ForegroundColor Green

# PASSO 3: Selecionar ou criar projeto
Write-Host "`n[3/7] Selecionando projeto JARVIS..." -ForegroundColor Yellow
$projectName = "jarvis-production"

# Verificar se projeto existe
$projects = railway project list
if ($projects -match $projectName) {
    Write-Host "Projeto encontrado, selecionando..." -ForegroundColor Cyan
    railway select
} else {
    Write-Host "Criando novo projeto..." -ForegroundColor Cyan
    railway init --name $projectName
}

Write-Host "✅ Projeto configurado" -ForegroundColor Green

# PASSO 4: Adicionar PostgreSQL
Write-Host "`n[4/7] Adicionando PostgreSQL..." -ForegroundColor Yellow
railway add postgresql

if ($LASTEXITCODE -ne 0) {
    Write-Host "PostgreSQL pode ja existir, continuando..." -ForegroundColor Yellow
}

Write-Host "✅ PostgreSQL configurado" -ForegroundColor Green

# PASSO 5: Adicionar Redis
Write-Host "`n[5/7] Adicionando Redis..." -ForegroundColor Yellow
railway add redis

if ($LASTEXITCODE -ne 0) {
    Write-Host "Redis pode ja existir, continuando..." -ForegroundColor Yellow
}

Write-Host "✅ Redis configurado" -ForegroundColor Green

# PASSO 6: Configurar variaveis de ambiente
Write-Host "`n[6/7] Configurando variaveis de ambiente..." -ForegroundColor Yellow

railway variables set JWT_SECRET "jarvis-super-secret-production-key-2024-secure"
railway variables set NODE_ENV "production"
railway variables set PORT "3000"
railway variables set BCRYPT_ROUNDS "10"
railway variables set THROTTLE_TTL "60"
railway variables set THROTTLE_LIMIT "100"
railway variables set SANDBOX_BUDGET_LIMIT "1000.00"
railway variables set SANDBOX_ENABLED "true"

Write-Host "✅ Variaveis configuradas" -ForegroundColor Green

# PASSO 7: Deploy do projeto
Write-Host "`n[7/7] Fazendo deploy do JARVIS..." -ForegroundColor Yellow
railway up

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro durante o deploy" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Deploy iniciado com sucesso" -ForegroundColor Green

# Informacoes finais
Write-Host "`n🎉 DEPLOY CONCLUIDO!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host "`nAcompanhe o deploy:" -ForegroundColor Cyan
Write-Host "  railway logs" -ForegroundColor White
Write-Host "`nAbrir dashboard:" -ForegroundColor Cyan
Write-Host "  railway open" -ForegroundColor White
Write-Host "`nVer status:" -ForegroundColor Cyan
Write-Host "  railway status" -ForegroundColor White

Write-Host "`nPROXIMOS PASSOS MANUAIS:" -ForegroundColor Yellow
Write-Host "1. Acesse railway open" -ForegroundColor White
Write-Host "2. Vá no servico PostgreSQL - Console" -ForegroundColor White
Write-Host "3. Execute: npx prisma db push" -ForegroundColor White
Write-Host "4. Configure health check no servico JARVIS" -ForegroundColor White
Write-Host "5. Aguarde o deploy completar (5-10 minutos)" -ForegroundColor White

Write-Host "`nSeu JARVIS estara em: https://jarvis-production.up.railway.app" -ForegroundColor Green

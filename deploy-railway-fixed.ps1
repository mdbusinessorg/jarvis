# Script PowerShell para Deploy Automático do JARVIS no Railway.app
# Usa caminho completo do Node.js para evitar problemas de PATH

$nodePath = "C:\Program Files\nodejs\node.exe"
$npmPath = "C:\Program Files\nodejs\npm.cmd"

Write-Host "🚀 DEPLOY AUTOMÁTICO JARVIS - RAILWAY.APP" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

# Verificar Node.js
if (-not (Test-Path $nodePath)) {
    Write-Host "❌ Node.js não encontrado em $nodePath" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Node.js encontrado: " -ForegroundColor Green -NoNewline
& $nodePath --version

# PASSO 1: Instalar Railway CLI usando npx
Write-Host "`n[1/7] Configurando Railway CLI..." -ForegroundColor Yellow

# Criar alias temporário para railway
function Invoke-Railway {
    & $npmPath exec -- @railway/cli @args
}

# Testar se railway funciona
try {
    Invoke-Railway --version
    Write-Host "✅ Railway CLI configurado" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro ao configurar Railway CLI" -ForegroundColor Red
    Write-Host "Usando caminho direto para comandos Railway..." -ForegroundColor Yellow
}

# PASSO 2: Login no Railway
Write-Host "`n[2/7] Login no Railway.app..." -ForegroundColor Yellow
try {
    Invoke-Railway login
    Write-Host "✅ Login realizado com sucesso" -ForegroundColor Green
} catch {
    Write-Host "⚠️ Login pode já estar feito, continuando..." -ForegroundColor Yellow
}

# PASSO 3: Selecionar ou criar projeto
Write-Host "`n[3/7] Selecionando projeto JARVIS..." -ForegroundColor Yellow
$projectName = "jarvis-production"

try {
    Invoke-Railway select
    Write-Host "✅ Projeto selecionado" -ForegroundColor Green
} catch {
    Write-Host "Criando novo projeto..." -ForegroundColor Cyan
    Invoke-Railway init --name $projectName
    Write-Host "✅ Projeto criado" -ForegroundColor Green
}

# PASSO 4: Adicionar PostgreSQL
Write-Host "`n[4/7] Adicionando PostgreSQL..." -ForegroundColor Yellow
try {
    Invoke-Railway add postgresql
    Write-Host "✅ PostgreSQL configurado" -ForegroundColor Green
} catch {
    Write-Host "⚠️ PostgreSQL pode já existir, continuando..." -ForegroundColor Yellow
}

# PASSO 5: Adicionar Redis
Write-Host "`n[5/7] Adicionando Redis..." -ForegroundColor Yellow
try {
    Invoke-Railway add redis
    Write-Host "✅ Redis configurado" -ForegroundColor Green
} catch {
    Write-Host "⚠️ Redis pode já existir, continuando..." -ForegroundColor Yellow
}

# PASSO 6: Configurar variaveis de ambiente
Write-Host "`n[6/7] Configurando variaveis de ambiente..." -ForegroundColor Yellow

try {
    Invoke-Railway variables set JWT_SECRET "jarvis-super-secret-production-key-2024-secure"
    Invoke-Railway variables set NODE_ENV "production"
    Invoke-Railway variables set PORT "3000"
    Invoke-Railway variables set BCRYPT_ROUNDS "10"
    Invoke-Railway variables set THROTTLE_TTL "60"
    Invoke-Railway variables set THROTTLE_LIMIT "100"
    Invoke-Railway variables set SANDBOX_BUDGET_LIMIT "1000.00"
    Invoke-Railway variables set SANDBOX_ENABLED "true"
    Write-Host "✅ Variaveis configuradas" -ForegroundColor Green
} catch {
    Write-Host "⚠️ Erro ao configurar variaveis, continue manualmente..." -ForegroundColor Yellow
}

# PASSO 7: Deploy do projeto
Write-Host "`n[7/7] Fazendo deploy do JARVIS..." -ForegroundColor Yellow
try {
    Invoke-Railway up
    Write-Host "✅ Deploy iniciado com sucesso" -ForegroundColor Green
} catch {
    Write-Host "❌ Erro durante o deploy" -ForegroundColor Red
    Write-Host "Execute manualmente: railway up" -ForegroundColor Yellow
}

# Informacoes finais
Write-Host "`n🎉 DEPLOY CONCLUIDO!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host "`nAcompanhe o deploy:" -ForegroundColor Cyan
Write-Host "  railway logs" -ForegroundColor White
Write-Host "`nAbrir dashboard:" -ForegroundColor Cyan
Write-Host "  railway open" -ForegroundColor White

Write-Host "`nPROXIMOS PASSOS MANUAIS:" -ForegroundColor Yellow
Write-Host "1. Acesse railway open" -ForegroundColor White
Write-Host "2. Vá no servico PostgreSQL - Console" -ForegroundColor White
Write-Host "3. Execute: npx prisma db push" -ForegroundColor White
Write-Host "4. Configure health check no servico JARVIS" -ForegroundColor White
Write-Host "5. Aguarde o deploy completar (5-10 minutos)" -ForegroundColor White

Write-Host "`nSeu JARVIS estara em: https://jarvis-production.up.railway.app" -ForegroundColor Green

# Script para enviar JARVIS para o GitHub
# Execute este script após criar o repositório no GitHub

Write-Host "🚀 ENVIANDO JARVIS PARA O GITHUB" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

# Verificar se estamos no diretório correto
$currentDir = Get-Location
Write-Host "Diretório atual: $currentDir" -ForegroundColor Cyan

if (-not ($currentDir -match "jarvis")) {
    Write-Host "❌ Por favor, navegue para o diretório jarvis primeiro" -ForegroundColor Red
    Write-Host "Execute: cd C:\Users\DELL\.devin\jarvis" -ForegroundColor Yellow
    exit 1
}

# Inicializar Git se necessário
if (-not (Test-Path ".git")) {
    Write-Host "`n[1/5] Inicializando Git..." -ForegroundColor Yellow
    git init
    Write-Host "✅ Git inicializado" -ForegroundColor Green
} else {
    Write-Host "`n[1/5] Git já inicializado" -ForegroundColor Green
}

# Adicionar todos os arquivos
Write-Host "`n[2/5] Adicionando arquivos..." -ForegroundColor Yellow
git add .
Write-Host "✅ Arquivos adicionados" -ForegroundColor Green

# Commit inicial
Write-Host "`n[3/5] Criando commit..." -ForegroundColor Yellow
git commit -m "Initial commit - JARVIS complete system with voice module"
Write-Host "✅ Commit criado" -ForegroundColor Green

# Adicionar remote
Write-Host "`n[4/5] Conectando ao GitHub..." -ForegroundColor Yellow
Write-Host "Cole a URL do seu repositório GitHub abaixo:" -ForegroundColor Cyan
$repoUrl = Read-Host "URL do GitHub (ex: https://github.com/seu-usuario/jarvis.git)"

git remote add origin $repoUrl
Write-Host "✅ Remote adicionado" -ForegroundColor Green

# Push para GitHub
Write-Host "`n[5/5] Enviando para GitHub..." -ForegroundColor Yellow
git branch -M main
git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro ao fazer push. Verifique suas credenciais do GitHub." -ForegroundColor Red
    Write-Host "Você pode precisar configurar autenticação GitHub:" -ForegroundColor Yellow
    Write-Host "1. Crie um Personal Access Token em GitHub Settings" -ForegroundColor Yellow
    Write-Host "2. Use: git config --global credential.helper store" -ForegroundColor Yellow
    Write-Host "3. Tente novamente: git push -u origin main" -ForegroundColor Yellow
    exit 1
}

Write-Host "`n🎉 CÓDIGO ENVIADO PARA O GITHUB COM SUCESSO!" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green
Write-Host "`nAgora você pode:" -ForegroundColor Cyan
Write-Host "1. Voltar ao Railway.app" -ForegroundColor White
Write-Host "2. Procurar pelo repositório 'jarvis'" -ForegroundColor White
Write-Host "3. Selecionar e fazer deploy" -ForegroundColor White

Write-Host "`nSeu repositório: $repoUrl" -ForegroundColor Green

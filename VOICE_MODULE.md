# 🎤 Módulo de Voz do JARVIS

## 🎯 Funcionalidades Implementadas

### 1. Conversação por Voz
- ✅ Iniciar conversação com JARVIS
- ✅ Processar entrada de áudio
- ✅ Transcrição de áudio para texto
- ✅ Identificação de intents
- ✅ Respostas inteligentes
- ✅ Histórico de conversação

### 2. Comandos de Voz
- ✅ Comandos naturais em português
- ✅ 8 comandos principais integrados
- ✅ Execução automática de tarefas
- ✅ Feedback em voz

### 3. Text-to-Speech
- ✅ Converter respostas em áudio
- ✅ Suporte a múltiplos idiomas
- ✅ Duração estimada

## 🎤 Comandos de Voz Disponíveis

### "JARVIS, pesquisar na web [termo]"
- **Função**: Pesquisa automática na internet
- **Uso**: "JARVIS, pesquisar sobre iPhone 15"
- **Ação**: Cria tarefa de WEB_SEARCH

### "JARVIS, ver campanhas"
- **Função**: Listar campanhas de anúncios
- **Uso**: "JARVIS, mostrar minhas campanhas"
- **Ação**: Chama API `/api/ads/campaigns`

### "JARVIS, criar site"
- **Função: Criar novo site automaticamente
- **Uso**: "JARVIS, cria um site para meu produto"
- **Ação**: Inicia fluxo de SITE_CREATE

### "JARVIS, ver emails"
- **Função**: Ver emails não lidos
- **Uso**: "JARVIS, ver meus emails"
- **Ação**: Chama API `/api/email/read`

### "JARVIS, quanto faturei"
- **Função**: Ver faturamento atual
- **Uso**: "JARVIS, quanto faturei este mês"
- **Ação**: Chama API `/api/money/revenue`

### "JARVIS, ver leads"
- **Função**: Listar leads capturados
- **Uso**: "JARVIS, mostrar meus leads"
- **Ação**: Chama API `/api/leads`

### "JARVIS, otimiza anúncios"
- **Função**: Otimizar campanhas automaticamente
- **Uso**: "JARVIS, otimiza minhas campanhas"
- **Ação**: Chama API `/api/ads/optimizations`

### "JARVIS, status do sistema"
- **Função**: Ver saúde do sistema
- **Uso**: "JARVIS, como está o sistema"
- **Ação**: Chama API `/api/dashboard/stats`

## 🎧 API Endpoints

### Conversação
- `POST /api/voice/conversation/start` - Iniciar conversa
- `POST /api/voice/conversation/input` - Processar áudio
- `GET /api/voice/conversation/:id` - Histórico
- `POST /api/voice/conversation/:id/end` - Encerrar conversa

### Comandos
- `POST /api/voice/command` - Executar comando por voz
- `GET /api/voice/commands` - Listar comandos disponíveis
- `GET /api/voice/stats` - Estatísticas de voz

### Text-to-Speech
- `POST /api/voice/tts` - Converter texto em áudio

## 🔧 Configuração Necessária

### Variáveis de Ambiente (.env)
```env
# OpenAI Whisper (transcrição de áudio)
OPENAI_WHISPER_API_KEY="seu-whisper-api-key"

# ElevenLabs (text-to-speech de alta qualidade)
ELEVENLABS_API_KEY="seu-elevenlabs-key"

# Google Cloud TTS (alternativa)
GOOGLE_TTS_API_KEY="seu-google-tts-key"
```

### Para Transcrição de Áudio (Recomendado)
**Opção 1: OpenAI Whisper API**
- Preço: $0.006/minuto
- Qualidade: Excelente
- Setup: Apenas API key

**Opção 2: AssemblyAI**
- Preço: $0.00025/segundo
- Qualidade: Muito boa
- Setup: API key

**Opção 3: Mozilla DeepSpeech**
- Preço: Gratuito
- Qualidade: Razoável
- Setup: Auto-hosted

### Para Text-to-Speech (Recomendado)
**Opção 1: ElevenLabs**
- Preço: $0.30/1000 caracteres
- Qualidade: Excelente, vozes naturais
- Setup: API key

**Opção 2: Google Cloud TTS**
- Preço: $4.00/milhão de caracteres
- Qualidade: Muito boa
- Setup: API key

**Opção 3: Amazon Polly**
- Preço: $4.00/milhão de caracteres
- Qualidade: Excelente
- Setup: AWS credentials

## 🚀 Como Usar

### 1. Via API
```bash
# Iniciar conversa
POST /api/voice/conversation/start

# Enviar áudio (base64)
POST /api/voice/conversation/input
{
  "conversationId": "conv_123",
  "audioData": "base64_encoded_audio"
}

# Executar comando por texto
POST /api/voice/command
{
  "command": "JARVIS, pesquisar sobre iPhone 15"
}

# Converter resposta em áudio
POST /api/voice/tts
{
  "text": "Vou buscar informações sobre iPhone 15",
  "language": "pt-BR"
}
```

### 2. Via Frontend (Frontend Sugerido)
Para usar voz em um frontend, você precisará:

**Interface Web**:
- Captura de áudio via Web Speech API
- Conversão para base64
- Playback de áudio retornado

**Interface Mobile**:
- React Native Voice API
- Expo Speech Recognition
- TTS playback nativo

## 🎨 Exemplo de Uso

### Conversa Completa
```
Usuário: "JARVIS, pesquisar sobre iPhone 15"
JARVIS: "Claro! O que você quer que eu pesquise na internet?"
Usuário: "Problemas e reviews"
JARVIS: "Vou buscar informações sobre problemas e reviews do iPhone 15..."
[Executa busca]
JARVIS: "Encontrei reviews interessantes. O iPhone 15 tem boas críticas em câmera e bateria, mas alguns usuários reportam problemas de aquecimento. Quer que eu aprofunde algo específico?"
```

### Comando Direto
```
Usuário: "JARVIS, otimiza anúncios"
JARVIS: "Vou analisar suas campanhas e sugerir otimizações. Isso pode levar alguns minutos..."
[Executa otimização]
JARVIS: "Criei 3 sugestões de otimização para suas campanhas. Você quer que eu aplique alguma delas?"
```

## 🎯 Próximos Passos

### 1. Configurar API Keys
- Adicionar variáveis de voz ao .env
- Testar transcrição e TTS

### 2. Integrar com Frontend
- Criar interface web com captura de áudio
- Implementar playback de respostas

### 3. Melhorar Reconhecimento
- Usar GPT-4 para análise de intents
- Aumentar precisão de comandos

### 4. Adicionar Mais Comandos
- Integração com todos os módulos
- Comandos complexos e multi-passo

## 🎁 Benefícios da Voz

- **Natural**: Conversação como com humano
- **Hands-free**: Operar sem usar teclado
- **Acessível**: Para usuários com limitações visuais
- **Rápido**: Comandos mais rápidos que digitação
- **Intuitivo**: Falar é mais natural que digitar

O JARVIS agora aceita comandos de voz em português! 🎤
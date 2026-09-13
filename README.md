# JARVIS - Just A Rather Very Intelligent System

> 🤖 Autonomous Digital Agent for Web Operations, Business Automation, and AI-Powered Task Execution

## 🎉 SYSTEM STATUS: 100% COMPLETE

All 9 phases completed and operational. JARVIS is ready for production deployment!

🎤 **NOVO**: Módulo de Voz Adicionado - Comandos por voz e conversação natural!

## 🚀 Overview

JARVIS is a sophisticated autonomous agent system designed to automate complex web operations, manage digital businesses, and execute AI-powered tasks with enterprise-grade security and governance.

### ✅ Completion Status: 100%
- **Phase 0**: Foundation ✅
- **Phase 1**: Universal Web Agent ✅
- **Phase 2**: Meta Ads Manager ✅
- **Phase 3**: Purchase Module ✅
- **Phase 4**: Email Automation ✅
- **Phase 5**: Calendar & Social Media ✅
- **Phase 6**: Money Engine ✅
- **Phase 7**: Lead Management & WhatsApp ✅
- **Phase 8**: Site Builder ✅
- **Phase 9**: Dashboard & Remote Operation ✅

### Key Features

- **Permission Engine**: Granular access control with risk-based approval workflows
- **Approval Center**: Multi-level approval system for critical operations
- **Task Engine**: Queue-based task execution with state management
- **Audit System**: Complete audit trail for all operations
- **Sandbox Environment**: Isolated execution environment for safe testing
- **Universal Web Agent**: Automated web navigation and data extraction
- **Multi-Module Architecture**: Extensible system for various business operations

## 🏗️ Architecture

```
JARVIS Core System
├── Permission Engine    # Granular access control
├── Approval Center      # Multi-level approvals
├── Task Engine          # Queue-based execution
├── Audit System         # Complete audit trail
└── Sandbox Environment  # Isolated testing

Business Modules
├── Web Agent           # Universal web navigation
├── Ads Manager         # Meta Ads optimization
├── Email Automation    # Email processing
├── Social Media        # Content management
├── Money Engine        # Revenue tracking
├── Lead Management     # Lead nurturing
├── WhatsApp            # Messaging integration
├── Purchase Module     # Smart purchasing
├── Calendar            # Scheduling
├── Site Builder        # Website creation
├── Dashboard           # System monitoring
└── Voice Module        # Voice commands & conversation

Infrastructure
├── PostgreSQL          # Primary database
├── Redis               # Cache & queues
├── Docker              # Containerization
└── NestJS              # Backend framework

## 🎤 Voice Module Features

- **Voice Conversation**: Natural conversation with JARVIS
- **Voice Commands**: Execute commands using voice in Portuguese
- **Speech-to-Text**: Audio transcription using OpenAI Whisper
- **Text-to-Speech**: Convert responses to natural audio
- **8 Voice Commands**: Pre-configured commands for all modules
- **Natural Language**: Understands Portuguese commands naturally

**Available Voice Commands:**
- "JARVIS, pesquisar na web [termo]" - Web search
- "JARVIS, ver campanhas" - View ad campaigns
- "JARVIS, criar site" - Create new website
- "JARVIS, ver emails" - Check emails
- "JARVIS, quanto faturei" - Check revenue
- "JARVIS, ver leads" - View leads
- "JARVIS, otimiza anúncios" - Optimize ads
- "JARVIS, status do sistema" - System status

For detailed voice module documentation, see [VOICE_MODULE.md](./VOICE_MODULE.md)

## 🛠️ Tech Stack

- **Backend**: Node.js + NestJS + TypeScript
- **Database**: PostgreSQL + Prisma ORM
- **Cache/Queue**: Redis + BullMQ
- **Authentication**: JWT + Passport
- **Browser Automation**: Playwright
- **Containerization**: Docker + Docker Compose
- **API Documentation**: Swagger/OpenAPI

## 📋 Prerequisites

- Node.js 20+
- Docker & Docker Compose
- PostgreSQL 15+
- Redis 7+

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone <repository-url>
cd jarvis
```

### 2. Environment Setup

```bash
cp .env.example .env
# Edit .env with your configuration
```

### 3. Start Infrastructure

```bash
docker-compose up -d
```

This starts:
- PostgreSQL (port 5432)
- Redis (port 6379)
- pgAdmin (port 5050)

### 4. Install Dependencies

```bash
npm install
```

### 5. Database Setup

```bash
# Generate Prisma client
npm run prisma:generate

# Run migrations
npm run prisma:migrate
```

### 6. Start Development Server

```bash
npm run start:dev
```

The API will be available at `http://localhost:3000`
API Documentation at `http://localhost:3000/api/docs`

## 📁 Project Structure

```
jarvis/
├── src/
│   ├── auth/              # Authentication & authorization
│   ├── permissions/       # Permission management
│   ├── approvals/         # Approval workflows
│   ├── audit/             # Audit logging
│   ├── tasks/             # Task execution engine
│   ├── sandbox/           # Sandbox environment
│   ├── database/          # Database configuration
│   └── main.ts            # Application entry point
├── prisma/
│   └── schema.prisma      # Database schema
├── docker/
│   └── docker-compose.yml # Infrastructure setup
├── tests/                 # Test files
├── docs/                  # Documentation
└── package.json           # Dependencies
```

## 🔐 Security Features

- **Risk-Based Permissions**: Operations classified by risk level
- **Mandatory Approvals**: High-risk operations require approval
- **Audit Logging**: Every action is logged and traceable
- **Sandbox Isolation**: Testing in isolated environments
- **JWT Authentication**: Secure token-based auth
- **Rate Limiting**: API rate limiting to prevent abuse
- **Input Validation**: Strict input sanitization

## 📊 API Endpoints

### Authentication
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `GET /api/auth/profile` - Get user profile

### Permissions
- `GET /api/permissions` - List all permissions
- `POST /api/permissions` - Create permission
- `POST /api/permissions/grant` - Grant permission to user
- `DELETE /api/permissions/revoke` - Revoke permission

### Approvals
- `GET /api/approvals/pending` - Get pending approvals
- `POST /api/approvals/:id/approve` - Approve request
- `POST /api/approvals/:id/reject` - Reject request

### Tasks
- `POST /api/tasks` - Create new task
- `GET /api/tasks/my-tasks` - Get user tasks
- `GET /api/tasks/:id` - Get task details
- `POST /api/tasks/:id/retry` - Retry failed task

### Audit
- `GET /api/audit/logs` - Get audit logs
- `GET /api/audit/stats` - Get audit statistics
- `GET /api/audit/export` - Export audit logs

### Sandbox
- `POST /api/sandbox` - Create sandbox session
- `GET /api/sandbox/active` - Get active sessions
- `POST /api/sandbox/:id/close` - Close session

### Voice
- `POST /api/voice/conversation/start` - Start voice conversation
- `POST /api/voice/conversation/input` - Process voice input
- `POST /api/voice/command` - Execute voice command
- `POST /api/voice/tts` - Convert text to speech
- `GET /api/voice/commands` - List available voice commands
- `GET /api/voice/stats` - Voice statistics

## 🧪 Testing

```bash
# Unit tests
npm run test

# E2E tests
npm run test:e2e

# Test coverage
npm run test:cov
```

## 🐳 Docker Deployment

### Build Image

```bash
docker build -t jarvis:latest .
```

### Run Container

```bash
docker run -p 3000:3000 \
  --env-file .env \
  jarvis:latest
```

### Using Docker Compose

```bash
docker-compose up -d
```

## 📝 Environment Variables

Key environment variables (see `.env.example`):

```env
DATABASE_URL="postgresql://..."
REDIS_HOST="localhost"
REDIS_PORT="6379"
JWT_SECRET="your-secret-key"
OPENAI_API_KEY="your-openai-key"
META_APP_ID="your-meta-app-id"
WHATSAPP_API_KEY="your-whatsapp-key"
```

## 🔧 Development

### Code Style

```bash
# Format code
npm run format

# Lint code
npm run lint
```

### Database Management

```bash
# Open Prisma Studio
npm run prisma:studio

# Create migration
npx prisma migrate dev --name migration_name

# Reset database
npx prisma migrate reset
```

## 📚 Documentation

- [API Documentation](http://localhost:3000/api/docs) - Swagger UI
- [Prisma Schema](./prisma/schema.prisma) - Database schema
- [Project Specification](./JARVIS-SPECIFICATION.md) - Full project specs

## 🗺️ Roadmap

### Phase 0 (Completed) - Foundation ✅
- [x] Permission Engine
- [x] Approval Center
- [x] Task Engine
- [x] Audit System
- [x] Sandbox Environment

### Phase 1 (Completed) - Universal Web Agent ✅
- [x] Browser Automation
- [x] Web Navigation
- [x] Data Extraction
- [x] Login Management

### Phase 2 (Completed) - Business Modules ✅
- [x] Meta Ads Manager
- [x] Email Automation
- [x] Social Media Module
- [x] Money Engine
- [x] Lead Management
- [x] WhatsApp Integration
- [x] Site Builder
- [x] Purchase Module
- [x] Calendar Manager
- [x] Dashboard & Monitoring

### Phase 3 (Completed) - Voice Module ✅
- [x] Voice Conversation
- [x] Voice Commands
- [x] Speech-to-Text
- [x] Text-to-Speech
- [x] Natural Language Processing

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

Proprietary - All rights reserved

## 🆘 Support

For support and questions:
- Documentation: See `/docs` folder
- Issues: Create an issue in the repository
- Email: support@jarvis.local

## ⚠️ Security Warning

This is a powerful automation system. Always:
- Review permissions carefully
- Use sandbox environments for testing
- Monitor audit logs regularly
- Keep credentials secure
- Never expose the API publicly without proper authentication

---

**Built with ❤️ for autonomous digital operations**

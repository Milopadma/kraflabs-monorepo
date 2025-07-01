# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# KrafLabs Monorepo - Claude Code Assistant Guide

## Project Overview

KrafLabs is a comprehensive blockchain-based platform for managing intellectual property, creative communities, and product certification. The project is organized as a **monorepo** containing multiple interconnected applications that work together to provide a complete ecosystem for creators, organizations, and administrators.

## Repository Structure

```
kraflabs-monorepo/
├── kraflab-admin-dashboard/     # Organization admin dashboard
│   ├── backend/                 # Node.js API (Hono.js framework)
│   └── frontend/               # Next.js admin interface
├── kraflab-internal-dashboard/  # Internal admin tools
│   ├── backend/                 # Node.js API (Hono.js framework)
│   └── frontend/               # Next.js internal dashboard
├── kraflab-web-portal/         # Creator web portal
│   ├── backend/                # Node.js API
│   └── frontend/               # Next.js creator interface
├── kraflab-smartcontract/      # Solidity smart contracts
└── kraflabs-shared-db-schema/  # Shared database schema package
```

## Core Applications

### 1. kraflab-admin-dashboard

**Purpose**: Organization management dashboard for handling community registration and verification.

**Tech Stack**:

- Backend: Node.js, Hono.js, Drizzle ORM, PostgreSQL
- Frontend: Next.js 15.3.1, React 19, Tailwind CSS, TypeScript 5.8.3
- Package Manager: pnpm

**Key Features**:

- Community management and verification
- User account management
- Dashboard reports and metrics
- Role-based access control

**Scripts**:

```bash
# Backend
cd kraflab-admin-dashboard/backend
pnpm dev                 # Start dev server
pnpm build              # Build for production
pnpm start              # Start production build
pnpm test               # Run Vitest tests
pnpm db:start           # Start PostgreSQL container
pnpm db:stop            # Stop PostgreSQL container
pnpm db:clean           # Stop and remove volumes
pnpm db:migrate         # Run database migrations
pnpm db:seed            # Seed database
pnpm dev:db-up          # Start database for development
pnpm dev:db-down        # Clean stop database

# Frontend
cd kraflab-admin-dashboard/frontend
pnpm dev                # Start dev server (port 5174)
pnpm build              # Build for production
pnpm start              # Start production build
pnpm lint               # Run ESLint
```

### 2. kraflab-internal-dashboard

**Purpose**: Internal administrative interface for managing organizations and monitoring platform activity.

**Tech Stack**:

- Backend: Node.js, Hono.js, Drizzle ORM, PostgreSQL, Pinata (IPFS)
- Frontend: Next.js 15.3.1, React, Tailwind CSS, TypeScript 5.8.2
- Package Manager: pnpm

**Key Features**:

- Organization creation and management
- Local branding tag monitoring
- Activity tracking across all portals
- Payment and transaction oversight

**Scripts**:

```bash
# Backend (same pattern as admin dashboard)
cd kraflab-internal-dashboard/backend
pnpm dev                 # Start dev server
pnpm build              # Build for production
pnpm start              # Start production build
pnpm test               # Run Vitest tests
pnpm lint               # Run ESLint
pnpm db:start           # Start PostgreSQL container
pnpm db:stop            # Stop PostgreSQL container
pnpm db:clean           # Stop and remove volumes
pnpm db:migrate         # Run database migrations
pnpm db:seed            # Seed database
pnpm dev:db-up          # Start database for development
pnpm dev:db-down        # Clean stop database

# Frontend
cd kraflab-internal-dashboard/frontend
pnpm dev                # Start dev server
pnpm build              # Build for production
pnpm start              # Start production build
pnpm lint               # Run ESLint
```

### 3. kraflab-web-portal

**Purpose**: Creator-facing portal for product registration and OCP (Original Certificate of Product) management.

**Tech Stack**:

- Backend: Node.js, Hono.js, TypeScript, Drizzle ORM, Pinata (IPFS), iPaymu
- Frontend: Next.js 15.3.1, React, Tailwind CSS, Zustand
- Payment: iPaymu integration

**Key Features**:

- User registration and verification
- Product submission for OCP minting
- QR code generation for Origin Product Numbers (OPN)
- Transaction dashboard
- Community management

**Scripts**:

```bash
# Backend
cd kraflab-web-portal/backend
pnpm dev                 # Start dev server
pnpm build              # Build for production
pnpm start              # Start production build
pnpm test               # Run Vitest tests
pnpm lint               # Run ESLint
pnpm db:start           # Start PostgreSQL container
pnpm db:stop            # Stop PostgreSQL container
pnpm db:clean           # Stop and remove volumes
pnpm db:migrate         # Run database migrations
pnpm db:seed            # Seed database
pnpm dev:db-up          # Start database for development
pnpm dev:db-down        # Clean stop database

# Frontend
cd kraflab-web-portal/frontend
pnpm dev                # Start dev server
pnpm build              # Build for production
pnpm start              # Start production build
pnpm lint               # Run ESLint
```

### 4. kraflab-smartcontract

**Purpose**: Ethereum smart contracts for blockchain functionality.

**Tech Stack**:

- Solidity, Hardhat, TypeScript
- OpenZeppelin contracts
- CREATE2 deterministic deployment

**Key Contracts**:

- `Kraflab.sol`: Main access control contract
- `KraflabTag.sol`: Soulbound NFT for identity tagging
- `KraflabFactory.sol`: Deterministic contract deployment
- `KraflabLicense.sol`: License token management

**Scripts**:

```bash
cd kraflab-smartcontract
pnpm install            # Install dependencies (or yarn)
pnpm build              # Build TypeScript
pnpm compile            # Compile contracts with Hardhat
pnpm test               # Run test suite
pnpm test-extended      # Run extended tests
pnpm test-gas           # Test with gas reporting
pnpm local-node         # Start local Hardhat node
pnpm deploy-kraflab     # Deploy main contract
pnpm deploy-license     # Deploy license contract
pnpm deploy-factory     # Deploy factory contract
pnpm deploy-tag         # Deploy tag contract
pnpm deploy-ocp         # Deploy OCP contract
pnpm verify-kraflab     # Verify main contract
pnpm verify-license     # Verify license contract
pnpm verify-factory     # Verify factory contract
pnpm verify-tag         # Verify tag contract
```

### 5. kraflabs-shared-db-schema

**Purpose**: Shared database schema package used across all applications.

**Tech Stack**:

- Drizzle ORM, PostgreSQL, TypeScript
- Published as npm package: `@baliola/kraflabs-shared-db-schema`

**Key Features**:

- Centralized database schema definitions
- Shared migration scripts
- Common database utilities

**Scripts**:

```bash
cd kraflabs-shared-db-schema
pnpm build              # Build TypeScript package
pnpm db:generate        # Generate Drizzle migrations
pnpm db:migrate         # Apply migrations
pnpm db:studio          # Open Drizzle Studio
pnpm db:start           # Start PostgreSQL container
pnpm db:stop            # Stop PostgreSQL container
pnpm db:clean           # Stop and remove volumes
pnpm db:seed            # Seed database with sample data
pnpm dev:db-up          # Start database for development
pnpm dev:db-down        # Clean stop database
```

## Technology Stack Summary

### Backend Technologies

- **Framework**: Hono.js (modern, fast web framework)
- **Database**: PostgreSQL with Drizzle ORM
- **Authentication**: JWT tokens
- **File Storage**: Pinata (IPFS)
- **Email**: Nodemailer
- **Validation**: Zod schemas
- **API Documentation**: OpenAPI/Swagger

### Frontend Technologies

- **Framework**: Next.js 15.3.1 with App Router
- **UI Library**: React 19
- **Styling**: Tailwind CSS 3.0
- **State Management**: Zustand
- **Forms**: Formik with Yup validation
- **HTTP Client**: Axios
- **Charts**: Chart.js
- **Icons**: Heroicons, React Icons

### Development Tools

- **Language**: TypeScript 5.8+
- **Package Manager**: pnpm (preferred), yarn
- **Linting**: ESLint
- **Testing**: Vitest
- **Containerization**: Docker & Docker Compose

### Blockchain

- **Smart Contracts**: Solidity
- **Development**: Hardhat
- **Standards**: ERC721, ERC4906, ERC5267
- **Libraries**: OpenZeppelin, ethers.js

## Environment Configuration

Each application requires environment variables. Key variables include:

```bash
# Database
DATABASE_URL="postgresql://username:password@localhost:5430/dbname"

# Authentication
JWT_SECRET="your-jwt-secret"

# CORS & URLs
FRONTEND_URL="http://localhost:5174"
BACKEND_URL="http://localhost:3333"

# IPFS Storage
PINATA_JWT="your-pinata-jwt"
GATEWAY_URL="your-pinata-gateway-url"

# Email (SMTP)
SMTP_HOST="your-smtp-host"
SMTP_PORT=465
SMTP_USER="your-smtp-user"
SMTP_PASS="your-smtp-pass"
```

## Development Workflow

### Getting Started

1. Clone the repository
2. Install dependencies in each application:
   ```bash
   cd kraflab-admin-dashboard/backend && pnpm install
   cd ../frontend && pnpm install
   # Repeat for other applications
   ```
3. Set up environment variables using `.env.example` files
4. Start databases: `pnpm db:start` (in backend directories)
5. Run migrations: `pnpm db:migrate`
6. Start development servers: `pnpm dev`

### Database Management

- Each backend has its own database container
- Shared schema is managed via `kraflabs-shared-db-schema`
- Migrations are handled by Drizzle Kit
- Use `pnpm db:studio` to open Drizzle Studio

### Docker Support

- Each application has Dockerfiles for containerization
- Root-level and app-level docker-compose.yml files
- Database services are containerized for development

## Architecture Patterns

### Monorepo Organization

- **Shared Dependencies**: Database schema, common utilities
- **Independent Deployments**: Each app can be deployed separately
- **Consistent Tech Stack**: Similar patterns across applications

### Backend Architecture

- **Feature-based Structure**: Organized by domain features
- **Service Layer Pattern**: Business logic separated from controllers
- **Middleware**: Authentication, error handling, validation
- **API-first Design**: OpenAPI documentation

### Frontend Architecture

- **Component-driven**: Reusable UI components
- **Feature Modules**: Organized by application features
- **State Management**: Zustand for client state
- **Type Safety**: Full TypeScript coverage

### Blockchain Integration

- **Smart Contract Services**: Abstracted blockchain interactions
- **Soulbound Tokens**: Non-transferable identity certificates
- **Deterministic Deployment**: CREATE2 for predictable addresses
- **Role-based Access**: Multi-level permission system

## Key Business Logic & Architecture Patterns

### User Roles & Permissions Hierarchy

- **Organizations**: Created in internal-dashboard, manage communities and verify corporate creators
- **Communities**: Created by organizations in admin-dashboard, manage individual creators
- **Creators**: Register in web-portal, verified by communities (individual) or organizations (corporate)
- **Admins**: Multi-level access (super admin, org admin, group admin) with blockchain role enforcement

### Smart Contract Integration Architecture

**Centralized Service Pattern:**
Each backend maintains a `SmartContractService` class with standardized methods:
- `createOrganization()` - Organization on-chain registration
- `createCommunityByOrganization()` / `createCommunityByCorporate()` - Community group creation
- `addCreatorIndividual()` / `addCreatorCorporate()` - Creator role assignment
- `verifyPayment()` / `mintTag()` - Product certification workflow

**Blockchain Event Integration:**
- Event listening via Viem WebSocket connections (`blockchain-listener.service.ts`)
- Processor pattern for handling `DEPLOY_TAG`, `META_TRANSACTION_EXECUTED` events
- Automatic database synchronization with blockchain state

**Deterministic Deployment Pattern:**
- Uses `keccak256(entityId)` for predictable on-chain IDs
- CREATE2 deployment for consistent contract addresses
- Organization wallets encrypted and stored for transaction signing

### Multi-Step Verification Workflows

**Organization Verification Flow:**
1. Internal-dashboard creates organization → email verification token
2. Email magic link → Admin-dashboard password setup
3. Password setup triggers wallet creation and on-chain organization registration
4. Organization becomes active and can manage communities

**Community Verification Flow:**
1. Organizations create communities → immediate on-chain group creation
2. Corporate creators create communities → pending approval workflow
3. Verification triggers `createCommunityByCorporate()` smart contract call
4. Community wallet gets group admin permissions for creator management

**Creator Verification Flow:**
1. Individual creators verified by communities → `addCreatorIndividual()`
2. Corporate creators verified by organizations → `addCreatorCorporate()`
3. Both trigger blockchain role assignment with proper access control

### Product Certification & Tag System

**Payment-to-Mint Workflow:**
1. Creator submits product in web portal
2. Payment processing via iPaymu with webhook verification
3. `verifyPayment()` smart contract call validates payment
4. Organization wallet signs `mintTag()` transaction
5. Soulbound NFT minted with IPFS metadata
6. QR code generated for Origin Product Number (OPN)

**Tag Deployment Architecture:**
- Factory pattern for deterministic NFT contract deployment
- Metadata stored on IPFS via Pinata service
- Non-transferable, non-burnable soulbound tokens
- Event-driven synchronization between blockchain and database

## Code Quality & Standards

### Error Handling Pattern

All backend applications follow a comprehensive standardized error handling pattern:

**Core Components:**

- **Error Helper**: `backend/src/utils/error-handler.ts` - Central error conversion utility with specialized handlers
- **Error Middleware**: `backend/src/middleware/error.ts` - Global Hono middleware catcher
- **Error Context**: Standardized context tracking for debugging and monitoring

**Multi-Layer Error Handling Architecture:**
```typescript
// Specialized error handlers for different domains
class DatabaseErrorHandler extends BaseErrorHandler
class ValidationErrorHandler extends BaseErrorHandler  
class ExternalServiceErrorHandler extends BaseErrorHandler
class BusinessLogicErrors extends BaseErrorHandler
class AuthErrors extends BaseErrorHandler

// Main coordinator with context tracking
class ErrorHandler {
  static handleError(error: unknown, context?: ErrorContext): AppError
  static toApiResponse<T>(error: AppError): ApiResponse<T>
}
```

**Service Layer Pattern:**
1. **Services** wrap business logic in try/catch and convert failures:
   ```ts
   catch (err) {
     const appErr = ErrorHandler.handleError(err, { 
       endpoint: "communities/create", 
       method: "POST", 
       timestamp: new Date(),
       userId: organizationId 
     });
     return ErrorHandler.toApiResponse(appErr);
   }
   ```
2. **Controllers** receive `ApiResponse<T>` and only decide HTTP status codes
3. **Global middleware** catches uncaught errors and shapes via `ErrorHandler.toApiResponse`
4. **Async wrapper** available: `asyncErrorHandler()` to eliminate repetitive try/catch

**Smart Contract Error Integration:**
- Blockchain transaction failures handled with specific error types
- On-chain operation rollbacks when database updates fail
- Transaction hash logging for failed operations

**Reference implementations:**
- Web-portal Auth service: `kraflab-web-portal/backend/src/features/auth/auth.service.ts`
- Admin-dashboard Community service: `kraflab-admin-dashboard/backend/src/features/communities/communities.service.ts`

### Testing & API Validation

**Unit Testing:**

- Vitest for unit/integration tests
- Test files in `__tests__/` directories within feature folders
- Coverage for critical business logic

**API Testing:**

- Bruno API testing tool (`.bru` files)
- Test structure requirements:
  ```javascript
  tests {
    test("test name", () => { ... })
  }
  docs {
    // Documentation
  }
  ```
- **Test validation priorities:**
  1. Request structure validation
  2. Response status verification
  3. Response body structure
  4. Data type validation

**Smart Contract Testing:**

- Hardhat for smart contract testing
- Gas reporting for contract optimization
- Extended test suites available

### Linting & Formatting

- ESLint configurations in each project
- TypeScript strict mode enabled
- Consistent code style across applications

### Authentication & Authorization Patterns

**Multi-Entity JWT System:**
Different applications handle different entity types with consistent patterns:

```typescript
// Admin Dashboard: Organization users
interface OrganizationTokenPayload {
  entityType: "organization_user";
  sub: string; // organization user ID
  organizationId: string;
  role: "organization_admin" | "organization_verifier";
}

// Web Portal: Multi-entity support
interface CreatorTokenPayload {
  entityType: "creator";
  sub: string; // creator ID
  type: "individual" | "corporate";
}

interface CommunityTokenPayload {
  entityType: "community";
  sub: string; // community ID
}
```

**Middleware Strategy Pattern:**
- `jwtMiddleware`: Base token verification across all applications
- `creatorAuthMiddleware`: Creator-specific validation with type discrimination
- `guestAuthMiddleware`: Guest creator access in web portal
- `generalAuthMiddleware`: Multi-entity support with role-based access

### Database & Schema Management

**Shared Schema Architecture:**
- Centralized schema in `@baliola/kraflabs-shared-db-schema` package
- Consistent UUID foreign keys across all applications
- Enum-based status management with database-enforced constraints
- Cross-application entity relationships maintained via shared types

**Migration & Seeding Strategy:**
```typescript
// Each application follows consistent pattern
interface MigrationWorkflow {
  "pnpm db:start": "Start containerized PostgreSQL";
  "pnpm db:migrate": "Apply shared schema migrations";
  "pnpm db:seed": "Seed with app-specific data";
  "pnpm db:studio": "Open Drizzle Studio for inspection";
}
```

**Verification Definition System:**
- Configurable verification requirements per entity type
- Dynamic verification item creation based on entity definitions
- Support for required/optional verification items
- Extensible for new entity types and verification modes

### Type Safety & Validation

- Full TypeScript coverage with strict mode enabled
- Zod schemas for runtime validation integrated with OpenAPI
- Drizzle-zod for database schema validation
- Type-safe smart contract integration via TypeChain-generated types

## Deployment Considerations

### Environment Separation

- Development: Local with containers
- Production: Separate deployments per application
- Database: Shared PostgreSQL instance

### Security

- JWT-based authentication
- CORS configuration
- Environment variable management
- Smart contract auditing considerations

### Scalability

- Independent service scaling
- Database connection pooling
- IPFS for distributed file storage

## Common Development Tasks

### Blockchain-First Development Requirements

**Critical Principle:** All major entities (organizations, communities, creators) must be registered on-chain when they reach verified status.

**On-Chain Integration Checklist:**
1. Use existing `SmartContractService` patterns for blockchain calls
2. Encrypt and store entity wallets using ethers.js encryption
3. Use deterministic IDs with `keccak256(entityId)` for on-chain operations
4. Ensure blockchain operations complete before database status updates
5. Handle blockchain failures gracefully with proper error messages

**Smart Contract Service Patterns:**
Each backend maintains standardized methods:
- `createOrganization()` - Organization registration
- `createCommunityByOrganization()` / `createCommunityByCorporate()` - Community groups  
- `addCreatorIndividual()` / `addCreatorCorporate()` - Creator role assignment
- `verifyPayment()` / `mintTag()` - Product certification workflows

Use admin-dashboard implementation as reference for smart contract integration.

### Adding New Features with Blockchain Integration

1. **Schema Updates**: Modify `kraflabs-shared-db-schema` for new entity types
2. **Smart Contract Methods**: Add new methods to `SmartContractService` if needed
3. **Verification Workflows**: Implement on-chain registration in verification flows
4. **Error Handling**: Use standardized `ErrorHandler` patterns for blockchain errors
5. **Testing**: Include blockchain interaction tests with proper mocking

### Database Changes

1. Modify schema in `kraflabs-shared-db-schema`
2. Generate migrations: `pnpm db:generate` 
3. Apply migrations: `pnpm db:migrate`
4. Update dependent applications with new schema types
5. Add verification definitions for new entity types if applicable

### Smart Contract Updates

1. Modify contracts in `kraflab-smartcontract`
2. Run tests: `pnpm test` (note: updated from yarn)
3. Deploy to networks: `pnpm deploy-*`
4. Update `SmartContractService` methods in all relevant backends
5. Test integration with updated contract interfaces

## Troubleshooting

### Common Issues

- **Database Connection**: Check DATABASE_URL and container status
- **CORS Errors**: Verify FRONTEND_URLS configuration
- **Build Failures**: Ensure all dependencies installed with correct package manager
- **Smart Contract Issues**: Check network configuration and gas settings

### Development Tips

- Use `pnpm` consistently across all projects
- Keep environment files updated
- Monitor container logs for database issues
- Use Drizzle Studio for database inspection
- Leverage TypeScript for better development experience

## Resources

### Documentation Files

- Individual README.md in each application directory
- API specifications in APISPEC.md files
- Smart contract documentation in kraflab-smartcontract/README.md

### Package Managers

- Primary: pnpm (faster, more efficient)
- Fallback: yarn/npm (some legacy usage)

## Quick Reference Commands

### Start Full Development Environment

```bash
# Terminal 1: Admin Dashboard
cd kraflab-admin-dashboard/backend && pnpm db:start && pnpm dev

# Terminal 2: Admin Frontend
cd kraflab-admin-dashboard/frontend && pnpm dev

# Terminal 3: Internal Dashboard
cd kraflab-internal-dashboard/backend && pnpm db:start && pnpm dev

# Terminal 4: Web Portal
cd kraflab-web-portal/backend && pnpm db:start && pnpm dev

# Terminal 5: Smart Contracts (if needed)
cd kraflab-smartcontract && pnpm local-node
```

### Database Operations

```bash
# Fresh database setup
pnpm db:clean && pnpm db:start && pnpm db:migrate && pnpm db:seed

# Schema changes (in kraflabs-shared-db-schema)
pnpm db:generate && pnpm db:migrate

# Database inspection
pnpm db:studio
```

### Testing Commands

```bash
# Backend tests
pnpm test                # Vitest unit tests

# Smart contract tests
cd kraflab-smartcontract
pnpm test               # Standard test suite
pnpm test-gas           # With gas reporting
pnpm test-extended      # Extended test coverage

# Frontend linting
pnpm lint               # ESLint checks
```

### Build Commands

```bash
# Build all applications for production
cd kraflab-admin-dashboard/backend && pnpm build
cd ../frontend && pnpm build
cd ../../kraflab-internal-dashboard/backend && pnpm build
cd ../frontend && pnpm build
cd ../../kraflab-web-portal/backend && pnpm build
cd ../frontend && pnpm build
cd ../../kraflab-smartcontract && pnpm compile
cd ../kraflabs-shared-db-schema && pnpm build
```

### Port Reference

- **Admin Dashboard Frontend**: 5174
- **Backend APIs**: Usually 3333 (check individual .env files)
- **Database**: 5430 (containerized PostgreSQL)
- **Drizzle Studio**: Usually 5173 (when running db:studio)

This guide should help future Claude Code instances understand the codebase structure and development workflow efficiently.

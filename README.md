# KrafLabs Monorepo

This is the monorepo for the KrafLabs platform, containing multiple services and applications.

## Redis Queue Management

The platform uses Redis for job queues (BullMQ). Sometimes old jobs can persist after database cleanup, causing errors. Here are the available cleanup options:

### Quick Redis Flush

```bash
# flush redis queues only (fastest)
./flush-redis.sh

# or
pnpm redis:flush
```

### Development Cleanup Options

```bash
# start backends with clean redis queues
./dev-backends.sh --clean-redis

# full cleanup (database + redis) then start
./dev-backends.sh --clean-all

# normal start (no cleanup)
./dev-backends.sh
```

### Manual Cleanup Commands

```bash
# standard infrastructure cleanup (database + redis volumes)
pnpm clean:infrastructure

# comprehensive cleanup (flushes redis data explicitly)
pnpm clean:full

# infrastructure + backends
pnpm dev:full
```

## Common Issues

### "relation does not exist" errors with job processing

This happens when Redis contains old jobs from previous sessions but the database has been cleaned. Solution:

```bash
# stop everything
^C

# flush redis queues
./flush-redis.sh

# restart with clean queues
./dev-backends.sh --clean-redis
```

### Old jobs still processing after cleanup

Sometimes Redis persistence keeps old jobs. Use the comprehensive cleanup:

```bash
pnpm clean:full
pnpm dev:full
```

## Development Scripts

All development scripts are available in the root package.json:

- `pnpm dev:full` - start infrastructure then backends
- `pnpm dev:backends` - start all backend services
- `pnpm clean:infrastructure` - clean database and redis volumes
- `pnpm clean:full` - comprehensive cleanup including redis flush
- `pnpm redis:flush` - flush redis queues only
- `pnpm status` - check running services

## Architecture

The monorepo contains:

- **kraflab-admin-dashboard** - Organization admin interface
- **kraflab-internal-dashboard** - Internal admin interface
- **kraflab-web-portal** - Public web portal
- **kraflab-smartcontract** - Blockchain smart contracts
- **kraflabs-shared-db-schema** - Shared database schema and services

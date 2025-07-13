#!/bin/bash

# quick redis queue flush script for kraflabs monorepo

set -e

# colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # no color

echo -e "${CYAN}🧹 flushing redis queues...${NC}"

# check if redis is running
if ! docker ps | grep -q "kraflab_redis"; then
    echo -e "${RED}❌ redis not running. starting redis...${NC}"
    cd kraflabs-shared-db-schema && pnpm redis:start
    cd ..
    echo -e "${GREEN}✅ redis started${NC}"
    sleep 2
fi

# flush redis
echo -e "${YELLOW}🗑️  flushing all redis data...${NC}"
cd kraflabs-shared-db-schema && pnpm redis:flush
cd ..

echo -e "${GREEN}✅ redis queues flushed successfully${NC}"
echo -e "${CYAN}💡 you can now restart your backends with clean queues${NC}" 
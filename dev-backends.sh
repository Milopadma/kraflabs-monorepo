#!/bin/bash

# kraflabs monorepo - development backends runner
# this script starts all three backend services in parallel

set -e

# colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # no color

# parse command line arguments
CLEAN_REDIS=false
CLEAN_ALL=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --clean-redis)
            CLEAN_REDIS=true
            shift
            ;;
        --clean-all)
            CLEAN_ALL=true
            shift
            ;;
        --help)
            echo "usage: $0 [options]"
            echo "options:"
            echo "  --clean-redis    flush redis queues before starting"
            echo "  --clean-all      full cleanup (database + redis) before starting"
            echo "  --help           show this help message"
            exit 0
            ;;
        *)
            echo "unknown option: $1"
            echo "use --help for usage information"
            exit 1
            ;;
    esac
done

echo -e "${CYAN}🚀 starting kraflabs backend services...${NC}"

# perform cleanup if requested
if [[ "$CLEAN_ALL" == true ]]; then
    echo -e "${YELLOW}🧹 performing full cleanup (database + redis)...${NC}"
    cd kraflabs-shared-db-schema && pnpm services:clean-full
    cd ..
    echo -e "${GREEN}✅ full cleanup completed${NC}"
    
    echo -e "${YELLOW}🏗️  starting fresh infrastructure...${NC}"
    cd kraflabs-shared-db-schema && pnpm services:start
    cd ..
    echo -e "${GREEN}✅ infrastructure started${NC}"
elif [[ "$CLEAN_REDIS" == true ]]; then
    echo -e "${YELLOW}🧹 flushing redis queues...${NC}"
    cd kraflabs-shared-db-schema && pnpm redis:flush
    cd ..
    echo -e "${GREEN}✅ redis queues flushed${NC}"
fi

# check if infrastructure is running
echo -e "${YELLOW}📋 checking infrastructure status...${NC}"
if ! docker ps | grep -q "kraflab_postgres"; then
    echo -e "${RED}❌ postgresql not running. starting infrastructure...${NC}"
    cd kraflabs-shared-db-schema && pnpm services:start
    cd ..
    echo -e "${GREEN}✅ infrastructure started${NC}"
else
    echo -e "${GREEN}✅ infrastructure already running${NC}"
fi

# function to start a backend service
start_backend() {
    local service_name=$1
    local service_path=$2
    local color=$3
    local port=$4

    echo -e "${color}🔧 starting ${service_name} backend...${NC}"
    cd "$service_path" && PORT=$port pnpm dev &
    local pid=$!
    echo -e "${color}📡 ${service_name} backend started (pid: ${pid})${NC}"
    cd - > /dev/null
}

# start all backend services
start_backend "admin-dashboard" "kraflab-admin-dashboard/backend" "$BLUE" "3222"
start_backend "internal-dashboard" "kraflab-internal-dashboard/backend" "$GREEN" "3111"
start_backend "web-portal" "kraflab-web-portal/backend" "$YELLOW" "3333"

echo -e "${CYAN}🎯 all backend services started!${NC}"
echo -e "${MAGENTA}💡 to stop all services, press ctrl+c${NC}"
echo -e "${MAGENTA}💡 logs will appear below:${NC}"
echo -e "${MAGENTA}💡 next time, use --clean-redis to flush queues or --clean-all for full cleanup${NC}"
echo ""

# wait for all background processes
wait

FROM n8nio/n8n:2.47.2

ENV N8N_PORT=10000
ENV PORT=10000
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV N8N_USER_FOLDER=/home/node/.n8n
ENV N8N_PUSH_BACKEND=sse

# Prevent Node.js heap from exceeding Render Free Tier 512MB RAM
ENV NODE_OPTIONS="--max-old-space-size=380"

# Fix task runner crash on slow startup
ENV N8N_RUNNERS_MODE=internal
ENV N8N_RUNNERS_GRANT_TOKEN_TTL=300
ENV N8N_PYTHON_ENABLED=false

# Tune database ping & execution data pruning to reduce memory footprint
ENV DB_PING_TIMEOUT_MS=60000
ENV DB_SQLITE_VACUUM_ON_STARTUP=false
ENV EXECUTIONS_DATA_PRUNE=true
ENV EXECUTIONS_DATA_MAX_AGE=48
ENV EXECUTIONS_DATA_SAVE_ON_SUCCESS=none

EXPOSE 10000

#!/bin/bash

PROJECT_NAME=llm MAGE_CODE_PATH=/home/src docker compose up
#!/bin/bash

# DEBUG
# INFO
# WARNING
# ERROR
# CRITICAL
# export SERVER_VERBOSITY=ERROR

export DEBUG=
# export DEBUG_FILE_IO=0
# export DEBUG_MEMORY=0
# export DEUS_EX_MACHINA=0
# export DISABLE_API_TERMINAL_OUTPUT=1
# export DISABLE_DATABASE_TERMINAL_OUTPUT=1
export REQUIRE_USER_AUTHENTICATION=0
export REQUIRE_USER_PERMISSIONS=0


export DYNAMIC_BLOCKS_VERSION=2
export MEMORY_MANAGER_PANDAS_VERSION=2
export MEMORY_MANAGER_POLARS_VERSION=2
export MEMORY_MANAGER_VERSION=2
export VARIABLE_DATA_OUTPUT_META_CACHE=1
export MATERIA_ENABLED=1
export KERNEL_MANAGER=magic

# Project settings
# If you start the project with ./start.sh, the project name and code path will already be set.
export PROJECT_NAME=rager
export LANGUAGE_SERVER_HOST=127.0.0.1
export LANGUAGE_SERVER_PORT=8765

# Load custom files
# export PYTHONPATH="/home/src/default_repo/mlops:${PYTHONPATH}"

# No-code UI interactions
export MAGE_PRESENTERS_DIRECTORY=/home/src/default_repo/mlops/mlops/presenters

# Database
export POSTGRES_HOST=magic-database
export POSTGRES_DB=magic
export POSTGRES_PASSWORD=password
export POSTGRES_USER=postgres
export DATABASE_CONNECTION_URL="postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:5432/${POSTGRES_DB}"

# Alerts
export SMTP_EMAIL=$SMTP_EMAIL
export SMTP_PASSWORD=$SMTP_PASSWORD

# AI
export HUGGINGFACE_API=""
export HUGGINGFACE_INFERENCE_API_TOKEN=""
export OPENAI_API_KEY=""

export SERVICES="server app magic-database lsp elasticsearch"

# Front-end
export ONLY_V=2

./scripts/dev.sh default_repo/$PROJECT_NAME --override-compose docker-compose.override.yml

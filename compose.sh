#!/usr/bin/env bash

sops exec-file --no-fifo .env "set -f; docker compose --env-file {} $*" 

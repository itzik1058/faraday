#!/usr/bin/env bash

sops exec-file --no-fifo .env "docker compose --env-file {} $*" 

#!/bin/bash
rsync --delete --exclude=.git --exclude=builds -avz ./scripts/ atlas.servers.asio:/data/ssd/share/lab_scripts/
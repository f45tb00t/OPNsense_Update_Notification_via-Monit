#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CURRENT_VERSION=$(opnsense-version)
AVAILABLE_VERSION=$(opnsense-update -c)

if [ -z "$AVAILABLE_VERSION" ]; then
    echo "NO_UPDATE: Current version: $CURRENT_VERSION"
    exit 0
else
    echo "UPDATE_AVAILABLE: Current version: $CURRENT_VERSION, Available version: $AVAILABLE_VERSION"
    exit 1
fi

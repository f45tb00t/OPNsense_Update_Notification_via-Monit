#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Aktuelle installierte Version abrufen und nur die Versionsnummer extrahieren
CURRENT_VERSION=$(opnsense-version | awk '{print $2}')

# Verfügbare Version aus dem Repository abrufen
AVAILABLE_VERSION=$(pkg rquery '%v' opnsense)

if [ "$CURRENT_VERSION" = "$AVAILABLE_VERSION" ]; then
    # Keine neue Version verfügbar
    echo "NO_UPDATE: Current version: $CURRENT_VERSION"
    exit 0
else
    # Update verfügbar
    echo "UPDATE_AVAILABLE: Current version: OPNsense $CURRENT_VERSION, Available version: OPNsense $AVAILABLE_VERSION"
    exit 1
fi

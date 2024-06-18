#!/bin/bash

# Basisname des Containers der kopiert werden soll
BASE_CONTAINER="schule1"

# Präfix für die neuen Container
CONTAINER_PREFIX="uc"

# Netzwerkprofil (bitte anpassen, falls erforderlich)
NETWORK_PROFILE="default"

    read -p "Anzahl Container: " NUM_CONTAINERS
    read -p "Snapshot: " snapshot_name

# Funktion zum Erstellen und Konfigurieren eines Containers
create_container() {
    local container_name=$1
    local base_container=$2

#    local snapshot_name="base"

    # Container aus dem Snapshot erstellen
    lxc copy "${base_container}/${snapshot_name}" "${container_name}"

    # Container starten
    lxc start "${container_name}"

    # Warten, bis der Container eine IP-Adresse erhält
    sleep 5

    # IP-Adresse des Containers abrufen
    local ip_address=$(lxc list "${container_name}" -c 4 | grep eth0 | awk '{print $2}')

    # IP-Adresse anzeigen
    echo "Container ${container_name} hat die IP-Adresse ${ip_address}"
}

# Hauptschleife zum Erstellen der Container
for i in $(seq 1 $NUM_CONTAINERS); do
    container_name="${CONTAINER_PREFIX}${i}"
    create_container "${container_name}" "${BASE_CONTAINER}"
done

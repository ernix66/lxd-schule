
#!/bin/bash

# Name des zu kopierenden Containers
original_container_name="uc"
read -p "Anzahl Container: " NUM_C

# Container 10 Mal loeschen
for i in $( seq 1 $NUM_C); do
  new_container_name="${original_container_name}${i}"
  
  # Überprüfen, ob der Zielcontainer bereits existiert
  if lxc list | grep -q "$new_container_name"; then
    echo "Der Container '$new_container_name' existiert und wird geloescht"
    lxc delete "${new_container_name}"
  echo "geloescht: $new_container_name"
    
    continue
  fi
  
  echo "Container existiert nicht"
  #lxc copy "$original_container_name" "$new_container_name"
done

echo "Alle Container wurden geloescht."

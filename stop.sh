
#!/bin/bash

# Name des zu kopierenden Containers
original_container_name="uc"

read -p "Anzahl Container zu stoppen: " NUM_C
echo $NUM_C
# Container 10 Mal  NUM_Cread -p "Enter fullname: " fullname

#for i in {1..$NUM_C}; do
for i in $( seq 1 $NUM_C ); do
  new_container_name="${original_container_name}${i}"
  
  # Überprüfen, ob der Zielcontainer bereits existiert
  if lxc list | grep -q "$new_container_name"; then
    echo "Der Container '$new_container_name' existiert und wird gestoppt"
    lxc stop "${new_container_name}" --force
  echo "stoppeded: $new_container_name"
    
    continue
  fi
  
  echo " '$new_container_name' Container existiert nicht"
  #lxc copy "$original_container_name" "$new_container_name"
done

echo "Alle Container wurden gestoppt."

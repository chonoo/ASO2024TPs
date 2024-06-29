echo "Ingrese un nombre para conocer la edad probable:"
read nombre


response=$(curl -s "https://api.agify.io/?name=${nombre}")


if [[ $? -ne 0 ]]; then
  echo "Error: No se pudo obtener la información. Inténtelo nuevamente."
  exit 1
fi


edad=$(echo "$response" | jq -r '.age')


if [[ $edad == "null" ]]; then
  echo "No se encontró información para el nombre '$nombre'."
else
  echo "La edad probable de alguien llamado '$nombre' es: $edad años."
fi

exit 0

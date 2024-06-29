numero_aleatorio=$(awk -v min=1 -v max=100 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')

echo "Este juego es de adivinar el Numero"
echo "Adivina el número entre el 1 y el 100. "

intentos=0

while true; do
    read -p "Ingresa un número: " intento


    if ! [[ "$intento" =~ ^[0-9]+$ ]]; then
        echo "Por favor ingresa un número correcto ."
        continue
    fi

    intentos=$((intentos + 1))


    if (( intento < numero_aleatorio)); then
        echo "El número es mayor."
    elif (( intento > numero_aleatorio )); then
        echo "El número es menor."
    else
        echo "Muy Bien, Adivinaste el número en $intentos intentos"
        break
    fi
done
 
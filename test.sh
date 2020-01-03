echo Hello, who are you?

SANDMAN=("EVENTS_DB" 
"TICKETS_TYPE_DB")

for s in "${SANDMAN[@]}"; do

    while [ -z "${!s}" ]; do
        read -p "$s: " "$s"
    done
    # declare "$s"="matur"
    # servervar=s
    # echo "${!servervar}" "$s"
done

CONFIGS="heroku config:set "
for s in "${SANDMAN[@]}"; do
    echo "${!s}"
    CONFIGS="$CONFIGS $s=${!s}"
    done
app=makeittakeit2
CONFIGS="$CONFIGS --app=$app"
echo $CONFIGS
$CONFIGS

# while [ -z "$TAGS_CONNECT_DB" ]; do
# read -p 'TAGS_CONNECT_DB: ' TAGS_CONNECT_DB
# done

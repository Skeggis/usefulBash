while [ -z "$APP_NAME" ]; do
read -p "Name of the app:" APP_NAME
done

# basic plan: "hobby-dev"
while [ -z "$POSTGRES_PLAN" ] || [ "$POSTGRES_PLAN" != "hobby-dev" ]; do
if [ -n "$POSTGRES_PLAN" ];
then
    echo 'For the moment the only supported postgres plan is the free one: "hobby-dev"'
fi
read -p "Postgres plan:" POSTGRES_PLAN
done

echo Now we need some env variables, thank you!

SANDMAN=("EVENTS_DB" "TICKETS_TYPE_DB" "TAGS_DB" "TAGS_CONNECT_DB" "SPEAKERS_DB"
"SPEAKERS_CONNECT_DB" "ORGANIZATIONS_DB" "CITIES_DB" "COUNTRIES_DB" "CATEGORIES_DB"
"SEARCH_EVENTS_DB" "EVENTS_INFO_VIEW" "ORDERS_DB" "CHIRO_TIX_SETTINGS_DB" "CLOUD_NAME"
"CLOUD_KEY" "CLOUD_SECRET" "ORDERS_DB" "USERS_DB" "SALT" "JWT_SECRET")
# SANDMAN=("EVENTS_DB" "TICKETS_TYPE_DB" "TAGS_DB")

SET_CONFIGS="heroku config:set"
for s in "${SANDMAN[@]}"; do
    while [ -z "${!s}" ]; do
        read -p "$s:" "$s"
    done
    SET_CONFIGS="$SET_CONFIGS $s=${!s}"
done
SET_CONFIGS="$SET_CONFIGS --app=$APP_NAME"

heroku create $APP_NAME
heroku addons:create heroku-postgresql:$POSTGRES_PLAN
$SET_CONFIGS
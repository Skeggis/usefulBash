name=$1

if [ -z "$name" ]; then
    echo "Please give the name of the app to destroy"
    exit 1
fi

heroku apps:destroy $name
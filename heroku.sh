name=$1

if [ -z "$name" ]; then
    echo "Please give the app a name"
    exit 1
fi

heroku create "$name"
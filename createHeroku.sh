name=$1
plan=$2

if [ -z "$name" ]; then
    echo "Please give the app a name"
    exit 1
fi

if [ -z "$plan"]; then
    plan="hobby-dev"
fi

heroku create "$name"
heroku addons:create heroku-postgresql:"$plan"
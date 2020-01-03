name=$1
plan=$2
server=$3
if [ -z "$name" ]; then
    echo "Please give the app a name"
    exit 1
fi

if [ -z "$plan"]; then
    plan="hobby-dev"
fi


heroku create $name -b https://github.com/mars/create-react-app-buildpack.git
heroku addons:create heroku-postgresql:$plan 
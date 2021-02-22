#!/bin/bash

#informerar användare att de behöver vara root för att köra scriptet, om de inte är det.
if [ $(whoami) != root ]
then
    echo "Du kör som $(whoami) men du behöver köra som root"
    exit
fi

#root-behörighet:

apt-get update -y               #Uppdatera repositories, svara automatiskt Ja på eventuella frågor

sudo apt-get install nginx -y   #installera NGINX

#ändra index-sidan för webbservern
echo "
<!DOCTYPE html>
<html>
  <head>
  <title>Welcome to my homepage!</title>
  </head>
  <body>
    <style>
      h3 {
        text-align: center;
      }
    </style>
    <h3>Välkommen till antons hemsida</h3>
  </body>
</html>
" | sudo tee /var/www/html/index.nginx-debian.html 1>/dev/null #Istället för att skicka till standar output så skicka till "inget"


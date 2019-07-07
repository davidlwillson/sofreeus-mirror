#!/bin/bash -eu
color='';colors='red orange yellow green blue indigo violet'

function cleanup {
  set +e
  # killall midori
  for color in $colors
  do
    echo "Stopping and removing a container named $color ..."
    docker rm --force $color
  done
  set -e
}

function display {
  for color in $colors
  do
    echo "Creating a container named $color ..."
    docker run --name $color -d httpd:2.4
    echo "Copying the web-page to the container..."
    docker cp /tmp/$color.index.html $color:/usr/local/apache2/htdocs/index.html
    docker cp /tmp/devopsdaystechdemo.png $color:/usr/local/apache2/htdocs/
    sleep 1
    echo "Getting the container's ip address ..."
    container_ip=$( docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $color )
    echo $container_ip
    grep "$container_ip $color" /etc/hosts || {
      echo "$container_ip $color" | sudo tee -a /etc/hosts
    }
    sleep 1
    # spawn a sub-process to browse it
    echo "Firing up a browser to $container_ip ..."
    curl "http://$color/"
    sleep 1
  done
}

cleanup
display

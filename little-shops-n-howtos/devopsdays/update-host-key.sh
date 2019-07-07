#!/bin/bash -eu
while read server
do
  tempfile=$( mktemp )
  if [[ $server ]] && ssh-keyscan $server > $tempfile && [[ -s $tempfile ]]
  then
    if [[ $server =~ ^[[:digit:].]*$ ]]
    then
      echo "$server is numbers"
      ssh-keygen -R $server
      cat $tempfile >> ~/.ssh/known_hosts
      echo "$server added to known_hosts"
    else
      echo "$server is name"
      ip=$( dig $server +short )
      ssh-keygen -R $server
      ssh-keygen -R $ip
      cat $tempfile >> ~/.ssh/known_hosts
      echo "$server added to known_hosts"
    fi
  fi
  rm $tempfile
done

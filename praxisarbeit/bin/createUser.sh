#!/bin/sh

# Reading input parameters
while getopts i:p:c: flag; do
  case "${flag}" in
  i) i=${OPTARG} ;;
  p) p=${OPTARG} ;;
  c) c=${OPTARG} ;;
  esac
done

echo "inputFile: $i"
echo "password: $p"
echo "createGroup: $c"

addNewUser() {
  if id "$1" &>/dev/null; then
    echo 'New user was created'
    sudo useradd -g $group -m $1
  else
    echo 'User already exists, no new user could be created'
  fi
}

# Reading File
a=1
cat $i | grep -v '^#' | grep -v '^$' | while read user group names; do # Check if group2 exists
  if grep -q $group /etc/group; then
    echo "Group exists"
    addNewUser $user $password
  else
    echo "Group does not exist"
    if [ $c ]; then
      echo "Creating group"
      sudo groupadd $group
      addNewUser $user $password
    else
      echo "There is no group $c and createGroup flag is not set. No userName was created"
    fi
  fi

done

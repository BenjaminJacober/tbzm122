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

# Reading File
a=1
while read ln; do
  # Get names
  user=${ln[0]}
  group=${ln[1]}
  names=${ln[2]}

  # Check if group exists
  if grep -q $group /etc/group; then
    echo "group exists"
    sudo usermod -a -G $group $user
  else
    echo "group does not exist"
    if [ $c ]; then
          sudo groupadd $group
          sudo usermod -a -G $group $user
    else
      echo "There is no group $c and createGroup flag is not set. No user was created"
    fi
  fi

  a=$((a + 1))
done <$i

echo "$fileArray"

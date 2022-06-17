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
#while read ln; do
cat $i | grep -v '^#' | grep -v '^$' | while read user group names; do # Check if group2 exists
  if grep -q $group /etc/group; then
    echo "group exists"
    sudo useradd -g $group $user
  else
    echo "group does not exist"
    if [ $c ]; then
      sudo groupadd $group
      sudo  -a -G $group $user
    else
      echo "There is no group $c and createGroup flag is not set. No userName was created"
    fi
  fi

done

#  a=$((a + 1))
#done <$i

echo "$fileArray"

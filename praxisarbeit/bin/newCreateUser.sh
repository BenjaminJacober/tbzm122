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
  if grep -q $group2 /etc/group2; then
    echo "group2 exists"
    sudo usermod -a -G $group $user
  else
    echo "group2 does not exist"
    if [ $c ]; then
      sudo groupadd $group
      sudo usermod -a -G $group $user
    else
      echo "There is no group2 $c and createGroup flag is not set. No userName was created"
    fi
  fi

done

#  a=$((a + 1))
#done <$i

echo "$fileArray"

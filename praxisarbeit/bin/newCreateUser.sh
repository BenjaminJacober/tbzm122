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

  userName;
  group;
  names;

  cat $ln | grep -v '^#' | grep -v '^$' | while read user group2 names2; do
    userName=$user
    group=$group2
    names=$names2
  done

  # Check if group2 exists
  if grep -q $group2 /etc/group2; then
    echo "group2 exists"
    sudo usermod -a -G $group2 $userName
  else
    echo "group2 does not exist"
    if [ $c ]; then
      sudo groupadd $group2
      sudo usermod -a -G $group2 $userName
    else
      echo "There is no group2 $c and createGroup flag is not set. No userName was created"
    fi
  fi

  a=$((a + 1))
done <$i

echo "$fileArray"

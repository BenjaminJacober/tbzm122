while getopts c:o:g:e flag; do
  case "${flag}" in
  c) c=${OPTARG} ;;
  o) o=${OPTARG} ;;
  g) g=${OPTARG} ;;
  e) e=${OPTARG} ;;
  esac
done

DIR="/home/benjaminjacober/Documents/GitHub/tbzm122/praxisarbeit/backups"
if [ -d "$DIR" ]; then
  echo "Going into group directory: $g"
  for userDir in *; do
    # Go into user group
    echo "Going into user directory: $userDir"
    cd $DIR
    cd $g
    cd $userDir

    # Delete old files
    for file in $(ls -t | tail -n +11); do
      echo "Deleting file: $file"
      rm "$file"
    done

    # Create new backup
    userHome="/home/$userDir"
    echo userHome
    cp -r userHome temp
    cd temp
    for file in *; do
      rm specified.txt
    done

#    tar -c archiveName

  done

else
  echo "donf"
fi

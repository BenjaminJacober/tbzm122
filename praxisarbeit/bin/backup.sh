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
  # Take action if $DIR exists. #
  cd $DIR
  echo "Going into group directory: $g"
  cd $g
  for userDir in *; do
    # Go into user group
    echo "Going into user directory: $userDir"
    cd $userDir

    # Delete old files
    for file in $(ls -t | tail -n +11); do
      echo "Deleting file: $file"
      rm "$file"
    done

    # Create new backup
    userHome="/home/$userDir/*"
    cp -r userHome temp
    cd temp
    for file in *; do
      rm specified.txt
    done

    cd $DIR
    cd $g
  done

else
  echo "donf"
fi

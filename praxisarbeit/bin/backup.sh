while getopts g:e:a flag; do
  case "${flag}" in
  g) g=${OPTARG} ;;
  e) e=${OPTARG} ;;
  a) a=${OPTARG} ;;
  esac
done

echo "amountOfBackups: $a"

DIR="/home/dodo/Documents/GitHub/tbzm122/praxisarbeit/backups"
if [ -d "$DIR" ]; then
  echo "Going into group directory: $g"
  cd $DIR
  cd $g
  for userDir in *; do
    # Go into user group
    echo "Going into user directory: $userDir"
    cd $userDir

    # Delete old files
    for file in $(ls -t | tail -n +$a+1); do
      echo "Deleting file: $file"
      rm "$file"
    done

    # Create new backup
    userHome="/home/$userDir"
    echo $userHome
    cp -r $userHome temp
    cd temp
    for file in *; do
      pwd
      rm specified.txt
    done

    echo "Creating tar"
    tar -czvf "$(date '+%Y-%m-%d').$userDir.tar.gz" $userHome

    cd $DIR
    cd $g

  done

else
  echo "donf"
fi

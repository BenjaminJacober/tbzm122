while getopts g:e:a:c flag; do
  case "${flag}" in
  g) g=${OPTARG} ;;
  e) e=${OPTARG} ;;
  a) a=${OPTARG} ;;
  o) o=${OPTARG} ;;
  esac
done

echo "If this script doesn't work install members (sudo apt install members | or similar)"
echo "amountOfBackups: $a"

let "a=a+1"

cwd=`pwd`
DIR="/home/"
if [ -d "$DIR" ]; then

  # Create dir if doesn't exists
  if [ -d "$cwd/../backups/$g" ]; then
    echo "Ignore this"
  else
    mkdir "$cwd/../backups/$g"
  fi

  # Going into group backup directory
  cd "$cwd/../backups/$g"

  for userDir in `members $g`; do

    # Create dir if doesn't exists
    if [ -d "$cwd/../backups/$g/$userDir" ]; then
      echo "Ignore this"
    else
      mkdir "$cwd/../backups/$g/$userDir"
    fi

    # Delete old files
    # Going into user backup directory
    cd $userDir

    for file in $(ls -t | tail -n +$a); do
      echo "Deleting file: $file"
      rm "$file"
    done

    # Create new backup
    userHome="/home/$userDir"

    echo "Creating tar"
    if [ $o ]; then
      tar -czvf "$cwd/../backups/$g/$userDir/$o.$(date '+%Y-%m-%d').$userDir.tar.gz" $userHome
    else
      tar -czvf "$cwd/../backups/$g/$userDir/$(date '+%Y-%m-%d').$userDir.tar.gz" $userHome
    fi

  done

else
  echo "donf"
fi

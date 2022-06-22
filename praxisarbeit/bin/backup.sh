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

cwd=`pwd`
DIR="/home/"
if [ -d "$DIR" ]; then

  # Going into group backup directory
  cd "$cwd/../backups/$g"

  for userDir in members $g; do

    # Delete old files
    # Going into user backup directory
    cd $g

    for file in $(ls -t | tail -n +$a+1); do
      echo "Deleting file: $file"
      rm "$file"
    done

    # Create new backup
    # Go into user home directory
    echo "Going into user directory: $userDir"
    cd $DIR$userDir
    userHome="/home/$userDir"
    echo $userHome
    cp -r $userHome temp
    cd temp
    for file in *; do
      pwd
      rm specified.txt
    done

    echo "Creating tar"
    tar -czvf "$cwd/../backups/$g/$o.$(date '+%Y-%m-%d').$userDir.tar.gz" $userHome

  done

else
  echo "donf"
fi

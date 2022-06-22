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
    cd $userDir

    for file in $(ls -t | tail -n +$a+1); do
      echo "Deleting file: $file"
      rm "$file"
    done

    # Create new backup
    userHome="/home/$userDir"
    echo "Creating tar"
    tar -czvf "$cwd/../backups/$g/$o.$(date '+%Y-%m-%d').$userDir.tar.gz" $userHome

  done

else
  echo "donf"
fi

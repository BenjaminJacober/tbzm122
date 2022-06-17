while getopts c:o:g:e flag; do
  case "${flag}" in
  c) c=${OPTARG} ;;
  o) o=${OPTARG} ;;
  g) g=${OPTARG} ;;
  e) e=${OPTARG} ;;
  esac
done

DIR="/home/dodo/Documents/GitHub/tbzm122/praxisarbeit/backups"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo $DIR
  cd $DIR
  for userDir in *; do
    cd $userDir
    echo $userDir
    for file in $(ls -t|tail -n +10) ;
    do 
       rm $file
    done
    noch loeaschen
  done

else
  echo "donf"
fi

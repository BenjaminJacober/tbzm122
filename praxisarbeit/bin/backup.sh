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
  echo $DIR
  for userDir in $DIR; do
    cd "$DIR$userDir"
    echo $userDir
    echo ls | wc -l
  done

else
  echo "donf"
fi

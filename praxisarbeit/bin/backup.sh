while getopts c:o:g:e flag; do
  case "${flag}" in
  c) c=${OPTARG} ;;
  o) o=${OPTARG} ;;
  g) g=${OPTARG} ;;
  e) e=${OPTARG} ;;
  esac
done

DIR="$pwd"
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Installing config files in ${DIR}..."
fi
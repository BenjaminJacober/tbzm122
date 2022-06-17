# Reading input parameters
while getopts a:c: flag; do
  case "${flag}" in
  a) a=${OPTARG} ;;
  c) c=${OPTARG} ;;
  esac
done

echo "amountOfBackups: $a"
echo "command: $c"


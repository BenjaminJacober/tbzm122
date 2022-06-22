# Reading input parameters
while getopts a:c: flag; do
  case "${flag}" in
  a) a=${OPTARG} ;;
  c) c=${OPTARG} ;;
  esac
done

echo "command: $c"

# Reading File
a=1
cat ../etc/createCronJob.conf | grep -v '^#' | grep -v '^$' | while read group; do
  echo $group
  if grep -q $group /etc/group; then
    echo "Creating cron job"
    #echo new cron into cron file
    echo "00 00 * 00 00 $command" >> mycron
    #install new cron file
    crontab mycron
    rm mycron
  else
    echo "Group does not exist, did not set up cron job"
done
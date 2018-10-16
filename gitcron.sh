# Argument 1 - Interval time in minutes
# Argument 2 - Git Directory Location
# eg. 	$ ./gitcron.sh 1 /var/www/vawsum  &>/dev/null &
#		$ disown
function myGitCron() {
	arg1=$1
	arg2=$2
	while true
	do
		cd $arg2
		git pull origin master
		sleep "${arg1}m"
	done
}
myGitCron $1 $2

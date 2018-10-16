# Make sure that you have stored your git's credentials previously by issuing following command
#$ git config credential.helper 'cache --timeout=86400' 
# The above command will store the credentials for a day. 
#If you wish you can increase the timeout to suite your purpose.

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

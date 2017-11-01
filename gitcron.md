# Shell Script to automatically pull from master
The following bash functions defined in bash_aliases runs at 5 minutes interval to pull commits from master branch in the git directory from a remote repository. Since, fetching latest commits will require credentials, 'autoexpect' needs to be setup to run the command with password input. Password will be saved in clear text file which is a security risk, but one has to assume that the server security is configured properly. You may also set file permission of the resulting exp file to 700 or 600.

```sh

function myGitPull() {
        cd /var/www/gitdir/
        expect gitpass.exp
}

function myGitCron() {
        while true
        do
                myGitPull
                sleep 5m
        done
}
```

In order to automate the process, the following commands should be run:
`$ myGitCron &>/dev/null &`
Above command will pushes it off to the backgroung and keeps it running.
However, in order to keep it running even after exiting the terminal, it should be disowned by issuing the following command:
`$ disown`


Ref:
http://www.admin-magazine.com/Articles/Automating-with-Expect-Scripts
https://stackoverflow.com/questions/4662048/are-there-any-cron-jobs-alternative
https://www.maketecheasier.com/run-bash-commands-background-linux/

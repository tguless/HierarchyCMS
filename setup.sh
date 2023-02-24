SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR

if [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
	if [ ! -f "/bin/apt-cyg" ]; then
		lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
		install apt-cyg /bin
		rm apt-cyg
	fi  
	apt-cyg install wget dos2unix 
fi

if [ ! -d "./WebApp-Maven/local-maven-repo" ]; then	 
	dos2unix ./WebApp-Maven/register-jars.sh
	./WebApp-Maven/register-jars.sh
fi

if [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
	mkdir /cygdrive/c/wscache
	mkdir /cygdrive/c/wscache/smallpic
else 
	mkdir /var/lib/hierarchycms/
	mkdir /var/lib/hierarchycms/smallpic
fi
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
WEB_DIR="$(find $SCRIPT_DIR/WebApp-Maven/web/target/ -maxdepth 1 -type d -name web-*)"
cd $WEB_DIR
export PATH=$PATH:/usr/local/bin/
java  -Xmx256m -classpath ./WEB-INF/lib/*\;./WEB-INF/classes/ com/hierarchycm/transcoder/QueueProcessor

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPT_DIR

mkdir jars
cd jars
wget http://www.java2s.com/Code/JarDownload/gxt/gxt-2.2.4-gwt22.jar.zip
unzip gxt-2.2.4-gwt22.jar.zip
rm gxt-2.2.4-gwt22.jar.zip
cd ..
mkdir ./local-maven-repo

mvn deploy:deploy-file \
 -DgroupId=com.extjs \
 -DartifactId=gxt \
 -Dversion=2.2.4-gwt22 \
 -Durl=file:./local-maven-repo/ \
 -DrepositoryId=local-maven-repo \
 -DupdateReleaseInfo=true \
 -Dfile=./jars/gxt-2.2.4-gwt22.jar


#!/bin/sh
#
# Name: ffmpeg git
# Version: 0.01a
# Description: ffmpeg git compilation with libvorbis, x264, mp3 lame support
# Script_URI: http://www.techno-blog.net
#
# Author: Nikos


###########################
##### Run some checks #####
###########################

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Erreur : Vous devez être root pour utiliser ce script, use sudo sh $0"
    exit 1
fi

#############################################
##### Set some variables and functions ######
#############################################

# Directory where this script is located
BASEDIR="$(dirname $0)"

error_out() {
    echo "Could not ${1}, aborting"
    exit 1
}

wrap() {
    local ErrorMsg="$1"
    shift
    local cmd="$1"
    shift
    $cmd "$@" || error_out "$ErrorMsg"
}

# Function to install packages
install_pkgs() {
    aptitude -yq=3 install "$@"
}

# Function to remove packages
remove_pkgs() {
    aptitude -yq=3 remove "$@"
}


#################################
##### The magic starts here #####
#################################

# Uninstall Packages
wrap "remove libmp3lame-dev ffmpeg" remove_pkgs libmp3lame-dev ffmpeg

# Install packages
wrap "install some dependancies" install_pkgs quilt libsdl1.2-dev libogg-dev libvorbis-dev liba52-dev libdts-dev libimlib2-dev texi2html libraw1394-dev libdc1394-22-dev libtheora-dev libgsm1-dev libxvidcore-dev libfaac-dev libfaad-dev build-essential git-core checkinstall yasm texi2html libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libx11-dev libxfixes-dev zlib1g-dev nasm

# Retrieving x264, libvorbis, mp3lame
mkdir ffmpeg_source
cd ffmpeg_source

wrap "retrieving x264 from git sources" git clone git://git.videolan.org/x264
cd x264
wrap "set up x264 config" ./configure --enable-static --disable-opencl
wrap "compilation with 3 cores" make -j3
wrap "build install-lib-dev" make install-lib-dev
wrap "build DEB package" checkinstall --pkgname=x264 --default --pkgversion="3:$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes

cd ..
mkdir -p /usr/local/share/doc/lame
wrap "download lamemp3 source" wget http://downloads.sourceforge.net/project/lame/lame/3.98.4/lame-3.98.4.tar.gz
tar xzvf lame-3.98.4.tar.gz
cd lame-3.98.4
wrap "set up lamemp3" ./configure --enable-nasm --disable-shared
wrap "compilation" make
wrap "build DEB package" checkinstall --pkgname=lame-ffmpeg --pkgversion="3.98.4" --backup=no --default --deldoc=yes

cd ..
wrap "retrieving libvpx from git sources" git clone http://git.chromium.org/webm/libvpx.git
cd libvpx
wrap "set up libvpx config" ./configure
wrap "compilation with 3 cores" make -j3
wrap "build DEB package" checkinstall --pkgname=libvpx --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no --default --deldoc=yes

cd ..
wrap "retrieving ffmpeg from git sources" git clone git://git.videolan.org/ffmpeg
cd ffmpeg
wrap "set up ffmpeg config" ./configure --enable-gpl --enable-postproc --enable-swscale --enable-pthreads --enable-x11grab --enable-libdc1394 --enable-libfaac --enable-libgsm --enable-libmp3lame --enable-libtheora --enable-libvorbis --enable-libx264 --enable-libxvid --enable-nonfree --enable-version3 --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libvpx --enable-avfilter
wrap "compilation with 3 cores" make -j3
wrap "build DEB package" checkinstall --pkgname=ffmpeg --pkgversion="0.6.3-git" --backup=no --deldoc=yes --default
hash x264 ffmpeg ffplay ffprobe

echo "#############################"
echo "##### Mission complete! #####"
echo "#############################"


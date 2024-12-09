#!/bin/bash

base_url='https://cn.bing.com'
suffix_url=$(curl -s http://cn.bing.com/HPImageArchive.aspx\?format\=js\&idx\=0\&n\=3 | sed 's/,/\n/g' | grep '\"urlbase\"' -m 1 | sed 's/:/\n/g' | sed 1d | sed 's/"//g')
#高清图后缀
size='_UHD.jpg'
image_url=$base_url$suffix_url$size
dir_name="Wallpapers"
file_name=$(date "+%Y%m%d")
cur_dir=$(pwd)
file_path=~/$dir_name/$file_name.jpg

check() {
  if [ -f $file_path ]; then
    echo "文件存在"
  else
    download
  fi
}

download() {
  echo "开始下载 $image_url"
  curl -s $image_url -o $file_path
  echo $file_path
  echo "更换壁纸..."
}

if [ -d $dir_name ]; then
  check
else
  mkdir bing
  check
fi

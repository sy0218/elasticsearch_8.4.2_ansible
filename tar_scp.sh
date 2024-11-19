#!/usr/bin/bash

system_file="/data/work/system_download.txt"

elasticsearch_array=($(cat ${system_file} | grep elasticsearch_ip | awk -F '|' '{for(i=2; i<=NF; i++) print $i}'))
len_array=${#elasticsearch_array[@]}

ansible_dir=$1
tar_dir=$2

for ((i=0; i<len_array; i++));
do
	current_ip=${elasticsearch_array[$i]}
	scp ${ansible_dir}/*elasticsearch-?.?.?-*tar* root@${current_ip}:${tar_dir}/
done


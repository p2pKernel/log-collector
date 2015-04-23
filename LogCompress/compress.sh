#!/bin/bash

current_utc=$1
logs_num=$2
logs_dir=$3
dest_dir=$4
ftp_dir=$5
ext=log

if [[ ! -d ${logs_dir} ]]; then
    echo "Directory ${logs_dir} is not exist"
    echo "Usage compress.sh current_time(UTC) logs_num logs_dir dest_dir ftp_dir"
    echo "e.g., compress.sh `date -d '20150423 15:55' +%s` 5 . out ftp/`date +%Y%m%d`"
    echo "This script will first merge logs into dest_dir, then zip it into ftp_dir"
    echo "The original logs will be removed"
    exit -1
fi

if [[ ! -d ${dest_dir} ]]; then
    mkdir -p ${dest_dir}
fi

if [[ ! -d ${ftp_dir} ]]; then
    mkdir -p ${ftp_dir}
fi

dest=`date -d @${current_utc} +%Y%m%d%H%M`

unset logs
for (( i = ${logs_num}, j=0; i > 0; i--, j++ )); do
    temp_tm_utc=$[${current_utc} - 60*${i}]
    logs[$j]=`date -d @${temp_tm_utc} +%Y%m%d%H%M.${ext}`
done

cd ${logs_dir}

# Step 1 - Merge logs
cat ${logs[@]} > ${dest_dir}/${dest}.${ext}

if [[ $? -ne 0 ]]; then
    echo "Fail to merge ${logs[@]} to ${dest_dir}/${dest}.${ext}"
    # exit -2
fi

# Step 2 - Remove original logs
rm -f ${logs[@]}

if [[ $? -ne 0 ]]; then
    echo "Fail to remove original logs: ${logs[@]}"
fi

# Step 3 - Zip logs
zip -rmjq ${ftp_dir}/${dest}.zip ${dest_dir}/${dest}.${ext}

if [[ $? -ne 0 ]]; then
    echo "Fail to zip -r ${ftp_dir}/${dest}.zip ${dest_dir}/${dest}.${ext}"
    exit -3
fi
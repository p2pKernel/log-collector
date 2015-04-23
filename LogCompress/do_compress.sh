#!/bin/bash

/common/log-collector/LogCompress/compress.sh `date +%s` 5 /var/log/bestv/B2C/service /data/log/B2C/service /data/ftp/log/B2C/service/`date +%Y%m%d`

#!/bin/bash

# server log
/common/log-collector/LogCompress/compress.sh `date +%s` 5 /var/log/bestv/B2C/service /data/log/B2C/service /data/ftp/log/B2C/service/`date +%Y%m%d`

# TSERVICEACCESQOS
/common/log-collector/LogCompress/compress.sh `date +%s` 5 /var/log/bestv/B2C/TSERVICEACCESQOS /data/log/B2C/TSERVICEACCESQOS /data/ftp/log/B2C/TSERVICEACCESQOS/`date +%Y%m%d`

#!/bin/bash

# server log
/common/log-collector/LogCompress/compress.sh `date +%s` 5 /var/log/bestv/B2C/service /data/log/B2C/service /data/ftp/log/B2C/service/`date +%Y%m%d` 

# TSERVICEACCESQOS
/common/log-collector/LogCompress/compress.sh `date +%s` 5 /var/log/bestv/B2C/TSERVICEACCESQOS/OTT /data/log/B2C/TSERVICEACCESQOS/OTT /data/ftp/log/B2C/TSERVICEACCESQOS/OTT/`date +%Y%m%d` /common/log-collector/LogCompress/pre_process_TSERVICEACCESQOS.sh 



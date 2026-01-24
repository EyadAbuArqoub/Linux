# System Activity Reporter - SAR

## What is SAR?

- SAR is a utility used to collect and report system activity. It collects data relating to most core system functions, and writes those metrics to binary data files.
- SAR is also a binary (/usr/bin/sar) which can be used to specifically query an sa## file (eg: sa01) or to request current running statistics from a system.
- SAR writes to log files in /var/log/sa. This directory holds two types of files - sa\#\# files (binary) and sar\#\# files (text).
- The number at the end of the file corresponds to the day of the month that file was recording.
- When the sysstat package is installed it places a file into /etc/cron.d/sysstat.
- This sets up two cron jobs.
    1. job to record statistics every 10 minutes.
    2. job to write the binary sa\#\# file to a text sar\#\# file once a day (typically right before midnight).
- Configuration file in /etc/sysconfig/sysstat.





## URLs

https://access.redhat.com/solutions/276533


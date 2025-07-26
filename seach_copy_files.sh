#!/bin/bash

find /home/bitrix/www/upload/ -type f -name '*.doc' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > doc.txt
echo "*.doc is ok"

find /home/bitrix/www/upload/ -type f -name '*.docx' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > docx.txt
echo "*.docx is ok"

find /home/bitrix/www/upload/ -type f -name '*.xls' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > xls.txt
echo "*.xls is ok"

find /home/bitrix/www/upload/ -type f -name '*.xlsx' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > xlsx.txt
echo "*.xlsx is ok"

find /home/bitrix/www/upload/ -type f -name '*.jpg' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > jpg.txt
echo "*.jpg is ok"

find /home/bitrix/www/upload/ -type f -name '*.png' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > png.txt
echo "*.png is ok"

find /home/bitrix/www/upload/ -type f -name '*.mp4' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > mp4.txt
echo "*.mp4 is ok"

find /home/bitrix/www/upload/ -type f -name '*.pdf' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > pdf.txt
echo "*.pdf is ok"

find /home/bitrix/www/upload/ -type f -name '*.zip' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > zip.txt
echo "*.zip is ok"

find /home/bitrix/www/upload/ -type f -name '*.7z' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > 7z.txt
echo "*.7z is ok"

find /home/bitrix/www/upload/ -type f -name '*.ppt' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > ppt.txt
echo "*.ppt is ok"

find /home/bitrix/www/upload/ -type f -name '*.pptx' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > pptx.txt
echo "*.pptx is ok"

find /home/bitrix/www/upload/ -type f -name '*.gif' -exec md5sum {} \; | /usr/bin/awk {'print $1"\t"$2'}| sort -n | uniq -c | sort -rn > gif.txt
echo "*.gif is ok"

echo "Log files is created"

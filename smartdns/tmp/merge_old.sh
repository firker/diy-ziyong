rm hosts                     
rm neohosts-for-smartdns.conf
sh ./go.sh

rm merge-for-smartdns.conf
echo "#*********************************************************"  > merge-for-smartdns.conf
echo "#TITLE=NeoHosts and anti-ads for SmartDNS" >> merge-for-smartdns.conf
echo "#url=https://github.com/neofelhz/neohosts" >> merge-for-smartdns.conf
echo -n "#version=" >> merge-for-smartdns.conf
date "+%Y-%m-%d %H:%M:%S" >> merge-for-smartdns.conf
echo "#TOTAL_LINES=grep" >> merge-for-smartdns.conf
echo "#*********************************************************" >> merge-for-smartdns.conf
cat  anti-ad-for-smartdns.conf neohosts-for-smartdns.conf|awk '!x[$0]++' > tmp.conf
grep address tmp.conf >> merge-for-smartdns.conf && rm tmp.conf
total=`grep -c address merge-for-smartdns.conf`
sed -i "s/grep/$total/" merge-for-smartdns.conf
sed -i '/^\s*$/d' merge-for-smartdns.conf
sed -i 's/
//g' merge-for-smartdns.conf


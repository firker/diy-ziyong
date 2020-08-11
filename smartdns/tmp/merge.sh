#rm hosts                     
#rm neohosts-for-smartdns.conf
#sh ./go.sh


rm anti-ad-for-smartdns.conf
wget https://gitee.com/privacy-protection-tools/anti-ad/raw/master/anti-ad-for-smartdns.conf && echo "++++++  start update anti-ad-for-smartdns.conf " >> 1.log 


rm hosts
wget https://hosts.nfz.moe/full/hosts
sed -i '/^\s*$/d' hosts
sed -i 's/
//g' hosts
sed -i "/#/d" hosts
sed -i "/::/d" hosts
sed -i "/localhost/d" hosts
#sed -i 's/0.0.0.0/address/' hosts
echo "#*********************************************************" > neohosts-for-smartdns.conf
echo "# Copyright (c), Neko Dev Team & neoHosts Team." >> neohosts-for-smartdns.conf
echo "# https://github.com/neofelhz/neohosts" >> neohosts-for-smartdns.conf
echo "#*********************************************************"  >> neohosts-for-smartdns.conf
echo "#TITLE=NeoHosts block ads for SmartDNS" >> neohosts-for-smartdns.conf
echo "#url=https://github.com/neofelhz/neohosts" >> neohosts-for-smartdns.conf
echo -n "#version=" >> neohosts-for-smartdns.conf
date "+%Y-%m-%d %H:%M:%S" >> neohosts-for-smartdns.conf
echo "#TOTAL_LINES=grep" >> neohosts-for-smartdns.conf
echo "#*********************************************************" >> neohosts-for-smartdns.conf

awk -F '[ ]' '{print "address /"$2"/#"}' hosts >> neohosts-for-smartdns.conf
total=`grep -c address neohosts-for-smartdns.conf`
sed -i "s/grep/$total/" neohosts-for-smartdns.conf

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


rm hosts
rm anti-ad-for-smartdns.conf
rm neohosts-for-smartdns.conf



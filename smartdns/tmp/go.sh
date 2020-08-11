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

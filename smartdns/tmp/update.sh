cd /etc/smartdns
rm /etc/smartdns/* -f

date +"%Y-%m-%d %H:%M:%S" > 1.log
echo ========  `date +"%Y-%m-%d %H:%M:%S"`  ======== >> 1.log

wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/update.sh

wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/make-gfwlist.sh
sh make-gfwlist.sh -d oversea -o gfwlist.conf && echo " +++++  update gfwlist.conf "  >> 1.log

wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/blacklist-ip.conf
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/custom.conf
wget https://raw.githubusercontent.com/jikkyfu/smartdns/master/merge.sh

sh ./merge.sh  &&  echo " +++++  update merge-for-smartdns.conf "  >> 1.log

rm make-gfwlist.sh
rm merge.sh

sed -ie '/smartdns/d' /var/spool/cron/crontabs/root
echo "0 4 * * * sh /etc/smartdns/update.sh" >> /var/spool/cron/crontabs/root

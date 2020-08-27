#ホスト名を指定する変数
HOSTNAME=source.oysterworld.jp

#profile.dファイルはサーバ共通の環境変数を設定するファイル置き場
cat <<EOF > /etc/profile.d/environment.sh    　　　　　　　　　　　　　　　　　
export HOSTNAME=$HOSTNAME
EOF
#環境変数を設定したファイルを実行
source /etc/profile.d/environment.sh

#Javaのインストール
yum -y install java-1.8.0-openjdk-devel

#gitのインストール
yum -y install git

#SSL/TLS証明書のインストール
git clone https://github.com/letsencrypt/letsencrypt

#SSL/TLS証明書の移動 binファイルは実行可能プログラム置き場のこと
mv letsencrypt /usr/bin/

#新規ドメインの取得 (取得しすぎると取得できなくなるので注意)
sed -i -e "s/elif \[ -f \/etc\/issue \] && grep -iq \"Amazon Linux\" \/etc\/issue ; then/elif grep -i \"Amazon Linux\" \/etc\/issue > \/dev\/null 2>\&1 || grep \x27cpe:.*:amazon_linux:2\x27 \/etc\/os-release > \/dev\/null 2>\&1; then/g" /usr/bin/letsencrypt/letsencrypt-auto  #コードの修正(AmazonAWS-EC2用)
/usr/bin/letsencrypt/letsencrypt-auto certonly --standalone -d $HOSTNAME -mroot@$HOSTNAME --agree-tos -n --debug

cd /root/

#Java-Tomcat用に証明書をパッケージ化
openssl pkcs12 -export -in /etc/letsencrypt/live/$HOSTNAME/cert.pem -inkey /etc/letsencrypt/live/$HOSTNAME/privkey.pem -out keystore.p12 -name tomcat -CAfile /etc/letsencrypt/$HOSTNAME/chain.pem -caname root -passout pass:test

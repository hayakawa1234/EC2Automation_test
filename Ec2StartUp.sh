pkill -f jar  #jarファイルのプロセスを停止するコマンド
rm /root/oysterworld.jar  #前回の実行時に置いたjarファイルを削除するコマンド
mv /home/ec2-user/oysterworld.jar /root #転送されたjarファイルをrootに移動 (直接rootに送りたいができないため)
cd /root  #ルートに移動
java -jar /root/oysterworld.jar --spring.profiles.active=production & #jarファイルの実行コマンド

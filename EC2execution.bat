chcp 65001
Dropbox\オイスターワールド\ホームページ\EC2_automation_command\EC2Automation_test
echo Y | xcopy key.pem %USERPROFILE%
echo Y | xcopy Ec2.sh %USERPROFILE%
echo Y | xcopy Ec2StartUp.sh %USERPROFILE%
echo Y | xcopy oysterworld.jar %USERPROFILE%

SET TRANSFERPLACE=ec2-user@source.oysterworld.jp:/home/ec2-user
scp -oStrictHostKeyChecking=no -i %USERPROFILE%\key.pem %USERPROFILE%\Ec2.sh %TRANSFERPLACE%
scp -oStrictHostKeyChecking=no -i %USERPROFILE%\key.pem %USERPROFILE%\Ec2StartUp.sh %TRANSFERPLACE%
scp -oStrictHostKeyChecking=no -i %USERPROFILE%\key.pem %USERPROFILE%\oysterworld.jar %TRANSFERPLACE%
ssh -oStrictHostKeyChecking=no -i %USERPROFILE%\key.pem ec2-user@ec2-52-198-93-77.ap-northeast-1.compute.amazonaws.com "sh Ec2.sh"
pause

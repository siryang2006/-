�������ˣ�  
1.���ؽ�ѹ  
wget https://github.com/fatedier/frp/releases/download/v0.27.0/frp_0.27.0_linux_amd64.tar.gz  
tar -zxvf frp_0.27.0_linux_amd64.tar.gz  
mv frp_0.27.0_linux_amd64  
cd frp  
  
2.�޸�����  
vi frps.ini  
  
[common]  
bind_port = 7000  
dashboard_port = 7500  
dashboard_user = admin  
dashboard_pwd = admin  
  
3.����Ϊ��������  
sudo vi /etc/systemd/system/frps.service  
  
[Unit]  
Description=frps daemon  
After=syslog.target  network.target  
Wants=network.target  
[Service]  
Type=simple  
ExecStart=/home/frp/frps -c /home/frp/frps.ini  
Restart=always  
RestartSec=1min  
[Install]  
WantedBy=multi-user.target  
  
4.��������  
sudo systemctl start frps  
sudo systemctl enable frps  
sudo systemctl restart frps  
sudo systemctl stop frps  
sudo systemctl status frps  
  
5.���������ð�ȫ��������7000 7500 3389  
  
6.windows����frpc(https://github.com/fatedier/frp/releases)  
  
7.�༭ frpc.ini  
  
[common]  
server_addr = 120.27.XXX.XXX  
server_port = 7000  
admin_addr = 127.0.0.1  
admin_port = 7400  
admin_user = admin  
admin_pwd = admin  
  
[RDP]  
type = tcp  
local_ip = 127.0.0.1  
local_port = 3389  
remote_port = 3389  
  
8.�½��ļ�start-frp.vbs  
  
dim objShell  
set objShell=wscript.createObject("WScript.Shell")  
iReturnCode=objShell.Run("C:\WWW\frp\frpc.exe -c C:\WWW\frp\frpc.ini",0,TRUE)  
  
9.start-frp.vbs���� C:\Users\zmh\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup����Ŀ¼�У�����ʵ�ֿ�������  
  
10.˫�� start-frp.vbs���� frpc ����  
  
11.winodws��������Զ�̷��ʺͷ���ǽ  
  
12.��������ʣ�http://120.27.XXX.XXX:7500  
  
13.����һ̨���Դ�Զ�����棬����120.27.XXX.XXX:3389  
  
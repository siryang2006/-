服务器端：  
1.下载解压  
wget https://github.com/fatedier/frp/releases/download/v0.27.0/frp_0.27.0_linux_amd64.tar.gz  
tar -zxvf frp_0.27.0_linux_amd64.tar.gz  
mv frp_0.27.0_linux_amd64  
cd frp  
  
2.修改配置  
vi frps.ini  
  
[common]  
bind_port = 7000  
dashboard_port = 7500  
dashboard_user = admin  
dashboard_pwd = admin  
  
3.设置为服务启动  
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
  
4.启动服务  
sudo systemctl start frps  
sudo systemctl enable frps  
sudo systemctl restart frps  
sudo systemctl stop frps  
sudo systemctl status frps  
  
5.阿里云配置安全组规则，添加7000 7500 3389  
  
6.windows下载frpc(https://github.com/fatedier/frp/releases)  
  
7.编辑 frpc.ini  
  
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
  
8.新建文件start-frp.vbs  
  
dim objShell  
set objShell=wscript.createObject("WScript.Shell")  
iReturnCode=objShell.Run("C:\WWW\frp\frpc.exe -c C:\WWW\frp\frpc.ini",0,TRUE)  
  
9.start-frp.vbs放在 C:\Users\zmh\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup启动目录中，即可实现开机启动  
  
10.双击 start-frp.vbs启动 frpc 服务。  
  
11.winodws设置允许远程访问和防火墙  
  
12.浏览器访问：http://120.27.XXX.XXX:7500  
  
13.另外一台电脑打开远程桌面，输入120.27.XXX.XXX:3389  
  
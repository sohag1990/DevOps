# Hola :)


 #Software as a Service (SaaS)
 #Platform as a Service (PaaS)
 #Infrastructure as a Service (IaaS)
 #linux filename maximum 255 characters
 #Linux path maximum 4096 characters
 # starting dot(.) is mean the hidden
# Help
man -h
man mysql 
man cp # to know details about copy 

pwd #present working directory
w # to check who ar logged in currently
env # to show the all environment variables


#command chaining/ multiple command at a time
mkdir dirName; cd dirName; touch hello.txt #command chain separeted by semicolon

#kill  Process
kill -s pid
kill -9 pid #force kill
pkill -9 -u shakhawat firefox #kill firefox for user shakhawat
sudo killall -9 httpd # to kill all httpd services
# History
history
history | grep "docker"
#To search/grep/find
grep keyword filename 
grep -n keyword filename #-n = line number
grep -c keyword filename #-c = count
find ~/Desktop/docs/ -name *txt | xargs -i keywordThatWantToFind

locate filename/foldername

# Shells
cat /etc/Shells
echo $SHELL 


#to resolve hostname with ip address
# entry the ip address against hostname to 
sudo vim /etc/hosts # example already there


#Disk spaces/use/more
df -ah
df -h
df -hT 
du -sh /directoryName #du=disk use
sudo fdisk -l #details of disk
#Disk mount
ls /mnt
mount
mount /dev/sda2 /mnt #to mount
umount /mnt # to unmount
sudo vi /etc/fstab # edit with care. mount rules

#manage swap memory
swapoff -a
#Permanently off swaf: 
sudo vi /etc/fstab

#Ram useas
free -M
free -g 
vmstat -a 
vmstat 2 6 # every two second 6 interval
cat /proc/meminfo # details of memory information

# current version of linux kurnel
uname 
uname -a
uname -v
uname -r

#check NetStat ... open ports and more
netstat 
netstat | more
netstat -tulpn | more # to check tcp ports and services

#ipaddress and more
ifconfig
ip addr
ip addr show
ip addr show eth0

#Current cpu process and running cpu/ram use. performance check
ps #process
ps aux
ps aux | grep mysql
top
htop #interective UI

#Service check/manage
service mysql status
systemctl mysql 
systemctl status mysql.service
systemctl status apache2.service
systemctl start apache2.service
systemctl stop apache2.service
systemctl restart apache2.service


#To check cache apt cache policy of any package
apt-cache policy kubelet | head -n 20

# To view file in pretty way . alternative of cat
more /filename 

#scp secure copy server to server
scp ./dt-the7.zip   imrojony@192.168.1.105:Desktop/ 

#tar zip (c=create, z=zip, v=verbose, f=allow to filename)
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file
tar -czvf archive.tar.gz stuff
#zip multiple directory
tar -czvf archive.tar.gz /home/ubuntu/Downloads /usr/local/stuff /home/ubuntu/Documents/notes.txt
#exclude directory
tar -czvf archive.tar.gz /home/ubuntu --exclude=/home/ubuntu/Downloads --exclude=/home/ubuntu/.cache
tar -czvf archive.tar.gz /home/ubuntu --exclude=*.mp4

#tar unzip
tar -xzvf archive.tar.gz
tar -xzvf archive.tar.gz -C /tmp # -C = switch to the folder after command done 

#ownership and mod
sudo chown -R username:groupname directories #-R to include subdirectories

sudo chmod 754 Confidential
sudo chmod u=rwx,g=rx,o=r Confidential
# So, 7 = 4 + 2 + 1 (rwx);      5 = 4  + 1 (rx);   4 (r)
# 4 = Read
# 2 = Write
# 1 = Execute
# 0 = no permission

#Shortlink
ln -s /home/shakhawat/go/src/github.com/sohag1990/DevOps ~/Desktop/

#cron job
man cron
man crontab 
systemctl status cron
vim /etc/crontab
crontab -e #to configure the cron tab

# Example of job definition:
# .---------------- minute (0 - 59)
# | .------------- hour (0 - 23)
# | | .---------- day of month (1 - 31)
# | | | .------- month (1 - 12) OR jan,feb,mar,apr ...
# | | | | .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# | | | | |
# * * * * * user-name command to be executed

#vim commands
https://coderwall.com/p/adv71w/basic-vim-commands-for-getting-started
https://www.fprintf.net/vimCheatSheet.html


# Login
sudo -i # to be root
su - usearname #user login
su - # to superuser

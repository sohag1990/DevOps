# Hola :-)

###RClone

##rclone commands
# to config rclone
rclone config 
#to show all files available in googleDrive
rclone ls googleDrive:/ 
rclone -h 
# rclone copy current directory all files to googleDrive bakup folder
rclone  copy ./ googleDrive:/bakup/ 
# this command download the google Drive remote directoy to my local machine
rclone copy googleDrive:/"Christian Martin - The Work From Anywhere Accelerator" ./ -v 

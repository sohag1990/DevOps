Hola:-)

# Disk extend
# modify volume to new incresed size
# run those commands to resize disk
#check current the available and attached storage blocks on your EC2 Instance.
lsblk
#Using the growpart command expand the partition from it's original and current size to the new available disk size.
#carefull about the name of your volume may be different.
growpart /dev/xvda 1
# Expand file system
# Please note, the name of your volume may be different.
resize2fs /dev/xvda1
# Check Partitions and Disk Space
lsblk
df -h
# Done!




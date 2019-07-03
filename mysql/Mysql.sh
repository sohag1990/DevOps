# Hola :-)

###Mysql Notes
# to connect mysql server
mysql -u root --host 172.17.0.2 -p 
# To show all available databases
show databases; 
 # To use mysql db
use dbName; 
# To show all tables from current selected databases
show tables; 
# fetch all data from tableName
select * from tableName; 
# this command select leads table and count rows with match mail like gmail
select count(*) from leads where email like '%gmail%'; 
# To find all emails with name and website 
select email, name, website from leads where email !=''; 
# email decenting order, and name acending order and offset first 5 then limit 50
SELECT * FROM leads ORDER BY email DESC, name ASC LIMIT 5, 50; 
SELECT s.name as Student, c.name as Course 
    FROM student s
        INNER JOIN bridge b ON s.id = b.sid
        INNER JOIN course c ON b.cid  = c.id 
    ORDER BY s.name  # Inner Join example

INSERT INTO `leads` (`email`, `name`, `website`) VALUES ('hola@domain.com', 'Chalie Chaplie', 'domain.com');
UPDATE `leads` SET `email` = `hola@gmail.com` where id=5;
DELETE FROM `leads` where id=5;

# Alter Database Character Set.
ALTER DATABASE back_office_go CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 
#Alter table character Set
ALTER TABLE user_meta CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; 
 # Alter a field character Set
ALTER TABLE user_meta CHANGE meta_value meta_value TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

## Mysql Backup and Restore command
# this command will export crawl database as name crawl0-bak.sql
mysqldump -u root --host 172.17.0.2 -p crawl > crawl0-bak.sql 
# this command will restore the crawl database from crawl0-bak.sql backup file
mysql -u username --host 172.17.0.2 -p crawl < crawl0-bak.sql 
# inside mysql server this command will import the sql file and restore database.
source ~/Desktop/backup.sql 

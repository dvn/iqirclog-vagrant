# Rebuilding http://irclog.iq.harvard.edu

## iqirclog database restore

`mysql -u root -e "create database iqirclog; GRANT ALL PRIVILEGES ON iqirclog.* TO iqirclog@localhost IDENTIFIED BY 'foo'"`

`wget http://git.huit.harvard.edu/iqirclog/iqirclog-data/blobs/raw/master/data/mysql/mysql_backup_20140210-230501.sql.bz2`

`bunzip2 -c mysql_backup_20140210-230501.sql.bz2 | mysql -h localhost -u root`

`mysql -h localhost -u iqirclog -pfoo -Diqirclog -e 'select * from irclog limit 1'`

## ilbot setup

Clone and checkout this commit:

https://github.com/moritz/ilbot/commit/96203e28fd2439e54e37f06387ce17c447f8a1ff

For Perl dependencies packaged as RPMs: http://yum.greptilian.com

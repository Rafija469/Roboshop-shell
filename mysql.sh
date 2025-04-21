if [ -z "${MYSQL_ROOT_PASSWORDT"} -O -z "$1" ]; then
echo input password is missing
exit
fi

if [ -n "${MYSQL_ROOT_PASSWORDT"} ]; then
PASSWORD_$MYSQL_ROOT_PASSWORDT
fi

 if [ -n "$1" ]; then
 PASSWORD=$1
 fi

dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass $PASSWORD
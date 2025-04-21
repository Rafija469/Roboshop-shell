if [ -z "$1" ]; then
  echo input password is missing
  exit
  fi

component_name=shipping
source common.sh

java

dnf install mysql -y
for file in schema app-user master-data1 do
mysql -h mysql-dev.azrdevops82.online -uroot -p$1 < /app/db/$file.sql
done

systemd
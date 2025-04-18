componet_name = catalogue
source common.sh
nodejs

cp catalogue.service /etc/systemd/system/catalogue.service
cp mongo.repo /etc/yum.repos.d/mongo.repo

dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.azrdevops82.online </app/db/master-data.js
systemd
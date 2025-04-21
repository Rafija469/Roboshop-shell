componet_name = catalogue
source common.sh


cp mongo.repo /etc/yum.repos.d/mongo.repo

nodejs

dnf install mongodb-mongosh -y
mongosh --host mongodb-dev.azrdevops82.online </app/db/master-data.js

systemd
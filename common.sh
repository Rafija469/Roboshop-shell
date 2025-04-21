pwd=${pwd}
systemd(){
    cp ${pwd}/${component_name}.service /etc/systemd/system/${component_name}.service
  systemctl daemon-reload
  systemctl enable $(component_name)
  systemctl start $(component_name)
}
app_pre_setup{
  useradd roboshop
    rm -rf /app
    mkdir /app
    curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
    cd /app
    unzip /tmp/payment.zip
    cd /app
    unzip /tmp/${component_name}.zip

}
nodejs(){

  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y
  app_pre_setup
  npm install
}


python() {
  dnf install python3 gcc python3-devel -y
   app_pre_setup
  pip3 install -r requirements.txt
}
java(){
  dnf install maven -y
  app_pre_setup
  mvn clean package
  mv target/${component_name}-1.0.jar ${component_name}.jar
}
#!/bin/bash

USERID=$(id -u)

R="\[e31m"
G="\[e32m"
Y="\[e33m"
N="\[e0m"

VALIDATE(){
    if [$1 -ne 0]
    then
        echo -e "$2 .. $R FAILURE $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi 
}

Checkroot(){

    if [USERID -ne 0]
    then
        echo -e "$Y You must have sudo access to run this script $N"
}

dnf list installed mysql

if [$? -ne 0]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql is already $Y installed $N" 
fi


if [$? -ne 0]
then
    dnf install git -y
    VALIDATE $? "Installing git.."
else
    echo -e "GIT already $Y installed $N"
fi

if [$? -ne 0]
then
    dnf install nodejs:20 -y
    VALIDATE $? "installing nodejs..."
else
    echo -e "nodejs is already  $Y installed.. $N"
fi

if [$? -ne 0]
then
    dnf install nginx -y
    VALIDATE $? "installing Nginx"
else
    echo "nginx is already installed"
fi


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
        echo -e "$R ERROR: You must have sudo access to run this script $N"
        exit 1
    fi
}

dnf list installed mysql

if [$? -ne 0]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo -e "mysql is already $Y installed $N" 
fi


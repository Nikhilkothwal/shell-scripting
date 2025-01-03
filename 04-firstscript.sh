#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[47m"

if [$USERID -ne 0]
then
    echo "Error you must have sudo access for this command"
    exit 1
fi


VALIDATE(){
    if [$1 -ne 0]
    then
        echo -e "$2 .. $R FAILURE $N"
    else
        echo "$2 ... $G SUCCESS $N"
    fi 
}


dnf list installed mysql



if [$? -ne 0]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "mysql is already $Y installed $N" 
fi


dnf list installed git

if [$? -ne 0]
then
    dnf install git -y
    VALIDATE $? "Installing git.."
else
    echo "GIT already $Y installed $N"
fi



#!/bin/bash
# Create a base project tree 
if [ -z $1 ]; then
    echo "Please enter parameters with format :"
    echo "./baseSource.sh <folder_name>"
else
mkdir -p $1/source
mkdir -p $1/include
mkdir -p $1/libs
mkdir -p $1/doc
mkdir -p $1/dependence

curl https://raw.githubusercontent.com/KhangKT1310/Makefile_Base/main/source/main.c > $1/source/main.c
curl https://raw.githubusercontent.com/KhangKT1310/Makefile_Base/main/Makefile > $1/Makefile

fi

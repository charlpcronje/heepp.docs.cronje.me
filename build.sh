#!/bin/bash
if [ ! -d "./public" ] 
then 
    echo "Directory './public' does not exist";
    echo "Creating Directory: './public'";
fi
  
echo "Running Build";
retype build

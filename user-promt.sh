#!/usr/bin/env bash
choosePort()
{
    read -p "Enter the port: " port
    echo "entered ${port}"
}

while true; do
    read -p "Do you wish to continue [Y/N]? " yn
    case ${yn} in
        [Yy]* ) choosePort;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
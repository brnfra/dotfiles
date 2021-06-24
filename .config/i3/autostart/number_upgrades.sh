#!/bin/bash

#script to check if exist upgrades avaliable
#For Debian based distros
CHECK=$(expr $(apt list --upgradeable | wc -l) - 1)
echo $CHECK

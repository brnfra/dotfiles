#!/bin/bash
#script to check if exist upgrades avaliable

CHECK=$(expr $(apt list --upgradeable | wc -l) - 1)
echo $CHECK

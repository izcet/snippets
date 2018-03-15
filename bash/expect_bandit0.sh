#!/bin/sh

ssh bandit0@bandit.labs.overthewire.org
expect "password:"
sleep 2 
send "bandit0\r"

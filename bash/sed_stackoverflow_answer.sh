#!/bin/bash

prefix="err"

target1="foo"
target2="bar"

sub1pre="<red>"
sub1post="<_red>"

sub2pre="<blu>\1<_blu>"
sub2post="<_blu>"

sub3pre="<gre>"
sub3post="<_gre>"

FILE=$1

sed -E -e "s:($prefix$target1):$sub1pre\1$sub1post:" \
    -e  "s/($prefix$target2)/$sub2pre/" \
    -e  "s#($prefix(.*&!$target1&!$target2))#$sub3pre\1$sub3post#" $FILE 

 

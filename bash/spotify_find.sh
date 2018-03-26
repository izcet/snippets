#!/bin/bash

USER=baerista

find / -type d -name '*[Ss]potify*' -print 2> /dev/null
find / -type d -name '*$USER*' -print 2> /dev/null
